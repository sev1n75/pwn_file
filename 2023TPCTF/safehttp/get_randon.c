// 参考星盟师傅的wp
// https://blog.xmcve.com/2023/11/28/TPCTF2023-Writeup/#
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>

int main(){
    unsigned int seed = time(0LL);
    char v1 = 0;
    char v5[0x10];
    srand(seed);
    for (int i = 0; i <= 12; ++i )
    {
    do
    {
        do
        v1 = rand();
        while ( v1 <= 32 );
    }
    while ( v1 == 127 );
    v5[i] = v1;
    }
    v5[13] = 0;
    write(1, v5, sizeof(v5));
}
