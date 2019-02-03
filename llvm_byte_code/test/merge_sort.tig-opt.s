	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	8(%rsp), %r14
	movq	%r14, %rdi
	callq	create_array
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	create_array_test
	movq	%rax, %rbx
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	merge_sort
	movq	%rax, %r15
	movl	$.L__unnamed_3, %edi
	callq	tig_print
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
	xorl	%esi, %esi
	movl	$.L__unnamed_4, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
	movl	$2, %esi
	movl	$.L__unnamed_6, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
	movl	$3, %esi
	movl	$.L__unnamed_7, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
	movl	$4, %esi
	movl	$.L__unnamed_8, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	merge_sort
	movq	%rax, %rbx
	xorl	%esi, %esi
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
	movl	$1, %esi
	movl	$.L__unnamed_10, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
	movl	$2, %esi
	movl	$.L__unnamed_11, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
	movl	$3, %esi
	movl	$.L__unnamed_12, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
	movl	$4, %esi
	movl	$.L__unnamed_13, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movl	$.L__unnamed_14, %edi
	callq	tig_print
	movq	%rbx, %rdi
	callq	tig_array_length
	movq	%rbx, %rdi
	callq	tig_array_length
	movl	%eax, %r14d
	decl	%r14d
	xorl	%ebp, %ebp
	cmpl	%ebp, %r14d
	jl	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_15, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	print_arr_int_ele
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	.LBB1_2
.LBB1_3:                                # %end
	movl	$.L__unnamed_16, %edi
	callq	tig_print
	movl	$.L__unnamed_17, %edi
	callq	tig_print
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, 8(%rsp)
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$7, %eax
	jg	.LBB2_3
	.p2align	4, 0x90
.LBB2_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$7, %eax
	jle	.LBB2_2
.LBB2_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$8, (%r14)
	movq	%rbx, 8(%r14)
	xorl	%ebx, %ebx
	cmpl	$7, %ebx
	jg	.LBB2_6
	.p2align	4, 0x90
.LBB2_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_18, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r14), %r15
	movl	$50, %edi
	callq	tig_random
	movl	%eax, (%r15,%rbx,4)
	incq	%rbx
	cmpl	$7, %ebx
	jle	.LBB2_5
.LBB2_6:                                # %end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	create_array, .Lfunc_end2-create_array
	.cfi_endproc
                                        # -- End function
	.globl	merge_sort              # -- Begin function merge_sort
	.p2align	4, 0x90
	.type	merge_sort,@function
merge_sort:                             # @merge_sort
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, 8(%rsp)
	movq	%r14, %rdi
	callq	tig_array_length
	movl	%eax, %ebp
	cmpl	$2, %ebp
	jl	.LBB3_2
# %bb.1:                                # %else
	movl	%ebp, %ebx
	shrl	$31, %ebx
	addl	%ebp, %ebx
	sarl	%ebx
	leal	-1(%rbx), %ecx
	leaq	8(%rsp), %r15
	xorl	%edx, %edx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	sub_arr
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	callq	merge_sort
	movq	%rax, %r12
	decl	%ebp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	movl	%ebp, %ecx
	callq	sub_arr
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	callq	merge_sort
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	merge
	movq	%rax, %r14
.LBB3_2:                                # %merge
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	merge_sort, .Lfunc_end3-merge_sort
	.cfi_endproc
                                        # -- End function
	.globl	sub_arr                 # -- Begin function sub_arr
	.p2align	4, 0x90
	.type	sub_arr,@function
sub_arr:                                # @sub_arr
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def %ecx killed %ecx def %rcx
                                        # kill: def %edx killed %edx def %rdx
	movq	%rsi, %r12
	movq	%rdi, 16(%rsp)
	movq	%rdx, (%rsp)            # 8-byte Spill
	subl	%edx, %ecx
	leal	1(%rcx), %ebp
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	leal	4(,%rcx,4), %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	%ebp, %eax
	jge	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	%eax, %rcx
	movl	$0, (%rbx,%rcx,4)
	incl	%eax
	cmpl	%ebp, %eax
	jl	.LBB4_2
