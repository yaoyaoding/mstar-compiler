default rel

global main
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

extern strcmp
extern sprintf
extern strcpy
extern malloc
extern strlen
extern __isoc99_scanf
extern puts
extern printf


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        call    __init
        pop     rbp
        ret


__print:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rax
        mov     edi, L_012
        mov     eax, 0
        call    printf
        leave
        ret


__println:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rdi, rax
        call    puts
        leave
        ret


__getString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     esi, __buffer.2866
        mov     edi, L_012
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, __buffer.2866
        call    strlen
        mov     dword [rbp-0CH], eax
        mov     eax, dword [rbp-0CH]
        add     eax, 8
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     esi, __buffer.2866
        mov     rdi, rax
        call    strcpy
        mov     rax, qword [rbp-8H]
        leave
        ret


__getInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rax, [rbp-8H]
        mov     rsi, rax
        mov     edi, L_013
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, qword [rbp-8H]
        leave
        ret


__toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     edi, 32
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+8H]
        mov     rax, qword [rbp-18H]
        mov     rdx, rax
        mov     esi, L_013
        mov     rdi, rcx
        mov     eax, 0
        call    sprintf
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        leave
        ret


__string_length:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        mov     rax, qword [rax]
        pop     rbp
        ret


__string_substring:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     dword [rbp-1CH], esi
        mov     dword [rbp-20H], edx
        mov     eax, dword [rbp-1CH]
        mov     edx, dword [rbp-20H]
        sub     edx, eax
        mov     eax, edx
        add     eax, 1
        mov     dword [rbp-0CH], eax
        mov     eax, dword [rbp-0CH]
        add     eax, 9
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     dword [rbp-10H], 0
        jmp     L_002

L_001:  mov     eax, dword [rbp-10H]
        add     eax, 8
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-1CH]
        lea     ecx, [rax+8H]
        mov     eax, dword [rbp-10H]
        add     eax, ecx
        movsxd  rcx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-10H], 1
L_002:  mov     eax, dword [rbp-10H]
        cmp     eax, dword [rbp-0CH]
        jl      L_001
        mov     eax, dword [rbp-0CH]
        add     eax, 8
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-8H]
        leave
        ret


__string_parseInt:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-8H], 0
        mov     dword [rbp-0CH], 0
        add     qword [rbp-18H], 8
        mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        cmp     al, 45
        jnz     L_003
        mov     dword [rbp-0CH], 1
        add     qword [rbp-18H], 1
        jmp     L_005

L_003:  jmp     L_005

L_004:  mov     rdx, qword [rbp-8H]
        mov     rax, rdx
        shl     rax, 2
        add     rax, rdx
        add     rax, rax
        mov     rdx, rax
        mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        movsx   eax, al
        sub     eax, 48
        cdqe
        add     rax, rdx
        mov     qword [rbp-8H], rax
        add     qword [rbp-18H], 1
L_005:  mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        test    al, al
        jnz     L_004
        cmp     dword [rbp-0CH], 0
        jz      L_006
        mov     rax, qword [rbp-8H]
        neg     rax
        jmp     L_007

L_006:  mov     rax, qword [rbp-8H]
L_007:  pop     rbp
        ret


__string_ord:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        add     rax, 8
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movsx   rax, al
        pop     rbp
        ret


__stringConcate:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     rax, qword [rbp-28H]
        mov     rax, qword [rax]
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-30H]
        mov     rax, qword [rax]
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-18H]
        add     rax, rdx
        add     rax, 9
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-18H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     dword [rbp-1CH], 0
        jmp     L_009

L_008:  mov     eax, dword [rbp-1CH]
        add     eax, 8
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-1CH]
        add     eax, 8
        movsxd  rcx, eax
        mov     rax, qword [rbp-28H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-1CH], 1
L_009:  mov     eax, dword [rbp-1CH]
        cdqe
        cmp     rax, qword [rbp-18H]
        jl      L_008
        mov     dword [rbp-1CH], 0
        jmp     L_011

L_010:  mov     rax, qword [rbp-18H]
        lea     rdx, [rax+8H]
        mov     eax, dword [rbp-1CH]
        cdqe
        add     rax, rdx
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-1CH]
        add     eax, 8
        movsxd  rcx, eax
        mov     rax, qword [rbp-30H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-1CH], 1
L_011:  mov     eax, dword [rbp-1CH]
        cdqe
        cmp     rax, qword [rbp-10H]
        jl      L_010
        mov     rax, qword [rbp-18H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-10H]
        add     rax, rdx
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-8H]
        leave
        ret


__stringCompare:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        cdqe
        leave
        ret



SECTION .data   


SECTION .bss    align=32

__buffer.2866:
        resb    1048576


