#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(1633771873);
    for (int i = 0; i < 100; i++) {
        int v2 = rand() % 3;
        int v3 = (v2 + 1) % 3;
        printf("%d", v3);
    }
    printf("\n");
    return 0;
}
