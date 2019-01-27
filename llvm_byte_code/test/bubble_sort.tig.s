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
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	create_array
	movq	%rax, (%rsp)
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	callq	print_array
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	callq	bubble_sort
	movl	$.L__unnamed_3, %edi
	callq	tig_print
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	callq	print_array
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	print_array             # -- Begin function print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 32(%rsp)
	movq	%rsi, 16(%rsp)
	movl	$.L__unnamed_4, %edi
	callq	tig_print
	movq	16(%rsp), %rdi
	callq	tig_array_length
	movl	$0, 12(%rsp)
	movq	16(%rsp), %rdi
	callq	tig_array_length
	decl	%eax
	movl	%eax, 28(%rsp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_2:                                # %loop
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	16(%rsp), %rbx
	movslq	12(%rsp), %r14
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	(%rax,%r14,4), %edi
	callq	print_arr_int_ele
	incl	12(%rsp)
.LBB1_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movl	28(%rsp), %eax
	cmpl	12(%rsp), %eax
	jge	.LBB1_2
# %bb.3:                                # %end
	movl	$.L__unnamed_6, %edi
	callq	tig_print
	movl	$.L__unnamed_7, %edi
	callq	tig_print
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
	.cfi_endproc
                                        # -- End function
	.globl	create_array            # -- Begin function create_array
	.p2align	4, 0x90
	.type	create_array,@function
create_array:                           # @create_array
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 24(%rsp)
	movl	$8, 8(%rsp)
	movl	$8, %ebp
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$0, (%rsp)
	cmpl	%ebp, (%rsp)
	jge	.LBB2_3
	.p2align	4, 0x90
.LBB2_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	(%rsp), %rax
	movl	$1, (%rbx,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, (%rsp)
	cmpl	%ebp, (%rsp)
	jl	.LBB2_2
.LBB2_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	%ebp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 16(%rsp)
	movl	$0, 4(%rsp)
	movl	8(%rsp), %eax
	decl	%eax
	movl	%eax, 12(%rsp)
	jmp	.LBB2_4
	.p2align	4, 0x90
.LBB2_5:                                # %loop11
                                        #   in Loop: Header=BB2_4 Depth=1
	movslq	4(%rsp), %r14
	movq	16(%rsp), %rbx
	movl	$.L__unnamed_8, %edx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rbx
	movl	$50, %edi
	callq	tig_random
	movl	%eax, (%rbx,%r14,4)
	incl	4(%rsp)
.LBB2_4:                                # %test10
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax
	cmpl	4(%rsp), %eax
	jge	.LBB2_5
# %bb.6:                                # %end12
	movq	16(%rsp), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end2:
	.size	create_array, .Lfunc_end2-create_array
	.cfi_endproc
                                        # -- End function
	.globl	bubble_sort             # -- Begin function bubble_sort
	.p2align	4, 0x90
	.type	bubble_sort,@function
bubble_sort:                            # @bubble_sort
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 40(%rsp)
	movq	%rsi, 16(%rsp)
	movl	$0, 4(%rsp)
	movq	%rsi, %rdi
	callq	tig_array_length
	movl	%eax, 24(%rsp)
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_4:                                # %end8
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	8(%rsp), %eax
	movl	%eax, 4(%rsp)
.LBB3_1:                                # %test
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	movl	4(%rsp), %edi
	callq	tig_not
	cmpl	$1, %eax
	jne	.LBB3_8
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$1, 8(%rsp)
	movl	$0, (%rsp)
	movl	24(%rsp), %eax
	addl	$-2, %eax
	movl	%eax, 28(%rsp)
	jmp	.LBB3_3
	.p2align	4, 0x90
.LBB3_7:                                # %else
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$0, 36(%rsp)
	incl	(%rsp)
.LBB3_3:                                # %test6
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	28(%rsp), %eax
	cmpl	(%rsp), %eax
	jl	.LBB3_4
# %bb.5:                                # %test20
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	16(%rsp), %rbx
	movslq	(%rsp), %r14
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	(%rax,%r14,4), %eax
	movl	%eax, 12(%rsp)
	movq	16(%rsp), %rbx
	movl	(%rsp), %ebp
	incl	%ebp
	movl	$.L__unnamed_10, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 32(%rsp)
	cmpl	%eax, 12(%rsp)
	jle	.LBB3_7
# %bb.6:                                # %then
                                        #   in Loop: Header=BB3_3 Depth=2
	movslq	(%rsp), %rbx
	movq	16(%rsp), %rbp
	movl	$.L__unnamed_11, %edx
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%rbp), %rax
	movl	32(%rsp), %ecx
	movl	%ecx, (%rax,%rbx,4)
	movl	(%rsp), %ebx
	incl	%ebx
	movq	16(%rsp), %rbp
	movl	$.L__unnamed_12, %edx
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	12(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	$0, 8(%rsp)
	jmp	.LBB3_7
.LBB3_8:                                # %end
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end3:
	.size	bubble_sort, .Lfunc_end3-bubble_sort
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_4,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_4:
	.asciz	"["
	.size	.L__unnamed_4, 2

	.type	.L__unnamed_5,@object   # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_5:
	.asciz	"test/bubble_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_5, 47

	.type	.L__unnamed_6,@object   # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_6:
	.zero	1
	.size	.L__unnamed_6, 1

	.type	.L__unnamed_7,@object   # @3
.L__unnamed_7:
	.asciz	"]"
	.size	.L__unnamed_7, 2

	.type	.L__unnamed_8,@object   # @4
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_8:
	.asciz	"test/bubble_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_8, 48

	.type	.L__unnamed_9,@object   # @5
	.p2align	4
.L__unnamed_9:
	.asciz	"test/bubble_sort.tig::30.46: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_10,@object  # @6
	.p2align	4
.L__unnamed_10:
	.asciz	"test/bubble_sort.tig::31.43: Array out of bound"
	.size	.L__unnamed_10, 48

	.type	.L__unnamed_11,@object  # @7
	.p2align	4
.L__unnamed_11:
	.asciz	"test/bubble_sort.tig::35.35: Array out of bound"
	.size	.L__unnamed_11, 48

	.type	.L__unnamed_12,@object  # @8
	.p2align	4
.L__unnamed_12:
	.asciz	"test/bubble_sort.tig::36.35: Array out of bound"
	.size	.L__unnamed_12, 48

	.type	.L__unnamed_1,@object   # @9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @10
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @11
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14


	.section	".note.GNU-stack","",@progbits
