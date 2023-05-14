#include <sys/types.h>
#include <sys/stat.h>
#include <sys/sendfile.h>
#include <unistd.h>
#include <fcntl.h>

int main(int arg, char **argv) {
  int echo_fd = open ("/bin/echo", O_RDONLY);
  int fd = open(argv [1], O_WRONLY | O_CREAT, 0755);
  sendfile(fd, echo_fd, 0, 1024*1024);
  close(fd);
  execl(argv[1], argv[1], "SAFE", NULL);
}

