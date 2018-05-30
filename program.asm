





default rel

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
global main

extern strcmp
extern __sprintf_chk
extern memcpy
extern malloc
extern __isoc99_scanf
extern puts
extern __printf_chk


SECTION .text   6

__print:
        lea     rdx, [rdi+8H]
        mov     esi, L_017
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
        mov     esi, __buffer.3420
        mov     edi, L_017
        xor     eax, eax
        push    rbx
        mov     ebx, __buffer.3420
        sub     rsp, 8
        call    __isoc99_scanf
L_001:  mov     edx, dword [rbx]
        add     rbx, 4
        lea     eax, [rdx-1010101H]
        not     edx
        and     eax, edx
        and     eax, 80808080H
        jz      L_001
        mov     edx, eax
        shr     edx, 16
        test    eax, 8080H
        cmove   eax, edx
        lea     rdx, [rbx+2H]
        cmove   rbx, rdx
        add     al, al
        sbb     rbx, 3
        sub     rbx, __buffer.3420
        lea     edi, [rbx+8H]
        movsxd  rdi, edi
        call    malloc
        mov     rbp, rax
        lea     rdx, [rbx+1H]
        movsxd  rax, ebx
        lea     rdi, [rbp+8H]
        mov     qword [rbp], rax
        mov     esi, __buffer.3420
        call    memcpy
        add     rsp, 8
        mov     rax, rbp
        pop     rbx
        pop     rbp
        ret







ALIGN   16

__getInt:
        sub     rsp, 24
        mov     edi, L_018
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
        mov     ecx, L_018
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
        jle     L_003
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
        je      L_004
        cmp     ebx, 15
        jbe     L_004
        mov     esi, ebx
        xor     edx, edx
        xor     r8d, r8d
        shr     esi, 4
        mov     ecx, esi
        shl     ecx, 4
