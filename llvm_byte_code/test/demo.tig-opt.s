	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/demo__code_begin"
"_camlLlvm_byte_code/test/demo__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/demo__data_begin"
"_camlLlvm_byte_code/test/demo__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$16, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %rbx
	movl	$5, (%rax)
	leaq	L___unnamed_1(%rip), %rax
	movq	%rax, 8(%rbx)
	movl	$40, %edi
	callq	_malloc
Ltmp1:
	movq	%rax, %rbp
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	LBB0_3
	.p2align	4, 0x90
LBB0_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, (%rbp,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jle	LBB0_2
LBB0_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp2:
	movq	%rax, %r14
	movl	$5, (%rax)
	movq	%rbp, 8(%rax)
	leaq	L___unnamed_2(%rip), %rdx
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	_tig_check_array_bound
Ltmp3:
	movq	8(%r14), %rax
	movq	(%rax), %rbp
	leaq	L___unnamed_3(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp4:
	movl	(%rbp), %ebp
	movq	%rsp, %r14
	leaq	L___unnamed_4(%rip), %r15
	testl	%ebp, %ebp
	jle	LBB0_6
	.p2align	4, 0x90
LBB0_5:                                 ## %loop12
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_fib
Ltmp5:
	movl	%eax, %edi
	callq	_tig_print_int
Ltmp6:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_tig_check_null_pointer
Ltmp7:
	movq	8(%rbx), %rdi
	callq	_tig_print
Ltmp8:
	decl	%ebp
	testl	%ebp, %ebp
	jg	LBB0_5
LBB0_6:                                 ## %end13
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fib                    ## -- Begin function fib
	.p2align	4, 0x90
_fib:                                   ## @fib
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	je	LBB1_3
## %bb.1:                               ## %else
	movl	%esi, %ebx
	movl	$1, %eax
	cmpl	$1, %esi
	je	LBB1_3
## %bb.2:                               ## %else4
	leal	-1(%rbx), %esi
	movq	(%rsp), %rdi
	callq	_fib
Ltmp9:
	movl	%eax, %ebp
	addl	$-2, %ebx
	movq	(%rsp), %rdi
	movl	%ebx, %esi
	callq	_fib
Ltmp10:
	addl	%ebp, %eax
LBB1_3:                                 ## %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:                          ## @0
	.asciz	"Demo program"

	.p2align	4               ## @1
L___unnamed_2:
	.asciz	"test/demo.tig::14.20: Array out of bound"

	.p2align	4               ## @2
L___unnamed_3:
	.asciz	"test/demo.tig::14.23: Nil pointer exception!"

	.p2align	4               ## @3
L___unnamed_4:
	.asciz	"test/demo.tig::19.19: Nil pointer exception!"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/demo__code_end"
"_camlLlvm_byte_code/test/demo__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/demo__data_end"
"_camlLlvm_byte_code/test/demo__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/demo__frametable"
"_camlLlvm_byte_code/test/demo__frametable":
	.short	11
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
                                        ## live roots for fib
	.quad	Ltmp9
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	24
	.short	0
	.p2align	3
.subsections_via_symbols
