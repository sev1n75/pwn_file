.global _start
.intel_syntax noprefix
_start:
      xor eax, eax
      mov al, 40
      mov rdi, 1
      mov rsi, 0
      mov rdx, 0
      mov r10, 12222
      syscall
