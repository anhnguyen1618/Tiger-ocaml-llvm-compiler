	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/staticlink__code_begin"
"_camlLlvm_byte_code/test/staticlink__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/staticlink__data_begin"
"_camlLlvm_byte_code/test/staticlink__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	$5, 4(%rsp)
	movl	$28, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$6, %eax
	jg	LBB0_3
	.p2align	4, 0x90
LBB0_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$4, (%rbx,%rax,4)
	incq	%rax
	cmpl	$6, %eax
	jle	LBB0_2
LBB0_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp1:
	movl	$7, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 8(%rsp)
	movq	%rsp, %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_nested_function
Ltmp2:
	movl	$18, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp3:
	movl	$-5, %esi
	movq	%rbx, %rdi
	callq	_nested_function
Ltmp4:
	movl	$13, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp5:
	movl	$-18, %esi
	movq	%rbx, %rdi
	callq	_nested_function
Ltmp6:
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp7:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_nested_function        ## -- Begin function nested_function
	.p2align	4, 0x90
_nested_function:                       ## @nested_function
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, (%rsp)
	movl	%esi, 12(%rsp)
	movl	$6, 8(%rsp)
	movq	8(%rdi), %rbx
	leaq	L___unnamed_1(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp8:
	movq	8(%rbx), %rax
	movl	$7, 8(%rax)
	movq	%rsp, %rdi
	callq	_f
Ltmp9:
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_f                      ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	movl	4(%rax), %ebx
	addl	8(%rdi), %ebx
	movq	8(%rax), %r14
	leaq	L___unnamed_2(%rip), %rdx
	movl	$2, %esi
	movq	%r14, %rdi
	callq	_tig_check_array_bound
Ltmp10:
	movq	8(%r14), %rax
	addl	8(%rax), %ebx
	movq	(%rsp), %rax
	addl	12(%rax), %ebx
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_2:
	.asciz	"test/staticlink.tig::10.35: Array out of bound"

	.p2align	4               ## @1
L___unnamed_1:
	.asciz	"test/staticlink.tig::12.6: Array out of bound"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/staticlink__code_end"
"_camlLlvm_byte_code/test/staticlink__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/staticlink__data_end"
"_camlLlvm_byte_code/test/staticlink__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/staticlink__frametable"
"_camlLlvm_byte_code/test/staticlink__frametable":
	.short	11
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp5
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	24
	.short	0
	.p2align	3
                                        ## live roots for nested_function
	.quad	Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	24
	.short	0
	.p2align	3
                                        ## live roots for f
	.quad	Ltmp10
	.short	24
	.short	0
	.p2align	3
.subsections_via_symbols
