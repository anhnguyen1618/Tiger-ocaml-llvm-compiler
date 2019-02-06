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
	callq	heap_sort
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
	callq	heap_sort
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
	.globl	heap_sort               # -- Begin function heap_sort
	.p2align	4, 0x90
	.type	heap_sort,@function
heap_sort:                              # @heap_sort
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, (%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rsi, %rdi
	callq	tig_array_length
	movl	%eax, %ebx
	movl	%ebx, 8(%rsp)
	movq	%rsp, %r14
	movq	%r14, %rdi
	callq	create_max_heap
	movl	8(%rsp), %edx
	decl	%edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	swap
	addl	$-2, %ebx
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_2:                                # %loop
                                        #   in Loop: Header=BB3_1 Depth=1
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	max_heapify
	xorl	%esi, %esi
	movq	%r14, %rdi
	movl	%ebx, %edx
	callq	swap
	decl	%ebx
.LBB3_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	leal	1(%rbx), %edx
	cmpl	$2, %edx
	jge	.LBB3_2
# %bb.3:                                # %end
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end3:
	.size	heap_sort, .Lfunc_end3-heap_sort
	.cfi_endproc
                                        # -- End function
	.globl	create_max_heap         # -- Begin function create_max_heap
	.p2align	4, 0x90
	.type	create_max_heap,@function
create_max_heap:                        # @create_max_heap
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	movl	8(%rdi), %eax
	leal	-1(%rax), %ecx
	shrl	$31, %ecx
	leal	-1(%rax,%rcx), %ebx
	sarl	%ebx
	testl	%ebx, %ebx
	js	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rdi
	movl	8(%rdi), %edx
	movl	%ebx, %esi
	callq	max_heapify
	decl	%ebx
	testl	%ebx, %ebx
	jns	.LBB4_2
.LBB4_3:                                # %end
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end4:
	.size	create_max_heap, .Lfunc_end4-create_max_heap
	.cfi_endproc
                                        # -- End function
	.globl	swap                    # -- Begin function swap
	.p2align	4, 0x90
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:                                # %entry
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
	movl	%edx, %r14d
	movl	%esi, %ebp
	movq	%rdi, 8(%rsp)
	movq	16(%rdi), %rbx
	movl	$.L__unnamed_19, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %r15
	movl	(%rax,%r15,4), %r12d
	movq	8(%rsp), %rax
	movq	16(%rax), %rbp
	movl	$.L__unnamed_20, %edx
	movq	%rbp, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%rbp), %rax
	movslq	%r14d, %rbp
	movl	(%rax,%rbp,4), %r14d
	movq	8(%rsp), %rax
	movq	16(%rax), %rbx
	movl	$.L__unnamed_21, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	%r14d, (%rax,%r15,4)
	movq	8(%rsp), %rax
	movq	16(%rax), %rbx
	movl	$.L__unnamed_22, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	%r12d, (%rax,%rbp,4)
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	swap, .Lfunc_end5-swap
	.cfi_endproc
                                        # -- End function
	.globl	max_heapify             # -- Begin function max_heapify
	.p2align	4, 0x90
	.type	max_heapify,@function
max_heapify:                            # @max_heapify
	.cfi_startproc
# %bb.0:                                # %test8
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
	movl	%edx, %ebp
	movl	%esi, %r13d
	movq	%rdi, 8(%rsp)
	movq	16(%rdi), %rbx
	movl	$.L__unnamed_23, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%r13d, %r15
	movl	(%rax,%r15,4), %r14d
	leal	2(%r13,%r13), %ebx
	xorl	%eax, %eax
	movl	%ebp, 20(%rsp)          # 4-byte Spill
	cmpl	%ebp, %ebx
	jge	.LBB6_2
# %bb.1:                                # %then9
	movq	8(%rsp), %rax
	movq	16(%rax), %rbp
	movl	$.L__unnamed_24, %edx
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%rbp), %rcx
	movslq	%ebx, %rdx
	xorl	%eax, %eax
	cmpl	%r14d, (%rcx,%rdx,4)
	setg	%al
.LBB6_2:                                # %merge11
	leal	1(%r13,%r13), %ebp
	testl	%eax, %eax
	movl	%r13d, %r12d
	je	.LBB6_4
# %bb.3:                                # %then
	movq	8(%rsp), %rax
	movq	16(%rax), %r12
	movl	$.L__unnamed_25, %edx
	movq	%r12, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r12), %rax
	movslq	%ebx, %rcx
	movl	(%rax,%rcx,4), %r14d
	movl	%ebx, %r12d
.LBB6_4:                                # %test42
	xorl	%eax, %eax
	cmpl	20(%rsp), %ebp          # 4-byte Folded Reload
	jge	.LBB6_6
# %bb.5:                                # %then43
	movq	8(%rsp), %rax
	movq	16(%rax), %rbx
	movl	$.L__unnamed_26, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rcx
	movslq	%ebp, %rdx
	xorl	%eax, %eax
	cmpl	%r14d, (%rcx,%rdx,4)
	setg	%al
.LBB6_6:                                # %merge45
	testl	%eax, %eax
	je	.LBB6_7
# %bb.10:                               # %then39
	movq	8(%rsp), %rax
	movq	16(%rax), %rbx
	movl	$.L__unnamed_27, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %r14d
	movl	%ebp, %r12d
.LBB6_7:                                # %test78
	movq	8(%rsp), %rax
	movq	16(%rax), %rbx
	movl	$.L__unnamed_28, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	cmpl	(%rax,%r15,4), %r14d
	je	.LBB6_9