.LBB4_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r13
	movl	%ebp, (%r13)
	movq	%rbx, 8(%r13)
	xorl	%ebx, %ebx
	cmpl	%ebx, 8(%rsp)           # 4-byte Folded Reload
	jl	.LBB4_6
	.p2align	4, 0x90
.LBB4_5:                                # %loop17
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax            # 8-byte Reload
	leal	(%rax,%rbx), %ebp
	movl	$.L__unnamed_19, %edx
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r13), %r14
	movslq	%ebx, %r15
	movl	$.L__unnamed_20, %edx
	movq	%r12, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%r12), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%r14,%r15,4)
	incl	%ebx
	cmpl	%ebx, 8(%rsp)           # 4-byte Folded Reload
	jge	.LBB4_5
.LBB4_6:                                # %end18
	movq	%r13, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	sub_arr, .Lfunc_end4-sub_arr
	.cfi_endproc
                                        # -- End function
	.globl	merge                   # -- Begin function merge
	.p2align	4, 0x90
	.type	merge,@function
merge:                                  # @merge
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r15
	movq	%rdi, 64(%rsp)
	movq	%rsi, 32(%rsp)          # 8-byte Spill
	movq	%rsi, %rdi
	callq	tig_array_length
	movl	%eax, %ebp
	movq	%r15, %rdi
	callq	tig_array_length
	movl	%eax, %ebx
	movq	%rbp, %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	leal	(%rbp,%rbx), %r14d
	leal	(,%r14,4), %edi
	callq	malloc
	movq	%rax, %rbp
	xorl	%eax, %eax
	cmpl	%r14d, %eax
	jge	.LBB5_3
	.p2align	4, 0x90
.LBB5_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	%eax, %rcx
	movl	$0, (%rbp,%rcx,4)
	incl	%eax
	cmpl	%r14d, %eax
	jl	.LBB5_2
.LBB5_3:                                # %end
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	movq	%r15, 48(%rsp)          # 8-byte Spill
	movl	$16, %edi
	callq	malloc
	movl	%r14d, (%rax)
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%rbp, 8(%rax)
	xorl	%ebp, %ebp
	movl	$0, 12(%rsp)            # 4-byte Folded Spill
	xorl	%r14d, %r14d
	jmp	.LBB5_4
	.p2align	4, 0x90
.LBB5_12:                               # %else27
                                        #   in Loop: Header=BB5_4 Depth=1
	movl	$.L__unnamed_21, %edx
	movl	%ebp, %r13d
	movq	16(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%rbp), %rbp
	movslq	%r14d, %r14
	movl	$.L__unnamed_22, %edx
	movq	%r15, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r15), %rax
	movl	(%rax,%r12,4), %eax
	movl	%eax, (%rbp,%r14,4)
	incl	%ebx
	movl	%ebx, 12(%rsp)          # 4-byte Spill
	incl	%r14d
	movl	%r13d, %ebp
.LBB5_4:                                # %test14
                                        # =>This Inner Loop Header: Depth=1
	cmpl	40(%rsp), %ebp          # 4-byte Folded Reload
	movl	$0, %eax
	jge	.LBB5_6
# %bb.5:                                # %then
                                        #   in Loop: Header=BB5_4 Depth=1
	xorl	%eax, %eax
	movl	12(%rsp), %ecx          # 4-byte Reload
	cmpl	24(%rsp), %ecx          # 4-byte Folded Reload
	setl	%al
.LBB5_6:                                # %merge
                                        #   in Loop: Header=BB5_4 Depth=1
	testl	%eax, %eax
	movq	48(%rsp), %r12          # 8-byte Reload
	movq	32(%rsp), %rbx          # 8-byte Reload
	je	.LBB5_7
# %bb.10:                               # %test25
                                        #   in Loop: Header=BB5_4 Depth=1
	movl	$.L__unnamed_23, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	movl	(%rax,%rcx,4), %r13d
	movl	$.L__unnamed_24, %edx
	movq	%r12, %rdi
	movl	12(%rsp), %ebx          # 4-byte Reload
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r12), %rax
	movq	%r12, %r15
	movslq	%ebx, %r12
	cmpl	(%rax,%r12,4), %r13d
	jge	.LBB5_12
