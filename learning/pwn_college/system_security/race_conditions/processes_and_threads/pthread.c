#include <pthread.h> 
#include <unistd.h>
#include <stdlib.h> 
#include <stdio.h>

void *thread_main(int arg) {
  printf("Thread %d, PID %d, TID %d, UID %d\n", arg, getpid(), gettid(), getuid());
}

int main() {
  pthread_t thread1, thread2;
  pthread_create(&thread1, NULL, thread_main, 1); 
  pthread_create(&thread2, NULL, thread_main, 2);
  printf("main thread; Pid %d TiD %d UID %d\n" , getpid(), gettid(), getuid());
  pthread_join(thread1, NULL); 
  pthread_join(thread2, NULL);
}
