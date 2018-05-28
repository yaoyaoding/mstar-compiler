





default rel

global main

extern malloc


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     dword [rbp-34H], 1
        mov     dword [rbp-30H], 2
        mov     dword [rbp-2CH], 3
        mov     dword [rbp-28H], 4
        mov     dword [rbp-24H], 5
        mov     dword [rbp-20H], 6
        mov     dword [rbp-1CH], 7
        mov     dword [rbp-18H], 8
        mov     eax, dword [rbp-30H]
        mov     edx, dword [rbp-34H]
        add     eax, edx
        mov     dword [rbp-14H], eax
        mov     eax, dword [rbp-14H]
        imul    eax, dword [rbp-2CH]
        mov     dword [rbp-10H], eax
        mov     eax, dword [rbp-10H]
        mov     edx, dword [rbp-14H]
        add     edx, eax
        mov     eax, dword [rbp-28H]
        add     edx, eax
        mov     eax, dword [rbp-24H]
        add     edx, eax
        mov     eax, dword [rbp-20H]
        add     edx, eax
        mov     eax, dword [rbp-1CH]
        add     edx, eax
        mov     eax, dword [rbp-18H]
        add     eax, edx
        mov     dword [rbp-0CH], eax
        mov     eax, dword [rbp-0CH]
        cdqe
        shl     rax, 2
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .eh_frame align=8

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H
        dd main-$-20H
        dd 00000095H, 100E4100H
        dd 0D430286H, 0C900206H
        dd 00000807H


