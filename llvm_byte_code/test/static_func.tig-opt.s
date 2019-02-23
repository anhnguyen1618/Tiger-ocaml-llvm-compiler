	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/static_func__code_begin"
"_camlLlvm_byte_code/test/static_func__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/static_func__data_begin"
"_camlLlvm_byte_code/test/static_func__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	$20, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	LBB0_3
	.p2align	4, 0x90
LBB0_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$9, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jbe	LBB0_2
LBB0_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp1:
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 16(%rsp)
	movl	$16, %edi
	callq	_malloc
Ltmp2:
	movl	$0, (%rax)
	leaq	L___unnamed_1(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	%rax, 24(%rsp)
	leaq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$3, %ecx
	movl	$4, %r8d
	callq	_f
Ltmp3:
	movq	24(%rsp), %rbx
	leaq	L___unnamed_2(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp4:
	movl	(%rbx), %edi
	callq	_tig_print_int
Ltmp5:
	movq	24(%rsp), %rbx
	leaq	L___unnamed_3(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp6:
	movq	8(%rbx), %rdi
	callq	_tig_print
Ltmp7:
	movq	24(%rsp), %rbx
	leaq	L___unnamed_4(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp8:
	movl	(%rbx), %edi
	movl	$28, %esi
	callq	_assert_equal_int
Ltmp9:
	movq	24(%rsp), %rbx
	leaq	L___unnamed_5(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp10:
	movq	8(%rbx), %rdi
	leaq	L___unnamed_6(%rip), %rsi
	callq	_assert_equal_string
Ltmp11:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_f                      ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
	.cfi_startproc
## %bb.0:                               ## %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, (%rsp)
	movl	%esi, 12(%rsp)
	movl	%ecx, 16(%rsp)
	movl	%r8d, 20(%rsp)
	movl	$7, 8(%rsp)
	movq	%rsp, %rdi
	movl	$4, %esi
	callq	_g
Ltmp12:
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_g                      ## -- Begin function g
	.p2align	4, 0x90
_g:                                     ## @g
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movq	%rdi, %rbx
	movl	12(%rdi), %edi
	callq	_tig_print_int
Ltmp13:
	movl	%ebp, %edi
	callq	_tig_print_int
Ltmp14:
	movl	16(%rbx), %edi
	callq	_tig_print_int
Ltmp15:
	movl	20(%rbx), %edi
	callq	_tig_print_int
Ltmp16:
	movq	(%rbx), %rax
	movq	16(%rax), %r14
	leaq	L___unnamed_7(%rip), %rsi
	movq	%r14, %rdi
	callq	_tig_check_null_pointer
Ltmp17:
	leaq	L___unnamed_6(%rip), %rax
	movq	%rax, 8(%r14)
	movq	(%rbx), %rax
	movq	16(%rax), %r14
	leaq	L___unnamed_8(%rip), %rsi
	movq	%r14, %rdi
	callq	_tig_check_null_pointer
Ltmp18:
	addl	12(%rbx), %ebp
	addl	16(%rbx), %ebp
	addl	20(%rbx), %ebp
	addl	8(%rbx), %ebp
	movq	(%rbx), %rax
	movq	8(%rax), %rbx
	leaq	L___unnamed_9(%rip), %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp19:
	movq	8(%rbx), %rax
	addl	16(%rax), %ebp
	movl	%ebp, (%r14)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:                          ## @0
	.asciz	"hello world"

	.p2align	4               ## @1
L___unnamed_7:
	.asciz	"test/static_func.tig::15.8: Nil pointer exception!"

	.p2align	4               ## @2
L___unnamed_8:
	.asciz	"test/static_func.tig::16.8: Nil pointer exception!"

	.p2align	4               ## @3
L___unnamed_9:
	.asciz	"test/static_func.tig::16.43: Array out of bound"

	.p2align	4               ## @4
L___unnamed_2:
	.asciz	"test/static_func.tig::23.13: Nil pointer exception!"

	.p2align	4               ## @5
L___unnamed_3:
	.asciz	"test/static_func.tig::24.10: Nil pointer exception!"

	.p2align	4               ## @6
L___unnamed_4:
	.asciz	"test/static_func.tig::26.15: Nil pointer exception!"

	.p2align	4               ## @7
L___unnamed_5:
	.asciz	"test/static_func.tig::27.18: Nil pointer exception!"

L___unnamed_6:                          ## @8
	.asciz	"foo bar"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/static_func__code_end"
"_camlLlvm_byte_code/test/static_func__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/static_func__data_end"
"_camlLlvm_byte_code/test/static_func__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/static_func__frametable"
"_camlLlvm_byte_code/test/static_func__frametable":
	.short	20
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp5
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp8
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for f
	.quad	Ltmp12
	.short	24
	.short	0
	.p2align	3
                                        ## live roots for g
	.quad	Ltmp13
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp14
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp15
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp16
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp17
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp18
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp19
	.short	24
	.short	0
	.p2align	3
.subsections_via_symbols
