global _start

section .data
msg db '1337', 0x0A 
len equ $ - msg 

section .text
_start:

    mov rax, 1 
    mov rdi, 1 
    mov rsi, msg 
    mov rdx, len 
    syscall

    mov rax, 60 
    xor rdi, rdi 
    syscall
