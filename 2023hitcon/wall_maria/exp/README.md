# Wall Maria

## From Author

### Instruction

- You have a busybox shell running as root
- The Qemu running this VM is built with a custom, vulnerable PCI device called `maria`
- Try exploiting the `maria` PCI device to achieve Qemu escape
- You may assumed that Busybox, the Linux kernel, and other parts of Qemu are **not vulnerable**.

### Files

- `./share/qemu-system-x86_64`: The vulnerable Qemu binary
- `./src/maria.c`: The source code of the custom PCI device

### Flag location

- `/home/user/flag` (The flag is located outside the virtual machine)

### Notes

- **Your exploit should be library-agnostic. In other words, it should not rely on shared library offsets.**

## My note

- **未完成**！

  因为不知名原因，`read 0x00` 无法调用 `maria_mmio_read()`，用<a href="https://github.com/wxrdnx/HITCON-2023-Challenges/blob/main/wall-maria/solution/exploit.c">官方wp</a>也不行。

  待解决！如果你知道原因，请通过我的 github 主页的联系方式联系我！！！感谢🙏

- 解题思路

  - set offsets
  - read 0x00，把buff 给src，然后读 src 可以获得读到 maria->mmio 获得 base
  - 然后在 src 伪造一个 mmio 用 write 0x00 把 src 给 buff 覆盖 maria->mmio 修改函数表里的 read, write 对应地址，劫持 read，write，修改为 mprotect 和 shellcode

- gdb debug tips

  ```bash
  # docker外面

  DOCKERFILE: apt-get install gdbserver; docker run -p 1234:1234

  # docker-compose.yml 加上

    cap_add:
      - SYS_PTRACE
    ports:
      - "30002:30002"
      - "1234:1234"

  # docker 里面，用 gdbserver 远程调试
  gdbserver 0.0.0.0:1234 --attach $(pidof qemu-system-x86_64)

  # 外面 sudo gdb ./qemu-system-x86_64
  pwndbg> target remote :1234
  ```

  ```c
  pwndbg> ptype /ox MariaState
  type = struct {
  /* 0x0000      |  0x0a20 */    PCIDevice pdev;
  /* 0x0a20      |  0x0010 */    struct {
  /* 0x0a20      |  0x0008 */        uint64_t src;
  /* 0x0a28      |  0x0001 */        uint8_t off;
  /* XXX  7-byte padding   */

                                     /* total size (bytes):   16 */
                                 } state;
  /* 0x0a30      |  0x2000 */    char buff[8192];
  /* 0x2a30      |  0x0110 */    MemoryRegion mmio;

                                 /* total size (bytes): 11072 */
                               }
  ```

  ```c
  pwndbg> set $maria = (MariaState *)0x55e912ae2770
  pwndbg> p $maria->mmio
  $23 = {
    parent_obj = {
      class = 0x55e911b8eae0,
      free = 0x0,
      properties = 0x55e912ae6fa0,
      ref = 1,
      parent = 0x55e912ae2770
    },
    romd_mode = true,
    ram = false,
    subpage = false,
    readonly = false,
    nonvolatile = false,
    rom_device = false,
    flush_coalesced_mmio = false,
    dirty_log_mask = 0 '\000',
    is_iommu = false,
    ram_block = 0x0,
    owner = 0x55e912ae2770,
    ops = 0x55e90f6ddf80 <maria_mmio_ops>,
    opaque = 0x55e912ae2770,
  //....
  ```

- `cpu_physical_memory_rw()`
 
  ```c 
  // https://loora1n.github.io/2023/09/19/qemu逃逸/
  void __cdecl cpu_physical_memory_rw(hwaddr addr, void *buf, hwaddr len, bool is_write) {};
  /*
  *	函数简介：
  *		该函数主要用于物理内存之间的数据读写：当is_write为0时，由addr拷贝
  *		至buf；当is_write为1时，由buf拷贝至addr。
  *	参数含义：
  *		hwaddr addr 	表示客户机的物理地址，例如QEMU中我们的EXP程序；
  *		void* buf 		表示QEMU本身的虚拟地址，例如qemu-system-x86_64；
  *		hwaddr len		表示读写长度；
  *		bool is_write	函数功能控制参数，解释如上简介。
  */
  ```

