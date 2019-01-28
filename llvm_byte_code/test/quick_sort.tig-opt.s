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
	callq	quick_sort
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
	movl	(%rax), %esi
	movl	$4, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	4(%rax), %esi
	movl	$3, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$2, %esi
	movl	$.L__unnamed_6, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	8(%rax), %esi
	movl	$2, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$3, %esi
	movl	$.L__unnamed_7, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	12(%rax), %esi
	movl	$1, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$4, %esi
	movl	$.L__unnamed_8, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	16(%rax), %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	callq	assert_int
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	quick_sort
	xorl	%esi, %esi
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	(%rax), %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$1, %esi
	movl	$.L__unnamed_10, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	4(%rax), %esi
	movl	$1, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$2, %esi
	movl	$.L__unnamed_11, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	8(%rax), %esi
	movl	$2, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$3, %esi
	movl	$.L__unnamed_12, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	12(%rax), %esi
	movl	$3, %edx
	movq	%r14, %rdi
	callq	assert_int
	movl	$4, %esi
	movl	$.L__unnamed_13, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	16(%rax), %esi
	movl	$4, %edx
	movq	%r14, %rdi
	callq	assert_int
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edx, %r14d
	movl	%esi, %ebp
	movq	%rdi, 8(%rsp)
	movq	8(%rdi), %rbx
	movl	$.L__unnamed_19, %edx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%r14d, %rbx
	movl	(%rax,%rbx,4), %r13d
	movq	8(%rsp), %rax
	movq	8(%rax), %rdi
	movl	$.L__unnamed_20, %edx
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	leal	-1(%rbx), %eax
	movl	%eax, 28(%rsp)          # 4-byte Spill
	movl	%ebp, %r15d
	movl	%r13d, 20(%rsp)         # 4-byte Spill
	cmpl	%ebp, 28(%rsp)          # 4-byte Folded Reload
	jge	.LBB4_2
	jmp	.LBB4_5
	.p2align	4, 0x90
.LBB4_4:                                # %merge
                                        #   in Loop: Header=BB4_2 Depth=1
	incl	%ebp
	cmpl	%ebp, 28(%rsp)          # 4-byte Folded Reload
	jl	.LBB4_5
