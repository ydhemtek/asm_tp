global _start

section .bss
buffer resb 32

section .text
_start:


    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 32
    syscall 


    movzx rbx, byte [buffer]

    cmp rbx, '0'
    jl not_number
    cmp rbx, '9'
    jg not_number
    

    sub rbx, '0'


    cmp rbx, 2
    je is_prime
    cmp rbx, 3
    je is_prime
    cmp rbx, 5
    je is_prime
    cmp rbx, 7
    je is_prime
    jmp not_prime

is_prime:
    mov rax, 60
    xor rdi, rdi
    syscall

not_prime:
    mov rax, 60
    mov rdi, 1
    syscall

not_number:
    mov rax, 60
    mov rdi, 2
    syscall
