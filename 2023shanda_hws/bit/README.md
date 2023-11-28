# 2023 HWS 山大专场 - bit

- add
  - idx[0,0x1d]
  - size不限
  - 没初始化，
  - 输出依赖于 cnt_table，如果不读数据，不会输出
  - 读数据 off by null，输入字符0/1,会以此给chunk对应位置1

- show
  - idx > 0x1e 也可以，有数组越界
  - idx为负数，idx上面是chunk地址，所以cnt大小可以很大,
  - 所以要在 chunk_table上面找一个小于chunk_tablede

    ```python
    pwndbg> p/x 0x563bf81b3000 + 0x4060
    $4 = 0x563bf81b7060
    pwndbg> search -4 "0x563bf81b"
    Searching for value: b'\x1b\xf8;V'
    ..........
    channel         0x563bf81b700a 0x563bf81b
    pwndbg> p/x 0x563bf81b3000 + 0x4060 - 0x563bf81b7008
    $5 = 0x58
    pwndbg> p/d 0x58/8
    $6 = 11
    pwndbg> p/x 0x563bf81b3000 + 0x4160 - 11*4
    $8 = 0x563bf81b7134
    pwndbg> p/x 0x563bf81b7130 - 0x563bf81b3000 - 0x4060
    $9 = 0xd0
    pwndbg> p/d 0xd0/8
    $10 = 26
    ```

    所以要 malloc 到第27个 chunk

- dele
  - 正常

- off by null 重叠堆块，劫持 tcache 打 free_hook
