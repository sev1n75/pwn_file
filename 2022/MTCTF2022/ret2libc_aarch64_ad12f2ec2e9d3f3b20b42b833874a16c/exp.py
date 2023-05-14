from pwn import *

#io = process('./pwn')
io = remote('39.106.76.68', 32990)

io.interactive()
