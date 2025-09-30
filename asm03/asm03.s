global _start

section .data
msg db "1337", 0x0A
len equ $ - msg

section .text
_start:



    mov rsi, [rsp+16]
    test rsi, rsi
    jz error_exit 


    mov al, byte [rsi]
    cmp al, '4'
    jne error_exit


    mov al, byte [rsi+1]
    cmp al, '2'
    jne error_exit


    mov al, byte [rsi+2]
    cmp al, 0
    je write_42
    cmp al, 0x0A 
    je write_42
    jmp error_exit

write_42:

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
