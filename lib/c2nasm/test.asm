default rel

global string_length
global string_ord
global string_substring
global string_parseInt
global main
global exchange
global makeHeap
global adjustHeap
global heapSort
global print
global toString
global addString__
global println
global getInt
global getString

global _global_n
global _global_a

extern malloc
extern printf
extern puts
extern puts
extern getchar
extern putchar
extern sprintf
extern __stack_chk_fail
extern malloc
extern printf
extern strlen
extern memcpy
extern scanf
SECTION .text

toString:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rdx,rdi
	mov rax,0
	mov rdi,stringbuffer
	mov rsi,format1
	call sprintf
	mov rdi,stringbuffer
	call transtring
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

println:
	push	r8
	push	r9
	push	r10
	push	r11
	call puts
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	ret

addString__:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	push rsi
	mov rsi,rdi
	mov rdi,stringbuffer
	mov rdx,[rsi-8]
	push rdx
	call memcpy
	pop rdi
	pop rsi
	add rdi,stringbuffer
	mov rdx,[rsi-8]
	add rdx,1
	call memcpy
	mov rdi,stringbuffer
	call transtring
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

getInt:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rax,0
	mov rdi,format1
	mov rsi,intbuffer
	call scanf
	mov rax,[intbuffer]
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

string_length:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-4H], 0
	jmp     Llen_002
Llen_001:  add     dword [rbp-4H], 1
Llen_002:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Llen_001
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret

string_ord:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-1CH], esi
	mov     eax, dword [rbp-1CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	mov     dword [rbp-4H], eax
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret

print:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rax,0
	mov rsi,rdi
	mov rdi,format2
	call printf
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

transtring:

	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	call strlen
	push rdi
	mov rdi,rax
	push rdi
	add rdi,9
	call malloc
	pop rdi
	mov [rax],rdi
	add rax,8
	mov rdx,rdi
	add rdx,1
	mov rdi,rax
	pop rsi
	sub rsp,8
	push rax
	call memcpy
	pop rax
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

getString:

	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rax,0
	mov rdi,format2
	mov rsi,stringbuffer
	call scanf
	mov rdi,stringbuffer
	call transtring
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

string_substring:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	push rdi
	push rsi
	mov rdi,rdx
	sub rdi,rsi
	add rdi,1
	push rdi
	add rdi,9
	call malloc
	pop rdx
	mov [rax],rdx
	add rax,8
	pop rsi
	pop rdi
	add rsi,rdi
	mov rdi,rax
	push rdx
	push rax
	call memcpy
	pop rax
	pop rdx
	mov qword[rax+rdx],0
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

string_parseInt:
	push    rbp
	mov     rbp, rsp
	push	r8
	push	r9
	push	r10
	push	r11
	sub     rsp, 32
	mov     qword [rbp-18H], rdi
	mov     edi, 256
	call    malloc
	mov     qword [rbp-8H], rax
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lpar_002
Lpar_001:  add     dword [rbp-10H], 1
Lpar_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lpar_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lpar_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lpar_001
	jmp     Lpar_004
Lpar_003:  mov     edx, dword [rbp-0CH]
	mov     eax, edx
	shl     eax, 2
	add     eax, edx
	add     eax, eax
	mov     ecx, eax
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	add     eax, ecx
	sub     eax, 48
	mov     dword [rbp-0CH], eax
	add     dword [rbp-10H], 1
Lpar_004:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 47
	jle     Lpar_005
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jle     Lpar_003
Lpar_005:  mov     eax, dword [rbp-0CH]
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	leave
	ret

string_eq:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-0CH], 0
	mov     dword [rbp-8H], 0
	jmp     Leq_002
Leq_001:  add     dword [rbp-0CH], 1
Leq_002:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_004
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_001
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_001
	jmp     Leq_004
Leq_003:  add     dword [rbp-8H], 1
Leq_004:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_005
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_003
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_003
Leq_005:  mov     eax, dword [rbp-0CH]
	cmp     eax, dword [rbp-8H]
	jz      Leq_006
	mov     eax, 0
	jmp     Leq_010
Leq_006:  mov     dword [rbp-4H], 0
	mov     dword [rbp-4H], 0
	jmp     Leq_009
Leq_007:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-4H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jz      Leq_008
	mov     eax, 0
	jmp     Leq_010
Leq_008:  add     dword [rbp-4H], 1
Leq_009:  mov     eax, dword [rbp-4H]
	cmp     eax, dword [rbp-0CH]
	jl      Leq_007
	mov     eax, 1
Leq_010:  pop     rbp
	ret

string_s:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Ll_012
Ll_011:  add     dword [rbp-10H], 1
Ll_012:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_014
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_011
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_011
	jmp     Ll_014
Ll_013:  add     dword [rbp-0CH], 1
Ll_014:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_015
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_013
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_013
Ll_015:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Ll_019
Ll_016:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Ll_017
	mov     eax, 1
	jmp     Ll_021
Ll_017:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Ll_018
	mov     eax, 0
	jmp     Ll_021
