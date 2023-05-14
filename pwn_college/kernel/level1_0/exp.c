#include <fcntl.h>
#include <stdio.h>

int main(void)
{
  int fd = open("/proc/pwncollege", O_RDWR);
  printf("fd : %d\n",fd);
  if ( fd <= 0)
    puts("open error");
  char buf[1024] = {0};
  char passwd[] = "qqypfbyywqmzhfcn";
  if( write(fd,passwd,16) != 16) {
    puts("write error");
  }
  read(fd, buf, 1024);
  puts(buf);

  return 0;
}