L_002:  movdqu  xmm0, oword [r13+rdx+8H]
        add     r8d, 1
        movdqu  oword [rax+rdx+8H], xmm0
        add     rdx, 16
        cmp     r8d, esi
        jc      L_002
        cmp     ebx, ecx
        je      L_003
        lea     edx, [rdi+rcx]
        lea     r13d, [rcx+8H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r13d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+1H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r11d, [rcx+9H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r11d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+2H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r10d, [rcx+0AH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r10d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+3H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r9d, [rcx+0BH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r9d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+4H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r8d, [rcx+0CH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r8d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+5H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     esi, [rcx+0DH]
        movsxd  rdx, edx
        movzx   r14d, byte [rbp+rdx]
        movsxd  rdx, esi
        mov     byte [rax+rdx], r14b
        lea     edx, [rcx+6H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        movsxd  rdx, edx
        movzx   r15d, byte [rbp+rdx]
        lea     edx, [rcx+0EH]
        movsxd  r14, edx
        mov     byte [rax+r14], r15b
        lea     r14d, [rcx+7H]
        cmp     ebx, r14d
        jle     L_003
        add     r14d, edi
        cmp     ebx, r13d
        movsxd  r14, r14d
        movzx   r15d, byte [rbp+r14]
        lea     r14d, [rcx+0FH]
        movsxd  r14, r14d
        mov     byte [rax+r14], r15b
        jle     L_003
        add     r13d, edi
        cmp     ebx, r11d
        movsxd  r13, r13d
        movzx   r14d, byte [rbp+r13]
        lea     r13d, [rcx+10H]
        movsxd  r13, r13d
        mov     byte [rax+r13], r14b
        jle     L_003
        add     r11d, edi
        cmp     ebx, r10d
        movsxd  r11, r11d
        movzx   r13d, byte [rbp+r11]
        lea     r11d, [rcx+11H]
        movsxd  r11, r11d
        mov     byte [rax+r11], r13b
        jle     L_003
        add     r10d, edi
        cmp     ebx, r9d
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        lea     r10d, [rcx+12H]
        movsxd  r10, r10d
        mov     byte [rax+r10], r11b
        jle     L_003
        add     r9d, edi
        cmp     ebx, r8d
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        lea     r9d, [rcx+13H]
        movsxd  r9, r9d
        mov     byte [rax+r9], r10b
        jle     L_003
        add     r8d, edi
        cmp     ebx, esi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        lea     r8d, [rcx+14H]
        movsxd  r8, r8d
        mov     byte [rax+r8], r9b
        jle     L_003
        add     esi, edi
        cmp     ebx, edx
        movsxd  rsi, esi
        movzx   r8d, byte [rbp+rsi]
        lea     esi, [rcx+15H]
        movsxd  rsi, esi
        mov     byte [rax+rsi], r8b
        jle     L_003
        add     edx, edi
        add     ecx, 22
        movsxd  rdx, edx
        movsxd  rcx, ecx
        movzx   edx, byte [rbp+rdx]
        mov     byte [rax+rcx], dl
L_003:  add     r12d, 9
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
L_004:  movsxd  rdi, edi
        xor     ecx, ecx
        add     rbp, rdi




ALIGN   16
L_005:  movzx   edx, byte [rbp+rcx]
        mov     byte [rax+rcx+8H], dl
        add     rcx, 1
        cmp     ebx, ecx
        jg      L_005
        jmp     L_003







ALIGN   16

__string_parseInt:
        movsx   edx, byte [rdi+8H]
        cmp     dl, 45
        jz      L_009
        lea     rcx, [rdi+8H]
        xor     edi, edi
L_006:  lea     eax, [rdx-30H]
        cmp     al, 9
        mov     eax, 0
        ja      L_008




ALIGN   8
L_007:  sub     edx, 48
        lea     rax, [rax+rax*4]
        add     rcx, 1
        movsxd  rdx, edx
        lea     rax, [rdx+rax*2]
        movsx   edx, byte [rcx]
        lea     esi, [rdx-30H]
        cmp     sil, 9
        jbe     L_007
L_008:  mov     rdx, rax
        neg     rdx
        test    edi, edi
        cmovne  rax, rdx
        ret





ALIGN   8
L_009:  lea     rcx, [rdi+9H]
        movsx   edx, byte [rdi+9H]
        mov     edi, 1
        jmp     L_006


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
        jle     L_011
        lea     rcx, [rbp+8H]
        lea     rdx, [rax+18H]
        lea     rsi, [rbp+18H]
        cmp     rcx, rdx
        lea     rdx, [rax+8H]
        setae   cl
        cmp     rsi, rdx
        setbe   dl
        or      cl, dl
        je      L_014
        cmp     rbx, 15
        jbe     L_014
        mov     rsi, rbx
        xor     ecx, ecx
        xor     edi, edi
        shr     rsi, 4
        mov     rdx, rsi
        shl     rdx, 4
L_010:  movdqu  xmm0, oword [rbp+rcx+8H]
        add     rdi, 1
        movdqu  oword [rax+rcx+8H], xmm0
        add     rcx, 16
        cmp     rsi, rdi
        ja      L_010
        cmp     rbx, rdx
        je      L_011
        lea     r14d, [rdx+8H]
        movsxd  r14, r14d
        movzx   ecx, byte [rbp+r14]
        mov     byte [rax+r14], cl
        lea     ecx, [rdx+1H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     r10d, [rdx+9H]
        movsxd  rcx, r10d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+2H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     r9d, [rdx+0AH]
        movsxd  rcx, r9d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+3H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     r8d, [rdx+0BH]
        movsxd  rcx, r8d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+4H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     edi, [rdx+0CH]
        movsxd  rcx, edi
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+5H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     esi, [rdx+0DH]
        movsxd  rcx, esi
        movzx   r11d, byte [rbp+rcx]
        mov     byte [rax+rcx], r11b
        lea     ecx, [rdx+6H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     ecx, [rdx+0EH]
        movsxd  r11, ecx
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        lea     r11d, [rdx+7H]
        movsxd  r11, r11d
        cmp     rbx, r11
        jle     L_011
        lea     r11d, [rdx+0FH]
        cmp     rbx, r14
        movsxd  r11, r11d
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        jle     L_011
        lea     r11d, [rdx+10H]
        movsxd  r10, r10d
        cmp     rbx, r10
        movsxd  r11, r11d
        movzx   r14d, byte [rbp+r11]
        mov     byte [rax+r11], r14b
        jle     L_011
        lea     r10d, [rdx+11H]
        movsxd  r9, r9d
        cmp     rbx, r9
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        mov     byte [rax+r10], r11b
        jle     L_011
        lea     r9d, [rdx+12H]
        movsxd  r8, r8d
        cmp     rbx, r8
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        mov     byte [rax+r9], r10b
        jle     L_011
        lea     r8d, [rdx+13H]
        movsxd  rdi, edi
        cmp     rbx, rdi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        mov     byte [rax+r8], r9b
        jle     L_011
        lea     edi, [rdx+14H]
        movsxd  rsi, esi
        cmp     rbx, rsi
        movsxd  rdi, edi
        movzx   r8d, byte [rbp+rdi]
        mov     byte [rax+rdi], r8b
        jle     L_011
        lea     esi, [rdx+15H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        movsxd  rsi, esi
        movzx   edi, byte [rbp+rsi]
        mov     byte [rax+rsi], dil
        jle     L_011
        add     edx, 22
        movsxd  rdx, edx
        movzx   ecx, byte [rbp+rdx]
        mov     byte [rax+rdx], cl
L_011:  test    r13, r13
        jle     L_016
        lea     rsi, [r13+1H]
        add     rbx, 8
        mov     edx, 1
        xor     ecx, ecx




ALIGN   8
L_012:  movzx   edi, byte [r12+rdx+7H]
        add     rcx, rax
        mov     byte [rcx+rbx], dil
        mov     rcx, rdx
        add     rdx, 1
        cmp     rdx, rsi
        jnz     L_012
L_013:  add     r13, rax
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
L_014:  xor     edx, edx




ALIGN   8
L_015:  movzx   ecx, byte [rbp+rdx+8H]
        mov     byte [rax+rdx+8H], cl
        add     rdx, 1
        cmp     rbx, rdx
        jnz     L_015
        jmp     L_011

L_016:  add     rbx, 8
        jmp     L_013







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

__buffer.3420:
        resb    1048576


SECTION .text.startup 6

main:
        xor     eax, eax
        jmp     __init



SECTION .rodata.str1.1 

L_017:
        db 25H, 73H, 00H

L_018:
        db 25H, 6CH, 64H, 00H


;=====================================================================
	 section .text
_main:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 256
	mov rdi, 8
	call malloc
	mov qword [rbp - 144], rax
	mov rbx, qword [rbp - 144]
	mov qword [rbx], 0
	mov r10, qword [rbp - 144]
	mov rbx, r10
	mov qword [rbp - 240], rbx
	mov rbx, 10
	mov qword [rbp - 248], rbx
	mov rbx, qword [rbp - 248]
	mov r10, qword [rbp - 88]
	lea r10, [rbx * 8 + 8]
	mov qword [rbp - 88], r10
	mov rdi, qword [rbp - 88]
	call malloc
	mov qword [rbp - 120], rax
	mov rbx, qword [rbp - 248]
	mov r10, qword [rbp - 120]
	mov qword [r10], rbx
	b1:
	mov rbx, qword [rbp - 248]
	cmp rbx, 0
	jg b2
	b3:
	mov rbx, qword [rbp - 120]
	mov r10, rbx
	mov qword [rbp - 216], r10
	mov rbx, 0
	mov qword [rbp - 168], rbx
	b4:
	mov rbx, qword [rbp - 168]
	cmp rbx, 10
	jl b5
	b6:
	mov rbx, qword [rbp - 240]
	mov r10, rbx
	mov qword [rbp - 80], r10
	mov rsi, qword [rbp - 216]
	mov rdi, qword [rbp - 80]
	call _vector.init
	mov rdi, g_0
	call __print
	mov rbx, qword [rbp - 240]
	mov r10, rbx
	mov qword [rbp - 184], r10
	mov rdi, qword [rbp - 184]
	call _vector.tostring
	mov qword [rbp - 152], rax
	mov rdi, qword [rbp - 152]
	call __println
	mov rdi, 8
	call malloc
	mov qword [rbp - 104], rax
	mov rbx, qword [rbp - 104]
	mov qword [rbx], 0
	mov rbx, qword [rbp - 104]
	mov r10, rbx
	mov qword [rbp - 8], r10
	mov r10, qword [rbp - 8]
	mov rbx, r10
	mov qword [rbp - 192], rbx
	mov rsi, qword [rbp - 240]
	mov rdi, qword [rbp - 192]
	call _vector.copy
	mov qword [rbp - 40], rax
	mov r10, qword [rbp - 8]
	mov rbx, r10
	mov qword [rbp - 128], rbx
	mov rdx, 817
	mov rsi, 3
	mov rdi, qword [rbp - 128]
	call _vector.set
	mov qword [rbp - 136], rax
	mov rbx, qword [rbp - 136]
	cmp rbx, 0
	jne b7
	jmp b8
	b7:
	mov rdi, g_1
	call __println
	b8:
	mov rdi, g_2
	call __print
	mov r10, qword [rbp - 8]
	mov rbx, r10
	mov qword [rbp - 208], rbx
	mov rdi, qword [rbp - 208]
	call _vector.tostring
	mov qword [rbp - 24], rax
	mov rdi, qword [rbp - 24]
	call __println
	mov rdi, g_3
	call __print
	mov rbx, qword [rbp - 240]
	mov r10, rbx
	mov qword [rbp - 48], r10
	mov rsi, qword [rbp - 8]
	mov rdi, qword [rbp - 48]
	call _vector.add
	mov qword [rbp - 224], rax
	mov rbx, qword [rbp - 224]
	mov r10, rbx
	mov qword [rbp - 112], r10
	mov rdi, qword [rbp - 112]
	call _vector.tostring
	mov qword [rbp - 200], rax
	mov rdi, qword [rbp - 200]
	call __println
	mov rdi, g_4
	call __print
	mov rbx, qword [rbp - 240]
	mov r10, rbx
	mov qword [rbp - 16], r10
	mov rsi, qword [rbp - 8]
	mov rdi, qword [rbp - 16]
	call _vector.dot
	mov qword [rbp - 96], rax
	mov rdi, qword [rbp - 96]
	call __toString
	mov qword [rbp - 72], rax
	mov rdi, qword [rbp - 72]
	call __println
	mov rdi, g_5
	call __print
	mov r10, qword [rbp - 8]
	mov rbx, r10
	mov qword [rbp - 32], rbx
	mov rbx, 1
	mov qword [rbp - 232], rbx
	mov rbx, qword [rbp - 232]
	shl rbx, 3
	mov qword [rbp - 232], rbx
	mov rsi, qword [rbp - 232]
	mov rdi, qword [rbp - 32]
	call _vector.scalarInPlaceMultiply
	mov qword [rbp - 64], rax
	mov rbx, qword [rbp - 64]
	mov r10, rbx
	mov qword [rbp - 176], r10
	mov rdi, qword [rbp - 176]
	call _vector.tostring
	mov qword [rbp - 160], rax
	mov rdi, qword [rbp - 160]
	call __println
	mov rax, 0
	leave
	ret 
	b5:
	mov rbx, 9
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	mov r10, qword [rbp - 168]
	sub rbx, r10
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	mov r10, qword [rbp - 168]
	mov r11, qword [rbp - 216]
	mov qword [r11 + r10 * 8 + 8], rbx
	b9:
	mov rbx, qword [rbp - 168]
	inc rbx
	mov qword [rbp - 168], rbx
	jmp b4
	b2:
	mov rbx, qword [rbp - 248]
	mov r10, qword [rbp - 120]
	mov qword [r10 + rbx * 8], 0
	mov rbx, qword [rbp - 248]
	dec rbx
	mov qword [rbp - 248], rbx
	jmp b1
_vector.init:
	b10:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	mov qword [rbp - 80], rdi
	mov qword [rbp - 48], rsi
	mov rbx, qword [rbp - 48]
	cmp rbx, 0
	je b11
	b12:
	mov r10, qword [rbp - 48]
	mov rbx, r10
	mov qword [rbp - 72], rbx
	mov rbx, qword [rbp - 72]
	mov r10, qword [rbx]
	mov qword [rbp - 32], r10
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 64]
	lea r10, [rbx * 8 + 8]
	mov qword [rbp - 64], r10
	mov rdi, qword [rbp - 64]
	call malloc
	mov qword [rbp - 56], rax
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 56]
	mov qword [r10], rbx
	b13:
	mov rbx, qword [rbp - 32]
	cmp rbx, 0
	jg b14
	b15:
	mov rbx, qword [rbp - 80]
	mov r10, qword [rbp - 56]
	mov qword [rbx], r10
	mov rbx, 0
	mov qword [rbp - 8], rbx
	b16:
	mov r10, qword [rbp - 48]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 24]
	cmp rbx, qword [r10]
	jl b17
	b18:
	jmp b19
	b17:
	mov rbx, qword [rbp - 80]
	mov r10, qword [rbx]
	mov qword [rbp - 16], r10
	mov rbx, qword [rbp - 8]
	mov r11, qword [rbp - 48]
	mov r10, qword [r11 + rbx * 8 + 8]
	mov qword [rbp - 40], r10
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 8]
	mov r11, qword [rbp - 40]
	mov qword [rbx + r10 * 8 + 8], r11
	b20:
	mov rbx, qword [rbp - 8]
	inc rbx
	mov qword [rbp - 8], rbx
	jmp b16
	b14:
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 56]
	mov qword [r10 + rbx * 8], 0
	mov rbx, qword [rbp - 32]
	dec rbx
	mov qword [rbp - 32], rbx
	jmp b13
	b11:
	b19:
	leave
	ret 
_vector.getDim:
	b21:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword [rbp - 8], rdi
	mov rbx, qword [rbp - 8]
	cmp qword [rbx], 0
	je b22
	b23:
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbx]
	mov qword [rbp - 24], r10
	mov r10, qword [rbp - 24]
	mov rbx, qword [r10]
	mov qword [rbp - 16], rbx
	mov rax, qword [rbp - 16]
	jmp b24
	b22:
	mov rax, 0
	b24:
	leave
	ret 
_vector.dot:
	b25:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	mov qword [rbp - 80], rdi
	mov qword [rbp - 64], rsi
	mov rbx, 0
	mov qword [rbp - 32], rbx
	mov rbx, 0
	mov qword [rbp - 56], rbx
	b26:
	mov rdi, qword [rbp - 80]
	call _vector.getDim
	mov qword [rbp - 48], rax
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 48]
	cmp rbx, r10
	jl b27
	b28:
	mov rax, qword [rbp - 56]
	leave
	ret 
	b27:
	mov r10, qword [rbp - 80]
	mov rbx, qword [r10]
	mov qword [rbp - 16], rbx
	mov r10, qword [rbp - 64]
	mov rbx, r10
	mov qword [rbp - 8], rbx
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbx]
	mov qword [rbp - 24], r10
	mov rbx, qword [rbp - 32]
	mov r11, qword [rbp - 16]
	mov r10, qword [r11 + rbx * 8 + 8]
	mov qword [rbp - 72], r10
	mov rax, qword [rbp - 72]
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 24]
	imul qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 40], rax
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 32]
	inc rbx
	mov qword [rbp - 32], rbx
	jmp b26
