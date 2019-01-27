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
	callq	quick_sort
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
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
.LBB1_4:                                # %continue
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	print_arr_int_ele
	incl	12(%rsp)
.LBB1_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movl	28(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB1_5
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	16(%rsp), %rbx
	movl	12(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB1_4
# %bb.3:                                # %error
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$.L__unnamed_5, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
	jmp	.LBB1_4
.LBB1_5:                                # %end
	movl	$.L__unnamed_6, %edi
	callq	tig_print
	movl	$.L__unnamed_7, %edi
	callq	tig_print
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 32(%rsp)
	movl	$8, 16(%rsp)
	movl	$8, %ebp
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$0, 8(%rsp)
	cmpl	%ebp, 8(%rsp)
	jge	.LBB2_3
	.p2align	4, 0x90
.LBB2_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	8(%rsp), %rax
	movl	$1, (%rbx,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 8(%rsp)
	cmpl	%ebp, 8(%rsp)
	jl	.LBB2_2
.LBB2_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	%ebp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 24(%rsp)
	movl	$0, 12(%rsp)
	movl	16(%rsp), %eax
	decl	%eax
	movl	%eax, 20(%rsp)
	jmp	.LBB2_4
	.p2align	4, 0x90
.LBB2_7:                                # %continue
                                        #   in Loop: Header=BB2_4 Depth=1
	movq	8(%rbp), %rbp
	movslq	%ebx, %rbx
	movl	$50, %edi
	callq	tig_random
	movl	%eax, (%rbp,%rbx,4)
	incl	12(%rsp)
.LBB2_4:                                # %test10
                                        # =>This Inner Loop Header: Depth=1
	movl	20(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB2_8
# %bb.5:                                # %loop11
                                        #   in Loop: Header=BB2_4 Depth=1
	movl	12(%rsp), %ebx
	movq	24(%rsp), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB2_7
# %bb.6:                                # %error
                                        #   in Loop: Header=BB2_4 Depth=1
	movl	$.L__unnamed_8, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
	jmp	.LBB2_7
.LBB2_8:                                # %end12
	movq	24(%rsp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	create_array, .Lfunc_end2-create_array
	.cfi_endproc
                                        # -- End function
	.globl	quick_sort              # -- Begin function quick_sort
	.p2align	4, 0x90
	.type	quick_sort,@function
quick_sort:                             # @quick_sort
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rsi, %rdi
	callq	tig_array_length
                                        # kill: def %eax killed %eax def %rax
	leal	-1(%rax), %edx
	leaq	8(%rsp), %rdi
	xorl	%esi, %esi
	callq	sort
	addq	$24, %rsp
	retq
.Lfunc_end3:
	.size	quick_sort, .Lfunc_end3-quick_sort
	.cfi_endproc
                                        # -- End function
	.globl	partition               # -- Begin function partition
	.p2align	4, 0x90
	.type	partition,@function
partition:                              # @partition
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebx
	movq	%rdi, 16(%rsp)
	movl	%esi, 40(%rsp)
	movl	%ebx, 24(%rsp)
	movl	%esi, 8(%rsp)
	movq	8(%rdi), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB4_2
# %bb.1:                                # %error
	movl	$.L__unnamed_9, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_2:                                # %continue
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 28(%rsp)
	movq	16(%rsp), %rax
	movq	8(%rax), %rbx
	movl	8(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB4_4
# %bb.3:                                # %error11
	movl	$.L__unnamed_10, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_4:                                # %continue12
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 32(%rsp)
	movl	40(%rsp), %eax
	movl	%eax, 12(%rsp)
	movl	24(%rsp), %eax
	decl	%eax
	movl	%eax, 44(%rsp)
	jmp	.LBB4_5
	.p2align	4, 0x90
.LBB4_16:                               # %else
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	$0, 52(%rsp)
	incl	12(%rsp)
.LBB4_5:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movl	44(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB4_17
# %bb.6:                                # %loop
                                        #   in Loop: Header=BB4_5 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rbx
	movl	12(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB4_8
# %bb.7:                                # %error33
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	$.L__unnamed_11, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_8:                                # %continue34
                                        #   in Loop: Header=BB4_5 Depth=1
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 36(%rsp)
	movq	16(%rsp), %rax
	movq	8(%rax), %rbx
	movl	8(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB4_10
# %bb.9:                                # %error47
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	$.L__unnamed_12, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_10:                               # %test54
                                        #   in Loop: Header=BB4_5 Depth=1
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 48(%rsp)
	movl	36(%rsp), %eax
	cmpl	28(%rsp), %eax
	jge	.LBB4_16
# %bb.11:                               # %then
                                        #   in Loop: Header=BB4_5 Depth=1
	movq	16(%rsp), %rax
	movl	8(%rsp), %ebx
	movq	8(%rax), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB4_13
# %bb.12:                               # %error65
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	$.L__unnamed_13, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_13:                               # %continue66
                                        #   in Loop: Header=BB4_5 Depth=1
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	36(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movq	16(%rsp), %rax
	movl	12(%rsp), %ebx
	movq	8(%rax), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB4_15
# %bb.14:                               # %error78
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	$.L__unnamed_14, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_15:                               # %continue79
                                        #   in Loop: Header=BB4_5 Depth=1
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	48(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	8(%rsp)
	jmp	.LBB4_16
.LBB4_17:                               # %end
	movq	16(%rsp), %rax
	movq	8(%rax), %rbx
	movl	8(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB4_19
# %bb.18:                               # %error95
	movl	$.L__unnamed_15, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_19:                               # %continue96
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 32(%rsp)
	movq	16(%rsp), %rax
	movl	8(%rsp), %ebx
	movq	8(%rax), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB4_21
# %bb.20:                               # %error109
	movl	$.L__unnamed_16, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_21:                               # %continue110
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	28(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movq	16(%rsp), %rax
	movl	24(%rsp), %ebx
	movq	8(%rax), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB4_23
# %bb.22:                               # %error123
	movl	$.L__unnamed_17, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB4_23:                               # %continue124
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	32(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	8(%rsp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end4:
	.size	partition, .Lfunc_end4-partition
	.cfi_endproc
                                        # -- End function
	.globl	sort                    # -- Begin function sort
	.p2align	4, 0x90
	.type	sort,@function
sort:                                   # @sort
	.cfi_startproc
# %bb.0:                                # %test
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	%esi, (%rsp)
	movl	%edx, 4(%rsp)
	cmpl	%edx, %esi
	jge	.LBB5_2
# %bb.1:                                # %then
	movl	(%rsp), %esi
	movl	4(%rsp), %edx
	movq	8(%rsp), %rdi
	callq	partition
                                        # kill: def %eax killed %eax def %rax
	movl	%eax, 16(%rsp)
	movl	(%rsp), %esi
	leal	-1(%rax), %edx
	movq	8(%rsp), %rdi
	callq	sort
	movl	16(%rsp), %esi
	incl	%esi
	movl	4(%rsp), %edx
	movq	8(%rsp), %rdi
	callq	sort
.LBB5_2:                                # %else
	movl	$0, 20(%rsp)
	addq	$24, %rsp
	retq
.Lfunc_end5:
	.size	sort, .Lfunc_end5-sort
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
	.asciz	"test/quick_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_5, 46

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
	.asciz	"test/quick_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_8, 47

	.type	.L__unnamed_9,@object   # @5
	.p2align	4
.L__unnamed_9:
	.asciz	"test/quick_sort.tig::24.36: Array out of bound"
	.size	.L__unnamed_9, 47

	.type	.L__unnamed_10,@object  # @6
	.p2align	4
.L__unnamed_10:
	.asciz	"test/quick_sort.tig::25.47: Array out of bound"
	.size	.L__unnamed_10, 47

	.type	.L__unnamed_11,@object  # @7
	.p2align	4
.L__unnamed_11:
	.asciz	"test/quick_sort.tig::29.46: Array out of bound"
	.size	.L__unnamed_11, 47

	.type	.L__unnamed_12,@object  # @8
	.p2align	4
.L__unnamed_12:
	.asciz	"test/quick_sort.tig::30.48: Array out of bound"
	.size	.L__unnamed_12, 47

	.type	.L__unnamed_13,@object  # @9
	.p2align	4
.L__unnamed_13:
	.asciz	"test/quick_sort.tig::34.35: Array out of bound"
	.size	.L__unnamed_13, 47

	.type	.L__unnamed_14,@object  # @10
	.p2align	4
.L__unnamed_14:
	.asciz	"test/quick_sort.tig::35.35: Array out of bound"
	.size	.L__unnamed_14, 47

	.type	.L__unnamed_15,@object  # @11
	.p2align	4
.L__unnamed_15:
	.asciz	"test/quick_sort.tig::39.43: Array out of bound"
	.size	.L__unnamed_15, 47

	.type	.L__unnamed_16,@object  # @12
	.p2align	4
.L__unnamed_16:
	.asciz	"test/quick_sort.tig::40.23: Array out of bound"
	.size	.L__unnamed_16, 47

	.type	.L__unnamed_17,@object  # @13
	.p2align	4
.L__unnamed_17:
	.asciz	"test/quick_sort.tig::41.23: Array out of bound"
	.size	.L__unnamed_17, 47

	.type	.L__unnamed_1,@object   # @14
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @15
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @16
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14


	.section	".note.GNU-stack","",@progbits
