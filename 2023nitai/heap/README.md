# noob_heap

- 沙盒约等于没开， `execveat`没禁

- add

  - 没有初始化
  - size [0, 0x78], 但返回scanf 局部变量为初始化
  - idx[0, 0x1f]

- dele, show
  - 正常

- edit
  - off by null

- scanf 在输入过长时(如len=0x400) 会调用 malloc(0x800) 然后 free

  - 所以可以通过scanf 分配大 chunk，调用`malloc_consolidate` 在 smallbin 填一个 chunk
  - 然后申请回来剩一个0x100
  - `malloc_consolidate` 在向下合并时没有检查，直接判断

    ```c
    // https://elixir.bootlin.com/glibc/glibc-2.35/source/malloc/malloc.c#L4776
    nextinuse = inuse_bit_at_offset(nextchunk, nextsize);

    if (!nextinuse) {   //邻近的下一个chunk是freechunk
    size += nextsize;
    unlink(av, nextchunk, bck, fwd);
    ```

- 然后 off by null 把101改成 100，然后让 0x100 chunk 上面两个chunk 重叠，注意，合并后的chunk不能大于`0x100`，否则将会先分配下面的`0x100`的chunk，分配之后，合并后的chunk`prev_inuse(next)`就变成 1，不能通过检查

    ```c
    ----------------------------
    0x61 * 7 in tcache
    ----------------------------
    paddings
    ----------------------------
    0x61 victim in fastbin
    ----------------------------
    0x61 chunk A
    ----------------------------
    0x100 off by oned in unsortedbin
    ----------------------------
    padding
    ----------------------------
    top
    ----------------------------
    ```

    ```c
    ----------------------------
    0x61 * 7 in tcache
    ----------------------------
    paddings
    ----------------------------
    0xc1
    victim in fastbin and chunk A merged
    in unsorted bin then in smallbin 
    ----------------------------
    0x100 off by oned in smallbin
    ----------------------------
    padding 
    ----------------------------
    top
    ----------------------------
    ```

- 此后mallo(0x38) malloc(0x78)即可

- 然后 tcache poisoning 劫持 tcache struct

- 最后 劫持栈 ROP_mprotect + shellcode

    > 不好控制 r10, 所以没用 `execveat` 打脸了
