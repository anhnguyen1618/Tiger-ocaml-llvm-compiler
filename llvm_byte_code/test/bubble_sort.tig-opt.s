	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/bubble_sort__code_begin"
"camlLlvm_byte_code/test/bubble_sort__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/bubble_sort__data_begin"
"camlLlvm_byte_code/test/bubble_sort__data_begin":
	.text
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
.Ltmp0:
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	create_array_test
.Ltmp1:
	movq	%rax, %rbx
	movl	$.L__unnamed_1, %edi
	callq	tig_print
.Ltmp2:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
.Ltmp3:
	movl	$.L__unnamed_2, %edi
	callq	tig_print
.Ltmp4:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	bubble_sort
.Ltmp5:
	movl	$.L__unnamed_3, %edi
	callq	tig_print
.Ltmp6:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
.Ltmp7:
	xorl	%esi, %esi
	movl	$.L__unnamed_4, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp8:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
.Ltmp9:
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp10:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
.Ltmp11:
	movl	$2, %esi
	movl	$.L__unnamed_6, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp12:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
.Ltmp13:
	movl	$3, %esi
	movl	$.L__unnamed_7, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp14:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
.Ltmp15:
	movl	$4, %esi
	movl	$.L__unnamed_8, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp16:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
.Ltmp17:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	bubble_sort
.Ltmp18:
	xorl	%esi, %esi
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp19:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
.Ltmp20:
	movl	$1, %esi
	movl	$.L__unnamed_10, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp21:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
.Ltmp22:
	movl	$2, %esi
	movl	$.L__unnamed_11, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp23:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
.Ltmp24:
	movl	$3, %esi
	movl	$.L__unnamed_12, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp25:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
.Ltmp26:
	movl	$4, %esi
	movl	$.L__unnamed_13, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp27:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
.Ltmp28:
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
.Ltmp29:
	movq	%rbx, %rdi
	callq	tig_array_length
.Ltmp30:
	movq	%rbx, %rdi
	callq	tig_array_length
.Ltmp31:
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
.Ltmp32:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	print_arr_int_ele
.Ltmp33:
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	.LBB1_2
.LBB1_3:                                # %end
	movl	$.L__unnamed_16, %edi
	callq	tig_print
.Ltmp34:
	movl	$.L__unnamed_17, %edi
	callq	tig_print
.Ltmp35:
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
.Ltmp36:
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
.Ltmp37:
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
.Ltmp38:
	movq	8(%r14), %r15
	movl	$50, %edi
	callq	tig_random
.Ltmp39:
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
	.globl	bubble_sort             # -- Begin function bubble_sort
	.p2align	4, 0x90
	.type	bubble_sort,@function
bubble_sort:                            # @bubble_sort
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
	movq	%rdi, 32(%rsp)
	movq	%rsi, 16(%rsp)          # 8-byte Spill
	movq	%rsi, %rdi
	callq	tig_array_length
.Ltmp40:
	xorl	%edi, %edi
	addl	$-2, %eax
	movl	%eax, 8(%rsp)           # 4-byte Spill
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
	movl	4(%rsp), %edi           # 4-byte Reload
.LBB3_1:                                # %test
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	callq	tig_not
.Ltmp41:
	cmpl	$1, %eax
	jne	.LBB3_8
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$1, %r15d
	movl	$1, 4(%rsp)             # 4-byte Folded Spill
	jmp	.LBB3_3
	.p2align	4, 0x90
.LBB3_7:                                # %merge
                                        #   in Loop: Header=BB3_3 Depth=2
	incl	%r15d
.LBB3_3:                                # %test6
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%r15), %ebx
	cmpl	%ebx, 8(%rsp)           # 4-byte Folded Reload
	jl	.LBB3_4