_vector.scalarInPlaceMultiply:
	b29:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	mov qword [rbp - 72], rdi
	mov qword [rbp - 48], rsi
	mov rbx, qword [rbp - 72]
	cmp qword [rbx], 0
	je b30
	b31:
	mov rbx, 0
	mov qword [rbp - 8], rbx
	b32:
	mov rdi, qword [rbp - 72]
	call _vector.getDim
	mov qword [rbp - 56], rax
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 56]
	cmp rbx, r10
	jl b33
	b34:
	mov rax, qword [rbp - 72]
	jmp b35
	b33:
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov r10, qword [rbp - 24]
	mov rbx, qword [r10]
	mov qword [rbp - 32], rbx
	mov rbx, qword [rbp - 72]
	mov r10, rbx
	mov qword [rbp - 16], r10
	mov r10, qword [rbp - 16]
	mov rbx, qword [r10]
	mov qword [rbp - 64], rbx
	mov rax, qword [rbp - 48]
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 64]
	imul qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 40], rax
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 8]
	mov r11, qword [rbp - 40]
	mov qword [rbx + r10 * 8 + 8], r11
	b36:
	mov rbx, qword [rbp - 8]
	inc rbx
	mov qword [rbp - 8], rbx
	jmp b32
	b30:
	mov rax, 0
	b35:
	leave
	ret 
