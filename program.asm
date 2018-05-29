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
_origin:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	mov qword [rbp - 8], rdi
	mov rcx, qword [rbp - 8]
	mov rax, rcx
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 72]
	mov rcx, qword [rbp - 48]
	lea rcx, [rax * 8 + 8]
	mov qword [rbp - 48], rcx
	mov rdi, qword [rbp - 48]
	call malloc
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 72]
	mov qword [rax], rcx
	jmp b1
	b1:
	mov rax, qword [rbp - 72]
	cmp rax, 0
	jg b2
	jmp b3
	b2:
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 72]
	mov qword [rax + rcx * 8], 0
	mov rax, qword [rbp - 72]
	dec rax
	mov qword [rbp - 72], rax
	jmp b1
	b3:
	mov rax, qword [rbp - 16]
	mov rcx, rax
	mov qword [g_0], rcx
	mov rax, 0
	mov qword [g_1], rax
	jmp b4
	b5:
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 24], rcx
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 80]
	lea rcx, [rax * 8 + 8]
	mov qword [rbp - 80], rcx
	mov rdi, qword [rbp - 80]
	call malloc
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 64]
	mov rcx, qword [rbp - 24]
	mov qword [rax], rcx
	jmp b6
	b4:
	mov rax, qword [g_1]
	mov rcx, qword [rbp - 8]
	cmp rax, rcx
	jl b5
	jmp b7
	b8:
	mov rax, qword [g_1]
	mov rcx, rax
	mov qword [rbp - 56], rcx
	mov rax, qword [g_1]
	inc rax
	mov qword [g_1], rax
	jmp b4
	b6:
	mov rax, qword [rbp - 24]
	cmp rax, 0
	jg b9
	jmp b10
	b9:
	mov rax, qword [rbp - 64]
	mov rcx, qword [rbp - 24]
	mov qword [rax + rcx * 8], 0
	mov rax, qword [rbp - 24]
	dec rax
	mov qword [rbp - 24], rax
	jmp b6
	b10:
	mov rax, qword [rbp - 64]
	mov rcx, qword [g_1]
	mov rdx, qword [g_0]
	mov qword [rdx + rcx * 8 + 8], rax
	mov rax, 0
	mov qword [g_2], rax
	jmp b11
	b12:
	mov rax, qword [g_1]
	mov rdx, qword [g_0]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 32], rcx
	mov rax, qword [g_2]
	mov rcx, qword [rbp - 32]
	mov qword [rcx + rax * 8 + 8], 0
	jmp b13
	b14:
	jmp b8
	b11:
	mov rax, qword [g_2]
	mov rcx, qword [rbp - 8]
	cmp rax, rcx
	jl b12
	jmp b14
	b13:
	mov rax, qword [g_2]
	mov rcx, rax
	mov qword [rbp - 40], rcx
	mov rax, qword [g_2]
	inc rax
	mov qword [g_2], rax
	jmp b11
	b7:
	leave
	ret 