# %bb.5:                                # %test20
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$.L__unnamed_19, %edx
	movq	16(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp42:
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	movl	(%rax,%rcx,4), %r12d
	movl	$.L__unnamed_20, %edx
	movq	%rbp, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp43:
	movq	8(%rbp), %rax
	movslq	%r15d, %r14
	movl	(%rax,%r14,4), %r13d
	movl	%r12d, 12(%rsp)         # 4-byte Spill
	cmpl	%r13d, %r12d
	jle	.LBB3_7
# %bb.6:                                # %then
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$.L__unnamed_21, %edx
	movq	16(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp44:
	movq	8(%rbp), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	movl	%r13d, (%rax,%rcx,4)
	movl	$.L__unnamed_22, %edx
	movq	%rbp, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp45:
	movq	8(%rbp), %rax
	movl	12(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, (%rax,%r14,4)
	movl	$0, 4(%rsp)             # 4-byte Folded Spill
	jmp	.LBB3_7
.LBB3_8:                                # %end
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	bubble_sort, .Lfunc_end3-bubble_sort
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
.Ltmp46:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB4_2
.LBB4_3:                                # %end
	movl	$16, %edi
	callq	malloc
.Ltmp47:
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbx, 8(%r14)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	jg	.LBB4_6
	.p2align	4, 0x90
.LBB4_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_23, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp48:
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jle	.LBB4_5
.LBB4_6:                                # %end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end4:
	.size	create_array_test, .Lfunc_end4-create_array_test
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
	.asciz	"test/bubble_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_15, 47

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
	.asciz	"test/bubble_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_18, 48

	.type	.L__unnamed_19,@object  # @5
	.p2align	4
.L__unnamed_19:
	.asciz	"test/bubble_sort.tig::30.46: Array out of bound"
	.size	.L__unnamed_19, 48

	.type	.L__unnamed_20,@object  # @6
	.p2align	4
.L__unnamed_20:
	.asciz	"test/bubble_sort.tig::31.43: Array out of bound"
	.size	.L__unnamed_20, 48

	.type	.L__unnamed_21,@object  # @7
	.p2align	4
.L__unnamed_21:
	.asciz	"test/bubble_sort.tig::35.35: Array out of bound"
	.size	.L__unnamed_21, 48

	.type	.L__unnamed_22,@object  # @8
	.p2align	4
.L__unnamed_22:
	.asciz	"test/bubble_sort.tig::36.35: Array out of bound"
	.size	.L__unnamed_22, 48

	.type	.L__unnamed_23,@object  # @9
	.p2align	4
.L__unnamed_23:
	.asciz	"test/bubble_sort.tig::52.41: Array out of bound"
	.size	.L__unnamed_23, 48

	.type	.L__unnamed_1,@object   # @10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @11
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @12
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14

	.type	.L__unnamed_4,@object   # @13
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/bubble_sort.tig::65.23: Array out of bound"
	.size	.L__unnamed_4, 48

	.type	.L__unnamed_5,@object   # @14
	.p2align	4
.L__unnamed_5:
	.asciz	"test/bubble_sort.tig::66.23: Array out of bound"
	.size	.L__unnamed_5, 48

	.type	.L__unnamed_6,@object   # @15
	.p2align	4
.L__unnamed_6:
	.asciz	"test/bubble_sort.tig::67.23: Array out of bound"
	.size	.L__unnamed_6, 48

	.type	.L__unnamed_7,@object   # @16
	.p2align	4
.L__unnamed_7:
	.asciz	"test/bubble_sort.tig::68.23: Array out of bound"
	.size	.L__unnamed_7, 48

	.type	.L__unnamed_8,@object   # @17
	.p2align	4
.L__unnamed_8:
	.asciz	"test/bubble_sort.tig::69.23: Array out of bound"
	.size	.L__unnamed_8, 48

	.type	.L__unnamed_9,@object   # @18
	.p2align	4
.L__unnamed_9:
	.asciz	"test/bubble_sort.tig::73.23: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_10,@object  # @19
	.p2align	4
.L__unnamed_10:
	.asciz	"test/bubble_sort.tig::74.23: Array out of bound"
	.size	.L__unnamed_10, 48

	.type	.L__unnamed_11,@object  # @20
	.p2align	4
.L__unnamed_11:
	.asciz	"test/bubble_sort.tig::75.23: Array out of bound"
	.size	.L__unnamed_11, 48

	.type	.L__unnamed_12,@object  # @21
	.p2align	4
.L__unnamed_12:
	.asciz	"test/bubble_sort.tig::76.23: Array out of bound"
	.size	.L__unnamed_12, 48

	.type	.L__unnamed_13,@object  # @22
	.p2align	4
.L__unnamed_13:
	.asciz	"test/bubble_sort.tig::77.23: Array out of bound"
	.size	.L__unnamed_13, 48


	.text
	.globl	"camlLlvm_byte_code/test/bubble_sort__code_end"
"camlLlvm_byte_code/test/bubble_sort__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/bubble_sort__data_end"
"camlLlvm_byte_code/test/bubble_sort__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/bubble_sort__frametable"
"camlLlvm_byte_code/test/bubble_sort__frametable":
	.short	49
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp12
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp13
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp14
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp15
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp16
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp17
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp18
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp19
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp20
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp22
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp23
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp24
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp25
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp26
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp27
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp28
	.short	40
	.short	0
	.p2align	3
                                        # live roots for print_array
	.quad	.Ltmp29
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp30
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp31
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp32
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp33
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp34
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp35
	.short	40
	.short	0
	.p2align	3
                                        # live roots for create_array
	.quad	.Ltmp36
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp37
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp38
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp39
	.short	40
	.short	0
	.p2align	3
                                        # live roots for bubble_sort
	.quad	.Ltmp40
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp41
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp42
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp43
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp44
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp45
	.short	88
	.short	0
	.p2align	3
                                        # live roots for create_array_test
	.quad	.Ltmp46
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp47
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp48
	.short	40
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
