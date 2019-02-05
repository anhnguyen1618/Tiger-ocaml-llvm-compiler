	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	$0, 8(%rsp)
	xorl	%edi, %edi
	callq	tig_nillable
	movl	$1, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	movq	%rsp, %rdi
	callq	f
	movq	8(%rsp), %rbx
	movl	$.L__unnamed_1, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %edi
	movl	$5, %esi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	f                       # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	%rbx, 8(%rsp)
	movl	$16, %edi
	callq	malloc
	movl	$5, (%rax)
	movq	$0, 8(%rax)
	movq	%rax, 8(%rbx)
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_1:
	.asciz	"test/record_nil_esc.tig::8.19: Nil pointer exception!"
	.size	.L__unnamed_1, 54


	.section	".note.GNU-stack","",@progbits
