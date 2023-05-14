from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

#context.log_level = 'debug'
debug = 1

if debug:
    io = process('./')
else:
    io = remote('')

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]


io.interactive()

