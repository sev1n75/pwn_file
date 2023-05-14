#include <stdio.h>
#include <stdlib.h>

// gcc malloc_chunk.c -o malloc_chunk
int main() {
    char* ptr1 = malloc(0x20);
    char* ptr2 = malloc(0x20);
    char* ptr3 = malloc(0x20);

    memset(ptr1, 'A', 0x20);
    free(ptr1);
    free(ptr2);
    free(ptr3);

    char* ptr4 = malloc(0x20);
    char* ptr5 = malloc(0x408);
    char* ptr6 = malloc(0x409);

    free(ptr6);
    free(ptr5);
    return 0;
}
