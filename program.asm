





default rel

global __hasValue
global __getValue
global __setValue
global __print
global __println
global __getString
global __getInt
global __toString
global __string_length
global __string_substring
global __string_parseInt
global __string_ord
global __stringConcate
global __stringCompare
global __value
global __has
global __real_addr
global main

extern strcmp
extern __sprintf_chk
extern memcpy
extern malloc
extern __isoc99_scanf
extern puts
extern __printf_chk


SECTION .text   6

__hasValue:
        mov     rax, rdi
        mov     rdx, qword 1323E34A2B10BF67H
        imul    rdx
        mov     rax, rdi
        sar     rax, 63
        sar     rdx, 3
        sub     rdx, rax
        mov     eax, 107
        imul    rdx, rax
        mov     rax, rdi
        sub     rax, rdx
        mov     rdx, rax
        xor     eax, eax

        cmp     qword [abs __real_addr+rdx*8], rdi
        jz      L_002
L_001:

        ret





ALIGN   8
L_002:  cmp     rsi, 209
        ja      L_001
        imul    rdx, rdx, 210
        add     rsi, rdx

        mov     rax, qword [abs __has+rsi*8]
        ret






ALIGN   8

__getValue:
        mov     rax, rdi
        mov     rdx, qword 1323E34A2B10BF67H
        imul    rdx
        mov     rax, rdi
        sar     rax, 63
        sar     rdx, 3
        sub     rdx, rax
        mov     eax, 107
        imul    rdx, rax
        sub     rdi, rdx
        imul    rdi, rdi, 210
        add     rsi, rdi

        mov     rax, qword [abs __value+rsi*8]
        ret






ALIGN   8

__setValue:
        cmp     rsi, 209
        mov     r9, rdx
        ja      L_008
        mov     r8, qword 1323E34A2B10BF67H
        mov     rax, rdi
        mov     r10d, 107
        imul    r8
        mov     rax, rdi
        sar     rax, 63
        mov     r8, rdx
        sar     r8, 3
        sub     r8, rax
        mov     rax, rdi
        imul    r8, r10
        sub     rax, r8
        mov     r8, rax

        mov     rax, qword [abs __real_addr+rax*8]
        cmp     rax, rdi
        jz      L_007
        test    rax, rax
        je      L_012
        imul    rax, r8, 1680
        mov     edx, 1680

        lea     rdi, [abs __has+rax]
        test    dil, 01H
        jne     L_013
L_003:  test    dil, 02H
        jne     L_014
L_004:  test    dil, 04H
        jne     L_015
L_005:  mov     ecx, edx
        xor     eax, eax
        shr     ecx, 3
        test    dl, 04H
        rep stosq
        jnz     L_011
        test    dl, 02H
        jnz     L_010
L_006:  and     edx, 01H
        jnz     L_009




ALIGN   8
L_007:  mov     rax, r9
        imul    r8, r8, 210
        add     rsi, r8

        mov     qword [abs __has+rsi*8], 1

        mov     qword [abs __value+rsi*8], r9
        ret





ALIGN   8
L_008:

        ret





ALIGN   8
L_009:  mov     byte [rdi], 0
        jmp     L_007





ALIGN   8
L_010:  xor     eax, eax
        add     rdi, 2
        mov     word [rdi-2H], ax
        and     edx, 01H
        jz      L_007
        jmp     L_009





ALIGN   8
L_011:  mov     dword [rdi], 0
        add     rdi, 4
        test    dl, 02H
        jz      L_006
        jmp     L_010





ALIGN   8
L_012:

        mov     qword [abs __real_addr+r8*8], rdi
        jmp     L_007





ALIGN   8
L_013:

        mov     byte [abs __has+rax], 0
        add     rdi, 1
        mov     dl, -113
        jmp     L_003





ALIGN   8
L_014:  xor     ecx, ecx
        add     rdi, 2
        sub     edx, 2
        mov     word [rdi-2H], cx
        jmp     L_004





ALIGN   8
L_015:  mov     dword [rdi], 0
        sub     edx, 4
        add     rdi, 4
        jmp     L_005







ALIGN   16

__print:
        lea     rdx, [rdi+8H]
        mov     esi, L_032
        mov     edi, 1
        xor     eax, eax
        jmp     __printf_chk







ALIGN   16

__println:
        add     rdi, 8
        jmp     puts






ALIGN   8

__getString:
        push    rbp
        mov     esi, __buffer.3442
        mov     edi, L_032
        xor     eax, eax
        push    rbx
        mov     ebx, __buffer.3442
        sub     rsp, 8
        call    __isoc99_scanf
L_016:  mov     edx, dword [rbx]
        add     rbx, 4
        lea     eax, [rdx-1010101H]
        not     edx
        and     eax, edx
        and     eax, 80808080H
        jz      L_016
        mov     edx, eax
        shr     edx, 16
        test    eax, 8080H
        cmove   eax, edx
        lea     rdx, [rbx+2H]
        cmove   rbx, rdx
        add     al, al
        sbb     rbx, 3
        sub     rbx, __buffer.3442
        lea     edi, [rbx+8H]
        movsxd  rdi, edi
        call    malloc
        mov     rbp, rax
        lea     rdx, [rbx+1H]
        movsxd  rax, ebx
        lea     rdi, [rbp+8H]
        mov     qword [rbp], rax
        mov     esi, __buffer.3442
        call    memcpy
        add     rsp, 8
        mov     rax, rbp
        pop     rbx
        pop     rbp
        ret







ALIGN   16

__getInt:
        sub     rsp, 24
        mov     edi, L_033
        xor     eax, eax
        lea     rsi, [rsp+8H]
        call    __isoc99_scanf
        mov     rax, qword [rsp+8H]
        add     rsp, 24
        ret


        nop

ALIGN   16
__toString:
        push    rbp
        mov     rbp, rdi
        mov     edi, 32
        push    rbx
        sub     rsp, 8
        call    malloc
        lea     rdi, [rax+8H]
        mov     rbx, rax
        mov     r8, rbp
        mov     ecx, L_033
        mov     edx, 24
        mov     esi, 1
        xor     eax, eax
        call    __sprintf_chk
        cdqe
        mov     qword [rbx], rax
        add     rsp, 8
        mov     rax, rbx
        pop     rbx
        pop     rbp
        ret







ALIGN   16

__string_length:
        mov     rax, qword [rdi]
        ret







ALIGN   16

__string_substring:
        push    r15
        push    r14
        push    r13
        movsxd  r13, esi
        push    r12
        mov     r12d, edx
        sub     r12d, r13d
        push    rbp
        mov     rbp, rdi
        lea     edi, [r12+0AH]
        push    rbx
        lea     ebx, [r12+1H]
        movsxd  rdi, edi
        sub     rsp, 8
        call    malloc
        movsxd  rdx, ebx
        test    ebx, ebx
        mov     qword [rax], rdx
        jle     L_018
        lea     edi, [r13+8H]
        add     r13, rbp
        lea     rcx, [rax+18H]
        lea     rdx, [r13+8H]
        lea     rsi, [r13+18H]
        cmp     rcx, rdx
        lea     rdx, [rax+8H]
        setbe   cl
        cmp     rsi, rdx
        setbe   dl
        or      cl, dl
        je      L_019
        cmp     ebx, 15
        jbe     L_019
        mov     esi, ebx
        xor     edx, edx
        xor     r8d, r8d
        shr     esi, 4
        mov     ecx, esi
        shl     ecx, 4
