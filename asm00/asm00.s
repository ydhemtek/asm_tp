global _start

section .text
_start :
    mov     eax, 60
    xor     rdi, rdi
    syscall