_search:
	b15:
	push rbp
	mov rbp, rsp
	sub rsp, 736
	mov qword [rbp - 8], rdi
	mov qword [rbp - 16], rsi
	mov qword [rbp - 24], rdx
	mov rax, qword [rbp - 16]
	cmp rax, 0
	jg b16
	jmp b17
	b16:
	mov rax, qword [rbp - 8]
	cmp rax, 2
	je b18
	jmp b19
	b20:
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 552], rcx
	mov rax, qword [rbp - 552]
	sub rax, 1
	mov qword [rbp - 552], rax
	mov rcx, qword [rbp - 552]
	mov rdx, qword [g_0]
	mov rax, qword [rdx + rcx * 8 + 8]
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 632], rcx
	mov rax, qword [rbp - 632]
	sub rax, 1
	mov qword [rbp - 632], rax
	mov rax, qword [g_0]
	mov rdx, qword [rbp - 632]
	mov rcx, qword [rax + rdx * 8 + 8]
	mov qword [rbp - 672], rcx
	mov rax, qword [rbp - 384]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 600], rcx
	mov rax, qword [rbp - 600]
	mov rcx, qword [rbp - 672]
	add rax, qword [rcx + 16]
	mov qword [rbp - 600], rax
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 456], rcx
	mov rax, qword [rbp - 456]
	sub rax, 1
	mov qword [rbp - 456], rax
	mov rcx, qword [g_0]
	mov rdx, qword [rbp - 456]
	mov rax, qword [rcx + rdx * 8 + 8]
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 600]
	mov rcx, rax
	mov qword [rbp - 352], rcx
	mov rax, qword [rbp - 184]
	mov rcx, qword [rbp - 352]
	add rcx, qword [rax + 24]
	mov qword [rbp - 352], rcx
	mov rax, qword [rbp - 352]
	cmp rax, 15
	je b16
	jmp b21
	b22:
	mov rax, qword [rbp - 8]
	cmp rax, 0
	je b16
	jmp b20
	b17:
	mov rax, qword [rbp - 16]
	cmp rax, 0
	jl b16
	jmp b22
	b23:
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 24]
	mov qword [rbp - 424], rax
	mov rax, 45
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 80]
	sub rcx, rax
	mov qword [rbp - 80], rcx
	mov rax, qword [rbp - 424]
	mov rcx, qword [rbp - 80]
	mov qword [rax + 24], rcx
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 256], rax
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 528], rax
	mov rcx, qword [rbp - 256]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 272]
	mov rcx, qword [rbp - 528]
	add rax, qword [rcx + 16]
	mov qword [rbp - 272], rax
	mov rax, qword [g_0]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 64], rcx
	mov rax, qword [rbp - 272]
	mov rcx, rax
	mov qword [rbp - 152], rcx
	mov rax, qword [rbp - 152]
	mov rcx, qword [rbp - 64]
	add rax, qword [rcx + 24]
	mov qword [rbp - 152], rax
	mov rcx, qword [rbp - 152]
	mov rax, rcx
	mov qword [rbp - 264], rax
	mov rax, qword [g_0]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 232], rcx
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 16]
	mov qword [rbp - 216], rax
	mov rcx, qword [rbp - 232]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 224]
	mov rcx, qword [rbp - 216]
	add rax, qword [rcx + 16]
	mov qword [rbp - 224], rax
	mov rax, qword [g_0]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 584], rcx
	mov rax, qword [rbp - 224]
	mov rcx, rax
	mov qword [rbp - 88], rcx
	mov rax, qword [rbp - 88]
	mov rcx, qword [rbp - 584]
	add rax, qword [rcx + 24]
	mov qword [rbp - 88], rax
	mov rax, qword [rbp - 264]
	mov rcx, qword [rbp - 88]
	cmp rcx, rax
	je b24
	jmp b25
	b26:
	jmp b21
	b19:
	mov rax, qword [rbp - 16]
	cmp rax, 2
	je b27
	jmp b28
	b18:
	mov rax, qword [rbp - 16]
	cmp rax, 2
	je b23
	jmp b19
	b29:
	mov rcx, qword [g_3]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 664], rax
	mov rax, qword [rbp - 664]
	add rax, 1
	mov qword [rbp - 664], rax
	mov rax, qword [rbp - 664]
	mov rcx, qword [g_3]
	mov qword [rcx + 8], rax
	mov rax, 0
	mov qword [rbp - 520], rax
	jmp b30
	b25:
	jmp b26
	b31:
	mov rax, qword [g_0]
	mov rcx, qword [rax + 24]
	mov qword [rbp - 432], rcx
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 16]
	mov qword [rbp - 48], rax
	mov rcx, qword [rbp - 432]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 120]
	mov rcx, qword [rbp - 48]
	add rax, qword [rcx + 16]
	mov qword [rbp - 120], rax
	mov rax, qword [g_0]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 392], rcx
	mov rcx, qword [rbp - 120]
	mov rax, rcx
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 360]
	mov rcx, qword [rbp - 392]
	add rax, qword [rcx + 24]
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 360]
	mov rcx, qword [rbp - 264]
	cmp rax, rcx
	je b29
	jmp b25
	b32:
	mov rax, qword [g_0]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 296], rcx
	mov rax, qword [g_0]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 688], rcx
	mov rcx, qword [rbp - 296]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 192], rax
	mov rax, qword [rbp - 192]
	mov rcx, qword [rbp - 688]
	add rax, qword [rcx + 16]
	mov qword [rbp - 192], rax
	mov rax, qword [g_0]
	mov rcx, qword [rax + 24]
	mov qword [rbp - 712], rcx
	mov rax, qword [rbp - 192]
	mov rcx, rax
	mov qword [rbp - 696], rcx
	mov rax, qword [rbp - 696]
	mov rcx, qword [rbp - 712]
	add rax, qword [rcx + 24]
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 264]
	mov rcx, qword [rbp - 696]
	cmp rcx, rax
	je b31
	jmp b25
	b33:
	mov rax, qword [g_0]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 720], rcx
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 16]
	mov qword [rbp - 568], rax
	mov rcx, qword [rbp - 720]
	mov rax, qword [rcx + 24]
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 568]
	mov rcx, qword [rbp - 168]
	add rcx, qword [rax + 24]
	mov qword [rbp - 168], rcx
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 24]
	mov qword [rbp - 592], rax
	mov rax, qword [rbp - 168]
	mov rcx, rax
	mov qword [rbp - 648], rcx
	mov rax, qword [rbp - 592]
	mov rcx, qword [rbp - 648]
	add rcx, qword [rax + 24]
	mov qword [rbp - 648], rcx
	mov rax, qword [rbp - 264]
	mov rcx, qword [rbp - 648]
	cmp rcx, rax
	je b32
	jmp b25
	b34:
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 32], rax
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 16]
	mov qword [rbp - 464], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 240], rcx
	mov rax, qword [rbp - 240]
	mov rcx, qword [rbp - 464]
	add rax, qword [rcx + 16]
	mov qword [rbp - 240], rax
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 24]
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 240]
	mov rcx, rax
	mov qword [rbp - 376], rcx
	mov rax, qword [rbp - 376]
	mov rcx, qword [rbp - 112]
	add rax, qword [rcx + 16]
	mov qword [rbp - 376], rax
	mov rax, qword [rbp - 264]
	mov rcx, qword [rbp - 376]
	cmp rcx, rax
	je b33
	jmp b25
	b35:
	mov rax, qword [g_0]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 280], rcx
	mov rax, qword [g_0]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 608], rcx
	mov rax, qword [rbp - 280]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 56], rcx
	mov rax, qword [rbp - 608]
	mov rcx, qword [rbp - 56]
	add rcx, qword [rax + 8]
	mov qword [rbp - 56], rcx
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 24]
	mov qword [rbp - 488], rax
	mov rcx, qword [rbp - 56]
	mov rax, rcx
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 488]
	mov rcx, qword [rbp - 400]
	add rcx, qword [rax + 8]
	mov qword [rbp - 400], rcx
	mov rax, qword [rbp - 264]
	mov rcx, qword [rbp - 400]
	cmp rcx, rax
	je b34
	jmp b25
	b24:
	mov rax, qword [g_0]
	mov rcx, qword [rax + 24]
	mov qword [rbp - 96], rcx
	mov rcx, qword [g_0]
	mov rax, qword [rcx + 24]
	mov qword [rbp - 656], rax
	mov rax, qword [rbp - 96]
	mov rcx, qword [rax + 8]
	mov qword [rbp - 312], rcx
	mov rax, qword [rbp - 656]
	mov rcx, qword [rbp - 312]
	add rcx, qword [rax + 16]
	mov qword [rbp - 312], rcx
	mov rax, qword [g_0]
	mov rcx, qword [rax + 24]
	mov qword [rbp - 144], rcx
	mov rcx, qword [rbp - 312]
	mov rax, rcx
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 72]
	mov rcx, qword [rbp - 144]
	add rax, qword [rcx + 24]
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 264]
	mov rcx, qword [rbp - 72]
	cmp rcx, rax
	je b35
	jmp b25
	b36:
	mov rax, 0
	mov qword [rbp - 176], rax
	jmp b37
	b38:
	mov rdi, g_4
	call __print
	jmp b25
	b30:
	mov rax, qword [rbp - 520]
	cmp rax, 2
	jle b36
	jmp b38
	b39:
	mov rcx, qword [rbp - 520]
	mov rax, rcx
	mov qword [rbp - 560], rax
	mov rax, qword [rbp - 520]
	inc rax
	mov qword [rbp - 520], rax
	jmp b30
	b40:
	mov rcx, qword [g_0]
	mov rdx, qword [rbp - 520]
	mov rax, qword [rcx + rdx * 8 + 8]
	mov qword [rbp - 616], rax
	mov rax, qword [rbp - 176]
	mov rcx, qword [rbp - 616]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 304], rdx
	mov rdi, qword [rbp - 304]
	call __toString
	mov qword [rbp - 728], rax
	mov rdi, qword [rbp - 728]
	call __print
	mov rdi, g_5
	call __print
	jmp b41
	b42:
	mov rdi, g_6
	call __print
	jmp b39
	b37:
	mov rax, qword [rbp - 176]
	cmp rax, 2
	jle b40
	jmp b42
	b41:
	mov rax, qword [rbp - 176]
	mov rcx, rax
	mov qword [rbp - 288], rcx
	mov rax, qword [rbp - 176]
	inc rax
	mov qword [rbp - 176], rax
	jmp b37
	b27:
	mov rax, qword [rbp - 8]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 536], rdx
	mov rax, qword [rbp - 8]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 368], rdx
	mov rax, 15
	mov qword [rbp - 680], rax
	mov rax, qword [rbp - 680]
	mov rcx, qword [rbp - 368]
	sub rax, qword [rcx + 8]
	mov qword [rbp - 680], rax
	mov rax, qword [rbp - 8]
	mov rdx, qword [g_0]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 320], rcx
	mov rax, qword [rbp - 680]
	mov rcx, rax
	mov qword [rbp - 448], rcx
	mov rax, qword [rbp - 320]
	mov rcx, qword [rbp - 448]
	sub rcx, qword [rax + 16]
	mov qword [rbp - 448], rcx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 448]
	mov rdx, qword [rbp - 536]
	mov qword [rdx + rax * 8 + 8], rcx
	mov rax, qword [rbp - 8]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 504], rdx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 504]
	cmp qword [rcx + rax * 8 + 8], 0
	jg b43
	jmp b44
	b45:
	jmp b26
	b28:
	mov rax, 1
	mov qword [rbp - 520], rax
	jmp b46
	b47:
	mov rcx, qword [rbp - 8]
	mov rdx, qword [g_0]
	mov rax, qword [rdx + rcx * 8 + 8]
	mov qword [rbp - 344], rax
	mov rax, qword [rbp - 344]
	mov rdx, qword [rbp - 16]
	mov rcx, qword [rax + rdx * 8 + 8]
	mov qword [rbp - 544], rcx
	mov rax, qword [g_7]
	mov rcx, qword [rbp - 544]
	mov qword [rax + rcx * 8 + 8], 1
	mov rax, qword [rbp - 16]
	cmp rax, 2
	je b48
	jmp b49
	b44:
	jmp b45
	b50:
	mov rax, qword [rbp - 8]
	mov rdx, qword [g_0]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 160], rcx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 160]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 136], rdx
	mov rax, qword [g_7]
	mov rcx, qword [rbp - 136]
	cmp qword [rax + rcx * 8 + 8], 0
	je b47
	jmp b44
	b43:
	mov rax, qword [rbp - 8]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 128], rdx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 128]
	cmp qword [rcx + rax * 8 + 8], 10
	jl b50
	jmp b44
	b48:
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 496], rcx
	mov rax, qword [rbp - 496]
	add rax, 1
	mov qword [rbp - 496], rax
	mov rax, qword [rbp - 8]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 704], rdx
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov qword [rbp - 440], rcx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 440]
	mov rdx, qword [rbp - 704]
	add rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 440], rcx
	mov rdi, qword [rbp - 496]
	mov rsi, 0
	mov rdx, qword [rbp - 440]
	call _search
	mov qword [rbp - 336], rax
	jmp b51
	b51:
	mov rax, qword [rbp - 8]
	mov rdx, qword [g_0]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 40], rcx
	mov rax, qword [rbp - 40]
	mov rcx, qword [rbp - 16]
	mov rdx, qword [rax + rcx * 8 + 8]
	mov qword [rbp - 104], rdx
	mov rax, qword [g_7]
	mov rcx, qword [rbp - 104]
	mov qword [rax + rcx * 8 + 8], 0
	jmp b44
	b49:
	mov rax, qword [rbp - 16]
	mov rcx, rax
	mov qword [rbp - 200], rcx
	mov rax, qword [rbp - 200]
	add rax, 1
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 8]
	mov rcx, qword [g_0]
	mov rdx, qword [rcx + rax * 8 + 8]
	mov qword [rbp - 328], rdx
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov qword [rbp - 624], rcx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 624]
	mov rdx, qword [rbp - 328]
	add rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 624], rcx
	mov rdi, qword [rbp - 8]
	mov rsi, qword [rbp - 200]
	mov rdx, qword [rbp - 624]
	call _search
	mov qword [rbp - 736], rax
	jmp b51
	b52:
	mov rax, qword [g_7]
	mov rcx, qword [rbp - 520]
	cmp qword [rax + rcx * 8 + 8], 0
	je b53
	jmp b54
	b55:
	jmp b45
	b46:
	mov rax, qword [rbp - 520]
	cmp rax, 9
	jle b52
	jmp b55
	b56:
	mov rcx, qword [rbp - 520]
	mov rax, rcx
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 520]
	inc rax
	mov qword [rbp - 520], rax
	jmp b46
	b53:
	mov rax, qword [g_7]
	mov rcx, qword [rbp - 520]
	mov qword [rax + rcx * 8 + 8], 1
	mov rax, qword [rbp - 8]
	mov rdx, qword [g_0]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 248], rcx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 248]
	mov rdx, qword [rbp - 520]
	mov qword [rcx + rax * 8 + 8], rdx
	mov rax, qword [rbp - 16]
	cmp rax, 2
	je b57
	jmp b58
	b54:
	jmp b56
	b57:
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 576], rcx
	mov rax, qword [rbp - 576]
	add rax, 1
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov qword [rbp - 512], rcx
	mov rax, qword [rbp - 512]
	mov rcx, qword [rbp - 520]
	add rax, rcx
	mov qword [rbp - 512], rax
	mov rdi, qword [rbp - 576]
	mov rsi, 0
	mov rdx, qword [rbp - 512]
	call _search
	mov qword [rbp - 408], rax
	jmp b59
	b59:
	mov rcx, qword [rbp - 8]
	mov rdx, qword [g_0]
	mov rax, qword [rdx + rcx * 8 + 8]
	mov qword [rbp - 480], rax
	mov rax, qword [rbp - 480]
	mov rcx, qword [rbp - 16]
	mov qword [rax + rcx * 8 + 8], 0
	mov rax, qword [g_7]
	mov rcx, qword [rbp - 520]
	mov qword [rax + rcx * 8 + 8], 0
	jmp b54
	b58:
	mov rax, qword [rbp - 16]
	mov rcx, rax
	mov qword [rbp - 472], rcx
	mov rax, qword [rbp - 472]
	add rax, 1
	mov qword [rbp - 472], rax
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov qword [rbp - 416], rcx
	mov rax, qword [rbp - 520]
	mov rcx, qword [rbp - 416]
	add rcx, rax
	mov qword [rbp - 416], rcx
	mov rdi, qword [rbp - 8]
	mov rsi, qword [rbp - 472]
	mov rdx, qword [rbp - 416]
	call _search
	mov qword [rbp - 640], rax
	jmp b59
	b21:
	mov rax, 0
	leave
	ret 
