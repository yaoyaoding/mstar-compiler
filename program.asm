





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
	sub rsp, 416
	push r13
	push r15
	push r12
	push rbx
	push r14
	mov rax, rdi
	mov qword [rbp - 80], rax
	mov rax, rsi
	mov qword [rbp - 192], rax
	mov rax, rdx
	mov qword [rbp - 16], rax
	mov rax, rcx
	mov qword [rbp - 336], rax
	mov rcx, r8
	mov rax, qword [rbp - 80]
	cmp rax, 1
	je b1
	b2:
	mov rax, qword [rbp - 80]
	sub rax, 1
	mov qword [rbp - 344], rax
	mov rax, qword [rbp - 192]
	mov qword [rbp - 408], rax
	mov rax, qword [rbp - 336]
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 32], rax
	b3:
	mov rax, qword [rbp - 344]
	cmp rax, 1
	je b4
	b5:
	mov rax, qword [rbp - 344]
	sub rax, 1
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 408]
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 32]
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 144], rax
	b6:
	mov rax, qword [rbp - 64]
	cmp rax, 1
	je b7
	b8:
	mov rax, qword [rbp - 64]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 216]
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 320], rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 232], rax
	b9:
	cmp r12, 1
	je b10
	b11:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 384]
	mov r14, rax
	mov rax, qword [rbp - 232]
	mov rbx, rax
	mov rax, qword [rbp - 320]
	mov r15, rax
	mov rax, rcx
	b12:
	cmp rdx, 1
	je b13
	b14:
	mov r13, rdx
	sub r13, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r15
	mov rdx, r14
	mov rsi, rbx
	call _cd
	inc rax
	jmp b15
	b13:
	inc rax
	b15:
	b16:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 320]
	mov r14, rax
	mov rax, qword [rbp - 384]
	mov rbx, rax
	mov rax, qword [rbp - 232]
	mov r12, rax
	mov rax, rcx
	b17:
	cmp rdx, 1
	je b18
	b19:
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
	jmp b20
	b18:
	inc rax
	b20:
	b21:
	mov rcx, rax
	inc rcx
	jmp b22
	b10:
	inc rcx
	b22:
	mov rax, rcx
	b23:
	mov rcx, rax
	mov rax, qword [rbp - 64]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 216]
	mov qword [rbp - 416], rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 248], rax
	b24:
	cmp rbx, 1
	je b25
	b26:
	mov rax, rbx
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 304]
	mov r13, rax
	mov rax, qword [rbp - 248]
	mov r15, rax
	mov rax, qword [rbp - 416]
	mov r12, rax
	mov rax, rcx
	b27:
	cmp rdx, 1
	je b28
	b29:
	mov r14, rdx
	sub r14, 1
	mov r8, rax
	mov rcx, r15
	mov rdx, r12
	mov rsi, r13
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, r15
	call _cd
	inc rax
	jmp b30
	b28:
	inc rax
	b30:
	b31:
	mov rcx, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, qword [rbp - 416]
	mov rbx, rdx
	mov rdx, qword [rbp - 304]
	mov r12, rdx
	mov rdx, qword [rbp - 248]
	mov r14, rdx
	b32:
	cmp rax, 1
	je b33
	b34:
	mov r15, rax
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
	jmp b35
	b33:
	inc rcx
	b35:
	mov rax, rcx
	b36:
	mov rcx, rax
	inc rcx
	jmp b37
	b25:
	inc rcx
	b37:
	mov rax, rcx
	b38:
	mov rcx, rax
	inc rcx
	jmp b39
	b7:
	inc rcx
	b39:
	mov rax, rcx
	b40:
	mov rcx, rax
	mov rax, qword [rbp - 344]
	sub rax, 1
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 312], rax
	mov rax, qword [rbp - 408]
	mov qword [rbp - 160], rax
	mov rax, qword [rbp - 32]
	mov qword [rbp - 376], rax
	b41:
	mov rax, qword [rbp - 24]
	cmp rax, 1
	je b42
	b43:
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 312]
	mov qword [rbp - 392], rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 200], rax
	mov rdx, rcx
	b44:
	cmp rbx, 1
	je b45
	b46:
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 392]
	mov r15, rax
	mov rax, qword [rbp - 200]
	mov r14, rax
	mov rax, qword [rbp - 96]
	mov r12, rax
	mov rax, rdx
	b47:
	cmp rcx, 1
	je b48
	b49:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r12
	mov rdx, r15
	mov rsi, r14
	call _cd
	inc rax
	jmp b50
	b48:
	inc rax
	b50:
	b51:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, qword [rbp - 96]
	mov r12, rcx
	mov rcx, qword [rbp - 392]
	mov r14, rcx
	mov rcx, qword [rbp - 200]
	mov r15, rcx
	mov rcx, rdx
	b52:
	cmp rax, 1
	je b53
	b54:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r15
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r15
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b55
	b53:
	inc rcx
	b55:
	mov rax, rcx
	b56:
	mov rdx, rax
	inc rdx
	jmp b57
	b45:
	inc rdx
	b57:
	mov rax, rdx
	b58:
	mov rcx, rax
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 312]
	mov r14, rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 272], rax
	b59:
	mov rax, qword [rbp - 360]
	cmp rax, 1
	je b60
	b61:
	mov rax, qword [rbp - 360]
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 224]
	mov r15, rax
	mov rax, qword [rbp - 272]
	mov r13, rax
	mov r12, r14
	mov rax, rcx
	b62:
	cmp rdx, 1
	je b63
	b64:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, r15
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r12
	mov rdx, r15
	mov rsi, r13
	call _cd
	inc rax
	jmp b65
	b63:
	inc rax
	b65:
	b66:
	mov rcx, rax
	mov rax, qword [rbp - 360]
	sub rax, 1
	mov rdx, rax
	mov rbx, r14
	mov rax, qword [rbp - 224]
	mov r14, rax
	mov rax, qword [rbp - 272]
	mov r15, rax
	b67:
	cmp rdx, 1
	je b68
	b69:
	mov r12, rdx
	sub r12, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r12
	call _cd
	mov rcx, rax
	mov rax, r12
	mov r8, rcx
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b70
	b68:
	inc rcx
	b70:
	mov rax, rcx
	b71:
	mov rcx, rax
	inc rcx
	jmp b72
	b60:
	inc rcx
	b72:
	mov rax, rcx
	b73:
	mov rcx, rax
	inc rcx
	jmp b74
	b42:
	inc rcx
	b74:
	mov rax, rcx
	b75:
	mov rcx, rax
	inc rcx
	jmp b76
	b4:
	inc rcx
	b76:
	mov rax, rcx
	b77:
	mov rcx, rax
	mov rax, qword [rbp - 80]
	sub rax, 1
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 192]
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 336]
	mov qword [rbp - 176], rax
	b78:
	mov rax, qword [rbp - 400]
	cmp rax, 1
	je b79
	b80:
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov qword [rbp - 280], rax
	mov rax, qword [rbp - 208]
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 40]
	mov qword [rbp - 56], rax
	b81:
	mov rax, qword [rbp - 280]
	cmp rax, 1
	je b82
	b83:
	mov rax, qword [rbp - 280]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 136]
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 352], rax
	mov rax, qword [rbp - 112]
	mov qword [rbp - 368], rax
	mov rdx, rcx
	b84:
	cmp r12, 1
	je b85
	b86:
	mov rax, r12
	sub rax, 1
	mov rcx, qword [rbp - 152]
	mov r14, rcx
	mov rcx, qword [rbp - 368]
	mov rbx, rcx
	mov rcx, qword [rbp - 352]
	mov r15, rcx
	mov rcx, rdx
	b87:
	cmp rax, 1
	je b88
	b89:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r15
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b90
	b88:
	inc rcx
	b90:
	mov rax, rcx
	b91:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 352]
	mov rbx, rax
	mov rax, qword [rbp - 152]
	mov r12, rax
	mov rax, qword [rbp - 368]
	mov r15, rax
	mov rcx, rdx
	b92:
	cmp rsi, 1
	je b93
	b94:
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
	jmp b95
	b93:
	inc rcx
	b95:
	mov rax, rcx
	b96:
	mov rdx, rax
	inc rdx
	jmp b97
	b85:
	inc rdx
	b97:
	mov rax, rdx
	b98:
	mov rcx, rax
	mov rax, qword [rbp - 280]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov qword [rbp - 264], rax
	mov rax, qword [rbp - 136]
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 120], rax
	b99:
	cmp r14, 1
	je b100
	b101:
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 264]
	mov r13, rax
	mov rax, qword [rbp - 120]
	mov r12, rax
	mov rax, qword [rbp - 256]
	mov r15, rax
	mov rax, rcx
	b102:
	cmp rdx, 1
	je b103
	b104:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r15
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r15
	mov rdx, r13
	mov rsi, r12
	call _cd
	inc rax
	jmp b105
	b103:
	inc rax
	b105:
	b106:
	mov rcx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 256]
	mov rbx, rax
	mov rax, qword [rbp - 264]
	mov r14, rax
	mov rax, qword [rbp - 120]
	mov r12, rax
	b107:
	cmp rdx, 1
	je b108
	b109:
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
	jmp b110
	b108:
	inc rcx
	b110:
	mov rax, rcx
	b111:
	mov rcx, rax
	inc rcx
	jmp b112
	b100:
	inc rcx
	b112:
	mov rax, rcx
	b113:
	mov rcx, rax
	inc rcx
	jmp b114
	b82:
	inc rcx
	b114:
	mov rax, rcx
	b115:
	mov rcx, rax
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 40]
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 208]
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 288], rax
	b116:
	mov rax, qword [rbp - 72]
	cmp rax, 1
	je b117
	b118:
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 8]
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 288]
	mov rbx, rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 128], rax
	mov rdx, rcx
	b119:
	mov rax, qword [rbp - 184]
	cmp rax, 1
	je b120
	b121:
	mov rax, qword [rbp - 184]
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 240]
	mov r14, rax
	mov rax, qword [rbp - 128]
	mov r15, rax
	mov r12, rbx
	b122:
	cmp rcx, 1
	je b123
	b124:
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
	jmp b125
	b123:
	inc rdx
	b125:
	mov rax, rdx
	b126:
	mov rdx, rax
	mov rax, qword [rbp - 184]
	sub rax, 1
	mov r12, rbx
	mov rcx, qword [rbp - 240]
	mov r15, rcx
	mov rcx, qword [rbp - 128]
	mov r14, rcx
	mov rcx, rdx
	b127:
	cmp rax, 1
	je b128
	b129:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r15
	mov rdx, r14
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b130
	b128:
	inc rcx
	b130:
	mov rax, rcx
	b131:
	mov rdx, rax
	inc rdx
	jmp b132
	b120:
	inc rdx
	b132:
	mov rax, rdx
	b133:
	mov rcx, rax
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 48]
	mov r12, rax
	mov rax, qword [rbp - 8]
	mov r14, rax
	mov rax, qword [rbp - 288]
	mov qword [rbp - 328], rax
	b134:
	cmp r15, 1
	je b135
	b136:
	mov rax, r15
	sub rax, 1
	mov rdx, rax
	mov rax, r12
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 328]
	mov r13, rax
	mov rax, r14
	mov qword [rbp - 88], rax
	mov rax, rcx
	b137:
	cmp rdx, 1
	je b138
	b139:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r13
	mov rax, qword [rbp - 88]
	mov rdx, rax
	mov rax, qword [rbp - 104]
	mov rsi, rax
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rax, qword [rbp - 88]
	mov rcx, rax
	mov rax, qword [rbp - 104]
	mov rdx, rax
	mov rsi, r13
	call _cd
	inc rax
	jmp b140
	b138:
	inc rax
	b140:
	b141:
	mov rcx, rax
	mov rax, r15
	sub rax, 1
	mov r15, r14
	mov rdx, qword [rbp - 328]
	mov rbx, rdx
	b142:
	cmp rax, 1
	je b143
	b144:
	mov r14, rax
	sub r14, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r15
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b145
	b143:
	inc rcx
	b145:
	mov rax, rcx
	b146:
	mov rcx, rax
	inc rcx
	jmp b147
	b135:
	inc rcx
	b147:
	mov rax, rcx
	b148:
	mov rcx, rax
	inc rcx
	jmp b149
	b117:
	inc rcx
	b149:
	mov rax, rcx
	b150:
	mov rcx, rax
	inc rcx
	jmp b151
	b79:
	inc rcx
	b151:
	mov rax, rcx
	b152:
	mov rcx, rax
	inc rcx
	jmp b153
	b1:
	inc rcx
	b153:
	mov rax, rcx
	b154:
	pop r14
	pop rbx
	pop r12
	pop r15
	pop r13
	leave
	ret 
