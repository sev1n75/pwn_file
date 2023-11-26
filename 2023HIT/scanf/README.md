# 2023HITCTF-scanf

```c
0x4060: chunk_0x30_ptr
0x4068: getchar
0x4070: chunk_0x20_ptr
0x4078: 任意地址写'\x00'
0x4080: input_data
```

- op_codes
  - 0x7D: puts and free 0x30
  - 0x7B: malloc 0x30, scanf ld
  - 0x5D: puts and free 0x20
  - 0x5B: malloc 0x20, scanf d
  - 0x2A: 读入一个地址，该地址写'\x00'
  - 0x28: 4068 getchar()
  - 0x29: 4068 putchar()

- malloc 不限次数，只保存最后一个，scanf 相当于没有初始化

首先 scanf len >= 0x401 调用 `malloc(0x800)` 调用 `malloc_consolidate` 泄漏 libc

然后修改 `*stdin->_IO_buf_base` stdin 任意写攻击

具体利用参考我的博客<a href="https://sev1n75.github.io/2023/04/04/explpot_IO-FILE/#2-3-4-修改-stdin-任意地址写">_IO_FILE利用-2-3-4-修改-stdin-任意地址写</a>

