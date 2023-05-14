.global _start
.intel_syntax noprefix
_start:
      xor eax, eax
      mov al, 60
      syscall
