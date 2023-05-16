#include <pthread.h> 
#define _GUN_SOURCE
#include <sys/types.h>
#include <unistd.h> 
#include <stdlib.h> 
#include <stdio.h>
int done = 0;
void thread_main(int arg) {
  while (!done){
    sleep(1);
    printf("Thread %d, PIO %d, TID %d, UID %d\n", arg, getpid(), gettid(), getuid());
  }
}

int main() {
  pthread_t thread1, thread2;
  pthread_create(&thread1, NULL, thread_main, 1);
  pthread_create(&thread2, NULL, thread_main, 2);
  printf("Main thread: PID %d TID %d UID %d\n", getpid(), gettid() , getuid());
  getchar();
  done = 1;
  pthread_join(thread1, NULL);
  pthread_join(thread2, NULL);
  return 0;
}
