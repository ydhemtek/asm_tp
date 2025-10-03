global _start

section .data
nl db 0x0A

section .bss
buffer resb 16

section .text
_start:



    mov rsi, [rsp+16]
    call atoi
    mov rbx, rax

    mov rsi, [rsp+24]
    call atoi
    add rax, rbx


    mov rdi, buffer
    call itoa


    xor rcx, rcx
.len_loop:
    cmp byte [buffer+rcx], 0
    je .done_len
    inc rcx
    jmp .len_loop
.done_len:


    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, rcx
    syscall


    mov rax, 1
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall



    mov rax, 60
    xor rdi, rdi
    syscall





atoi:
    xor rax, rax
.next_digit:
    mov dl, byte [rsi]
    cmp dl, 0
    je .done
    cmp dl, 0x0A
    je .done
    sub dl, '0'
    imul rax, rax, 10
    add rax, rdx
    inc rsi
    jmp .next_digit
.done:
    ret


itoa:
    mov rcx, 0
    mov rbx, 10
    mov rdx, 0
    mov rsi, rdi


.convert_loop:
    xor rdx, rdx
    div rbx 
    add dl, '0'
    push rdx
    inc rcx
    test rax, rax
    jnz .convert_loop


.write_loop:
    pop rdx
    mov [rsi], dl
    inc rsi
    loop .write_loop

    mov byte [rsi], 0
    ret
