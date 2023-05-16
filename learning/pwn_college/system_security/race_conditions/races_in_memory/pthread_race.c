#include <pthread.h> 
#include <unistd.h> 
#include <stdlib.h> 
#include <stdio.h>
unsigned int size = 42;
void read_data() {
  char buffer [161];
  if (size < 16) {
    fprintf(stdout,"Valid size! Enter payload up to %d bytes. \n", size);
    printf("Read %d bytes! \n", read(0, buffer, size));
  }
  else 
    fprintf(stderr,"Invalid size %d! \n", size);
}

void *thread_allocator(int arg) {
  while (1) read_data();
}

int main() {
  pthread_t allocator;
  pthread_create(&allocator, NULL, thread_allocator, 0);
  while (size != 0) read(0, &size, 1);
  exit(0);
}
