





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
_main:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 368
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rax, qword [g_0]
	mov qword [g_0], rax
	mov rax, qword [g_1]
	mov qword [g_1], rax
	mov rax, qword [g_2]
	mov qword [g_2], rax
	b1:
	mov rax, 1
	mov rcx, 29
	mov rax, 536870912
	mov rax, qword [g_1]
	cmp rax, 536870912
	jl b2
	jmp b3
	b2:
	mov rax, 1
	mov rcx, 29
	mov rax, 536870912
	mov rcx, 536870912
	mov rcx, -536870912
	mov rax, qword [g_1]
	cmp rax, rcx
	jg b4
	b3:
	mov rax, qword [g_2]
	mov rdi, rax
	call __toString
	mov rsi, g_3
	mov rdi, rax
	call __stringConcate
	mov rbx, rax
	mov rax, qword [g_0]
	mov rdi, rax
	call __toString
	mov rsi, rax
	mov rdi, rbx
	call __stringConcate
	mov rsi, g_4
	mov rdi, rax
	call __stringConcate
	mov rbx, rax
	mov rax, qword [g_1]
	mov rdi, rax
	call __toString
	mov rsi, rax
	mov rdi, rbx
	call __stringConcate
	mov rdi, rax
	call __println
	mov rax, 0
	b5:
	mov rcx, qword [g_0]
	mov qword [g_0], rcx
	mov rcx, qword [g_1]
	mov qword [g_1], rcx
	mov rcx, qword [g_2]
	mov qword [g_2], rcx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	leave
	ret 
	b4:
	mov rax, qword [g_1]
	mov rcx, rax
	mov rax, qword [g_2]
	sub rcx, rax
	mov rdx, rcx
	mov rax, qword [g_0]
	add rdx, rax
	mov rax, qword [g_2]
	mov qword [rbp - 264], rax
	mov rsi, qword [g_0]
	mov rax, qword [rbp - 264]
	add rax, rsi
	mov qword [rbp - 264], rax
	mov r8, rdx
	mov rax, qword [rbp - 264]
	sub r8, rax
	mov rax, qword [g_1]
	mov rax, rcx
	mov rsi, rax
	mov rsi, rdx
	mov rax, qword [g_2]
	mov rax, qword [rbp - 264]
	mov rax, rsi
	mov rax, r8
	mov rdi, r8
	add rdi, rax
	mov rax, qword [g_1]
	mov r9, rax
	mov r9, rcx
	mov rsi, r9
	mov rsi, rdx
	mov rax, qword [g_2]
	mov rax, qword [rbp - 264]
	mov rax, rsi
	mov rax, r8
	mov rcx, qword [g_1]
	mov rcx, r9
	mov rbx, rcx
	mov rbx, rsi
	mov r12, rax
	add r12, rbx
	mov r11, rdi
	add r11, r12
	mov rax, qword [g_2]
	mov rcx, rax
	mov rax, qword [rbp - 264]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rax, rbx
	mov rsi, rcx
	add rsi, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 264]
	mov rcx, rsi
	sub rcx, rax
	mov rax, qword [g_1]
	mov rdx, rax
	mov rdx, r9
	mov r9, rdx
	mov r9, rbx
	mov rax, qword [g_2]
	mov rax, qword [rbp - 264]
	mov r9, r8
	mov rax, qword [g_1]
	mov qword [rbp - 184], rax
	mov rax, rdx
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 184]
	mov rax, rbx
	mov rax, r9
	mov rax, r12
	mov r9, rcx
	add r9, rax
	mov rax, r11
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 272]
	sub rax, r9
	mov qword [rbp - 272], rax
	mov rax, qword [g_2]
	mov r13, rax
	mov rax, qword [rbp - 264]
	mov r13, rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov r10, rax
	mov r10, rbx
	mov rax, r13
	mov rax, rsi
	mov r14, qword [g_2]
	mov r15, r14
	mov r15, r13
	mov r14, qword [g_1]
	mov r14, rdx
	mov r14, rbx
	mov r14, r15
	mov qword [rbp - 312], r14
	mov qword [rbp - 312], rsi
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 312]
	mov rsi, qword [rbp - 168]
	sub rsi, rax
	mov qword [rbp - 168], rsi
	mov rax, qword [g_2]
	mov rax, r13
	mov rsi, qword [g_1]
	mov rsi, rdx
	mov rsi, rbx
	mov rsi, rax
	mov rax, qword [rbp - 312]
	mov rsi, rax
	mov rax, qword [g_2]
	mov rax, r13
	mov rsi, rcx
	mov rax, qword [rbp - 168]
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 296]
	sub rax, rsi
	mov qword [rbp - 296], rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, rbx
	mov rsi, qword [g_2]
	mov rsi, r13
	mov qword [rbp - 120], rax
	mov rax, r8
	mov qword [rbp - 120], rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, rbx
	mov rax, qword [rbp - 120]
	mov rsi, rax
	mov rsi, r12
	mov rax, qword [g_2]
	mov r12, rax
	mov r12, r13
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, rbx
	mov rax, r12
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 312]
	mov qword [rbp - 64], rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 264]
	mov rax, qword [rbp - 64]
	mov qword [rbp - 280], rax
	mov rax, rcx
	mov qword [rbp - 280], rax
	mov rax, rsi
	mov qword [rbp - 224], rax
	mov rcx, qword [rbp - 280]
	mov rax, qword [rbp - 224]
	sub rax, rcx
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 72], rax
	mov rcx, qword [rbp - 224]
	mov rax, qword [rbp - 72]
	add rax, rcx
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 272]
	mov rcx, rax
	mov rax, qword [rbp - 72]
	sub rcx, rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, r10
	mov rbx, qword [g_2]
	mov qword [rbp - 232], rbx
	mov rbx, qword [rbp - 264]
	mov qword [rbp - 232], rbx
	mov r12, rax
	mov r12, r8
	mov rax, qword [g_1]
	mov rax, rdx
	mov r13, rax
	mov r13, r10
	mov rax, qword [g_2]
	mov rbx, rax
	mov rax, qword [rbp - 232]
	mov rbx, rax
	mov rax, r13
	mov rax, r8
	mov rax, r12
	mov qword [rbp - 152], rax
	mov rax, rdi
	mov qword [rbp - 152], rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, r10
	mov rdi, qword [g_2]
	mov rdi, rbx
	mov rdi, rax
	mov rdi, r8
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, r10
	mov rax, rdi
	mov qword [rbp - 136], rax
	mov rax, rsi
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 88], rax
	mov rax, r11
	mov qword [rbp - 88], rax
	mov rax, qword [g_2]
	mov rax, rbx
	mov rsi, qword [g_1]
	mov rsi, rdx
	mov rsi, r10
	mov rsi, rax
	mov rax, qword [rbp - 64]
	mov rsi, rax
	mov rax, qword [g_2]
	mov rax, rbx
	mov r8, rsi
	mov rax, qword [rbp - 280]
	mov r8, rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, r10
	mov rsi, qword [g_2]
	mov rsi, rbx
	mov rsi, rax
	mov rsi, rdi
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, r10
	mov rax, rsi
	mov rax, qword [rbp - 136]
	mov rax, r8
	mov rax, r9
	mov rax, qword [rbp - 88]
	mov r8, rax
	mov rax, qword [rbp - 272]
	mov r8, rax
	mov rax, qword [g_2]
	mov rsi, rax
	mov rsi, rbx
	mov rax, qword [g_1]
	mov rax, rdx
	mov qword [rbp - 56], rax
	mov rax, r10
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 64]
	mov rsi, rax
	mov rax, qword [g_2]
	mov rax, rbx
	mov r10, rsi
	mov rax, qword [rbp - 280]
	mov r10, rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, qword [rbp - 56]
	mov rsi, qword [g_2]
	mov rsi, rbx
	mov rax, rdi
	mov rsi, qword [g_1]
	mov rsi, rdx
	mov rsi, qword [rbp - 56]
	mov rax, qword [rbp - 136]
	mov rax, r10
	mov qword [rbp - 240], rax
	mov rax, r9
	mov qword [rbp - 240], rax
	mov rax, qword [g_2]
	mov rsi, rax
	mov rsi, rbx
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, qword [rbp - 56]
	mov rax, rsi
	mov rax, qword [rbp - 64]
	mov rdx, qword [g_2]
	mov rdx, rbx
	mov rsi, rax
	mov rax, qword [rbp - 280]
	mov rsi, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 184]
	mov rdx, rax
	mov rax, qword [rbp - 56]
	mov rdx, rax
	mov rax, qword [g_2]
	mov rax, rbx
	mov rax, rdx
	mov rax, rdi
	mov rdx, qword [g_1]
	mov rdx, qword [rbp - 184]
	mov rdx, qword [rbp - 56]
	mov rax, qword [rbp - 136]
	mov rdx, rsi
	mov rax, qword [rbp - 240]
	mov rdx, rax
	mov rax, qword [rbp - 240]
	mov rsi, rax
	sub rsi, rdx
	mov rdx, r8
	sub rdx, rsi
	add rcx, rdx
	mov rax, qword [g_2]
	mov r9, rax
	mov rax, qword [rbp - 232]
	mov r9, rax
	mov rax, qword [g_1]
	mov r8, rax
	mov rax, qword [rbp - 184]
	mov r8, rax
	mov rax, r8
	mov rax, qword [rbp - 56]
	mov rax, qword [rbp - 64]
	mov r9, rax
	mov rax, qword [g_2]
	mov r10, rax
	mov rax, qword [rbp - 232]
	mov r10, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 56]
	mov rax, r10
	mov rax, qword [rbp - 64]
	mov rax, qword [rbp - 168]
	mov r9, rax
	mov rax, qword [g_2]
	mov r10, rax
	mov rax, qword [rbp - 232]
	mov r10, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 56]
	mov rax, qword [rbp - 64]
	mov r10, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov rax, r10
	mov rax, qword [rbp - 280]
	mov r11, r9
	mov rax, qword [rbp - 296]
	mov r11, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 56]
	mov r9, qword [g_2]
	mov r9, qword [rbp - 232]
	mov r9, rax
	mov r9, rdi
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 56]
	mov rdi, r9
	mov rax, qword [rbp - 136]
	mov rdi, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov r9, qword [g_1]
	mov r9, r8
	mov r8, r9
	mov r8, qword [rbp - 56]
	mov r8, rax
	mov rax, qword [rbp - 64]
	mov r8, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov rax, r8
	mov rax, qword [rbp - 280]
	mov r10, rdi
	mov rax, qword [rbp - 224]
	mov r10, rax
	mov rax, qword [rbp - 72]
	mov r11, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rdi, rax
	mov rax, qword [rbp - 56]
	mov rdi, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov rax, qword [rbp - 120]
	mov rdi, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rax, qword [rbp - 56]
	mov rax, qword [rbp - 136]
	mov rdi, rax
	mov rax, qword [g_2]
	mov r8, rax
	mov rax, qword [rbp - 232]
	mov r8, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rax, qword [rbp - 56]
	mov rax, qword [rbp - 312]
	mov r8, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov rax, r8
	mov rax, qword [rbp - 280]
	mov rbx, rdi
	mov rbx, r10
	mov rax, qword [g_1]
	mov rax, r9
	mov rdi, rax
	mov rax, qword [rbp - 56]
	mov rdi, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov r8, rdi
	mov rax, qword [rbp - 120]
	mov r8, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rax, qword [rbp - 56]
	mov r12, r8
	mov rax, qword [rbp - 136]
	mov r12, rax
	mov rax, qword [g_2]
	mov rdi, rax
	mov rax, qword [rbp - 232]
	mov rdi, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rax, qword [rbp - 56]
	mov rax, rdi
	mov rax, qword [rbp - 312]
	mov rdi, qword [g_2]
	mov rdi, qword [rbp - 232]
	mov rax, qword [rbp - 280]
	mov rax, r12
	mov rax, r10
	mov r10, rbx
	add r10, rax
	mov rdi, r11
	add rdi, r10
	mov rax, qword [g_1]
	mov rax, r9
	mov r10, rax
	mov rax, qword [rbp - 56]
	mov r10, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov r10, r8
	mov rax, qword [g_1]
	mov rax, r9
	mov r11, rax
	mov rax, qword [rbp - 56]
	mov r11, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov rax, r11
	mov rax, r8
	mov rax, qword [rbp - 152]
	mov r10, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rax, qword [rbp - 56]
	mov r11, qword [g_2]
	mov r11, qword [rbp - 232]
	mov rax, r8
	mov r11, qword [g_1]
	mov r11, r9
	mov r11, qword [rbp - 56]
	mov rax, qword [rbp - 136]
	mov r11, r10
	mov rax, qword [rbp - 88]
	mov r11, rax
	mov rax, qword [g_2]
	mov r10, rax
	mov rax, qword [rbp - 232]
	mov r10, rax
	mov rax, qword [g_1]
	mov rax, r9
	mov rax, qword [rbp - 56]
	mov rax, qword [rbp - 312]
	mov r10, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov rbx, r10
	mov rax, qword [rbp - 280]
	mov rbx, rax
	mov rax, qword [g_1]
	mov r10, rax
	mov r10, r9
	mov r9, r10
	mov rax, qword [rbp - 56]
	mov r9, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov r9, r8
	mov rax, qword [g_1]
	mov rax, r10
	mov rax, qword [rbp - 56]
	mov rax, r9
	mov rax, qword [rbp - 136]
	mov rax, rbx
	mov rax, qword [rbp - 240]
	mov r9, r11
	mov rax, qword [rbp - 272]
	mov r9, rax
	mov rax, qword [g_2]
	mov r11, rax
	mov rax, qword [rbp - 232]
	mov r11, rax
	mov rax, qword [g_1]
	mov rax, r10
	mov rax, qword [rbp - 56]
	mov rax, qword [rbp - 312]
	mov r11, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov rbx, r11
	mov rax, qword [rbp - 280]
	mov rbx, rax
	mov rax, qword [g_1]
	mov rax, r10
	mov r11, rax
	mov rax, qword [rbp - 56]
	mov r11, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 232]
	mov r11, r8
	mov rax, qword [g_1]
	mov rax, r10
	mov rax, qword [rbp - 56]
	mov rax, r11
	mov rax, qword [rbp - 136]
	mov r11, rbx
	mov rax, qword [rbp - 240]
	mov r11, rax
	mov rax, qword [g_2]
	mov rbx, rax
	mov rax, qword [rbp - 232]
	mov rbx, rax
	mov rax, qword [g_1]
	mov rax, r10
	mov rax, qword [rbp - 56]
	mov rax, qword [rbp - 312]
	mov rbx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 264]
	mov rax, qword [rbp - 280]
	mov rbx, rax
	mov rax, qword [g_1]
	mov rax, r10
	mov rax, qword [rbp - 56]
	mov r12, qword [g_2]
	mov r12, qword [rbp - 264]
	mov r12, rax
	mov r12, r8
	mov rax, qword [g_1]
	mov rax, r10
	mov rax, qword [rbp - 56]
	mov rax, r12
	mov rax, qword [rbp - 136]
	mov rax, rbx
	mov rax, qword [rbp - 240]
	mov rax, r11
	mov rax, rsi
	mov rax, r9
	mov rax, rdx
	mov rdx, rdi
	add rdx, rax
	mov rax, rcx
	sub rax, rdx
	mov qword [g_2], rax
	mov rax, qword [g_1]
	mov rcx, rax
	mov rax, qword [g_2]
	sub rcx, rax
	mov rsi, rcx
	mov rax, qword [g_0]
	add rsi, rax
	mov rax, qword [g_2]
	mov rdi, rax
	mov rax, qword [g_0]
	add rdi, rax
	mov rax, rsi
	sub rax, rdi
	mov rdx, qword [g_1]
	mov r10, rdx
	mov r10, rcx
	mov rdx, r10
	mov rdx, rsi
	mov rcx, qword [g_2]
	mov rcx, rdi
	mov rcx, rdx
	mov rcx, rax
	mov rdx, rax
	add rdx, rcx
	mov rcx, qword [g_1]
	mov rcx, r10
	mov r9, rcx
	mov r9, rsi
	mov rcx, qword [g_2]
	mov rcx, rdi
	mov rcx, r9
	mov qword [rbp - 24], rcx
	mov qword [rbp - 24], rax
	mov rax, qword [g_1]
	mov rcx, rax
	mov rcx, r10
	mov rsi, rcx
	mov rsi, r9
	mov rax, qword [rbp - 24]
	mov r8, rax
	add r8, rsi
	mov rax, rdx
	mov qword [rbp - 128], rax
	mov rax, qword [rbp - 128]
	add rax, r8
	mov qword [rbp - 128], rax
	mov rax, qword [g_2]
	mov r11, rax
	mov r11, rdi
	mov rax, qword [g_1]
	mov rsi, rax
	mov rsi, r10
	mov rax, rsi
	mov rax, r9
	add r11, rax
	mov rax, qword [g_2]
	mov rax, rdi
	mov r12, r11
	sub r12, rax
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, r9
	mov r10, qword [g_2]
	mov rbx, r10
	mov rbx, rdi
	mov rax, qword [rbp - 24]
	mov rdi, qword [g_1]
	mov rdi, rsi
	mov rdi, r9
	mov rax, r8
	mov r10, r12
	add r10, rax
	mov rax, qword [rbp - 128]
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 200]
	sub rax, r10
	mov qword [rbp - 200], rax
	mov rax, qword [g_2]
	mov qword [rbp - 176], rax
	mov rax, rbx
	mov qword [rbp - 176], rax
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, r9
	mov rax, qword [rbp - 176]
	mov rdi, rax
	mov rdi, r11
	mov rax, qword [g_2]
	mov r13, rax
	mov r13, rbx
	mov rax, qword [g_1]
	mov rax, rsi
	mov r11, rax
	mov r11, r9
	mov r13, rdi
	mov rax, rdi
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 40]
	sub rax, r13
	mov qword [rbp - 40], rax
	mov rax, qword [g_2]
	mov r14, rax
	mov r14, rbx
	mov rax, qword [g_1]
	mov r13, rax
	mov r13, rsi
	mov rax, r13
	mov rax, r9
	mov rsi, r14
	mov rsi, rdi
	mov rax, qword [g_2]
	mov rax, rbx
	mov rsi, r12
	mov rax, qword [rbp - 40]
	mov qword [rbp - 248], rax
	mov rax, qword [rbp - 248]
	sub rax, rsi
	mov qword [rbp - 248], rax
	mov rax, qword [g_1]
	mov rax, r13
	mov r12, rax
	mov r12, r9
	mov rax, qword [g_2]
	mov rax, rbx
	mov rax, qword [rbp - 24]
	mov r12, rax
	mov rax, qword [g_1]
	mov rax, r13
	mov r13, rax
	mov r13, r9
	mov r9, r12
	mov r9, r8
	mov rax, qword [g_2]
	mov r12, rax
	mov r12, rbx
	mov rax, qword [g_1]
	mov rax, rcx
	mov rax, r13
	mov rax, r12
	mov qword [rbp - 352], rax
	mov rax, rdi
	mov qword [rbp - 352], rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 352]
	mov rax, rsi
	mov rdi, r9
	sub rdi, rax
	mov rax, qword [rbp - 248]
	mov r9, rax
	add r9, rdi
	mov rax, qword [rbp - 200]
	mov rbx, rax
	sub rbx, r9
	mov rax, qword [g_1]
	mov rax, rcx
	mov r12, rax
	mov r12, r11
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, r12
	mov rax, qword [rbp - 24]
	mov r12, qword [g_1]
	mov r12, rcx
	mov r13, r12
	mov r13, r11
	mov r12, qword [g_2]
	mov r12, qword [rbp - 176]
	mov r12, r13
	mov r12, qword [rbp - 24]
	mov qword [rbp - 328], rax
	mov rax, rdx
	mov qword [rbp - 328], rax
	mov rax, qword [g_1]
	mov rdx, rax
	mov rdx, rcx
	mov rax, rdx
	mov rax, r11
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 176]
	mov rax, qword [rbp - 24]
	mov rcx, qword [g_1]
	mov rcx, rdx
	mov rcx, r11
	mov qword [rbp - 32], rax
	mov rax, r8
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 328]
	mov rcx, rax
	mov rax, qword [rbp - 128]
	mov rcx, rax
	mov rax, qword [g_2]
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 144], rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, r11
	mov rax, qword [rbp - 144]
	mov rax, qword [rbp - 352]
	mov r8, qword [g_2]
	mov r8, qword [rbp - 176]
	mov r12, rax
	mov r12, rsi
	mov rax, qword [g_1]
	mov rax, rdx
	mov r8, rax
	mov r8, r11
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 24]
	mov r8, rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov qword [rbp - 336], rax
	mov rax, r11
	mov qword [rbp - 336], rax
	mov rax, r8
	mov rax, qword [rbp - 32]
	mov rax, r12
	mov qword [rbp - 160], rax
	mov rax, r10
	mov qword [rbp - 160], rax
	mov rax, rcx
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 200]
	mov qword [rbp - 48], rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rcx, qword [g_1]
	mov rcx, rdx
	mov rcx, qword [rbp - 336]
	mov rcx, rax
	mov rax, qword [rbp - 352]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, rcx
	mov qword [rbp - 96], rax
	mov rax, rsi
	mov qword [rbp - 96], rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rcx, rax
	mov rax, qword [rbp - 336]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, rcx
	mov rax, qword [rbp - 24]
	mov rcx, qword [g_1]
	mov rcx, rdx
	mov rcx, qword [rbp - 336]
	mov rax, qword [rbp - 32]
	mov rax, qword [rbp - 96]
	mov rsi, rax
	mov rax, qword [rbp - 160]
	mov rsi, rax
	mov rax, qword [g_2]
	mov rcx, rax
	mov rax, qword [rbp - 176]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, rdx
	mov rax, qword [rbp - 336]
	mov rax, qword [rbp - 352]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 96]
	mov rcx, rax
	mov rax, qword [g_1]
	mov r8, rax
	mov r8, rdx
	mov rdx, r8
	mov rax, qword [rbp - 336]
	mov rdx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 24]
	mov rdx, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, rdx
	mov rax, qword [rbp - 32]
	mov rax, rcx
	mov rax, qword [rbp - 160]
	mov rdx, rsi
	sub rdx, rax
	mov rax, qword [rbp - 48]
	mov r10, rax
	sub r10, rdx
	mov r11, rbx
	add r11, r10
	mov rax, qword [g_2]
	mov rcx, rax
	mov rax, qword [rbp - 176]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, qword [rbp - 352]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rsi, rax
	mov rax, qword [rbp - 176]
	mov rsi, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, rsi
	mov rax, rcx
	mov rbx, rcx
	mov rax, qword [rbp - 40]
	mov rbx, rax
	mov rax, qword [g_2]
	mov rsi, rax
	mov rax, qword [rbp - 176]
	mov rsi, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rsi, rcx
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, rsi
	mov rax, qword [rbp - 96]
	mov rax, qword [rbp - 248]
	mov rbx, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 176]
	mov rcx, rax
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, qword [rbp - 32]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov r12, qword [g_1]
	mov r12, r8
	mov r12, qword [rbp - 336]
	mov r12, rax
	mov r12, rsi
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, r12
	mov rax, qword [rbp - 96]
	mov rax, rcx
	mov rax, rdi
	mov rsi, rbx
	mov rsi, r9
	mov rax, qword [g_1]
	mov rax, r8
	mov rcx, rax
	mov rax, qword [rbp - 336]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, qword [rbp - 32]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov r9, qword [g_1]
	mov r9, r8
	mov r9, qword [rbp - 336]
	mov r9, rax
	mov rax, qword [rbp - 352]
	mov r9, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, r9
	mov rax, qword [rbp - 96]
	mov r9, rcx
	mov r9, rdi
	mov rax, qword [g_1]
	mov rax, r8
	mov rcx, rax
	mov rax, qword [rbp - 336]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rdi, rcx
	mov rax, qword [rbp - 32]
	mov rdi, rax
	mov rax, qword [g_2]
	mov rcx, rax
	mov rax, qword [rbp - 176]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, qword [rbp - 352]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, rcx
	mov rax, qword [rbp - 96]
	mov rcx, rdi
	mov rcx, r9
	mov rax, r9
	add rax, rcx
	mov r9, rsi
	add r9, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rcx, rax
	mov rax, qword [rbp - 336]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rsi, rax
	mov rsi, r8
	mov rbx, rsi
	mov rax, qword [rbp - 336]
	mov rbx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, rbx
	mov rax, qword [rbp - 24]
	mov rax, rcx
	mov rax, qword [rbp - 328]
	mov rcx, qword [g_1]
	mov rcx, r8
	mov rbx, rcx
	mov rcx, qword [rbp - 336]
	mov rbx, rcx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 176]
	mov rcx, qword [rbp - 24]
	mov rbx, rcx
	mov rcx, qword [g_1]
	mov rcx, r8
	mov rcx, qword [rbp - 336]
	mov rcx, rbx
	mov rcx, qword [rbp - 32]
	mov rbx, rax
	mov rax, qword [rbp - 128]
	mov rbx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rcx, qword [g_1]
	mov rcx, r8
	mov rcx, qword [rbp - 336]
	mov rcx, rax
	mov rax, qword [rbp - 352]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, rcx
	mov rax, qword [rbp - 96]
	mov rcx, qword [g_1]
	mov rcx, r8
	mov r12, rcx
	mov rcx, qword [rbp - 336]
	mov r12, rcx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 176]
	mov rcx, qword [rbp - 24]
	mov r12, rcx
	mov rcx, qword [g_1]
	mov rcx, r8
	mov rcx, qword [rbp - 336]
	mov rcx, qword [rbp - 32]
	mov r12, rcx
	mov rcx, rax
	mov rax, qword [rbp - 160]
	mov rcx, rax
	mov rax, qword [rbp - 48]
	mov rbx, rax
	mov rax, qword [g_2]
	mov r13, rax
	mov rax, qword [rbp - 176]
	mov r13, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, r13
	mov rax, qword [rbp - 352]
	mov r13, qword [g_2]
	mov r13, qword [rbp - 176]
	mov r13, rax
	mov rax, qword [rbp - 96]
	mov r13, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov r14, rax
	mov rax, qword [rbp - 336]
	mov r14, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 176]
	mov rax, qword [rbp - 24]
	mov r14, rax
	mov rax, qword [g_1]
	mov rax, r8
	mov rax, qword [rbp - 336]
	mov rax, r14
	mov rax, r12
	mov r12, r13
	mov r12, rcx
	mov rax, qword [g_2]
	mov r8, rax
	mov rax, qword [rbp - 176]
	mov r8, rax
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, qword [rbp - 336]
	mov rax, qword [rbp - 352]
	mov r8, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 144]
	mov r13, r8
	mov rax, qword [rbp - 96]
	mov r13, rax
	mov rax, qword [g_1]
	mov rax, rsi
	mov r8, rax
	mov rax, qword [rbp - 336]
	mov r8, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 144]
	mov rax, qword [rbp - 24]
	mov r8, rax
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, qword [rbp - 336]
	mov rax, r8
	mov rax, rdi
	mov rax, r13
	mov rax, rcx
	mov rax, r12
	mov rax, rdx
	mov rax, rbx
	mov rax, r10
	mov rcx, r9
	add rcx, rax
	mov rax, r11
	sub rax, rcx
	mov qword [g_0], rax
	mov rax, qword [g_1]
	mov rax, rsi
	mov rcx, qword [g_0]
	add rax, rcx
	mov rcx, qword [g_2]
	mov rdx, rcx
	mov rcx, qword [g_0]
	add rdx, rcx
	mov r8, rax
	sub r8, rdx
	mov rcx, qword [g_1]
	mov rcx, rsi
	mov rcx, rax
	mov rdi, qword [g_2]
	mov rdi, rdx
	mov qword [rbp - 16], rcx
	mov rcx, r8
	mov qword [rbp - 16], rcx
	mov rcx, r8
	mov qword [rbp - 104], rcx
	mov rdi, qword [rbp - 16]
	mov rcx, qword [rbp - 104]
	add rcx, rdi
	mov qword [rbp - 104], rcx
	mov rcx, qword [g_1]
	mov rcx, rsi
	mov r8, rcx
	mov r8, rax
	mov rax, qword [g_2]
	mov rax, rdx
	mov rax, r8
	mov rax, qword [rbp - 16]
	mov rcx, qword [g_1]
	mov rcx, rsi
	mov rcx, r8
	mov rdi, rax
	add rdi, rcx
	mov rax, qword [rbp - 104]
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 256]
	add rax, rdi
	mov qword [rbp - 256], rax
	mov rax, qword [g_2]
	mov r10, rax
	mov r10, rdx
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, r8
	mov rcx, r10
	add rcx, rax
	mov rax, qword [g_2]
	mov rax, r10
	mov r9, rcx
	sub r9, rax
	mov rax, qword [g_1]
	mov rax, rsi
	mov r11, rax
	mov r11, r8
	mov rax, qword [g_2]
	mov rax, r10
	mov rax, r11
	mov rax, qword [rbp - 16]
	mov r11, qword [g_1]
	mov r11, rsi
	mov r11, r8
	mov r11, rax
	mov r11, rdi
	mov rbx, r9
	add rbx, r11
	mov rax, qword [rbp - 256]
	mov qword [rbp - 192], rax
	mov rax, qword [rbp - 192]
	sub rax, rbx
	mov qword [rbp - 192], rax
	mov rax, qword [g_2]
	mov rdi, rax
	mov rdi, r10
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, r8
	mov r12, rdi
	mov r12, rcx
	mov rax, qword [g_2]
	mov rdi, rax
	mov rdi, r10
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, r8
	mov rax, rdi
	mov rax, rcx
	mov rdi, r12
	sub rdi, rax
	mov rax, qword [g_2]
	mov rax, r10
	mov r12, qword [g_1]
	mov r12, rsi
	mov r12, r8
	mov qword [rbp - 112], rax
	mov rax, rcx
	mov qword [rbp - 112], rax
	mov rax, qword [g_2]
	mov qword [rbp - 288], rax
	mov rax, r10
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 112]
	mov rcx, rax
	mov rcx, r9
	mov r9, rdi
	sub r9, rcx
	mov rax, qword [g_1]
	mov rax, rsi
	mov rax, r8
	mov r12, qword [g_2]
	mov r12, r10
	mov rax, qword [rbp - 16]
	mov r12, qword [g_1]
	mov r12, rsi
	mov r12, r8
	mov qword [rbp - 320], rax
	mov rax, r11
	mov qword [rbp - 320], rax
	mov rax, qword [g_2]
	mov r11, rax
	mov r11, r10
	mov rax, qword [g_1]
	mov qword [rbp - 80], rax
	mov rax, rsi
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 80]
	mov r10, rax
	mov r10, r8
	mov rsi, r11
	mov rax, qword [rbp - 112]
	mov rsi, rax
	mov rax, qword [g_2]
	mov rax, rdx
	mov rsi, rcx
	mov rax, qword [rbp - 320]
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 304]
	sub rax, rsi
	mov qword [rbp - 304], rax
	mov r8, r9
	mov rax, qword [rbp - 304]
	add r8, rax
	mov rax, qword [rbp - 192]
	mov r11, rax
	sub r11, r8
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rsi, rax
	mov rsi, r10
	mov rax, qword [g_2]
	mov rax, rdx
	mov rax, qword [rbp - 16]
	mov rsi, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r10
	mov r12, qword [g_2]
	mov r12, rdx
	mov rax, qword [rbp - 16]
	mov r13, rsi
	mov rax, qword [rbp - 104]
	mov r13, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r10
	mov rsi, qword [g_2]
	mov r12, rsi
	mov r12, rdx
	mov rsi, rax
	mov rax, qword [rbp - 16]
	mov rsi, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r10
	mov rax, rsi
	mov rax, qword [rbp - 320]
	mov rax, qword [rbp - 256]
	mov r13, rax
	mov rax, qword [g_2]
	mov rdx, rax
	mov rdx, r12
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r10
	mov rax, rdx
	mov rax, qword [rbp - 112]
	mov rdx, qword [g_2]
	mov rdx, r12
	mov qword [rbp - 360], rax
	mov rax, rcx
	mov qword [rbp - 360], rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rcx, rax
	mov rcx, r10
	mov rax, qword [g_2]
	mov rax, r12
	mov rax, qword [rbp - 16]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rdx, rax
	mov rdx, r10
	mov rax, rcx
	mov rax, qword [rbp - 320]
	mov rax, qword [rbp - 360]
	mov rax, rbx
	mov rcx, r13
	mov rax, qword [rbp - 192]
	mov rcx, rax
	mov rax, qword [g_2]
	mov r14, rax
	mov r14, r12
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov r13, rax
	mov r13, r10
	mov r10, r14
	mov rax, qword [rbp - 112]
	mov r10, rax
	mov rax, qword [g_2]
	mov rax, r12
	mov rax, qword [rbp - 360]
	mov r10, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r13
	mov r14, qword [g_2]
	mov r14, r12
	mov r14, rax
	mov rax, qword [rbp - 16]
	mov r14, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r13
	mov rax, r14
	mov rax, qword [rbp - 320]
	mov rax, r10
	mov qword [rbp - 208], rax
	mov rax, rbx
	mov qword [rbp - 208], rax
	mov rax, qword [g_2]
	mov r10, rax
	mov r10, r12
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r13
	mov rax, qword [rbp - 112]
	mov r10, rax
	mov rax, qword [g_2]
	mov rax, r12
	mov rax, qword [rbp - 360]
	mov r10, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, r13
	mov rbx, qword [g_2]
	mov rbx, r12
	mov rbx, rax
	mov rax, qword [rbp - 16]
	mov rbx, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rax, rbx
	mov rax, qword [rbp - 320]
	mov rax, qword [rbp - 208]
	mov r10, rax
	mov rax, qword [rbp - 208]
	mov qword [rbp - 344], rax
	mov rax, qword [rbp - 344]
	sub rax, r10
	mov qword [rbp - 344], rax
	mov rax, rcx
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 344]
	mov rcx, qword [rbp - 8]
	sub rcx, rax
	mov qword [rbp - 8], rcx
	mov rax, r11
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 216]
	add rcx, rax
	mov qword [rbp - 216], rcx
	mov rax, qword [g_2]
	mov rcx, rax
	mov rax, qword [rbp - 288]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov r10, rcx
	mov rax, qword [rbp - 112]
	mov r10, rax
	mov rax, qword [g_2]
	mov rcx, rax
	mov rax, qword [rbp - 288]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rax, rcx
	mov rax, qword [rbp - 112]
	mov r10, rdi
	mov rax, qword [g_2]
	mov rcx, rax
	mov rax, qword [rbp - 288]
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rax, qword [rbp - 112]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 288]
	mov rax, rcx
	mov rax, qword [rbp - 360]
	mov rcx, r10
	mov rcx, r9
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rdi, rax
	mov rdi, rdx
	mov rax, qword [g_2]
	mov rax, qword [rbp - 288]
	mov rax, qword [rbp - 16]
	mov rdi, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rax, qword [rbp - 320]
	mov rdi, rax
	mov rax, qword [g_2]
	mov r9, rax
	mov rax, qword [rbp - 288]
	mov r9, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rax, qword [rbp - 112]
	mov r9, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 288]
	mov rax, r9
	mov rax, qword [rbp - 360]
	mov rax, rdi
	mov rax, qword [rbp - 304]
	mov r10, rcx
	mov r10, r8
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov rcx, rax
	mov rcx, rsi
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov r8, rcx
	mov r8, rdi
	mov rax, qword [g_2]
	mov rax, qword [rbp - 288]
	mov rcx, qword [g_1]
	mov rcx, qword [rbp - 80]
	mov rcx, rdx
	mov rcx, rax
	mov rax, qword [rbp - 112]
	mov rcx, rax
	mov rax, qword [g_2]
	mov rax, qword [rbp - 288]
	mov rax, rcx
	mov rax, qword [rbp - 360]
	mov rax, qword [rbp - 304]
	mov r8, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov rax, rsi
	mov rcx, qword [g_1]
	mov rcx, qword [rbp - 80]
	mov rsi, rcx
	mov rsi, rdx
	mov r11, rax
	mov r11, rdi
	mov rcx, qword [g_2]
	mov rdx, rcx
	mov rcx, qword [rbp - 288]
	mov rdx, rcx
	mov rcx, qword [g_1]
	mov r9, rcx
	mov rcx, qword [rbp - 80]
	mov r9, rcx
	mov rcx, r9
	mov rcx, rsi
	mov rcx, rdx
	mov rcx, qword [rbp - 112]
	mov rdx, qword [g_2]
	mov rdx, qword [rbp - 288]
	mov rcx, qword [rbp - 360]
	mov rdx, r11
	mov rcx, qword [rbp - 304]
	mov rdx, rcx
	mov rcx, r8
	add rcx, rdx
	mov r8, r10
	add r8, rcx
	mov rcx, qword [g_1]
	mov rcx, r9
	mov rdx, rcx
	mov rdx, rsi
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov rdx, rax
	mov rcx, qword [g_1]
	mov rcx, r9
	mov rcx, rsi
	mov r10, qword [g_2]
	mov r10, qword [rbp - 288]
	mov rcx, rax
	mov r10, rdx
	mov rcx, qword [rbp - 104]
	mov r10, rcx
	mov rcx, qword [g_1]
	mov rcx, r9
	mov rdx, rcx
	mov rdx, rsi
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov r11, rdx
	mov r11, rax
	mov rcx, qword [g_1]
	mov rcx, r9
	mov rcx, rsi
	mov rcx, r11
	mov rcx, rdi
	mov rcx, qword [rbp - 256]
	mov r10, rcx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov r11, qword [g_1]
	mov r11, r9
	mov r11, rsi
	mov rcx, qword [rbp - 112]
	mov r11, qword [g_2]
	mov r11, qword [rbp - 288]
	mov r11, rcx
	mov rcx, qword [rbp - 360]
	mov r11, rcx
	mov rcx, qword [g_1]
	mov rcx, r9
	mov rbx, rcx
	mov rbx, rsi
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov rcx, rbx
	mov rcx, rax
	mov rbx, qword [g_1]
	mov rbx, r9
	mov r9, rbx
	mov r9, rsi
	mov r9, rcx
	mov r9, rdi
	mov rcx, r11
	mov rcx, qword [rbp - 208]
	mov rcx, qword [rbp - 192]
	mov r10, rcx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov rdi, qword [g_1]
	mov rdi, qword [rbp - 80]
	mov rdi, rsi
	mov rdi, rcx
	mov rcx, qword [rbp - 112]
	mov rdi, rcx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov rcx, qword [rbp - 360]
	mov rdi, rcx
	mov rcx, qword [g_1]
	mov rcx, qword [rbp - 80]
	mov r11, rcx
	mov r11, rsi
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov r11, rax
	mov rcx, qword [g_1]
	mov rcx, qword [rbp - 80]
	mov rcx, rsi
	mov rcx, r11
	mov rcx, r9
	mov r11, rdi
	mov rcx, qword [rbp - 208]
	mov r11, rcx
	mov rcx, qword [g_2]
	mov rdi, rcx
	mov rcx, qword [rbp - 288]
	mov rdi, rcx
	mov rcx, qword [g_1]
	mov rcx, qword [rbp - 80]
	mov rcx, rsi
	mov rcx, rdi
	mov rcx, qword [rbp - 112]
	mov rsi, qword [g_2]
	mov rsi, qword [rbp - 288]
	mov rdi, rcx
	mov rcx, qword [rbp - 360]
	mov rdi, rcx
	mov rcx, qword [g_1]
	mov rcx, qword [rbp - 80]
	mov rsi, rcx
	mov rsi, rdx
	mov rcx, qword [g_2]
	mov rcx, qword [rbp - 288]
	mov rcx, rsi
	mov rcx, rax
	mov rax, qword [g_1]
	mov rax, qword [rbp - 80]
	mov rax, rdx
	mov rax, rcx
	mov rax, r9
	mov rax, rdi
	mov rax, qword [rbp - 208]
	mov rax, r11
	mov rax, qword [rbp - 344]
	mov rax, r10
	mov rax, qword [rbp - 8]
	mov rcx, r8
	add rcx, rax
	mov rax, qword [rbp - 216]
	sub rax, rcx
	mov qword [g_1], rax
	jmp b1
__init:
	b6:
	push rbp
	mov rbp, rsp
	mov rcx, 1
	mov rdx, 1
	mov rsi, 1
	mov qword [g_0], rdx
	mov qword [g_1], rsi
	mov qword [g_2], rcx
	call _main
	mov rcx, qword [g_2]
	mov rsi, qword [g_1]
	mov rdx, qword [g_0]
	leave
	ret 
	section .data
g_2:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_0:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_1:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_3:
	dq 1
	db 20H, 00H
g_4:
	dq 1
	db 20H, 00H