_vector.add:
	b37:
	push rbp
	mov rbp, rsp
	sub rsp, 176
	mov qword [rbp - 64], rdi
	mov qword [rbp - 144], rsi
	mov rdi, qword [rbp - 64]
	call _vector.getDim
	mov qword [rbp - 8], rax
	mov r10, qword [rbp - 144]
	mov rbx, r10
	mov qword [rbp - 80], rbx
	mov rdi, qword [rbp - 80]
	call _vector.getDim
	mov qword [rbp - 120], rax
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 120]
	cmp rbx, r10
	jne b38
	b39:
	mov rdi, qword [rbp - 64]
	call _vector.getDim
	mov qword [rbp - 168], rax
	mov rbx, qword [rbp - 168]
	cmp rbx, 0
	je b38
	b40:
	mov rdi, 8
	call malloc
	mov qword [rbp - 32], rax
	mov rbx, qword [rbp - 32]
	mov qword [rbx], 0
	mov r10, qword [rbp - 32]
	mov rbx, r10
	mov qword [rbp - 16], rbx
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 160], r10
	mov rdi, qword [rbp - 64]
	call _vector.getDim
	mov qword [rbp - 96], rax
	mov rbx, qword [rbp - 96]
	mov r10, rbx
	mov qword [rbp - 88], r10
	mov rbx, qword [rbp - 128]
	mov r10, qword [rbp - 88]
	lea rbx, [r10 * 8 + 8]
	mov qword [rbp - 128], rbx
	mov rdi, qword [rbp - 128]
	call malloc
	mov qword [rbp - 152], rax
	mov rbx, qword [rbp - 152]
	mov r10, qword [rbp - 88]
	mov qword [rbx], r10
	b41:
	mov rbx, qword [rbp - 88]
	cmp rbx, 0
	jg b42
	b43:
	mov rbx, qword [rbp - 152]
	mov r10, qword [rbp - 160]
	mov qword [r10], rbx
	mov rbx, 0
	mov qword [rbp - 40], rbx
	b44:
	mov rdi, qword [rbp - 64]
	call _vector.getDim
	mov qword [rbp - 56], rax
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 56]
	cmp rbx, r10
	jl b45
	b46:
	mov rax, qword [rbp - 16]
	jmp b47
	b45:
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 104], r10
	mov r10, qword [rbp - 104]
	mov rbx, qword [r10]
	mov qword [rbp - 48], rbx
	mov rbx, qword [rbp - 64]
	mov r10, qword [rbx]
	mov qword [rbp - 72], r10
	mov r10, qword [rbp - 144]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 24]
	mov r10, qword [rbx]
	mov qword [rbp - 112], r10
	mov rbx, qword [rbp - 40]
	mov r11, qword [rbp - 72]
	mov r10, qword [r11 + rbx * 8 + 8]
	mov qword [rbp - 136], r10
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 136]
	mov r11, qword [rbp - 112]
	add r10, qword [r11 + rbx * 8 + 8]
	mov qword [rbp - 136], r10
	mov rbx, qword [rbp - 48]
	mov r10, qword [rbp - 40]
	mov r11, qword [rbp - 136]
	mov qword [rbx + r10 * 8 + 8], r11
	b48:
	mov rbx, qword [rbp - 40]
	inc rbx
	mov qword [rbp - 40], rbx
	jmp b44
	b42:
	mov rbx, qword [rbp - 152]
	mov r10, qword [rbp - 88]
	mov qword [rbx + r10 * 8], 0
	mov rbx, qword [rbp - 88]
	dec rbx
	mov qword [rbp - 88], rbx
	jmp b41
	b38:
	mov rax, 0
	b47:
	leave
	ret 
