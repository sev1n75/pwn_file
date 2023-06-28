#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <unistd.h>

#include <stdio.h>

#define _LARGEFILE64_SOURCE

char* flag[0x10];

int main() {
  int count = 3;
  while(count--);
  int mem = open("/proc/self/mem", O_RDWR);
  int flag_fd = open("./flag.txt", O_RDONLY);
  char* buf[0x100] = {0};
  long long addr;
  read(flag_fd,&flag,0x10);
  close(flag_fd);

  scanf("%llx", &addr); 
  lseek64(mem,addr,0);
  write(mem,&flag,8);

  close(mem);
}
