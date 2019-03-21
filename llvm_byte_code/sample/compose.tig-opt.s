	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/compose__code_begin"
"camlLlvm_byte_code/test/compose__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/compose__data_begin"
"camlLlvm_byte_code/test/compose__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$4, %edi
	callq	malloc
.Ltmp0:
	movq	%rax, %r14
	movl	$16, %edi
	callq	malloc
.Ltmp1:
	movq	%rax, %rbx
	movq	$double, (%rbx)
	movq	%r14, 8(%rbx)
	movl	$16, %edi
	callq	malloc
.Ltmp2:
	movq	$add_two, (%rax)
	movq	%r14, 8(%rax)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	compose
.Ltmp3:
	movq	(%rax), %r14
	movq	8(%rax), %rbx
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	*%r14
.Ltmp4:
	movl	%eax, %edi
	callq	tig_print_int
.Ltmp5:
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	*%r14
.Ltmp6:
	movl	$10, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp7:
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	*%r14
.Ltmp8:
	movl	$4, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp9:
	movl	$-2, %esi
	movq	%rbx, %rdi
	callq	*%r14
.Ltmp10:
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp11:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	add_two                 # -- Begin function add_two
	.p2align	4, 0x90
	.type	add_two,@function
add_two:                                # @add_two
# %bb.0:                                # %entry
                                        # kill: def %esi killed %esi def %rsi
	leal	2(%rsi), %eax
	retq
.Lfunc_end1:
	.size	add_two, .Lfunc_end1-add_two
                                        # -- End function
	.globl	double                  # -- Begin function double
	.p2align	4, 0x90
	.type	double,@function
double:                                 # @double
# %bb.0:                                # %entry
                                        # kill: def %esi killed %esi def %rsi
	leal	(%rsi,%rsi), %eax
	retq
.Lfunc_end2:
	.size	double, .Lfunc_end2-double
                                        # -- End function
	.globl	compose                 # -- Begin function compose
	.p2align	4, 0x90
	.type	compose,@function
compose:                                # @compose
# %bb.0:                                # %entry
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$24, %edi
	callq	malloc
.Ltmp12:
	movq	%rax, %rbx
	movq	%r12, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r14, 16(%rbx)
	movl	$16, %edi
	callq	malloc
.Ltmp13:
	movq	$h, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end3:
	.size	compose, .Lfunc_end3-compose
                                        # -- End function
	.globl	h                       # -- Begin function h
	.p2align	4, 0x90
	.type	h,@function
h:                                      # @h
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	callq	*(%rax)
.Ltmp14:
	movq	8(%rbx), %rcx
	movq	(%rcx), %rdx
	movq	8(%rcx), %rdi
	movl	%eax, %esi
	popq	%rbx
	jmpq	*%rdx                   # TAILCALL
.Lfunc_end4:
	.size	h, .Lfunc_end4-h
	.cfi_endproc
                                        # -- End function

	.globl	"camlLlvm_byte_code/test/compose__code_end"
"camlLlvm_byte_code/test/compose__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/compose__data_end"
"camlLlvm_byte_code/test/compose__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/compose__frametable"
"camlLlvm_byte_code/test/compose__frametable":
	.short	15
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	24
	.short	0
	.p2align	3
                                        # live roots for add_two
                                        # live roots for double
                                        # live roots for compose
	.quad	.Ltmp12
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp13
	.short	40
	.short	0
	.p2align	3
                                        # live roots for h
	.quad	.Ltmp14
	.short	8
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
