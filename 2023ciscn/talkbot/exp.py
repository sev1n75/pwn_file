from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc-2.31.so')
#elf = ELF('./')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./pwn')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

def new(size):
    io.sendlineafter(b"",str().encode())
    size = int(hex(size),16)
    io.sendlineafter(b"",str(size).encode())

def delete(idx):
    io.sendlineafter(b"",str().encode())

def show(idx):
    io.sendlineafter(b"",str().encode())

def edit(idx,content):
    io.sendlineafter(b"",str().encode())
    io.sendafter(b"",content)

payload = b'\xf2\x02\x01\x01' 
p()
io.send(payload)


io.interactive()