# %bb.8:                                # %then79
	movq	8(%rsp), %rdi
	movl	%r13d, %esi
	movl	%r12d, %edx
	callq	swap
	movq	8(%rsp), %rdi
	movl	%r12d, %esi
	movl	20(%rsp), %edx          # 4-byte Reload
	callq	max_heapify
.LBB6_9:                                # %merge81
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	max_heapify, .Lfunc_end6-max_heapify
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
	jg	.LBB7_3
	.p2align	4, 0x90
.LBB7_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB7_2
.LBB7_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbx, 8(%r14)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	jg	.LBB7_6
	.p2align	4, 0x90
.LBB7_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_29, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jle	.LBB7_5
.LBB7_6:                                # %end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end7:
	.size	create_array_test, .Lfunc_end7-create_array_test
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
	.asciz	"test/heap_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_15, 45

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
	.asciz	"test/heap_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_18, 46

	.type	.L__unnamed_19,@object  # @5
	.p2align	4
.L__unnamed_19:
	.asciz	"test/heap_sort.tig::36.37: Array out of bound"
	.size	.L__unnamed_19, 46

	.type	.L__unnamed_20,@object  # @6
	.p2align	4
.L__unnamed_20:
	.asciz	"test/heap_sort.tig::37.37: Array out of bound"
	.size	.L__unnamed_20, 46

	.type	.L__unnamed_21,@object  # @7
	.p2align	4
.L__unnamed_21:
	.asciz	"test/heap_sort.tig::39.23: Array out of bound"
	.size	.L__unnamed_21, 46

	.type	.L__unnamed_22,@object  # @8
	.p2align	4
.L__unnamed_22:
	.asciz	"test/heap_sort.tig::40.23: Array out of bound"
	.size	.L__unnamed_22, 46

	.type	.L__unnamed_23,@object  # @9
	.p2align	4
.L__unnamed_23:
	.asciz	"test/heap_sort.tig::45.38: Array out of bound"
	.size	.L__unnamed_23, 46

	.type	.L__unnamed_24,@object  # @10
	.p2align	4
.L__unnamed_24:
	.asciz	"test/heap_sort.tig::50.47: Array out of bound"
	.size	.L__unnamed_24, 46

	.type	.L__unnamed_25,@object  # @11
	.p2align	4
.L__unnamed_25:
	.asciz	"test/heap_sort.tig::51.40: Array out of bound"
	.size	.L__unnamed_25, 46

	.type	.L__unnamed_26,@object  # @12
	.p2align	4
.L__unnamed_26:
	.asciz	"test/heap_sort.tig::53.46: Array out of bound"
	.size	.L__unnamed_26, 46

	.type	.L__unnamed_27,@object  # @13
	.p2align	4
.L__unnamed_27:
	.asciz	"test/heap_sort.tig::54.40: Array out of bound"
	.size	.L__unnamed_27, 46

	.type	.L__unnamed_28,@object  # @14
	.p2align	4
.L__unnamed_28:
	.asciz	"test/heap_sort.tig::56.37: Array out of bound"
	.size	.L__unnamed_28, 46

	.type	.L__unnamed_29,@object  # @15
	.p2align	4
.L__unnamed_29:
	.asciz	"test/heap_sort.tig::80.41: Array out of bound"
	.size	.L__unnamed_29, 46

	.type	.L__unnamed_1,@object   # @16
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.asciz	"test/heap_sort.tig::94.23: Array out of bound"
	.size	.L__unnamed_4, 46

	.type	.L__unnamed_5,@object   # @20
	.p2align	4
.L__unnamed_5:
	.asciz	"test/heap_sort.tig::95.23: Array out of bound"
	.size	.L__unnamed_5, 46

	.type	.L__unnamed_6,@object   # @21
	.p2align	4
.L__unnamed_6:
	.asciz	"test/heap_sort.tig::96.23: Array out of bound"
	.size	.L__unnamed_6, 46

	.type	.L__unnamed_7,@object   # @22
	.p2align	4
.L__unnamed_7:
	.asciz	"test/heap_sort.tig::97.23: Array out of bound"
	.size	.L__unnamed_7, 46

	.type	.L__unnamed_8,@object   # @23
	.p2align	4
.L__unnamed_8:
	.asciz	"test/heap_sort.tig::98.23: Array out of bound"
	.size	.L__unnamed_8, 46

	.type	.L__unnamed_9,@object   # @24
	.p2align	4
.L__unnamed_9:
	.asciz	"test/heap_sort.tig::102.23: Array out of bound"
	.size	.L__unnamed_9, 47

	.type	.L__unnamed_10,@object  # @25
	.p2align	4
.L__unnamed_10:
	.asciz	"test/heap_sort.tig::103.23: Array out of bound"
	.size	.L__unnamed_10, 47

	.type	.L__unnamed_11,@object  # @26
	.p2align	4
.L__unnamed_11:
	.asciz	"test/heap_sort.tig::104.23: Array out of bound"
	.size	.L__unnamed_11, 47

	.type	.L__unnamed_12,@object  # @27
	.p2align	4
.L__unnamed_12:
	.asciz	"test/heap_sort.tig::105.23: Array out of bound"
	.size	.L__unnamed_12, 47

	.type	.L__unnamed_13,@object  # @28
	.p2align	4
.L__unnamed_13:
	.asciz	"test/heap_sort.tig::106.23: Array out of bound"
	.size	.L__unnamed_13, 47


	.section	".note.GNU-stack","",@progbits
