
default rel

extern GetStdHandle
extern WriteFile
extern ExitProcess

global start

section .data
    message db "Hey Hey!", 13, 10
    msg_len equ $ - message

section .bss
    bytes_written resd 1

section .text
start:
    ; GetStdHandle(STD_OUTPUT_HANDLE)
    sub rsp, 40
    mov ecx, -11
    call GetStdHandle

    ; WriteFile(handle, message, length, &bytes_written, NULL)
    mov rcx, rax
    lea rdx, [message]
    mov r8d, msg_len
    lea r9, [bytes_written]
    mov qword [rsp+32], 0
    call WriteFile

    ; ExitProcess(0)
    xor ecx, ecx
    call ExitProcess
