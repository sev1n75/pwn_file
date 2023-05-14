#include <assert.h> 
#include <unistd.h>
#include <stdio.h>

void check_input(char *filename) {
  int i;
  FILE *f = fopen(filename, "r");
  fscanf(f, "%d", &i);
  fclose(f);
  assert(i == 0);
}

void do_action(char *filename) {
  int i;
  FILE *f = fopen(filename, "r") ;
  fscanf(f,"%d", &i);
  fclose(f);
  i++;
  f = fopen(filename,"w");
  fprintf(f, "%d\n", i);
  printf("Wrote %d!\n" , i);
  fclose(f);
}

int main(int argc, char **argv) {
  check_input(argv[1]);
  do_action(argv[1]);
}
