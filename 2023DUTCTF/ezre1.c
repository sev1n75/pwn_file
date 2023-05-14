#include <stdio.h>
#include <stdlib.h>

int main() {
    int v1[26];
    v1[0] = 17;
    v1[1] = 102;
    v1[2] = 23;
    v1[3] = 23;
    v1[4] = 18;
    v1[5] = 61;
    v1[6] = -72;
    v1[7] = 44;
    v1[8] = 1;
    v1[9] = 92;
    v1[10] = -111;
    v1[11] = 54;
    v1[12] = -97;
    v1[13] = 44;
    v1[14] = 11;
    v1[15] = 95;
    v1[16] = -109;
    v1[17] = 8;
    v1[18] = 59;
    v1[19] = -102;
    v1[20] = 10;
    v1[21] = 118;
    v1[22] = 6;
    v1[23] = 70;
    v1[24] = 103;
    v1[25] = -28;
    char flag[27] =
        "DUTCTF{"
        "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
        "\x00}";
    char result[26];
    int size = 26;
    int i;
    char choic[] = "10111100110101100000101100";
    // 往左
    for (i = 7; i < 26; i++) {
        if (choic[i] == '0' && v1[(i - 1) % 26] != ' ') {
            while (flag[i] <= 0x7e) {
                result[i] = (flag[i] ^ v1[(i - 1) % size]) +
                            2 * (flag[i] & v1[(i - 1) % size]);
                if (result[i] == v1[i])
                    break;

                flag[i]++;
            }
        }
    }
    // 先右
    for (i = 24; i > 6; i--) {
        if (flag[i] == '\x7f')
            flag[i] = '\x00';
        if (choic[i] == '1' && flag[(i + 1) % 26] != ' ')
            while (flag[i] <= 0x7e) {
                // 如果choic[i]==1&& flag[i] != ' '则爆破；否则i++
                result[i] = ~(flag[i] & flag[(i + 1) % size]) &
                            (flag[(i + 1) % size] | flag[i]);
                if (result[i] == v1[i])
                    break;

                flag[i]++;
            }
    }

    printf("%s\n", flag);
}

/*


                result[i] = ~(flag[i] & flag[(i + 1) % size]) &
                            (flag[(i + 1) % size] | flag[i]);



                result[i] = (flag[i] ^ flag[(i - 1) % size]) +
                            2 * (flag[i] & flag[(i - 1) % size]);
*/