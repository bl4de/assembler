section .text

global _start

_start:
    xor eax,eax
    xor ebx,ebx
    mov al, 0x01
    int 0x80


; Breakpoint 1, 0x08048e47 in main ()
; (gdb) disass _exit
; Dump of assembler code for function _exit:
;    0x0806c501 <+0>:	mov    0x4(%esp),%ebx
;    0x0806c505 <+4>:	mov    $0xfc,%eax
;    0x0806c50a <+9>:	call   *0x80ea9f0
;    0x0806c510 <+15>:	mov    $0x1,%eax
;    0x0806c515 <+20>:	int    $0x80
;    0x0806c517 <+22>:	hlt
; End of assembler dump.
; (gdb)