.LBB4_2:                                # %test38
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_21, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %r14
	movl	(%rax,%r14,4), %r12d
	movq	8(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_22, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
	cmpl	%r13d, %r12d
	jge	.LBB4_4
# %bb.3:                                # %then
                                        #   in Loop: Header=BB4_2 Depth=1
	movq	8(%rbx), %rax
	movslq	%r15d, %r13
	movl	(%rax,%r13,4), %eax
	movl	%eax, 24(%rsp)          # 4-byte Spill
	movq	8(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_23, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	%r12d, (%rax,%r13,4)
	movl	20(%rsp), %r13d         # 4-byte Reload
	movq	8(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_24, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	24(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, (%rax,%r14,4)
	incl	%r15d
	jmp	.LBB4_4
.LBB4_5:                                # %end
	movq	8(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_25, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%r15d, %rbx
	movl	(%rax,%rbx,4), %r14d
	movq	8(%rsp), %rax
	movq	8(%rax), %rbp
	movl	$.L__unnamed_26, %edx
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%rbp), %rax
	movl	%r13d, (%rax,%rbx,4)
	movq	8(%rsp), %rax
	movq	8(%rax), %r15
	movl	$.L__unnamed_27, %edx
	movq	%r15, %rdi
	movq	32(%rsp), %rbp          # 8-byte Reload
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%r15), %rax
	movl	%r14d, (%rax,%rbp,4)
	movl	%ebx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
	movl	%edx, %ebx
	movl	%esi, %ebp
	movq	%rdi, 8(%rsp)
	cmpl	%ebx, %ebp
	jge	.LBB5_2
# %bb.1:                                # %then
	movq	8(%rsp), %rdi
	movl	%ebp, %esi
	movl	%ebx, %edx
	callq	partition
	movl	%eax, %r14d
	leal	-1(%r14), %edx
	movq	8(%rsp), %rdi
	movl	%ebp, %esi
	callq	sort
	leal	1(%r14), %esi
	movq	8(%rsp), %rdi
	movl	%ebx, %edx
	callq	sort
.LBB5_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end5:
	.size	sort, .Lfunc_end5-sort
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
	movl	$.L__unnamed_28, %edx
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
	.globl	assert_int              # -- Begin function assert_int
	.p2align	4, 0x90
	.type	assert_int,@function
assert_int:                             # @assert_int
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movl	$.L__unnamed_29, %edi
	callq	assert_equal_int
	popq	%rax
	retq
.Lfunc_end7:
	.size	assert_int, .Lfunc_end7-assert_int
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
	.asciz	"test/quick_sort.tig::6.67: Array out of bound"
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
	.asciz	"test/quick_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_18, 47

	.type	.L__unnamed_19,@object  # @5
	.p2align	4
.L__unnamed_19:
	.asciz	"test/quick_sort.tig::24.36: Array out of bound"
	.size	.L__unnamed_19, 47

	.type	.L__unnamed_20,@object  # @6
	.p2align	4
.L__unnamed_20:
	.asciz	"test/quick_sort.tig::25.47: Array out of bound"
	.size	.L__unnamed_20, 47

	.type	.L__unnamed_21,@object  # @7
	.p2align	4
.L__unnamed_21:
	.asciz	"test/quick_sort.tig::29.46: Array out of bound"
	.size	.L__unnamed_21, 47

	.type	.L__unnamed_22,@object  # @8
	.p2align	4
.L__unnamed_22:
	.asciz	"test/quick_sort.tig::30.48: Array out of bound"
	.size	.L__unnamed_22, 47

	.type	.L__unnamed_23,@object  # @9
	.p2align	4
.L__unnamed_23:
	.asciz	"test/quick_sort.tig::34.35: Array out of bound"
	.size	.L__unnamed_23, 47

	.type	.L__unnamed_24,@object  # @10
	.p2align	4
.L__unnamed_24:
	.asciz	"test/quick_sort.tig::35.35: Array out of bound"
	.size	.L__unnamed_24, 47

	.type	.L__unnamed_25,@object  # @11
	.p2align	4
.L__unnamed_25:
	.asciz	"test/quick_sort.tig::39.43: Array out of bound"
	.size	.L__unnamed_25, 47

	.type	.L__unnamed_26,@object  # @12
	.p2align	4
.L__unnamed_26:
	.asciz	"test/quick_sort.tig::40.23: Array out of bound"
	.size	.L__unnamed_26, 47

	.type	.L__unnamed_27,@object  # @13
	.p2align	4
.L__unnamed_27:
	.asciz	"test/quick_sort.tig::41.23: Array out of bound"
	.size	.L__unnamed_27, 47

	.type	.L__unnamed_28,@object  # @14
	.p2align	4
.L__unnamed_28:
	.asciz	"test/quick_sort.tig::64.41: Array out of bound"
	.size	.L__unnamed_28, 47

	.type	.L__unnamed_29,@object  # @15
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_29:
	.asciz	"quick_sort.tig"
	.size	.L__unnamed_29, 15

	.type	.L__unnamed_1,@object   # @16
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @17
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @18
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14

	.type	.L__unnamed_4,@object   # @19
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/quick_sort.tig::79.23: Array out of bound"
	.size	.L__unnamed_4, 47

	.type	.L__unnamed_5,@object   # @20
	.p2align	4
.L__unnamed_5:
	.asciz	"test/quick_sort.tig::80.23: Array out of bound"
	.size	.L__unnamed_5, 47

	.type	.L__unnamed_6,@object   # @21
	.p2align	4
.L__unnamed_6:
	.asciz	"test/quick_sort.tig::81.23: Array out of bound"
	.size	.L__unnamed_6, 47

	.type	.L__unnamed_7,@object   # @22
	.p2align	4
.L__unnamed_7:
	.asciz	"test/quick_sort.tig::82.23: Array out of bound"
	.size	.L__unnamed_7, 47

	.type	.L__unnamed_8,@object   # @23
	.p2align	4
.L__unnamed_8:
	.asciz	"test/quick_sort.tig::83.23: Array out of bound"
	.size	.L__unnamed_8, 47

	.type	.L__unnamed_9,@object   # @24
	.p2align	4
.L__unnamed_9:
	.asciz	"test/quick_sort.tig::87.23: Array out of bound"
	.size	.L__unnamed_9, 47

	.type	.L__unnamed_10,@object  # @25
	.p2align	4
.L__unnamed_10:
	.asciz	"test/quick_sort.tig::88.23: Array out of bound"
	.size	.L__unnamed_10, 47

	.type	.L__unnamed_11,@object  # @26
	.p2align	4
.L__unnamed_11:
	.asciz	"test/quick_sort.tig::89.23: Array out of bound"
	.size	.L__unnamed_11, 47

	.type	.L__unnamed_12,@object  # @27
	.p2align	4
.L__unnamed_12:
	.asciz	"test/quick_sort.tig::90.23: Array out of bound"
	.size	.L__unnamed_12, 47

	.type	.L__unnamed_13,@object  # @28
	.p2align	4
.L__unnamed_13:
	.asciz	"test/quick_sort.tig::91.23: Array out of bound"
	.size	.L__unnamed_13, 47


	.section	".note.GNU-stack","",@progbits