_vector.set:
	b49:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov qword [rbp - 24], rdi
	mov qword [rbp - 40], rsi
	mov qword [rbp - 8], rdx
	mov rdi, qword [rbp - 24]
	call _vector.getDim
	mov qword [rbp - 16], rax
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 40]
	cmp rbx, r10
	jl b50
	b51:
	mov rbx, qword [rbp - 24]
	mov r10, qword [rbx]
	mov qword [rbp - 32], r10
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 8]
	mov r11, qword [rbp - 32]
	mov qword [r11 + rbx * 8 + 8], r10
	b52:
	mov rax, 1
	b53:
	jmp b54
	b50:
	b55:
	mov rax, 0
	b56:
	b54:
	leave
	ret 
_vector.tostring:
	b57:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov qword [rbp - 56], rdi
	mov rbx, g_6
	mov qword [rbp - 16], rbx
	mov rdi, qword [rbp - 56]
	call _vector.getDim
	mov qword [rbp - 120], rax
	mov rbx, qword [rbp - 120]
	cmp rbx, 0
	jg b58
	jmp b59
	b58:
	mov rbx, qword [rbp - 56]
	mov r10, qword [rbx]
	mov qword [rbp - 80], r10
	mov r10, qword [rbp - 80]
	mov rbx, qword [r10 + 8]
	mov qword [rbp - 24], rbx
	mov rdi, qword [rbp - 24]
	call __toString
	mov qword [rbp - 104], rax
	mov rsi, qword [rbp - 104]
	mov rdi, qword [rbp - 16]
	call __stringConcate
	mov qword [rbp - 88], rax
	mov r10, qword [rbp - 88]
	mov rbx, r10
	mov qword [rbp - 16], rbx
	b59:
	mov rbx, 1
	mov qword [rbp - 64], rbx
	b60:
	mov rdi, qword [rbp - 56]
	call _vector.getDim
	mov qword [rbp - 48], rax
	mov rbx, qword [rbp - 64]
	mov r10, qword [rbp - 48]
	cmp rbx, r10
	jl b61
	b62:
	mov rsi, g_7
	mov rdi, qword [rbp - 16]
	call __stringConcate
	mov qword [rbp - 72], rax
	mov rbx, qword [rbp - 72]
	mov r10, rbx
	mov qword [rbp - 16], r10
	mov rax, qword [rbp - 16]
	leave
	ret 
	b61:
	mov rsi, g_8
	mov rdi, qword [rbp - 16]
	call __stringConcate
	mov qword [rbp - 96], rax
	mov r10, qword [rbp - 56]
	mov rbx, qword [r10]
	mov qword [rbp - 32], rbx
	mov r10, qword [rbp - 64]
	mov r11, qword [rbp - 32]
	mov rbx, qword [r11 + r10 * 8 + 8]
	mov qword [rbp - 112], rbx
	mov rdi, qword [rbp - 112]
	call __toString
	mov qword [rbp - 40], rax
	mov rsi, qword [rbp - 40]
	mov rdi, qword [rbp - 96]
	call __stringConcate
	mov qword [rbp - 8], rax
	mov rbx, qword [rbp - 8]
	mov r10, rbx
	mov qword [rbp - 16], r10
	b63:
	mov rbx, qword [rbp - 64]
	inc rbx
	mov qword [rbp - 64], rbx
	jmp b60
