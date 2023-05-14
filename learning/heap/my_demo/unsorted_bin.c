#include <stdio.h>
#include <stdlib.h>

int main() {
    char* ptr1 = malloc(0x89);
    malloc(0x20);
    char* ptr3 = malloc(0x88);
    malloc(0x20);
    char* ptr5 = malloc(0x420);
    char* ptr6 = malloc(0x20);

    free(ptr1);
    free(ptr3);
    free(ptr5);
    free(ptr6);

    return 0;
}
