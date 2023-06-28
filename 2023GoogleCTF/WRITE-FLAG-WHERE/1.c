#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <unistd.h>

int main() {
  int mem = open("/proc/self/mem", O_RDONLY);
  char* buf[0x100] = {0};
  read(mem,buf,0x100);
  write(1,buf,0x100);
}
