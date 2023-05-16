#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void signal_alarm(int s){
  puts("ALARM!");
  exit(42);
}

int main(int argc, char *argv[])
{
  signal(SIGALRM, signal_alarm);
  alarm(2);
  while(1);
  return 0;
}
