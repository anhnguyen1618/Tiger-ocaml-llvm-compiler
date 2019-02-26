	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/fib__code_begin"
"_camlLlvm_byte_code/test/fib__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/fib__data_begin"
"_camlLlvm_byte_code/test/fib__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	leaq	8(%rsp), %rbx
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	_fib
Ltmp0:
	movl	%eax, %r14d
	movl	$14, %esi
	movq	%rbx, %rdi
	callq	_fib
Ltmp1:
	movl	%eax, %ebp
	movl	$30, %esi
	movq	%rbx, %rdi
	callq	_fib
Ltmp2:
	movl	%eax, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	_assert_equal_int
Ltmp3:
	movl	$1, %edi
	movl	$1, %esi
	callq	_assert_equal_int
Ltmp4:
	movl	$5, %esi
	movl	%r14d, %edi
	callq	_assert_equal_int
Ltmp5:
	movl	$377, %esi              ## imm = 0x179
	movl	%ebp, %edi
	callq	_assert_equal_int
Ltmp6:
	movl	$832040, %esi           ## imm = 0xCB228
	movl	%ebx, %edi
	callq	_assert_equal_int
Ltmp7:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fib                    ## -- Begin function fib
	.p2align	4, 0x90
_fib:                                   ## @fib
## %bb.0:                               ## %entry
	pushq	%rbp
	pushq	%r14
	pushq	%rbx
	movl	%esi, %ebx
	cmpl	$1, %esi
	jbe	LBB1_2
## %bb.1:                               ## %else4
	movq	%rdi, %r14
	leal	-1(%rbx), %esi
	callq	_fib
Ltmp8:
	movl	%eax, %ebp
	addl	$-2, %ebx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_fib
Ltmp9:
	movl	%eax, %ebx
	addl	%ebp, %ebx
LBB1_2:                                 ## %merge
	movl	%ebx, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
                                        ## -- End function

	.globl	"_camlLlvm_byte_code/test/fib__code_end"
"_camlLlvm_byte_code/test/fib__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/fib__data_end"
"_camlLlvm_byte_code/test/fib__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/fib__frametable"
"_camlLlvm_byte_code/test/fib__frametable":
	.short	10
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
                                        ## live roots for fib
	.quad	Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	24
	.short	0
	.p2align	3
.subsections_via_symbols
