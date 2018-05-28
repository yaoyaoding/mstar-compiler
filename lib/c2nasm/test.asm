





default rel

global _Z4sizePl
global main


SECTION .text   6

_Z4sizePl:
        mov     rax, qword [rdi-8H]
        ret



SECTION .data   


SECTION .bss    


SECTION .text.startup 6

main:
        xor     eax, eax
        ret



SECTION .eh_frame align=8

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H
        db 10H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H
        dd _Z4sizePl-$-20H
        dd 00000005H, 00000000H
        dd 00000010H, 00000030H
        dd main-$-34H
        dd 00000003H, 00000000H