# %bb.11:                               # %then26
                                        #   in Loop: Header=BB5_4 Depth=1
	movl	$.L__unnamed_25, %edx
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %r12
	movslq	%r14d, %r15
	movl	$.L__unnamed_26, %edx
	movq	32(%rsp), %rbx          # 8-byte Reload
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movq	56(%rsp), %rcx          # 8-byte Reload
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%r12,%r15,4)
	incl	%ebp
	incl	%r14d
	jmp	.LBB5_4
.LBB5_7:
	movq	16(%rsp), %r13          # 8-byte Reload
	cmpl	40(%rsp), %ebp          # 4-byte Folded Reload
	jge	.LBB5_13
	.p2align	4, 0x90
.LBB5_9:                                # %loop69
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_27, %edx
	movq	%r13, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%r13), %r15
	movslq	%r14d, %r14
	movl	$.L__unnamed_28, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%r15,%r14,4)
	incl	%ebp
	incl	%r14d
	cmpl	40(%rsp), %ebp          # 4-byte Folded Reload
	jl	.LBB5_9
.LBB5_13:                               # %end70
	movq	24(%rsp), %r15          # 8-byte Reload
	movl	12(%rsp), %ebx          # 4-byte Reload
	cmpl	%r15d, %ebx
	jge	.LBB5_16
	.p2align	4, 0x90
.LBB5_15:                               # %loop92
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_29, %edx
	movq	%r13, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	%r13, %rbp
	movq	8(%rbp), %r13
	movslq	%r14d, %r14
	movl	$.L__unnamed_30, %edx
	movq	%r12, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r12), %rax
	movslq	%ebx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%r13,%r14,4)
	movq	%rbp, %r13
	incl	%ebx
	incl	%r14d
	cmpl	%r15d, %ebx
	jl	.LBB5_15
.LBB5_16:                               # %end93
	movq	%r13, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	merge, .Lfunc_end5-merge
	.cfi_endproc
                                        # -- End function
	.globl	create_array_test       # -- Begin function create_array_test
	.p2align	4, 0x90
	.type	create_array_test,@function
create_array_test:                      # @create_array_test
	.cfi_startproc
# %bb.0:                                # %entry
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
	movq	%rdi, 8(%rsp)
	movl	$20, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB6_3
	.p2align	4, 0x90
.LBB6_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB6_2
.LBB6_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbx, 8(%r14)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	jg	.LBB6_6
	.p2align	4, 0x90
.LBB6_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_31, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jle	.LBB6_5
.LBB6_6:                                # %end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end6:
	.size	create_array_test, .Lfunc_end6-create_array_test
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_14,@object  # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_14:
	.asciz	"["
	.size	.L__unnamed_14, 2

	.type	.L__unnamed_15,@object  # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_15:
	.asciz	"test/merge_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_15, 46

	.type	.L__unnamed_16,@object  # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_16:
	.zero	1
	.size	.L__unnamed_16, 1

	.type	.L__unnamed_17,@object  # @3
.L__unnamed_17:
	.asciz	"]"
	.size	.L__unnamed_17, 2

	.type	.L__unnamed_18,@object  # @4
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_18:
	.asciz	"test/merge_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_18, 47

	.type	.L__unnamed_19,@object  # @5
	.p2align	4
.L__unnamed_19:
	.asciz	"test/merge_sort.tig::29.35: Array out of bound"
	.size	.L__unnamed_19, 47

	.type	.L__unnamed_20,@object  # @6
	.p2align	4
.L__unnamed_20:
	.asciz	"test/merge_sort.tig::29.45: Array out of bound"
	.size	.L__unnamed_20, 47

	.type	.L__unnamed_23,@object  # @7
	.p2align	4
.L__unnamed_23:
	.asciz	"test/merge_sort.tig::45.35: Array out of bound"
	.size	.L__unnamed_23, 47

	.type	.L__unnamed_24,@object  # @8
	.p2align	4
.L__unnamed_24:
	.asciz	"test/merge_sort.tig::45.50: Array out of bound"
	.size	.L__unnamed_24, 47

	.type	.L__unnamed_25,@object  # @9
	.p2align	4
