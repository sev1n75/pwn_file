# 2023 TPCTF safehttp

- 2.37-0ubuntu1

- __ctype_b_loc()

    > <https://xuanxuanblingbling.github.io/ctf/pwn/2020/05/19/calc/>

- GET
  - init: 新建 root

    ```c
    struct chunk_50
    {
    chunk_50 *fd;
    chunk_50 *bk;
    char info[32];  //sprintf %-8s:%-13s:%-'8d", "root", password, 0LL
    char *note_chunk_ptr;
    int size;
    };
    ```

    srand(time(0)) passwprd[14]

    0x6050:存first_chunk_50

    新加chunk_50放在first_chunk右边

  - register = add
    - size[0, 0x400]
  - logoff = dele
  - show 需要uid = 0
  - poweroff = exit
- POST
  - note = edit 需要 uid = 0
- 每次输出会关闭 fd
- 所以应该只有两次输出机会(fd = 1/2)

参考[星盟师傅的wp](https://blog.xmcve.com/2023/11/28/TPCTF2023-Writeup/#title-6)

- 漏洞点在该 glibc 版本 存在 `sprintf` 溢出，可以在 register 调用 `sprintf` 时溢出`\x00` 到 note_chunk_ptr 修改指针，又有edit，所以可以任意地址写
  - 这个在docker hub 对应的 ubuntu:lunar-20230314 里写了，但是这个 base 里的libc版本不对属于是诈骗了

- 同时 register 时可以 伪造用户名为 `a:b:0` 伪造 uid