L_017:  movdqu  xmm0, oword [r13+rdx+8H]
        add     r8d, 1
        movdqu  oword [rax+rdx+8H], xmm0
        add     rdx, 16
        cmp     r8d, esi
        jc      L_017
        cmp     ebx, ecx
        je      L_018
        lea     edx, [rdi+rcx]
        lea     r13d, [rcx+8H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r13d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+1H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r11d, [rcx+9H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r11d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+2H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r10d, [rcx+0AH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r10d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+3H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r9d, [rcx+0BH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r9d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+4H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r8d, [rcx+0CH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r8d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+5H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     esi, [rcx+0DH]
        movsxd  rdx, edx
        movzx   r14d, byte [rbp+rdx]
        movsxd  rdx, esi
        mov     byte [rax+rdx], r14b
        lea     edx, [rcx+6H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        movsxd  rdx, edx
        movzx   r15d, byte [rbp+rdx]
        lea     edx, [rcx+0EH]
        movsxd  r14, edx
        mov     byte [rax+r14], r15b
        lea     r14d, [rcx+7H]
        cmp     ebx, r14d
        jle     L_018
        add     r14d, edi
        cmp     ebx, r13d
        movsxd  r14, r14d
        movzx   r15d, byte [rbp+r14]
        lea     r14d, [rcx+0FH]
        movsxd  r14, r14d
        mov     byte [rax+r14], r15b
        jle     L_018
        add     r13d, edi
        cmp     ebx, r11d
        movsxd  r13, r13d
        movzx   r14d, byte [rbp+r13]
        lea     r13d, [rcx+10H]
        movsxd  r13, r13d
        mov     byte [rax+r13], r14b
        jle     L_018
        add     r11d, edi
        cmp     ebx, r10d
        movsxd  r11, r11d
        movzx   r13d, byte [rbp+r11]
        lea     r11d, [rcx+11H]
        movsxd  r11, r11d
        mov     byte [rax+r11], r13b
        jle     L_018
        add     r10d, edi
        cmp     ebx, r9d
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        lea     r10d, [rcx+12H]
        movsxd  r10, r10d
        mov     byte [rax+r10], r11b
        jle     L_018
        add     r9d, edi
        cmp     ebx, r8d
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        lea     r9d, [rcx+13H]
        movsxd  r9, r9d
        mov     byte [rax+r9], r10b
        jle     L_018
        add     r8d, edi
        cmp     ebx, esi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        lea     r8d, [rcx+14H]
        movsxd  r8, r8d
        mov     byte [rax+r8], r9b
        jle     L_018
        add     esi, edi
        cmp     ebx, edx
        movsxd  rsi, esi
        movzx   r8d, byte [rbp+rsi]
        lea     esi, [rcx+15H]
        movsxd  rsi, esi
        mov     byte [rax+rsi], r8b
        jle     L_018
        add     edx, edi
        add     ecx, 22
        movsxd  rdx, edx
        movsxd  rcx, ecx
        movzx   edx, byte [rbp+rdx]
        mov     byte [rax+rcx], dl
L_018:  add     r12d, 9
        movsxd  r12, r12d
        mov     byte [rax+r12], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret





ALIGN   16
L_019:  movsxd  rdi, edi
        xor     ecx, ecx
        add     rbp, rdi




ALIGN   16
L_020:  movzx   edx, byte [rbp+rcx]
        mov     byte [rax+rcx+8H], dl
        add     rcx, 1
        cmp     ebx, ecx
        jg      L_020
        jmp     L_018







ALIGN   16

__string_parseInt:
        movsx   edx, byte [rdi+8H]
        cmp     dl, 45
        jz      L_024
        lea     rcx, [rdi+8H]
        xor     edi, edi
L_021:  lea     eax, [rdx-30H]
        cmp     al, 9
        mov     eax, 0
        ja      L_023




ALIGN   8
L_022:  sub     edx, 48
        lea     rax, [rax+rax*4]
        add     rcx, 1
        movsxd  rdx, edx
        lea     rax, [rdx+rax*2]
        movsx   edx, byte [rcx]
        lea     esi, [rdx-30H]
        cmp     sil, 9
        jbe     L_022
L_023:  mov     rdx, rax
        neg     rdx
        test    edi, edi
        cmovne  rax, rdx
        ret





ALIGN   8
L_024:  lea     rcx, [rdi+9H]
        movsx   edx, byte [rdi+9H]
        mov     edi, 1
        jmp     L_021


        nop

ALIGN   16
__string_ord:
        movsx   rax, byte [rdi+rsi+8H]
        ret







ALIGN   16

__stringConcate:
        push    r15
        push    r14
        push    r13
        push    r12
        mov     r12, rsi
        push    rbp
        mov     rbp, rdi
        push    rbx
        sub     rsp, 8
        mov     rbx, qword [rdi]
        mov     r13, qword [rsi]
        lea     r14, [rbx+r13]
        lea     rdi, [r14+9H]
        call    malloc
        test    rbx, rbx
        mov     qword [rax], r14
        jle     L_026
        lea     rcx, [rbp+8H]
        lea     rdx, [rax+18H]
        lea     rsi, [rbp+18H]
        cmp     rcx, rdx
        lea     rdx, [rax+8H]
        setae   cl
        cmp     rsi, rdx
        setbe   dl
        or      cl, dl
        je      L_029
        cmp     rbx, 15
        jbe     L_029
        mov     rsi, rbx
        xor     ecx, ecx
        xor     edi, edi
        shr     rsi, 4
        mov     rdx, rsi
        shl     rdx, 4
L_025:  movdqu  xmm0, oword [rbp+rcx+8H]
        add     rdi, 1
        movdqu  oword [rax+rcx+8H], xmm0
        add     rcx, 16
        cmp     rsi, rdi
        ja      L_025
        cmp     rbx, rdx
        je      L_026
        lea     r14d, [rdx+8H]
        movsxd  r14, r14d
        movzx   ecx, byte [rbp+r14]
        mov     byte [rax+r14], cl
        lea     ecx, [rdx+1H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     r10d, [rdx+9H]
        movsxd  rcx, r10d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+2H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     r9d, [rdx+0AH]
        movsxd  rcx, r9d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+3H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     r8d, [rdx+0BH]
        movsxd  rcx, r8d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+4H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     edi, [rdx+0CH]
        movsxd  rcx, edi
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+5H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     esi, [rdx+0DH]
        movsxd  rcx, esi
        movzx   r11d, byte [rbp+rcx]
        mov     byte [rax+rcx], r11b
        lea     ecx, [rdx+6H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     ecx, [rdx+0EH]
        movsxd  r11, ecx
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        lea     r11d, [rdx+7H]
        movsxd  r11, r11d
        cmp     rbx, r11
        jle     L_026
        lea     r11d, [rdx+0FH]
        cmp     rbx, r14
        movsxd  r11, r11d
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        jle     L_026
        lea     r11d, [rdx+10H]
        movsxd  r10, r10d
        cmp     rbx, r10
        movsxd  r11, r11d
        movzx   r14d, byte [rbp+r11]
        mov     byte [rax+r11], r14b
        jle     L_026
        lea     r10d, [rdx+11H]
        movsxd  r9, r9d
        cmp     rbx, r9
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        mov     byte [rax+r10], r11b
        jle     L_026
        lea     r9d, [rdx+12H]
        movsxd  r8, r8d
        cmp     rbx, r8
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        mov     byte [rax+r9], r10b
        jle     L_026
        lea     r8d, [rdx+13H]
        movsxd  rdi, edi
        cmp     rbx, rdi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        mov     byte [rax+r8], r9b
        jle     L_026
        lea     edi, [rdx+14H]
        movsxd  rsi, esi
        cmp     rbx, rsi
        movsxd  rdi, edi
        movzx   r8d, byte [rbp+rdi]
        mov     byte [rax+rdi], r8b
        jle     L_026
        lea     esi, [rdx+15H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        movsxd  rsi, esi
        movzx   edi, byte [rbp+rsi]
        mov     byte [rax+rsi], dil
        jle     L_026
        add     edx, 22
        movsxd  rdx, edx
        movzx   ecx, byte [rbp+rdx]
        mov     byte [rax+rdx], cl
L_026:  test    r13, r13
        jle     L_031
        lea     rsi, [r13+1H]
        add     rbx, 8
        mov     edx, 1
        xor     ecx, ecx




ALIGN   8
L_027:  movzx   edi, byte [r12+rdx+7H]
        add     rcx, rax
        mov     byte [rcx+rbx], dil
        mov     rcx, rdx
        add     rdx, 1
        cmp     rdx, rsi
        jnz     L_027
L_028:  add     r13, rax
        mov     byte [r13+rbx], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret





ALIGN   8
L_029:  xor     edx, edx




ALIGN   8
L_030:  movzx   ecx, byte [rbp+rdx+8H]
        mov     byte [rax+rdx+8H], cl
        add     rdx, 1
        cmp     rbx, rdx
        jnz     L_030
        jmp     L_026

L_031:  add     rbx, 8
        jmp     L_028







ALIGN   16

__stringCompare:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        add     rsp, 8
        cdqe
        ret



SECTION .data   


SECTION .bss    align=32

__value:
        resq    22472

__has:
        resq    22472

__real_addr:
        resq    108

__buffer.3442:
        resb    1048576


SECTION .text.startup 6

main:
        xor     eax, eax
        jmp     __init



SECTION .rodata.str1.1 

L_032:
        db 25H, 73H, 00H

L_033:
        db 25H, 6CH, 64H, 00H


;=====================================================================
	 section .text
_cd:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 864
	push r13
	push r15
	push r12
	push rbx
	push r14
	mov rax, rdi
	mov qword [rbp - 408], rax
	mov rax, rsi
	mov qword [rbp - 88], rax
	mov rax, rdx
	mov qword [rbp - 584], rax
	mov rax, rcx
	mov qword [rbp - 152], rax
	mov rcx, r8
	mov rax, qword [rbp - 408]
	cmp rax, 1
	je b1
	b2:
	mov rax, qword [rbp - 408]
	sub rax, 1
	mov qword [rbp - 592], rax
	mov rax, qword [rbp - 88]
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 584]
	mov qword [rbp - 712], rax
	b3:
	mov rax, qword [rbp - 592]
	cmp rax, 1
	je b4
	b5:
	mov rax, qword [rbp - 592]
	sub rax, 1
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 200]
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 712]
	mov qword [rbp - 768], rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 720], rax
	b6:
	mov rax, qword [rbp - 96]
	cmp rax, 1
	je b7
	b8:
	mov rax, qword [rbp - 96]
	sub rax, 1
	mov qword [rbp - 784], rax
	mov rax, qword [rbp - 64]
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 720]
	mov qword [rbp - 456], rax
	mov rax, qword [rbp - 768]
	mov qword [rbp - 104], rax
	b9:
	mov rax, qword [rbp - 784]
	cmp rax, 1
	je b10
	b11:
	mov rax, qword [rbp - 784]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 184]
	mov qword [rbp - 432], rax
	mov rax, qword [rbp - 104]
	mov qword [rbp - 544], rax
	mov rax, qword [rbp - 456]
	mov qword [rbp - 80], rax
	mov rdx, rcx
	b12:
	cmp rbx, 1
	je b13
	b14:
	mov rax, rbx
	sub rax, 1
	mov rcx, qword [rbp - 432]
	mov r14, rcx
	mov rcx, qword [rbp - 80]
	mov r15, rcx
	mov rcx, qword [rbp - 544]
	mov r12, rcx
	mov rcx, rdx
	b15:
	cmp rax, 1
	je b16
	b17:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, r15
	mov rdx, r12
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b18
	b16:
	inc rcx
	b18:
	mov rax, rcx
	b19:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 544]
	mov rbx, rax
	mov rax, qword [rbp - 432]
	mov r12, rax
	mov rax, qword [rbp - 80]
	mov r15, rax
	mov rcx, rdx
	b20:
	cmp rsi, 1
	je b21
	b22:
	mov r14, rsi
	sub r14, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b23
	b21:
	inc rcx
	b23:
	mov rax, rcx
	b24:
	mov rdx, rax
	inc rdx
	jmp b25
	b13:
	inc rdx
	b25:
	mov rax, rdx
	b26:
	mov rcx, rax
	mov rax, qword [rbp - 784]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 456]
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 184]
	mov qword [rbp - 560], rax
	mov rax, qword [rbp - 104]
	mov qword [rbp - 464], rax
	mov rdx, rcx
	b27:
	cmp rbx, 1
	je b28
	b29:
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 240]
	mov r14, rax
	mov rax, qword [rbp - 464]
	mov r12, rax
	mov rax, qword [rbp - 560]
	mov r15, rax
	mov rax, rdx
	b30:
	cmp rcx, 1
	je b31
	b32:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r15
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r15
	mov rdx, r14
	mov rsi, r12
	call _cd
	inc rax
	jmp b33
	b31:
	inc rax
	b33:
	b34:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 560]
	mov rbx, rax
	mov rax, qword [rbp - 240]
	mov r14, rax
	mov rax, qword [rbp - 464]
	mov r12, rax
	mov rax, rdx
	b35:
	cmp rcx, 1
	je b36
	b37:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	call _cd
	inc rax
	jmp b38
	b36:
	inc rax
	b38:
	b39:
	mov rdx, rax
	inc rdx
	jmp b40
	b28:
	inc rdx
	b40:
	mov rax, rdx
	b41:
	mov rcx, rax
	inc rcx
	jmp b42
	b10:
	inc rcx
	b42:
	mov rax, rcx
	b43:
	mov rcx, rax
	mov rax, qword [rbp - 96]
	sub rax, 1
	mov qword [rbp - 800], rax
	mov rax, qword [rbp - 768]
	mov qword [rbp - 552], rax
	mov rax, qword [rbp - 64]
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 720]
	mov qword [rbp - 48], rax
	b44:
	mov rax, qword [rbp - 800]
	cmp rax, 1
	je b45
	b46:
	mov rax, qword [rbp - 800]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 552]
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 520], rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 648], rax
	mov rdx, rcx
	b47:
	cmp r14, 1
	je b48
	b49:
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 24]
	mov rbx, rax
	mov rax, qword [rbp - 648]
	mov r12, rax
	mov rax, qword [rbp - 520]
	mov r15, rax
	b50:
	cmp rcx, 1
	je b51
	b52:
	mov r13, rcx
	sub r13, 1
	mov r8, rdx
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rdx, rax
	mov rax, r13
	mov r8, rdx
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b53
	b51:
	inc rdx
	b53:
	mov rax, rdx
	b54:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 520]
	mov r12, rax
	mov rax, qword [rbp - 24]
	mov rbx, rax
	mov rax, qword [rbp - 648]
	mov r14, rax
	b55:
	cmp rcx, 1
	je b56
	b57:
	mov r15, rcx
	sub r15, 1
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rdx, rax
	mov rax, r15
	mov r8, rdx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b58
	b56:
	inc rdx
	b58:
	mov rax, rdx
	b59:
	mov rdx, rax
	inc rdx
	jmp b60
	b48:
	inc rdx
	b60:
	mov rax, rdx
	b61:
	mov rcx, rax
	mov rax, qword [rbp - 800]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 392], rax
	mov rax, qword [rbp - 552]
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 360], rax
	mov rdx, rcx
	b62:
	cmp r12, 1
	je b63
	b64:
	mov rax, r12
	sub rax, 1
	mov rcx, qword [rbp - 392]
	mov rbx, rcx
	mov rcx, qword [rbp - 360]
	mov r15, rcx
	mov rcx, qword [rbp - 384]
	mov r13, rcx
	mov rcx, rdx
	b65:
	cmp rax, 1
	je b66
	b67:
	mov r14, rax
	sub r14, 1
	mov r8, rcx
	mov rcx, r15
	mov rdx, r13
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b68
	b66:
	inc rcx
	b68:
	mov rax, rcx
	b69:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rcx, qword [rbp - 384]
	mov rbx, rcx
	mov rcx, qword [rbp - 392]
	mov r14, rcx
	mov rcx, qword [rbp - 360]
	mov r12, rcx
	mov rcx, rdx
	b70:
	cmp rax, 1
	je b71
	b72:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b73
	b71:
	inc rcx
	b73:
	mov rax, rcx
	b74:
	mov rdx, rax
	inc rdx
	jmp b75
	b63:
	inc rdx
	b75:
	mov rax, rdx
	b76:
	mov rcx, rax
	inc rcx
	jmp b77
	b45:
	inc rcx
	b77:
	mov rax, rcx
	b78:
	mov rcx, rax
	inc rcx
	jmp b79
	b7:
	inc rcx
	b79:
	mov rax, rcx
	b80:
	mov rcx, rax
	mov rax, qword [rbp - 592]
	sub rax, 1
	mov qword [rbp - 856], rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 200]
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 712]
	mov qword [rbp - 376], rax
	b81:
	mov rax, qword [rbp - 856]
	cmp rax, 1
	je b82
	b83:
	mov rax, qword [rbp - 856]
	sub rax, 1
	mov qword [rbp - 128], rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 832], rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 536], rax
	b84:
	mov rax, qword [rbp - 128]
	cmp rax, 1
	je b85
	b86:
	mov rax, qword [rbp - 128]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 832]
	mov qword [rbp - 840], rax
	mov rax, qword [rbp - 536]
	mov qword [rbp - 688], rax
	mov rax, qword [rbp - 576]
	mov qword [rbp - 440], rax
	mov rdx, rcx
	b87:
	cmp r14, 1
	je b88
	b89:
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 840]
	mov rbx, rcx
	mov rcx, qword [rbp - 440]
	mov r12, rcx
	mov rcx, qword [rbp - 688]
	mov r15, rcx
	mov rcx, rdx
	b90:
	cmp rax, 1
	je b91
	b92:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b93
	b91:
	inc rcx
	b93:
	mov rax, rcx
	b94:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 688]
	mov r12, rax
	mov rax, qword [rbp - 840]
	mov r15, rax
	mov rax, qword [rbp - 440]
	mov r14, rax
	mov rax, rdx
	b95:
	cmp rcx, 1
	je b96
	b97:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r15
	mov rdx, r14
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, r15
	call _cd
	inc rax
	jmp b98
	b96:
	inc rax
	b98:
	b99:
	mov rdx, rax
	inc rdx
	jmp b100
	b88:
	inc rdx
	b100:
	mov rax, rdx
	b101:
	mov rcx, rax
	mov rax, qword [rbp - 128]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 576]
	mov qword [rbp - 320], rax
	mov rax, qword [rbp - 832]
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 536]
	mov qword [rbp - 8], rax
	mov rax, rcx
	b102:
	cmp rbx, 1
	je b103
	b104:
	mov rcx, rbx
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 320]
	mov r12, rcx
	mov rcx, qword [rbp - 8]
	mov r14, rcx
	mov rcx, qword [rbp - 40]
	mov r15, rcx
	b105:
	cmp rdx, 1
	je b106
	b107:
	mov r13, rdx
	sub r13, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r15
	mov rsi, r12
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r15
	mov rdx, r12
	mov rsi, r14
	call _cd
	inc rax
	jmp b108
	b106:
	inc rax
	b108:
	b109:
	mov rcx, rbx
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 40]
	mov r15, rcx
	mov rcx, qword [rbp - 320]
	mov rbx, rcx
	mov rcx, qword [rbp - 8]
	mov r12, rcx
	mov rcx, rax
	b110:
	cmp rdx, 1
	je b111
	b112:
	mov r14, rdx
	sub r14, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r15
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b113
	b111:
	inc rcx
	b113:
	mov rax, rcx
	b114:
	inc rax
	jmp b115
	b103:
	inc rax
	b115:
	b116:
	mov rcx, rax
	inc rcx
	jmp b117
	b85:
	inc rcx
	b117:
	mov rax, rcx
	b118:
	mov rcx, rax
	mov rax, qword [rbp - 856]
	sub rax, 1
	mov qword [rbp - 424], rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 280], rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 656], rax
	b119:
	mov rax, qword [rbp - 424]
	cmp rax, 1
	je b120
	b121:
	mov rax, qword [rbp - 424]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 224]
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 656]
	mov qword [rbp - 776], rax
	mov rax, qword [rbp - 280]
	mov qword [rbp - 504], rax
	mov rdx, rcx
	b122:
	cmp r12, 1
	je b123
	b124:
	mov rax, r12
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 32]
	mov r15, rax
	mov rax, qword [rbp - 504]
	mov r13, rax
	mov rax, qword [rbp - 776]
	mov r14, rax
	mov rcx, rdx
	b125:
	cmp rsi, 1
	je b126
	b127:
	mov rbx, rsi
	sub rbx, 1
	mov r8, rcx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r15
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b128
	b126:
	inc rcx
	b128:
	mov rax, rcx
	b129:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rcx, qword [rbp - 776]
	mov rbx, rcx
	mov rcx, qword [rbp - 32]
	mov r14, rcx
	mov rcx, qword [rbp - 504]
	mov r12, rcx
	mov rcx, rdx
	b130:
	cmp rax, 1
	je b131
	b132:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b133
	b131:
	inc rcx
	b133:
	mov rax, rcx
	b134:
	mov rdx, rax
	inc rdx
	jmp b135
	b123:
	inc rdx
	b135:
	mov rax, rdx
	b136:
	mov rcx, rax
	mov rax, qword [rbp - 424]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 280]
	mov qword [rbp - 232], rax
	mov rax, qword [rbp - 224]
	mov qword [rbp - 336], rax
	mov rax, qword [rbp - 656]
	mov qword [rbp - 120], rax
	b137:
	cmp r12, 1
	je b138
	b139:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 232]
	mov r15, rax
	mov rax, qword [rbp - 120]
	mov r14, rax
	mov rax, qword [rbp - 336]
	mov rbx, rax
	b140:
	cmp rdx, 1
	je b141
	b142:
	mov r13, rdx
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b143
	b141:
	inc rcx
	b143:
	mov rax, rcx
	b144:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 336]
	mov r12, rax
	mov rax, qword [rbp - 232]
	mov r15, rax
	mov rax, qword [rbp - 120]
	mov r14, rax
	mov rax, rcx
	b145:
	cmp rdx, 1
	je b146
	b147:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r15
	mov rdx, r14
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, r15
	call _cd
	inc rax
	jmp b148
	b146:
	inc rax
	b148:
	b149:
	mov rcx, rax
	inc rcx
	jmp b150
	b138:
	inc rcx
	b150:
	mov rax, rcx
	b151:
	mov rcx, rax
	inc rcx
	jmp b152
	b120:
	inc rcx
	b152:
	mov rax, rcx
	b153:
	mov rcx, rax
	inc rcx
	jmp b154
	b82:
	inc rcx
	b154:
	mov rax, rcx
	b155:
	mov rcx, rax
	inc rcx
	jmp b156
	b4:
	inc rcx
	b156:
	mov rax, rcx
	b157:
	mov rcx, rax
	mov rax, qword [rbp - 408]
	sub rax, 1
	mov qword [rbp - 192], rax
	mov rax, qword [rbp - 584]
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 88]
	mov qword [rbp - 752], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 608], rax
	b158:
	mov rax, qword [rbp - 192]
	cmp rax, 1
	je b159
	b160:
	mov rax, qword [rbp - 192]
	sub rax, 1
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 136]
	mov qword [rbp - 672], rax
	mov rax, qword [rbp - 608]
	mov qword [rbp - 680], rax
	mov rax, qword [rbp - 752]
	mov qword [rbp - 600], rax
	b161:
	mov rax, qword [rbp - 272]
	cmp rax, 1
	je b162
	b163:
	mov rax, qword [rbp - 272]
	sub rax, 1
	mov qword [rbp - 176], rax
	mov rax, qword [rbp - 672]
	mov qword [rbp - 160], rax
	mov rax, qword [rbp - 600]
	mov qword [rbp - 368], rax
	mov rax, qword [rbp - 680]
	mov qword [rbp - 848], rax
	b164:
	mov rax, qword [rbp - 176]
	cmp rax, 1
	je b165
	b166:
	mov rax, qword [rbp - 176]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 352], rax
	mov rax, qword [rbp - 848]
	mov qword [rbp - 328], rax
	mov rax, qword [rbp - 368]
	mov qword [rbp - 616], rax
	mov rdx, rcx
	b167:
	cmp rbx, 1
	je b168
	b169:
	mov rax, rbx
	sub rax, 1
	mov rcx, qword [rbp - 352]
	mov r12, rcx
	mov rcx, qword [rbp - 616]
	mov r14, rcx
	mov rcx, qword [rbp - 328]
	mov r15, rcx
	mov rcx, rdx
	b170:
	cmp rax, 1
	je b171
	b172:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r15
	mov rsi, r12
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r15
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b173
	b171:
	inc rcx
	b173:
	mov rax, rcx
	b174:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 328]
	mov r14, rax
	mov rax, qword [rbp - 352]
	mov rbx, rax
	mov rax, qword [rbp - 616]
	mov r12, rax
	mov rax, rdx
	b175:
	cmp rcx, 1
	je b176
	b177:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	call _cd
	inc rax
	jmp b178
	b176:
	inc rax
	b178:
	b179:
	mov rdx, rax
	inc rdx
	jmp b180
	b168:
	inc rdx
	b180:
	mov rax, rdx
	b181:
	mov rcx, rax
	mov rax, qword [rbp - 176]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 368]
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 848]
	mov qword [rbp - 488], rax
	mov rax, rcx
	b182:
	cmp r14, 1
	je b183
	b184:
	mov rcx, r14
	sub rcx, 1
	mov rdx, qword [rbp - 304]
	mov r15, rdx
	mov rdx, qword [rbp - 488]
	mov rbx, rdx
	mov rdx, qword [rbp - 256]
	mov r12, rdx
	mov rdx, rax
	b185:
	cmp rcx, 1
	je b186
	b187:
	mov r13, rcx
	sub r13, 1
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rdx, rax
	mov rax, r13
	mov r8, rdx
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b188
	b186:
	inc rdx
	b188:
	mov rax, rdx
	b189:
	mov rcx, r14
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 256]
	mov rbx, rcx
	mov rcx, qword [rbp - 304]
	mov r14, rcx
	mov rcx, qword [rbp - 488]
	mov r12, rcx
	mov rcx, rax
	b190:
	cmp rdx, 1
	je b191
	b192:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b193
	b191:
	inc rcx
	b193:
	mov rax, rcx
	b194:
	inc rax
	jmp b195
	b183:
	inc rax
	b195:
	b196:
	mov rcx, rax
	inc rcx
	jmp b197
	b165:
	inc rcx
	b197:
	mov rax, rcx
	b198:
	mov rcx, rax
	mov rax, qword [rbp - 272]
	sub rax, 1
	mov qword [rbp - 472], rax
	mov rax, qword [rbp - 680]
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 672]
	mov qword [rbp - 248], rax
	mov rax, qword [rbp - 600]
	mov qword [rbp - 792], rax
	b199:
	mov rax, qword [rbp - 472]
	cmp rax, 1
	je b200
	b201:
	mov rax, qword [rbp - 472]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 400]
	mov qword [rbp - 736], rax
	mov rax, qword [rbp - 792]
	mov qword [rbp - 264], rax
	mov rax, qword [rbp - 248]
	mov qword [rbp - 416], rax
	mov rdx, rcx
	b202:
	cmp rbx, 1
	je b203
	b204:
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 736]
	mov r14, rax
	mov rax, qword [rbp - 416]
	mov r12, rax
	mov rax, qword [rbp - 264]
	mov r13, rax
	mov rax, rdx
	b205:
	cmp rcx, 1
	je b206
	b207:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	call _cd
	inc rax
	jmp b208
	b206:
	inc rax
	b208:
	b209:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, qword [rbp - 264]
	mov r12, rcx
	mov rcx, qword [rbp - 736]
	mov rbx, rcx
	mov rcx, qword [rbp - 416]
	mov r14, rcx
	mov rcx, rdx
	b210:
	cmp rax, 1
	je b211
	b212:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b213
	b211:
	inc rcx
	b213:
	mov rax, rcx
	b214:
	mov rdx, rax
	inc rdx
	jmp b215
	b203:
	inc rdx
	b215:
	mov rax, rdx
	b216:
	mov rcx, rax
	mov rax, qword [rbp - 472]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 248]
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 400]
	mov qword [rbp - 624], rax
	mov rax, qword [rbp - 792]
	mov qword [rbp - 632], rax
	mov rdx, rcx
	b217:
	cmp r14, 1
	je b218
	b219:
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 696]
	mov r12, rax
	mov rax, qword [rbp - 632]
	mov r15, rax
	mov rax, qword [rbp - 624]
	mov rbx, rax
	b220:
	cmp rcx, 1
	je b221
	b222:
	mov r13, rcx
	sub r13, 1
	mov r8, rdx
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r13
	call _cd
	mov rdx, rax
	mov rax, r13
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b223
	b221:
	inc rdx
	b223:
	mov rax, rdx
	b224:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 624]
	mov r12, rax
	mov rax, qword [rbp - 696]
	mov rbx, rax
	mov rax, qword [rbp - 632]
	mov r15, rax
	b225:
	cmp rcx, 1
	je b226
	b227:
	mov r14, rcx
	sub r14, 1
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rdx, rax
	mov rax, r14
	mov r8, rdx
	mov rcx, r15
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b228
	b226:
	inc rdx
	b228:
	mov rax, rdx
	b229:
	mov rdx, rax
	inc rdx
	jmp b230
	b218:
	inc rdx
	b230:
	mov rax, rdx
	b231:
	mov rcx, rax
	inc rcx
	jmp b232
	b200:
	inc rcx
	b232:
	mov rax, rcx
	b233:
	mov rcx, rax
	inc rcx
	jmp b234
	b162:
	inc rcx
	b234:
	mov rax, rcx
	b235:
	mov rcx, rax
	mov rax, qword [rbp - 192]
	sub rax, 1
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 752]
	mov qword [rbp - 312], rax
	mov rax, qword [rbp - 136]
	mov qword [rbp - 728], rax
	mov rax, qword [rbp - 608]
	mov qword [rbp - 344], rax
	b236:
	mov rax, qword [rbp - 56]
	cmp rax, 1
	je b237
	b238:
	mov rax, qword [rbp - 56]
	sub rax, 1
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 312]
	mov qword [rbp - 496], rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 704], rax
	mov rax, qword [rbp - 728]
	mov qword [rbp - 512], rax
	b239:
	mov rax, qword [rbp - 72]
	cmp rax, 1
	je b240
	b241:
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 496]
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 512]
	mov qword [rbp - 640], rax
	mov rax, qword [rbp - 704]
	mov qword [rbp - 112], rax
	mov rdx, rcx
	b242:
	cmp rbx, 1
	je b243
	b244:
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 568]
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov r15, rax
	mov rax, qword [rbp - 640]
	mov r12, rax
	b245:
	cmp rcx, 1
	je b246
	b247:
	mov r13, rcx
	sub r13, 1
	mov r8, rdx
	mov rcx, r15
	mov rdx, r12
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rdx, rax
	mov rax, r13
	mov r8, rdx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b248
	b246:
	inc rdx
	b248:
	mov rax, rdx
	b249:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 640]
	mov r14, rax
	mov rax, qword [rbp - 568]
	mov rbx, rax
	mov rax, qword [rbp - 112]
	mov r12, rax
	mov rax, rdx
	b250:
	cmp rcx, 1
	je b251
	b252:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	call _cd
	inc rax
	jmp b253
	b251:
	inc rax
	b253:
	b254:
	mov rdx, rax
	inc rdx
	jmp b255
	b243:
	inc rdx
	b255:
	mov rax, rdx
	b256:
	mov rcx, rax
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 704]
	mov qword [rbp - 816], rax
	mov rax, qword [rbp - 496]
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 512]
	mov qword [rbp - 664], rax
	mov rdx, rcx
	b257:
	cmp rbx, 1
	je b258
	b259:
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 816]
	mov r13, rax
	mov rax, qword [rbp - 664]
	mov r14, rax
	mov rax, qword [rbp - 216]
	mov r12, rax
	mov rax, rdx
	b260:
	cmp rcx, 1
	je b261
	b262:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	call _cd
	inc rax
	jmp b263
	b261:
	inc rax
	b263:
	b264:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 216]
	mov r14, rax
	mov rax, qword [rbp - 816]
	mov rbx, rax
	mov rax, qword [rbp - 664]
	mov r12, rax
	b265:
	cmp rcx, 1
	je b266
	b267:
	mov r15, rcx
	sub r15, 1
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdx, rax
	mov rax, r15
	mov r8, rdx
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b268
	b266:
	inc rdx
	b268:
	mov rax, rdx
	b269:
	mov rdx, rax
	inc rdx
	jmp b270
	b258:
	inc rdx
	b270:
	mov rax, rdx
	b271:
	mov rcx, rax
	inc rcx
	jmp b272
	b240:
	inc rcx
	b272:
	mov rax, rcx
	b273:
	mov rcx, rax
	mov rax, qword [rbp - 56]
	sub rax, 1
	mov qword [rbp - 864], rax
	mov rax, qword [rbp - 728]
	mov qword [rbp - 808], rax
	mov rax, qword [rbp - 312]
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 480], rax
	b274:
	mov rax, qword [rbp - 864]
	cmp rax, 1
	je b275
	b276:
	mov rax, qword [rbp - 864]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 808]
	mov qword [rbp - 744], rax
	mov rax, qword [rbp - 480]
	mov r15, rax
	mov rax, qword [rbp - 208]
	mov qword [rbp - 288], rax
	b277:
	cmp r12, 1
	je b278
	b279:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 744]
	mov qword [rbp - 448], rax
	mov rax, qword [rbp - 288]
	mov r14, rax
	mov r13, r15
	mov rax, rcx
	b280:
	cmp rdx, 1
	je b281
	b282:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r13
	mov rax, qword [rbp - 448]
	mov rsi, rax
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r13
	mov rax, qword [rbp - 448]
	mov rdx, rax
	mov rsi, r14
	call _cd
	inc rax
	jmp b283
	b281:
	inc rax
	b283:
	b284:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, qword [rbp - 744]
	mov r14, rdx
	mov rdx, qword [rbp - 288]
	mov r12, rdx
	b285:
	cmp rax, 1
	je b286
	b287:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r15
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b288
	b286:
	inc rcx
	b288:
	mov rax, rcx
	b289:
	mov rcx, rax
	inc rcx
	jmp b290
	b278:
	inc rcx
	b290:
	mov rax, rcx
	b291:
	mov rcx, rax
	mov rax, qword [rbp - 864]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 208]
	mov r12, rax
	mov rax, qword [rbp - 808]
	mov qword [rbp - 760], rax
	mov rax, qword [rbp - 480]
	mov qword [rbp - 528], rax
	mov rdx, rcx
	b292:
	cmp r15, 1
	je b293
	b294:
	mov rax, r15
	sub rax, 1
	mov rcx, rax
	mov rbx, r12
	mov rax, qword [rbp - 528]
	mov r14, rax
	mov rax, qword [rbp - 760]
	mov qword [rbp - 824], rax
	mov rax, rdx
	b295:
	cmp rcx, 1
	je b296
	b297:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, r14
	mov rax, qword [rbp - 824]
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rax, qword [rbp - 824]
	mov rcx, rax
	mov rdx, rbx
	mov rsi, r14
	call _cd
	inc rax
	jmp b298
	b296:
	inc rax
	b298:
	b299:
	mov rdx, rax
	mov rax, r15
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 760]
	mov rbx, rax
	mov rax, qword [rbp - 528]
	mov r14, rax
	b300:
	cmp rcx, 1
	je b301
	b302:
	mov r15, rcx
	sub r15, 1
	mov r8, rdx
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rdx, rax
	mov rax, r15
	mov r8, rdx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b303
	b301:
	inc rdx
	b303:
	mov rax, rdx
	b304:
	mov rdx, rax
	inc rdx
	jmp b305
	b293:
	inc rdx
	b305:
	mov rax, rdx
	b306:
	mov rcx, rax
	inc rcx
	jmp b307
	b275:
	inc rcx
	b307:
	mov rax, rcx
	b308:
	mov rcx, rax
	inc rcx
	jmp b309
	b237:
	inc rcx
	b309:
	mov rax, rcx
	b310:
	mov rcx, rax
	inc rcx
	jmp b311
	b159:
	inc rcx
	b311:
	mov rax, rcx
	b312:
	mov rcx, rax
	inc rcx
	jmp b313
	b1:
	inc rcx
	b313:
	mov rax, rcx
	b314:
	pop r14
	pop rbx
	pop r12
	pop r15
	pop r13
	leave
	ret 
