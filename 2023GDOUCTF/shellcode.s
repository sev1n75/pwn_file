.global _start

_start:
 leaq %rbp, %rdi
  mov $0, %rsi
  mov $2, %rax
  syscall