_main:
	b60:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rdi, 3
	call _origin
	mov rdi, 0
	mov rsi, 0
	mov rdx, 0
	call _search
	mov qword [rbp - 24], rax
	mov rcx, qword [g_3]
	mov rax, qword [rcx + 8]
	mov qword [rbp - 8], rax
	mov rdi, qword [rbp - 8]
	call __toString
	mov qword [rbp - 16], rax
	mov rdi, qword [rbp - 16]
	call __println
	mov rax, 0
	leave
	ret 
__init:
	b61:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov rax, 10
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 32]
	lea rcx, [rax * 8 + 8]
	mov qword [rbp - 32], rcx
	mov rdi, qword [rbp - 32]
	call malloc
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 8]
	mov qword [rax], rcx
	jmp b62
	b62:
	mov rax, qword [rbp - 8]
	cmp rax, 0
	jg b63
	jmp b64
	b63:
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 8]
	mov qword [rax + rcx * 8], 0
	mov rax, qword [rbp - 8]
	dec rax
	mov qword [rbp - 8], rax
	jmp b62
	b64:
	mov rax, qword [rbp - 16]
	mov qword [g_7], rax
	mov rax, 1
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 48]
	mov rcx, qword [rbp - 24]
	lea rcx, [rax * 8 + 8]
	mov qword [rbp - 24], rcx
	mov rdi, qword [rbp - 24]
	call malloc
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 48]
	mov rcx, qword [rbp - 40]
	mov qword [rcx], rax
	jmp b65
	b65:
	mov rax, qword [rbp - 48]
	cmp rax, 0
	jg b66
	jmp b67
	b66:
	mov rax, qword [rbp - 48]
	mov rcx, qword [rbp - 40]
	mov qword [rcx + rax * 8], 0
	mov rax, qword [rbp - 48]
	dec rax
	mov qword [rbp - 48], rax
	jmp b65
	b67:
	mov rax, qword [rbp - 40]
	mov qword [g_3], rax
	call _main
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 56]
	leave
	ret 
	section .data
g_0:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_7:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_3:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_1:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_2:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_5:
	dq 1
	db 20H, 00H
g_6:
	dq 1
	db 0AH, 00H
g_4:
	dq 1
	db 0AH, 00H
