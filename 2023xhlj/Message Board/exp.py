from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./pwn')
libc = ELF('./libc.so.6')

debug = 1

if debug:
    io = process('./pwn')
else:
    io = remote('39.102.55.191',9999)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget= [0xe3afe,0xe3b01,0xe3b04]

name = b'a' *1
io.sendafter(b"please leave your name:",name)
payload = b'c' #b'b' * 0xb0 
p()
io.sendafter(b"Now, please say something to DASCTF:",payload)

io.interactive()