Ll_018:  add     dword [rbp-8H], 1
Ll_019:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Ll_016
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jl      Ll_020
	mov     eax, 0
	jmp     Ll_021
Ll_020:  mov     eax, 1
Ll_021:  pop     rbp
	ret

string_g:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lg_023
Lg_022:  add     dword [rbp-10H], 1
Lg_023:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_025
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_022
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_022
	jmp     Lg_025
Lg_024:  add     dword [rbp-0CH], 1
Lg_025:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_026
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_024
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_024
Lg_026:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Lg_030
Lg_027:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Lg_028
	mov     eax, 1
	jmp     Lg_032
Lg_028:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Lg_029
	mov     eax, 0
	jmp     Lg_032
Lg_029:  add     dword [rbp-8H], 1
Lg_030:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Lg_027
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jg      Lg_031
	mov     eax, 0
	jmp     Lg_032
Lg_031:  mov     eax, 1
Lg_032:  pop     rbp
	ret

string_le:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_002
Llege_001:  add     dword [rbp-10H], 1
Llege_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_001
	jmp     Llege_004
Llege_003:  add     dword [rbp-0CH], 1
Llege_004:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_005
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_003
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_003
Llege_005:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_009
Llege_006:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Llege_007
	mov     eax, 1
	jmp     Llege_011
Llege_007:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Llege_008
	mov     eax, 0
	jmp     Llege_011
Llege_008:  add     dword [rbp-8H], 1
Llege_009:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_006
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jle     Llege_010
	mov     eax, 0
	jmp     Llege_011
	Llege_010:  mov     eax, 1
	Llege_011:  pop     rbp
	ret

string_ge:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_013
Llege_012:  add     dword [rbp-10H], 1
Llege_013:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_015
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_012
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_012
	jmp     Llege_015
Llege_014:  add     dword [rbp-0CH], 1
Llege_015:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_016
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_014
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_014
Llege_016:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_020
Llege_017:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Llege_018
	mov     eax, 1
	jmp     Llege_022
Llege_018:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Llege_019
	mov     eax, 0
	jmp     Llege_022
Llege_019:  add     dword [rbp-8H], 1
Llege_020:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_017
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jge     Llege_021
	mov     eax, 0
	jmp     Llege_022
Llege_021:  mov     eax, 1
Llege_022:  pop     rbp
	ret

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 16
		push		r11
		push		r10
		push		r14
		push		r12
		push		r15
		push		r8
		push		r13
		push		r9
		call	getString
		mov		r11, rax
		mov		rdi, r11
		call	string_parseInt
		mov		r11, rax
		mov		qword [rel _global_n], r11
		mov		rdi, r11
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r11, rax
		mov		rdi, r11
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r8
loop_cond_0:
		mov		rsi, qword [rel _global_n]
		cmp		r8, rsi
		jl		loop_body_0
loop_end_0:
		mov		qword [rel _global_a], r11
		mov		r11, 0
		jmp		loop_cond_1
loop_body_1:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r11
		mov		qword [rbx+rcx*8+8], r11
		mov		r9, r11
		add		r9, 1
		mov		r11, r9
loop_cond_1:
		mov		rbx, qword [rel _global_a]
		mov		rcx, -1
		mov		r13, qword [rbx+rcx*8+8]
		cmp		r11, r13
		jl		loop_body_1
		jge		loop_end_1
loop_end_1:
		call	makeHeap
		mov		r13, rax
		call	heapSort
		mov		r13, rax
		mov		r11, 0
		jmp		loop_cond_2
loop_body_2:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r11
		mov		rdi, qword [rbx+rcx*8+8]
		call	toString
		mov		r10, rax
		mov		rdi, r10
		mov		rsi, str_const_0
		call	addString__
		mov		r15, rax
		mov		rdi, r15
		call	print
		mov		r13, rax
		mov		r12, r11
		add		r12, 1
		mov		r11, r12
loop_cond_2:
		mov		rbx, qword [rel _global_a]
		mov		rcx, -1
		mov		r14, qword [rbx+rcx*8+8]
		cmp		r11, r14
		jl		loop_body_2
		jge		loop_end_2
loop_end_2:
		mov		rdi, str_const_1
		call	print
		mov		r15, rax
		mov		rax, 0
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

exchange:
exchange_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 16
		push		r14
		push		r12
		push		r15
		push		r13
		mov		r12, rdi
		mov		r15, rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r15
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_a]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r13
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

makeHeap:
makeHeap_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 56
		push		r11
		push		r10
		push		r14
		push		r12
		push		r15
		push		r8
		push		r13
		push		r9
		mov		r14, qword [rel _global_n]
		sub		r14, 1
		mov		rax, r14
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		r14, rax
		mov		r13, 0
		mov		r13, 0
		jmp		loop_cond_3
loop_body_3:
		mov		r15, r14
		imul		r15, 2
		mov		r13, r15
		mov		r12, r14
		imul		r12, 2
		mov		qword [rbp-8], r12
		mov		rdi, qword [rbp-8]
		add		rdi, 1
		mov		qword [rbp-8], rdi
		mov		rsi, qword [rel _global_n]
		cmp		qword [rbp-8], rsi
		jl		short_mid_0
		jge		if_false_0
