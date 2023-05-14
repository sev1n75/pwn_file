#include <unistd.h>
#include <stdio.h>
#include<fcntl.h>

int main(void)
{
  int fd = open("/proc/pwncollege", O_WRONLY);
  if(fd < 0)
    puts("open error");
  char passwd[] = "dylgcsgflojsupql";
  write(fd, passwd, 0x10);
  system("/bin/sh");
	int fd2 = open("/flag", O_RDONLY);
  char buf[0x100] ={0};
  read(fd2, buf, 0x100);
  puts(buf);
  return 0;
}