_main:
	b155:
	push rbp
	mov rbp, rsp
	sub rsp, 192
	push r13
	push r15
	push r12
	push rbx
	push r14
	mov r12, g_0
	mov rbx, g_1
	mov r14, g_2
	call __getInt
	mov qword [rbp - 184], rax
	mov rax, r12
	mov qword [rbp - 16], rax
	mov rax, rbx
	mov qword [rbp - 176], rax
	mov rax, r14
	mov qword [rbp - 192], rax
	mov rcx, 0
	b156:
	mov rax, qword [rbp - 184]
	cmp rax, 1
	je b157
	b158:
	mov rax, qword [rbp - 184]
	sub rax, 1
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 192]
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 56], rax
	b159:
	mov rax, qword [rbp - 80]
	cmp rax, 1
	je b160
	b161:
	mov rax, qword [rbp - 80]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8]
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 160], rax
	mov rax, qword [rbp - 96]
	mov qword [rbp - 112], rax
	mov rdx, rcx
	b162:
	cmp r14, 1
	je b163
	b164:
	mov rax, r14
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 32]
	mov r13, rax
	mov rax, qword [rbp - 112]
	mov r12, rax
	mov rax, qword [rbp - 160]
	mov rbx, rax
	mov rcx, rdx
	b165:
	cmp rsi, 1
	je b166
	b167:
	mov r15, rsi
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b168
	b166:
	inc rcx
	b168:
	mov rax, rcx
	b169:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 160]
	mov rbx, rcx
	mov rcx, qword [rbp - 32]
	mov r15, rcx
	mov rcx, qword [rbp - 112]
	mov r12, rcx
	mov rcx, rdx
	b170:
	cmp rax, 1
	je b171
	b172:
	mov r14, rax
	sub r14, 1
	mov r8, rcx
	mov rcx, r15
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r15
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
	inc rdx
	jmp b175
	b163:
	inc rdx
	b175:
	mov rax, rdx
	b176:
	mov rcx, rax
	mov rax, qword [rbp - 80]
	sub rax, 1
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 96]
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 8]
	mov rbx, rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 48], rax
	mov rdx, rcx
	b177:
	mov rax, qword [rbp - 24]
	cmp rax, 1
	je b178
	b179:
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 40]
	mov r14, rax
	mov rax, qword [rbp - 48]
	mov r15, rax
	mov r12, rbx
	b180:
	cmp rcx, 1
	je b181
	b182:
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
	jmp b183
	b181:
	inc rdx
	b183:
	mov rax, rdx
	b184:
	mov rdx, rax
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 40]
	mov r15, rax
	mov rax, qword [rbp - 48]
	mov r12, rax
	b185:
	cmp rcx, 1
	je b186
	b187:
	mov r14, rcx
	sub r14, 1
	mov r8, rdx
	mov rcx, r15
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rdx, rax
	mov rax, r14
	mov r8, rdx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r15
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
	mov rdx, rax
	inc rdx
	jmp b190
	b178:
	inc rdx
	b190:
	mov rax, rdx
	b191:
	mov rcx, rax
	inc rcx
	jmp b192
	b160:
	inc rcx
	b192:
	mov rax, rcx
	b193:
	mov rcx, rax
	mov rax, qword [rbp - 184]
	sub rax, 1
	mov qword [rbp - 128], rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 88], rax
	mov rax, qword [rbp - 192]
	mov qword [rbp - 104], rax
	b194:
	mov rax, qword [rbp - 128]
	cmp rax, 1
	je b195
	b196:
	mov rax, qword [rbp - 128]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 104]
	mov rbx, rax
	mov rax, qword [rbp - 88]
	mov qword [rbp - 144], rax
	b197:
	cmp r12, 1
	je b198
	b199:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 72]
	mov r14, rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 64], rax
	mov r13, rbx
	mov rax, rcx
	b200:
	cmp rdx, 1
	je b201
	b202:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rax, qword [rbp - 64]
	mov rcx, rax
	mov rdx, r13
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r13
	mov rdx, r14
	mov rax, qword [rbp - 64]
	mov rsi, rax
	call _cd
	inc rax
	jmp b203
	b201:
	inc rax
	b203:
	b204:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov r14, rbx
	mov rax, qword [rbp - 72]
	mov r12, rax
	mov rax, qword [rbp - 144]
	mov r15, rax
	mov rax, rcx
	b205:
	cmp rdx, 1
	je b206
	b207:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r15
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r15
	mov rdx, r14
	mov rsi, r12
	call _cd
	inc rax
	jmp b208
	b206:
	inc rax
	b208:
	b209:
	mov rcx, rax
	inc rcx
	jmp b210
	b198:
	inc rcx
	b210:
	mov rax, rcx
	b211:
	mov rcx, rax
	mov rax, qword [rbp - 128]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 88]
	mov r13, rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 104]
	mov r12, rax
	mov rdx, rcx
	b212:
	cmp rbx, 1
	je b213
	b214:
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, r13
	mov qword [rbp - 120], rax
	mov r15, r12
	mov rax, qword [rbp - 136]
	mov r14, rax
	b215:
	cmp rcx, 1
	je b216
	b217:
	mov rax, rcx
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 152]
	sub rax, 1
	mov qword [rbp - 152], rax
	mov r8, rdx
	mov rcx, r15
	mov rdx, r14
	mov rax, qword [rbp - 120]
	mov rsi, rax
	mov rax, qword [rbp - 152]
	mov rdi, rax
	call _cd
	mov rdx, rax
	mov rax, qword [rbp - 152]
	mov rdi, rax
	mov r8, rdx
	mov rcx, r14
	mov rax, qword [rbp - 120]
	mov rdx, rax
	mov rsi, r15
	call _cd
	mov rdx, rax
	inc rdx
	jmp b218
	b216:
	inc rdx
	b218:
	mov rax, rdx
	b219:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 136]
	mov rbx, rax
	mov r15, r13
	mov rax, rdx
	b220:
	cmp rcx, 1
	je b221
	b222:
	mov r14, rcx
	sub r14, 1
	mov r8, rax
	mov rcx, r15
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r15
	call _cd
	inc rax
	jmp b223
	b221:
	inc rax
	b223:
	b224:
	mov rdx, rax
	inc rdx
	jmp b225
	b213:
	inc rdx
	b225:
	mov rax, rdx
	b226:
	mov rcx, rax
	inc rcx
	jmp b227
	b195:
	inc rcx
	b227:
	mov rax, rcx
	b228:
	mov rcx, rax
	inc rcx
	jmp b229
	b157:
	inc rcx
	b229:
	mov rax, rcx
	b230:
	mov rdi, rax
	call __toString
	mov rdi, rax
	call __println
	mov rax, 0
	b231:
	pop r14
	pop rbx
	pop r12
	pop r15
	pop r13
	leave
	ret 
__init:
	b232:
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