short_mid_0:
		mov		qword [rbp-16], r14
		mov		rdi, qword [rbp-16]
		imul		rdi, 2
		mov		qword [rbp-16], rdi
		mov		r8, qword [rbp-16]
		add		r8, 1
		mov		r9, r14
		imul		r9, 2
		mov		rbx, qword [rel _global_a]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r8
		mov		rsi, qword [rbp-24]
		cmp		qword [rbx+rcx*8+8], rsi
		jl		if_true_0
		jge		if_false_0
if_true_0:
		mov		r10, r14
		imul		r10, 2
		mov		r11, r10
		add		r11, 1
		mov		r13, r11
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-32], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r14
		mov		rsi, qword [rbp-32]
		cmp		qword [rbx+rcx*8+8], rsi
		jg		if_true_1
		jle		if_false_1
if_true_1:
		mov		rdi, r14
		mov		rsi, r13
		call	exchange
		mov		r13, rax
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		mov		qword [rbp-40], r14
		mov		rdi, qword [rbp-40]
		sub		rdi, 1
		mov		qword [rbp-40], rdi
		mov		r14, qword [rbp-40]
loop_cond_3:
		cmp		r14, 0
		jge		loop_body_3
		jl		loop_end_3
loop_end_3:
		mov		rax, 0
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

adjustHeap:
adjustHeap_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 88
		push		r11
		push		r10
		push		r14
		push		r12
		push		r15
		push		r8
		push		r13
		push		r9
		mov		r10, rdi
		mov		qword [rbp-8], 0
		mov		qword [rbp-16], 0
		mov		qword [rbp-24], 0
		jmp		loop_cond_4
loop_body_4:
		mov		r13, qword [rbp-8]
		imul		r13, 2
		mov		qword [rbp-16], r13
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-32], rsi
		mov		rdi, qword [rbp-32]
		imul		rdi, 2
		mov		qword [rbp-32], rdi
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-40], rsi
		mov		rdi, qword [rbp-40]
		add		rdi, 1
		mov		qword [rbp-40], rdi
		cmp		qword [rbp-40], r10
		jl		short_mid_1
		jge		if_false_2
short_mid_1:
		mov		r15, qword [rbp-8]
		imul		r15, 2
		mov		qword [rbp-48], r15
		mov		rdi, qword [rbp-48]
		add		rdi, 1
		mov		qword [rbp-48], rdi
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-56], rsi
		mov		rdi, qword [rbp-56]
		imul		rdi, 2
		mov		qword [rbp-56], rdi
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-64], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-48]
		mov		rsi, qword [rbp-64]
		cmp		qword [rbx+rcx*8+8], rsi
		jl		if_true_2
		jge		if_false_2
if_true_2:
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-72], rsi
		mov		rdi, qword [rbp-72]
		imul		rdi, 2
		mov		qword [rbp-72], rdi
		mov		r14, qword [rbp-72]
		add		r14, 1
		mov		qword [rbp-16], r14
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		cmp		qword [rbx+rcx*8+8], r12
		jg		if_true_3
		jle		if_false_3
if_true_3:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r11
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], r9
		mov		rsi, qword [rbp-16]
		mov		qword [rbp-8], rsi
		jmp		if_end_3
if_false_3:
		jmp		loop_end_4
if_end_3:
		nop
loop_cond_4:
		mov		r8, qword [rbp-8]
		imul		r8, 2
		cmp		r8, r10
		jl		loop_body_4
		jge		loop_end_4
loop_end_4:
		mov		rax, 0
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

heapSort:
heapSort_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 32
		push		r11
		push		r10
		push		r14
		push		r12
		push		r15
		push		r8
		push		r13
		push		r9
		mov		qword [rbp-8], 0
		mov		r9, 0
		jmp		loop_cond_5
loop_body_5:
		mov		rbx, qword [rel _global_a]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-8], rsi
		mov		r12, qword [rel _global_n]
		sub		r12, r9
		mov		qword [rbp-16], r12
		mov		rdi, qword [rbp-16]
		sub		rdi, 1
		mov		qword [rbp-16], rdi
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], r13
		mov		r10, qword [rel _global_n]
		sub		r10, r9
		mov		r15, r10
		sub		r15, 1
		mov		rbx, qword [rel _global_a]
		mov		rcx, r15
		mov		rsi, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], rsi
		mov		r14, qword [rel _global_n]
		sub		r14, r9
		mov		r11, r14
		sub		r11, 1
		mov		rdi, r11
		call	adjustHeap
		mov		r8, rax
		mov		r8, r9
		add		r8, 1
		mov		r9, r8
loop_cond_5:
		mov		rsi, qword [rel _global_n]
		cmp		r9, rsi
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		rax, 0
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r9
		pop		r13
		pop		r8
		pop		r15
		pop		r12
		pop		r14
		pop		r10
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_n:
		dq 0
_global_a:
		dq 0
	dq	1
str_const_0:
	db	32, 0

	dq	1
str_const_1:
	db	10, 0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
