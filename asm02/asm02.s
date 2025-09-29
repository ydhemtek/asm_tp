global _start

section .data
msg db "1337", 0x0A
len equ $ - msg


section .bss
input resb 2

section .text
_start:


    mov rax, 0 
    mov rdi, 0 
    mov rsi, input 
    mov rdx, 2 
    syscall


    mov al, byte [input]
    cmp al, '4'
    jne error_exit


    mov al, byte [input+1]
    cmp al, '2'
    jne error_exit


    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall


error_exit:
    mov rax, 60
    mov rdi, 1 
    syscall