SECTION .rodata 

L_012:
        db 25H, 73H, 00H

L_013:
        db 25H, 6CH, 64H, 00H


;=====================================================================
	 section .text
_main:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 144
	mov rcx, qword [g_0]
	mov rax, rcx
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 40]
	mov rcx, qword [rax]
	mov qword [rbp - 8], rcx
	mov rax, qword [rbp - 112]
	mov rcx, qword [rbp - 8]
	lea rax, [rcx * 8 + 8]
	mov qword [rbp - 112], rax
	mov rdi, qword [rbp - 112]
	call malloc
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 72]
	mov rcx, qword [rbp - 8]
	mov qword [rax], rcx
	jmp b1
	b1:
	mov rax, qword [rbp - 8]
	cmp rax, 0
	jg b2
	jmp b3
	b2:
	mov rax, qword [rbp - 72]
	mov rcx, qword [rbp - 8]
	mov qword [rax + rcx * 8], 0
	mov rax, qword [rbp - 8]
	dec rax
	mov qword [rbp - 8], rax
	jmp b1
	b3:
	mov rax, qword [rbp - 72]
	mov rcx, rax
	mov qword [rbp - 136], rcx
	mov rax, 0
	mov qword [rbp - 96], rax
	jmp b4
	b5:
	mov rax, qword [rbp - 96]
	mov rcx, qword [g_0]
	mov qword [rcx + rax * 8 + 8], 0
	call __getInt
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 96]
	mov rcx, qword [rbp - 136]
	mov rdx, qword [rbp - 64]
	mov qword [rcx + rax * 8 + 8], rdx
	jmp b6
	b7:
	mov rax, 0
	mov qword [rbp - 96], rax
	jmp b8
	b4:
	mov rax, qword [g_0]
	mov rcx, rax
	mov qword [rbp - 128], rcx
	mov rax, qword [rbp - 96]
	mov rcx, qword [rbp - 128]
	cmp rax, qword [rcx]
	jl b5
	jmp b7
	b6:
	mov rcx, qword [rbp - 96]
	mov rax, rcx
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 96]
	inc rax
	mov qword [rbp - 96], rax
	jmp b4
	b9:
	mov rax, qword [rbp - 96]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 24], rdx
	mov rdi, qword [rbp - 24]
	call __toString
	mov qword [rbp - 32], rax
	mov rdi, qword [rbp - 32]
	call __print
	jmp b10
	b11:
	mov rdi, g_1
	call __println
	mov rcx, qword [rbp - 136]
	mov rax, rcx
	mov qword [g_0], rax
	mov rax, 0
	mov qword [rbp - 96], rax
	jmp b12
	b8:
	mov rcx, qword [g_0]
	mov rax, rcx
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 120]
	mov rcx, qword [rbp - 96]
	cmp rcx, qword [rax]
	jl b9
	jmp b11
	b10:
	mov rax, qword [rbp - 96]
	mov rcx, rax
	mov qword [rbp - 16], rcx
	mov rax, qword [rbp - 96]
	inc rax
	mov qword [rbp - 96], rax
	jmp b8
	b13:
	mov rax, qword [rbp - 96]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 56], rdx
	mov rdi, qword [rbp - 56]
	call __toString
	mov qword [rbp - 80], rax
	mov rdi, qword [rbp - 80]
	call __print
	jmp b14
	b12:
	mov rax, qword [g_0]
	mov rcx, rax
	mov qword [rbp - 88], rcx
	mov rax, qword [rbp - 96]
	mov rcx, qword [rbp - 88]
	cmp rax, qword [rcx]
	jl b13
	jmp b15
	b14:
	mov rax, qword [rbp - 96]
	mov rcx, rax
	mov qword [rbp - 104], rcx
	mov rax, qword [rbp - 96]
	inc rax
	mov qword [rbp - 96], rax
	jmp b12
	b15:
	mov rax, 0
	leave
	ret 
__init:
	b16:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, 4
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [rbp - 24]
	lea rcx, [rax * 8 + 8]
	mov qword [rbp - 24], rcx
	mov rdi, qword [rbp - 24]
	call malloc
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 32]
	mov qword [rax], rcx
	jmp b17
	b17:
	mov rax, qword [rbp - 32]
	cmp rax, 0
	jg b18
	jmp b19
	b18:
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 32]
	mov qword [rax + rcx * 8], 0
	mov rax, qword [rbp - 32]
	dec rax
	mov qword [rbp - 32], rax
	jmp b17
	b19:
	mov rax, qword [rbp - 16]
	mov qword [g_0], rax
	call _main
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 8]
	leave
	ret 
	section .data
g_0:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_1:
	dq 0
	db 00H
