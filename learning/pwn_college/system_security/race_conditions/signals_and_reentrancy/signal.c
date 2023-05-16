#include <sys/sendfile.h> 
#include <stdlib.h> 
#include <unistd.h> 
#include <signal.h> 
#include <stdio.h> 
#include <fcntl.h>

int num = 0;

void signal_handler (int signum) {
  num = 0;
}

int main() {
  signal (SIGUSR1, signal_handler);
  while (1) {
    if (num == 0) num++;
    num --;
    if (num != 0) printf("NUM: %d\n", num);
  }
  return 0;
}