.L__unnamed_25:
	.asciz	"test/merge_sort.tig::47.38: Array out of bound"
	.size	.L__unnamed_25, 47

	.type	.L__unnamed_26,@object  # @10
	.p2align	4
.L__unnamed_26:
	.asciz	"test/merge_sort.tig::47.66: Array out of bound"
	.size	.L__unnamed_26, 47

	.type	.L__unnamed_21,@object  # @11
	.p2align	4
.L__unnamed_21:
	.asciz	"test/merge_sort.tig::52.38: Array out of bound"
	.size	.L__unnamed_21, 47

	.type	.L__unnamed_22,@object  # @12
	.p2align	4
.L__unnamed_22:
	.asciz	"test/merge_sort.tig::52.67: Array out of bound"
	.size	.L__unnamed_22, 47

	.type	.L__unnamed_27,@object  # @13
	.p2align	4
.L__unnamed_27:
	.asciz	"test/merge_sort.tig::58.34: Array out of bound"
	.size	.L__unnamed_27, 47

	.type	.L__unnamed_28,@object  # @14
	.p2align	4
.L__unnamed_28:
	.asciz	"test/merge_sort.tig::58.62: Array out of bound"
	.size	.L__unnamed_28, 47

	.type	.L__unnamed_29,@object  # @15
	.p2align	4
.L__unnamed_29:
	.asciz	"test/merge_sort.tig::64.34: Array out of bound"
	.size	.L__unnamed_29, 47

	.type	.L__unnamed_30,@object  # @16
	.p2align	4
.L__unnamed_30:
	.asciz	"test/merge_sort.tig::64.63: Array out of bound"
	.size	.L__unnamed_30, 47

	.type	.L__unnamed_31,@object  # @17
	.p2align	4
.L__unnamed_31:
	.asciz	"test/merge_sort.tig::89.41: Array out of bound"
	.size	.L__unnamed_31, 47

	.type	.L__unnamed_1,@object   # @18
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @19
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @20
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14

	.type	.L__unnamed_4,@object   # @21
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/merge_sort.tig::103.23: Array out of bound"
	.size	.L__unnamed_4, 48

	.type	.L__unnamed_5,@object   # @22
	.p2align	4
.L__unnamed_5:
	.asciz	"test/merge_sort.tig::104.23: Array out of bound"
	.size	.L__unnamed_5, 48

	.type	.L__unnamed_6,@object   # @23
	.p2align	4
.L__unnamed_6:
	.asciz	"test/merge_sort.tig::105.23: Array out of bound"
	.size	.L__unnamed_6, 48

	.type	.L__unnamed_7,@object   # @24
	.p2align	4
.L__unnamed_7:
	.asciz	"test/merge_sort.tig::106.23: Array out of bound"
	.size	.L__unnamed_7, 48

	.type	.L__unnamed_8,@object   # @25
	.p2align	4
.L__unnamed_8:
	.asciz	"test/merge_sort.tig::107.23: Array out of bound"
	.size	.L__unnamed_8, 48

	.type	.L__unnamed_9,@object   # @26
	.p2align	4
.L__unnamed_9:
	.asciz	"test/merge_sort.tig::111.23: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_10,@object  # @27
	.p2align	4
.L__unnamed_10:
	.asciz	"test/merge_sort.tig::112.23: Array out of bound"
	.size	.L__unnamed_10, 48

	.type	.L__unnamed_11,@object  # @28
	.p2align	4
.L__unnamed_11:
	.asciz	"test/merge_sort.tig::113.23: Array out of bound"
	.size	.L__unnamed_11, 48

	.type	.L__unnamed_12,@object  # @29
	.p2align	4
.L__unnamed_12:
	.asciz	"test/merge_sort.tig::114.23: Array out of bound"
	.size	.L__unnamed_12, 48

	.type	.L__unnamed_13,@object  # @30
	.p2align	4
.L__unnamed_13:
	.asciz	"test/merge_sort.tig::115.23: Array out of bound"
	.size	.L__unnamed_13, 48


	.section	".note.GNU-stack","",@progbits
