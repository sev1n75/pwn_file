#include <stdio.h>

int main(void)
{
    FILE *fp;
    long long *vtable_addr,*fake_vtable;

    fp=fopen("123.txt","rw");
    fake_vtable=malloc(0x40);

    vtable_addr=(long long *)((long long)fp+0xd8);     //vtable offset

    vtable_addr[0]=(long long)fake_vtable;

    memcpy(fp,"sh",3);

    fake_vtable[7]=system(); //xsputn

    fwrite("hi",2,1,fp);
}