_vector.copy:
	b64:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov qword [rbp - 8], rdi
	mov qword [rbp - 40], rsi
	mov rbx, qword [rbp - 40]
	cmp rbx, 0
	je b65
	b66:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 112], rbx
	mov rdi, qword [rbp - 112]
	call _vector.getDim
	mov qword [rbp - 72], rax
	mov rbx, qword [rbp - 72]
	cmp rbx, 0
	je b67
	b68:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rdi, qword [rbp - 24]
	call _vector.getDim
	mov qword [rbp - 88], rax
	mov rbx, qword [rbp - 88]
	mov r10, rbx
	mov qword [rbp - 104], r10
	mov rbx, qword [rbp - 104]
	mov r10, qword [rbp - 80]
	lea r10, [rbx * 8 + 8]
	mov qword [rbp - 80], r10
	mov rdi, qword [rbp - 80]
	call malloc
	mov qword [rbp - 56], rax
	mov rbx, qword [rbp - 56]
	mov r10, qword [rbp - 104]
	mov qword [rbx], r10
	b69:
	mov rbx, qword [rbp - 104]
	cmp rbx, 0
	jg b70
	b71:
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 56]
	mov qword [rbx], r10
	mov rbx, 0
	mov qword [rbp - 16], rbx
	b72:
	mov rdi, qword [rbp - 8]
	call _vector.getDim
	mov qword [rbp - 96], rax
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 96]
	cmp rbx, r10
	jl b73
	b74:
	jmp b75
	b73:
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbx]
	mov qword [rbp - 48], r10
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 64]
	mov r10, qword [rbx]
	mov qword [rbp - 32], r10
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 32]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 120], r11
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 48]
	mov r11, qword [rbp - 120]
	mov qword [r10 + rbx * 8 + 8], r11
	b76:
	mov rbx, qword [rbp - 16]
	inc rbx
	mov qword [rbp - 16], rbx
	jmp b72
	b70:
	mov rbx, qword [rbp - 56]
	mov r10, qword [rbp - 104]
	mov qword [rbx + r10 * 8], 0
	mov rbx, qword [rbp - 104]
	dec rbx
	mov qword [rbp - 104], rbx
	jmp b69
	b67:
	mov rbx, qword [rbp - 8]
	mov qword [rbx], 0
	b75:
	b77:
	mov rax, 1
	b78:
	jmp b79
	b65:
	b80:
	mov rax, 0
	b81:
	b79:
	leave
	ret 
__init:
	b82:
	push rbp
	mov rbp, rsp
	sub rsp, 0
	call _main
	leave
	ret 
	section .data
g_0:
	dq 10
	db 76H, 65H, 63H, 74H, 6FH, 72H, 20H, 78H, 3AH, 20H, 00H
g_1:
	dq 8
	db 65H, 78H, 63H, 69H, 74H, 65H, 64H, 21H, 00H
g_2:
	dq 10
	db 76H, 65H, 63H, 74H, 6FH, 72H, 20H, 79H, 3AH, 20H, 00H
g_3:
	dq 7
	db 78H, 20H, 2BH, 20H, 79H, 3AH, 20H, 00H
g_4:
	dq 7
	db 78H, 20H, 2AH, 20H, 79H, 3AH, 20H, 00H
g_5:
	dq 14
	db 28H, 31H, 20H, 3CH, 3CH, 20H, 33H, 29H, 20H, 2AH, 20H, 79H, 3AH, 20H, 00H
g_6:
	dq 2
	db 28H, 20H, 00H
g_8:
	dq 2
	db 2CH, 20H, 00H
g_7:
	dq 2
	db 20H, 29H, 00H