_main:
	b315:
	push rbp
	mov rbp, rsp
	sub rsp, 416
	push r13
	push r15
	push r12
	push rbx
	push r14
	mov r14, g_0
	mov r12, g_1
	mov rbx, g_2
	call __getInt
	mov qword [rbp - 144], rax
	mov rax, r14
	mov qword [rbp - 160], rax
	mov rax, r12
	mov qword [rbp - 112], rax
	mov rax, rbx
	mov qword [rbp - 416], rax
	mov rcx, 0
	b316:
	mov rax, qword [rbp - 144]
	cmp rax, 1
	je b317
	b318:
	mov rax, qword [rbp - 144]
	sub rax, 1
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 112]
	mov qword [rbp - 376], rax
	b319:
	mov rax, qword [rbp - 24]
	cmp rax, 1
	je b320
	b321:
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 32]
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 128], rax
	mov rax, qword [rbp - 224]
	mov qword [rbp - 80], rax
	b322:
	mov rax, qword [rbp - 96]
	cmp rax, 1
	je b323
	b324:
	mov rax, qword [rbp - 96]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 80]
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 128]
	mov qword [rbp - 88], rax
	b325:
	cmp rbx, 1
	je b326
	b327:
	mov rax, rbx
	sub rax, 1
	mov rdx, qword [rbp - 288]
	mov r12, rdx
	mov rdx, qword [rbp - 88]
	mov r13, rdx
	mov rdx, qword [rbp - 272]
	mov r15, rdx
	b328:
	cmp rax, 1
	je b329
	b330:
	mov r14, rax
	sub r14, 1
	mov r8, rcx
	mov rcx, r13
	mov rdx, r15
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r15
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b331
	b329:
	inc rcx
	b331:
	mov rax, rcx
	b332:
	mov rcx, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 272]
	mov rbx, rax
	mov rax, qword [rbp - 288]
	mov r12, rax
	mov rax, qword [rbp - 88]
	mov r15, rax
	b333:
	cmp rdx, 1
	je b334
	b335:
	mov r14, rdx
	sub r14, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b336
	b334:
	inc rcx
	b336:
	mov rax, rcx
	b337:
	mov rcx, rax
	inc rcx
	jmp b338
	b326:
	inc rcx
	b338:
	mov rax, rcx
	b339:
	mov rcx, rax
	mov rax, qword [rbp - 96]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 128]
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 336], rax
	mov rax, qword [rbp - 80]
	mov qword [rbp - 48], rax
	b340:
	cmp rbx, 1
	je b341
	b342:
	mov rax, rbx
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 360]
	mov r14, rax
	mov rax, qword [rbp - 48]
	mov r12, rax
	mov rax, qword [rbp - 336]
	mov r15, rax
	b343:
	cmp rdx, 1
	je b344
	b345:
	mov r13, rdx
	sub r13, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r15
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r15
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b346
	b344:
	inc rcx
	b346:
	mov rax, rcx
	b347:
	mov rcx, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 336]
	mov rbx, rax
	mov rax, qword [rbp - 360]
	mov r14, rax
	mov rax, qword [rbp - 48]
	mov r12, rax
	mov rax, rcx
	b348:
	cmp rdx, 1
	je b349
	b350:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	call _cd
	inc rax
	jmp b351
	b349:
	inc rax
	b351:
	b352:
	mov rcx, rax
	inc rcx
	jmp b353
	b341:
	inc rcx
	b353:
	mov rax, rcx
	b354:
	mov rcx, rax
	inc rcx
	jmp b355
	b323:
	inc rcx
	b355:
	mov rax, rcx
	b356:
	mov rcx, rax
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 224]
	mov qword [rbp - 352], rax
	mov rax, qword [rbp - 32]
	mov qword [rbp - 392], rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 192], rax
	b357:
	mov rax, qword [rbp - 184]
	cmp rax, 1
	je b358
	b359:
	mov rax, qword [rbp - 184]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 352]
	mov qword [rbp - 328], rax
	mov rax, qword [rbp - 192]
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 392]
	mov qword [rbp - 16], rax
	b360:
	cmp r14, 1
	je b361
	b362:
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 328]
	mov r12, rax
	mov rax, qword [rbp - 16]
	mov r15, rax
	mov rax, qword [rbp - 256]
	mov r13, rax
	b363:
	cmp rdx, 1
	je b364
	b365:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r15
	mov rdx, r13
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r13
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b366
	b364:
	inc rcx
	b366:
	mov rax, rcx
	b367:
	mov rcx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 256]
	mov r14, rax
	mov rax, qword [rbp - 328]
	mov rbx, rax
	mov rax, qword [rbp - 16]
	mov r12, rax
	mov rax, rcx
	b368:
	cmp rdx, 1
	je b369
	b370:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	call _cd
	inc rax
	jmp b371
	b369:
	inc rax
	b371:
	b372:
	mov rcx, rax
	inc rcx
	jmp b373
	b361:
	inc rcx
	b373:
	mov rax, rcx
	b374:
	mov rcx, rax
	mov rax, qword [rbp - 184]
	sub rax, 1
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 392]
	mov qword [rbp - 280], rax
	mov rax, qword [rbp - 352]
	mov r12, rax
	mov rax, qword [rbp - 192]
	mov qword [rbp - 56], rax
	mov rax, rcx
	b375:
	mov rcx, qword [rbp - 216]
	cmp rcx, 1
	je b376
	b377:
	mov rcx, qword [rbp - 216]
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 280]
	mov r15, rcx
	mov rcx, qword [rbp - 56]
	mov rbx, rcx
	mov r14, r12
	b378:
	cmp rdx, 1
	je b379
	b380:
	mov r13, rdx
	sub r13, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r14
	mov rdx, r15
	mov rsi, rbx
	call _cd
	inc rax
	jmp b381
	b379:
	inc rax
	b381:
	b382:
	mov rcx, qword [rbp - 216]
	sub rcx, 1
	mov rdx, rcx
	mov r14, r12
	mov rcx, qword [rbp - 280]
	mov rbx, rcx
	mov rcx, qword [rbp - 56]
	mov r12, rcx
	b383:
	cmp rdx, 1
	je b384
	b385:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	call _cd
	inc rax
	jmp b386
	b384:
	inc rax
	b386:
	b387:
	inc rax
	jmp b388
	b376:
	inc rax
	b388:
	b389:
	mov rcx, rax
	inc rcx
	jmp b390
	b358:
	inc rcx
	b390:
	mov rax, rcx
	b391:
	mov rcx, rax
	inc rcx
	jmp b392
	b320:
	inc rcx
	b392:
	mov rax, rcx
	b393:
	mov rcx, rax
	mov rax, qword [rbp - 144]
	sub rax, 1
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 112]
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 152], rax
	b394:
	mov rax, qword [rbp - 400]
	cmp rax, 1
	je b395
	b396:
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 240]
	mov qword [rbp - 368], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 384]
	mov qword [rbp - 344], rax
	b397:
	mov rax, qword [rbp - 200]
	cmp rax, 1
	je b398
	b399:
	mov rax, qword [rbp - 200]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 368]
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 64], rax
	mov rdx, rcx
	b400:
	cmp r12, 1
	je b401
	b402:
	mov rax, r12
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 40]
	mov r14, rax
	mov rax, qword [rbp - 64]
	mov r13, rax
	mov rax, qword [rbp - 208]
	mov rbx, rax
	mov rax, rdx
	b403:
	cmp rcx, 1
	je b404
	b405:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r13
	call _cd
	inc rax
	jmp b406
	b404:
	inc rax
	b406:
	b407:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 208]
	mov rbx, rax
	mov rax, qword [rbp - 40]
	mov r14, rax
	mov rax, qword [rbp - 64]
	mov r12, rax
	mov rax, rdx
	b408:
	cmp rcx, 1
	je b409
	b410:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	call _cd
	inc rax
	jmp b411
	b409:
	inc rax
	b411:
	b412:
	mov rdx, rax
	inc rdx
	jmp b413
	b401:
	inc rdx
	b413:
	mov rax, rdx
	b414:
	mov rcx, rax
	mov rax, qword [rbp - 200]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 320], rax
	mov rax, qword [rbp - 368]
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 8], rax
	b415:
	cmp r12, 1
	je b416
	b417:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 320]
	mov r15, rax
	mov rax, qword [rbp - 8]
	mov r14, rax
	mov rax, qword [rbp - 136]
	mov rbx, rax
	b418:
	cmp rdx, 1
	je b419
	b420:
	mov r13, rdx
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b421
	b419:
	inc rcx
	b421:
	mov rax, rcx
	b422:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 136]
	mov r12, rax
	mov rax, qword [rbp - 320]
	mov rbx, rax
	mov rax, qword [rbp - 8]
	mov r14, rax
	b423:
	cmp rdx, 1
	je b424
	b425:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b426
	b424:
	inc rcx
	b426:
	mov rax, rcx
	b427:
	mov rcx, rax
	inc rcx
	jmp b428
	b416:
	inc rcx
	b428:
	mov rax, rcx
	b429:
	mov rcx, rax
	inc rcx
	jmp b430
	b398:
	inc rcx
	b430:
	mov rax, rcx
	b431:
	mov rcx, rax
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov qword [rbp - 264], rax
	mov rax, qword [rbp - 384]
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 240]
	mov qword [rbp - 248], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 312], rax
	b432:
	mov rax, qword [rbp - 264]
	cmp rax, 1
	je b433
	b434:
	mov rax, qword [rbp - 264]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 120]
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 312]
	mov qword [rbp - 232], rax
	mov rax, qword [rbp - 248]
	mov qword [rbp - 72], rax
	mov rax, rcx
	b435:
	cmp r15, 1
	je b436
	b437:
	mov rcx, r15
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 104]
	mov rbx, rcx
	mov rcx, qword [rbp - 72]
	mov r13, rcx
	mov rcx, qword [rbp - 232]
	mov r12, rcx
	b438:
	cmp rdx, 1
	je b439
	b440:
	mov r14, rdx
	sub r14, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r13
	call _cd
	inc rax
	jmp b441
	b439:
	inc rax
	b441:
	b442:
	mov rcx, r15
	sub rcx, 1
	mov rdx, qword [rbp - 232]
	mov rbx, rdx
	mov rdx, qword [rbp - 104]
	mov r12, rdx
	mov rdx, qword [rbp - 72]
	mov r15, rdx
	b443:
	cmp rcx, 1
	je b444
	b445:
	mov r14, rcx
	sub r14, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r12
	call _cd
	inc rax
	jmp b446
	b444:
	inc rax
	b446:
	b447:
	inc rax
	jmp b448
	b436:
	inc rax
	b448:
	b449:
	mov rcx, rax
	mov rax, qword [rbp - 264]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 248]
	mov qword [rbp - 408], rax
	mov rax, qword [rbp - 120]
	mov r12, rax
	mov rax, qword [rbp - 312]
	mov qword [rbp - 176], rax
	b450:
	cmp r15, 1
	je b451
	b452:
	mov rax, r15
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 408]
	mov r13, rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 304], rax
	mov r14, r12
	mov rax, rcx
	b453:
	cmp rdx, 1
	je b454
	b455:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rax, qword [rbp - 304]
	mov rcx, rax
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r14
	mov rdx, r13
	mov rax, qword [rbp - 304]
	mov rsi, rax
	call _cd
	inc rax
	jmp b456
	b454:
	inc rax
	b456:
	b457:
	mov rcx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rax
	mov rbx, r12
	mov rax, qword [rbp - 408]
	mov r12, rax
	mov rax, qword [rbp - 176]
	mov r14, rax
	b458:
	cmp rdx, 1
	je b459
	b460:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b461
	b459:
	inc rcx
	b461:
	mov rax, rcx
	b462:
	mov rcx, rax
	inc rcx
	jmp b463
	b451:
	inc rcx
	b463:
	mov rax, rcx
	b464:
	mov rcx, rax
	inc rcx
	jmp b465
	b433:
	inc rcx
	b465:
	mov rax, rcx
	b466:
	mov rcx, rax
	inc rcx
	jmp b467
	b395:
	inc rcx
	b467:
	mov rax, rcx
	b468:
	mov rcx, rax
	inc rcx
	jmp b469
	b317:
	inc rcx
	b469:
	mov rax, rcx
	b470:
	mov rdi, rax
	call __toString
	mov rdi, rax
	call __println
	mov rax, 0
	b471:
	pop r14
	pop rbx
	pop r12
	pop r15
	pop r13
	leave
	ret 
__init:
	b472:
	push rbp
	mov rbp, rsp
	call _main
	leave
	ret 
	section .data
g_0:
	dq 1
	db 41H, 00H
g_1:
	dq 1
	db 42H, 00H
g_2:
	dq 1
	db 43H, 00H
