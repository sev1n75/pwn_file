#include <pthread.h> 
#include <unistd.h> 
#include <stdlib.h> 
#include <stdio.h>
//int done = 0;
void thread_main(int arg) {
  // if (arg == 1) syscall (105, 1000);
  if (arg == 1) setuid(1000) ;
  else sleep(1);
  printf("Thread %d, PID %d, TID %d, UID %d\n", arg, getpid(), gettid(), getuid());
}

int main()
{
  pthread_t thread1, thread2;
  printf("Launching threads! \n");
  pthread_create(&thread1, NULL, thread_main, 1); 
  pthread_create(&thread2, NULL, thread_main, 2);
  sleep(1);
  printf("Main thread: PID % TID &d UID %d \n", getpid(), gettid(), getuid());

  pthread_join(thread1, NULL);
  pthread_join(thread2, NULL);
  return 0;
}
