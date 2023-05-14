from pwn import *

context.log_level='debug'
#io=process('./pwntools')
io = remote('node5.anna.nssctf.cn',28096)

io.recvline()

for i in range(1000):
    io.recvuntil(b"What is ")
    q = io.recvuntil("?").decode().replace('?','')
# a = type(q)
# print(a)
    print(q)
    ans = eval(q)
    if(ans<0):
        ans = -ans
        io.sendline(b'-'+str(ans).encode())
    else:
        io.sendline(str(ans).encode())

io.interactive()

