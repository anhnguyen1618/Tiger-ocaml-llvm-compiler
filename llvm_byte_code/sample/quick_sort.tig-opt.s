<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/quick_sort__code_begin"
"camlLlvm_byte_code/test/quick_sort__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/quick_sort__data_begin"
"camlLlvm_byte_code/test/quick_sort__data_begin":
	.text
	.globl	main                    # -- Begin function main
=======
	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/heap_sort__code_begin"
"_camlLlvm_byte_code/test/heap_sort__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/heap_sort__data_begin"
"_camlLlvm_byte_code/test/heap_sort__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
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
	callq	_create_array
Ltmp0:
	movq	%rax, %r15
	callq	_create_array_test
Ltmp1:
	movq	%rax, %rbx
	leaq	L___unnamed_1(%rip), %rdi
	callq	_tig_print
Ltmp2:
	movq	%r15, %rsi
	callq	_print_array
Ltmp3:
	leaq	L___unnamed_2(%rip), %rdi
	callq	_tig_print
Ltmp4:
	leaq	8(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rsi
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	callq	quick_sort
.Ltmp5:
	movl	$.L__unnamed_3, %edi
	callq	tig_print
.Ltmp6:
	movq	%r14, %rdi
=======
	callq	_heap_sort
Ltmp5:
	leaq	L___unnamed_3(%rip), %rdi
	callq	_tig_print
Ltmp6:
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	movq	%r15, %rsi
	callq	_print_array
Ltmp7:
	leaq	L___unnamed_4(%rip), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp8:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	_assert_equal_int
Ltmp9:
	leaq	L___unnamed_5(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp10:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	_assert_equal_int
Ltmp11:
	leaq	L___unnamed_6(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp12:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	_assert_equal_int
Ltmp13:
	leaq	L___unnamed_7(%rip), %rdx
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp14:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	_assert_equal_int
Ltmp15:
	leaq	L___unnamed_8(%rip), %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp16:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	_assert_equal_int
Ltmp17:
	movq	%r14, %rdi
	movq	%rbx, %rsi
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	callq	quick_sort
.Ltmp18:
=======
	callq	_heap_sort
Ltmp18:
	leaq	L___unnamed_9(%rip), %rdx
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp19:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	_assert_equal_int
Ltmp20:
	leaq	L___unnamed_10(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp21:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	_assert_equal_int
Ltmp22:
	leaq	L___unnamed_11(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp23:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	_assert_equal_int
Ltmp24:
	leaq	L___unnamed_12(%rip), %rdx
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp25:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	_assert_equal_int
Ltmp26:
	leaq	L___unnamed_13(%rip), %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp27:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	_assert_equal_int
Ltmp28:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_array            ## -- Begin function print_array
	.p2align	4, 0x90
_print_array:                           ## @print_array
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
	movq	%rsi, %rbx
	leaq	L___unnamed_14(%rip), %rdi
	callq	_tig_print
Ltmp29:
	movq	%rbx, %rdi
	callq	_tig_array_length
Ltmp30:
	movq	%rbx, %rdi
	callq	_tig_array_length
Ltmp31:
	movl	%eax, %r14d
	decl	%r14d
	xorl	%ebp, %ebp
	leaq	L___unnamed_15(%rip), %r15
	cmpl	%ebp, %r14d
	jl	LBB1_3
	.p2align	4, 0x90
LBB1_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movl	%ebp, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp32:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	_print_arr_int_ele
Ltmp33:
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	LBB1_2
LBB1_3:                                 ## %end
	leaq	L___unnamed_16(%rip), %rdi
	callq	_tig_print
Ltmp34:
	leaq	L___unnamed_17(%rip), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_tig_print              ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_create_array           ## -- Begin function create_array
	.p2align	4, 0x90
_create_array:                          ## @create_array
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$32, %edi
	callq	_malloc
Ltmp35:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$7, %eax
	ja	LBB2_3
	.p2align	4, 0x90
LBB2_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$7, %eax
	jbe	LBB2_2
LBB2_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp36:
	movq	%rax, %r14
	movl	$8, (%rax)
	movq	%rbx, 8(%rax)
	xorl	%ebx, %ebx
	leaq	L___unnamed_18(%rip), %r15
	cmpl	$7, %ebx
	ja	LBB2_6
	.p2align	4, 0x90
LBB2_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp37:
	movq	8(%r14), %r12
	movl	$50, %edi
	callq	_tig_random
Ltmp38:
	movl	%eax, (%r12,%rbx,4)
	incq	%rbx
	cmpl	$7, %ebx
	jbe	LBB2_5
LBB2_6:                                 ## %end12
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
                                        # -- End function
	.globl	quick_sort              # -- Begin function quick_sort
	.p2align	4, 0x90
	.type	quick_sort,@function
quick_sort:                             # @quick_sort
	.cfi_startproc
# %bb.0:                                # %entry
=======
                                        ## -- End function
	.globl	_heap_sort              ## -- Begin function heap_sort
	.p2align	4, 0x90
_heap_sort:                             ## @heap_sort
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rsi, %rdi
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	callq	tig_array_length
.Ltmp40:
                                        # kill: def %eax killed %eax def %rax
	leal	-1(%rax), %edx
	leaq	8(%rsp), %rdi
	xorl	%esi, %esi
	callq	sort
.Ltmp41:
=======
	callq	_tig_array_length
Ltmp39:
	movl	%eax, %ebx
	movl	%eax, 8(%rsp)
	movq	%rsp, %r14
	movq	%r14, %rdi
	callq	_create_max_heap
Ltmp40:
	leal	-1(%rbx), %edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	_swap
Ltmp41:
	addl	$-2, %ebx
	jmp	LBB3_1
	.p2align	4, 0x90
LBB3_2:                                 ## %loop
                                        ##   in Loop: Header=BB3_1 Depth=1
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	_max_heapify
Ltmp42:
	xorl	%esi, %esi
	movq	%r14, %rdi
	movl	%ebx, %edx
	callq	_swap
Ltmp43:
	decl	%ebx
LBB3_1:                                 ## %test
                                        ## =>This Inner Loop Header: Depth=1
	leal	1(%rbx), %edx
	cmpl	$2, %edx
	jge	LBB3_2
## %bb.3:                               ## %end
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	addq	$24, %rsp
	retq
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
.Lfunc_end3:
	.size	quick_sort, .Lfunc_end3-quick_sort
	.cfi_endproc
                                        # -- End function
	.globl	partition               # -- Begin function partition
	.p2align	4, 0x90
	.type	partition,@function
partition:                              # @partition
=======
	.cfi_endproc
                                        ## -- End function
	.globl	_create_max_heap        ## -- Begin function create_max_heap
	.p2align	4, 0x90
_create_max_heap:                       ## @create_max_heap
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
	movq	%rdi, %rbx
	movl	8(%rdi), %eax
	leal	-1(%rax), %ecx
	shrl	$31, %ecx
	leal	-1(%rax,%rcx), %ebp
	sarl	%ebp
	testl	%ebp, %ebp
	js	LBB4_3
	.p2align	4, 0x90
LBB4_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	8(%rbx), %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	_max_heapify
Ltmp44:
	decl	%ebp
	testl	%ebp, %ebp
	jns	LBB4_2
LBB4_3:                                 ## %end
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_swap                   ## -- Begin function swap
	.p2align	4, 0x90
_swap:                                  ## @swap
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.cfi_startproc
## %bb.0:                               ## %entry
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
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
=======
	pushq	%rax
	.cfi_def_cfa_offset 64
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edx, %r14d
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	movl	%esi, %ebp
	movq	%rdi, 8(%rsp)
	movq	8(%rdi), %rbx
	movl	$.L__unnamed_19, %edx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
.Ltmp42:
	movq	8(%rbx), %rax
	movslq	%r14d, %rbx
	movl	(%rax,%rbx,4), %r13d
	movq	8(%rsp), %rax
	movq	8(%rax), %rdi
	movl	$.L__unnamed_20, %edx
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp43:
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
.Ltmp44:
	movq	8(%rbx), %rax
	movslq	%ebp, %r14
	movl	(%rax,%r14,4), %r12d
	movq	8(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_22, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp45:
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
.Ltmp46:
	movq	8(%rbx), %rax
	movl	%r12d, (%rax,%r13,4)
	movl	20(%rsp), %r13d         # 4-byte Reload
	movq	8(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_24, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp47:
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
.Ltmp48:
	movq	8(%rbx), %rax
	movslq	%r15d, %rbx
	movl	(%rax,%rbx,4), %r14d
	movq	8(%rsp), %rax
	movq	8(%rax), %rbp
	movl	$.L__unnamed_26, %edx
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp49:
	movq	8(%rbp), %rax
	movl	%r13d, (%rax,%rbx,4)
	movq	8(%rsp), %rax
	movq	8(%rax), %r15
	movl	$.L__unnamed_27, %edx
	movq	%r15, %rdi
	movq	32(%rsp), %rbp          # 8-byte Reload
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp50:
	movq	8(%r15), %rax
	movl	%r14d, (%rax,%rbp,4)
	movl	%ebx, %eax
	addq	$40, %rsp
=======
	movl	%esi, %r15d
	movq	%rdi, %rbx
	movq	16(%rdi), %rbp
	leaq	L___unnamed_19(%rip), %rdx
	movq	%rbp, %rdi
	callq	_tig_check_array_bound
Ltmp45:
	movq	8(%rbp), %rax
	movslq	%r15d, %r15
	movl	(%rax,%r15,4), %r12d
	movq	16(%rbx), %rbp
	leaq	L___unnamed_20(%rip), %rdx
	movq	%rbp, %rdi
	movl	%r14d, %esi
	callq	_tig_check_array_bound
Ltmp46:
	movq	8(%rbp), %rax
	movslq	%r14d, %r14
	movl	(%rax,%r14,4), %r13d
	movq	16(%rbx), %rbp
	leaq	L___unnamed_21(%rip), %rdx
	movq	%rbp, %rdi
	movl	%r15d, %esi
	callq	_tig_check_array_bound
Ltmp47:
	movq	8(%rbp), %rax
	movl	%r13d, (%rax,%r15,4)
	movq	16(%rbx), %rbx
	leaq	L___unnamed_22(%rip), %rdx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	_tig_check_array_bound
Ltmp48:
	movq	8(%rbx), %rax
	movl	%r12d, (%rax,%r14,4)
	addq	$8, %rsp
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
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
=======
	.cfi_endproc
                                        ## -- End function
	.globl	_max_heapify            ## -- Begin function max_heapify
	.p2align	4, 0x90
_max_heapify:                           ## @max_heapify
	.cfi_startproc
## %bb.0:                               ## %entry
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
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
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
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
.Ltmp51:
	movl	%eax, %r14d
	leal	-1(%r14), %edx
	movq	8(%rsp), %rdi
	movl	%ebp, %esi
	callq	sort
.Ltmp52:
	leal	1(%r14), %esi
	movq	8(%rsp), %rdi
	movl	%ebx, %edx
	callq	sort
.Ltmp53:
.LBB5_2:                                # %merge
	addq	$16, %rsp
=======
	movl	%edx, 4(%rsp)           ## 4-byte Spill
	movl	%esi, %r13d
	movq	%rdi, %r12
	movq	%rdi, 8(%rsp)           ## 8-byte Spill
	jmp	LBB6_1
	.p2align	4, 0x90
LBB6_10:                                ## %then79
                                        ##   in Loop: Header=BB6_1 Depth=1
	movq	%r12, %rdi
	movl	%r13d, %esi
	movl	%r15d, %edx
	callq	_swap
Ltmp55:
	movl	%r15d, %r13d
LBB6_1:                                 ## %tailrecurse
                                        ## =>This Inner Loop Header: Depth=1
	movq	16(%r12), %rbx
	movq	%rbx, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_23(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp49:
	movq	8(%rbx), %rax
	movslq	%r13d, %rcx
	movl	(%rax,%rcx,4), %ebp
	leal	1(%r13,%r13), %r14d
	movq	%r12, %rax
	leal	2(%r13,%r13), %r12d
	cmpl	4(%rsp), %r12d          ## 4-byte Folded Reload
	movq	%rcx, 16(%rsp)          ## 8-byte Spill
	movl	%ebp, (%rsp)            ## 4-byte Spill
	jge	LBB6_2
## %bb.3:                               ## %then9
                                        ##   in Loop: Header=BB6_1 Depth=1
	movq	16(%rax), %rbx
	movq	%rbx, %rdi
	movl	%r12d, %esi
	leaq	L___unnamed_24(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp50:
	movq	8(%rbx), %rax
	movslq	%r12d, %rbx
	cmpl	%ebp, (%rax,%rbx,4)
	movl	%r13d, %r15d
	movl	%r14d, %ebp
	jle	LBB6_5
## %bb.4:                               ## %then
                                        ##   in Loop: Header=BB6_1 Depth=1
	movq	8(%rsp), %rax           ## 8-byte Reload
	movq	16(%rax), %r15
	movq	%r15, %rdi
	movl	%r12d, %esi
	leaq	L___unnamed_25(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp51:
	movq	8(%r15), %rax
	movl	(%rax,%rbx,4), %eax
	movl	%eax, (%rsp)            ## 4-byte Spill
	movl	%r12d, %r15d
LBB6_5:                                 ## %merge
                                        ##   in Loop: Header=BB6_1 Depth=1
	cmpl	4(%rsp), %ebp           ## 4-byte Folded Reload
	jge	LBB6_6
LBB6_7:                                 ## %then43
                                        ##   in Loop: Header=BB6_1 Depth=1
	movq	8(%rsp), %r12           ## 8-byte Reload
	movq	16(%r12), %rbx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	leaq	L___unnamed_26(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp52:
	movq	8(%rbx), %rax
	movslq	%ebp, %rbx
	movl	(%rsp), %r14d           ## 4-byte Reload
	cmpl	%r14d, (%rax,%rbx,4)
	jle	LBB6_9
## %bb.8:                               ## %then39
                                        ##   in Loop: Header=BB6_1 Depth=1
	movq	16(%r12), %r15
	movq	%r15, %rdi
	movl	%ebp, %esi
	leaq	L___unnamed_27(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp53:
	movq	8(%r15), %rax
	movl	(%rax,%rbx,4), %r14d
	movl	%ebp, %r15d
	jmp	LBB6_9
	.p2align	4, 0x90
LBB6_2:                                 ##   in Loop: Header=BB6_1 Depth=1
	movl	%r13d, %r15d
	movl	%r14d, %ebp
	cmpl	4(%rsp), %ebp           ## 4-byte Folded Reload
	jl	LBB6_7
LBB6_6:                                 ##   in Loop: Header=BB6_1 Depth=1
	movq	8(%rsp), %r12           ## 8-byte Reload
	movl	(%rsp), %r14d           ## 4-byte Reload
LBB6_9:                                 ## %merge41
                                        ##   in Loop: Header=BB6_1 Depth=1
	movq	16(%r12), %rbx
	movq	%rbx, %rdi
	movq	16(%rsp), %rbp          ## 8-byte Reload
	movl	%ebp, %esi
	leaq	L___unnamed_28(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp54:
	movq	8(%rbx), %rax
	cmpl	(%rax,%rbp,4), %r14d
	jne	LBB6_10
## %bb.11:                              ## %merge81
	addq	$24, %rsp
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
.Lfunc_end5:
	.size	sort, .Lfunc_end5-sort
=======
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.cfi_endproc
                                        ## -- End function
	.globl	_create_array_test      ## -- Begin function create_array_test
	.p2align	4, 0x90
_create_array_test:                     ## @create_array_test
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
	movl	$20, %edi
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	callq	malloc
.Ltmp54:
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
.Ltmp55:
=======
	callq	_malloc
Ltmp56:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	LBB7_3
	.p2align	4, 0x90
LBB7_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jbe	LBB7_2
LBB7_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp57:
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	movq	%rax, %r14
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	leaq	L___unnamed_29(%rip), %r15
	cmpl	$4, %ebx
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	jg	.LBB6_6
	.p2align	4, 0x90
.LBB6_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_28, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp56:
=======
	ja	LBB7_6
	.p2align	4, 0x90
LBB7_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp58:
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	jle	.LBB6_5
.LBB6_6:                                # %end12
=======
	jbe	LBB7_5
LBB7_6:                                 ## %end12
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
.Lfunc_end6:
	.size	create_array_test, .Lfunc_end6-create_array_test
=======
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L___unnamed_14:                         ## @0
	.asciz	"["

<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	.type	.L__unnamed_15,@object  # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_15:
	.asciz	"test/quick_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_15, 46
=======
	.p2align	4               ## @1
L___unnamed_15:
	.asciz	"test/heap_sort.tig::6.67: Array out of bound"
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s

L___unnamed_16:                         ## @2
	.space	1

L___unnamed_17:                         ## @3
	.asciz	"]"

<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
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

	.type	.L__unnamed_1,@object   # @15
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
=======
	.p2align	4               ## @4
L___unnamed_18:
	.asciz	"test/heap_sort.tig::16.41: Array out of bound"

	.p2align	4               ## @5
L___unnamed_19:
	.asciz	"test/heap_sort.tig::36.37: Array out of bound"

	.p2align	4               ## @6
L___unnamed_20:
	.asciz	"test/heap_sort.tig::37.37: Array out of bound"

	.p2align	4               ## @7
L___unnamed_21:
	.asciz	"test/heap_sort.tig::39.23: Array out of bound"

	.p2align	4               ## @8
L___unnamed_22:
	.asciz	"test/heap_sort.tig::40.23: Array out of bound"

	.p2align	4               ## @9
L___unnamed_23:
	.asciz	"test/heap_sort.tig::45.38: Array out of bound"

	.p2align	4               ## @10
L___unnamed_24:
	.asciz	"test/heap_sort.tig::50.47: Array out of bound"

	.p2align	4               ## @11
L___unnamed_25:
	.asciz	"test/heap_sort.tig::51.40: Array out of bound"

	.p2align	4               ## @12
L___unnamed_26:
	.asciz	"test/heap_sort.tig::53.46: Array out of bound"

	.p2align	4               ## @13
L___unnamed_27:
	.asciz	"test/heap_sort.tig::54.40: Array out of bound"

	.p2align	4               ## @14
L___unnamed_28:
	.asciz	"test/heap_sort.tig::56.37: Array out of bound"

	.p2align	4               ## @15
L___unnamed_29:
	.asciz	"test/heap_sort.tig::80.41: Array out of bound"

L___unnamed_1:                          ## @16
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.asciz	"Before sorting"

<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	.type	.L__unnamed_2,@object   # @16
.L__unnamed_2:
=======
L___unnamed_2:                          ## @17
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.asciz	"=============="

<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	.type	.L__unnamed_3,@object   # @17
.L__unnamed_3:
=======
L___unnamed_3:                          ## @18
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.asciz	"After sorting"

<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
	.type	.L__unnamed_4,@object   # @18
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/quick_sort.tig::78.23: Array out of bound"
	.size	.L__unnamed_4, 47

	.type	.L__unnamed_5,@object   # @19
	.p2align	4
.L__unnamed_5:
	.asciz	"test/quick_sort.tig::79.23: Array out of bound"
	.size	.L__unnamed_5, 47

	.type	.L__unnamed_6,@object   # @20
	.p2align	4
.L__unnamed_6:
	.asciz	"test/quick_sort.tig::80.23: Array out of bound"
	.size	.L__unnamed_6, 47

	.type	.L__unnamed_7,@object   # @21
	.p2align	4
.L__unnamed_7:
	.asciz	"test/quick_sort.tig::81.23: Array out of bound"
	.size	.L__unnamed_7, 47

	.type	.L__unnamed_8,@object   # @22
	.p2align	4
.L__unnamed_8:
	.asciz	"test/quick_sort.tig::82.23: Array out of bound"
	.size	.L__unnamed_8, 47

	.type	.L__unnamed_9,@object   # @23
	.p2align	4
.L__unnamed_9:
	.asciz	"test/quick_sort.tig::86.23: Array out of bound"
	.size	.L__unnamed_9, 47

	.type	.L__unnamed_10,@object  # @24
	.p2align	4
.L__unnamed_10:
	.asciz	"test/quick_sort.tig::87.23: Array out of bound"
	.size	.L__unnamed_10, 47

	.type	.L__unnamed_11,@object  # @25
	.p2align	4
.L__unnamed_11:
	.asciz	"test/quick_sort.tig::88.23: Array out of bound"
	.size	.L__unnamed_11, 47

	.type	.L__unnamed_12,@object  # @26
	.p2align	4
.L__unnamed_12:
	.asciz	"test/quick_sort.tig::89.23: Array out of bound"
	.size	.L__unnamed_12, 47

	.type	.L__unnamed_13,@object  # @27
	.p2align	4
.L__unnamed_13:
	.asciz	"test/quick_sort.tig::90.23: Array out of bound"
	.size	.L__unnamed_13, 47


	.text
	.globl	"camlLlvm_byte_code/test/quick_sort__code_end"
"camlLlvm_byte_code/test/quick_sort__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/quick_sort__data_end"
"camlLlvm_byte_code/test/quick_sort__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/quick_sort__frametable"
"camlLlvm_byte_code/test/quick_sort__frametable":
	.short	57
=======
	.p2align	4               ## @19
L___unnamed_4:
	.asciz	"test/heap_sort.tig::94.23: Array out of bound"

	.p2align	4               ## @20
L___unnamed_5:
	.asciz	"test/heap_sort.tig::95.23: Array out of bound"

	.p2align	4               ## @21
L___unnamed_6:
	.asciz	"test/heap_sort.tig::96.23: Array out of bound"

	.p2align	4               ## @22
L___unnamed_7:
	.asciz	"test/heap_sort.tig::97.23: Array out of bound"

	.p2align	4               ## @23
L___unnamed_8:
	.asciz	"test/heap_sort.tig::98.23: Array out of bound"

	.p2align	4               ## @24
L___unnamed_9:
	.asciz	"test/heap_sort.tig::102.23: Array out of bound"

	.p2align	4               ## @25
L___unnamed_10:
	.asciz	"test/heap_sort.tig::103.23: Array out of bound"

	.p2align	4               ## @26
L___unnamed_11:
	.asciz	"test/heap_sort.tig::104.23: Array out of bound"

	.p2align	4               ## @27
L___unnamed_12:
	.asciz	"test/heap_sort.tig::105.23: Array out of bound"

	.p2align	4               ## @28
L___unnamed_13:
	.asciz	"test/heap_sort.tig::106.23: Array out of bound"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/heap_sort__code_end"
"_camlLlvm_byte_code/test/heap_sort__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/heap_sort__data_end"
"_camlLlvm_byte_code/test/heap_sort__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/heap_sort__frametable"
"_camlLlvm_byte_code/test/heap_sort__frametable":
	.short	59
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
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
	.quad	Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp12
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp13
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp14
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp15
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp16
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp17
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp18
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp19
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp20
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp22
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp23
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp24
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp25
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp26
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp27
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp28
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for print_array
	.quad	Ltmp29
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp30
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp31
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp32
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp33
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp34
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for create_array
	.quad	Ltmp35
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp36
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp37
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp38
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for heap_sort
	.quad	Ltmp39
	.short	40
	.short	0
	.p2align	3
<<<<<<< HEAD:llvm_byte_code/sample/quick_sort.tig-opt.s
                                        # live roots for quick_sort
	.quad	.Ltmp40
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp41
	.short	24
	.short	0
	.p2align	3
                                        # live roots for partition
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
	.quad	.Ltmp46
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp47
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp48
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp49
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp50
	.short	88
	.short	0
	.p2align	3
                                        # live roots for sort
	.quad	.Ltmp51
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp52
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp53
	.short	40
	.short	0
	.p2align	3
                                        # live roots for create_array_test
	.quad	.Ltmp54
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp55
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp56
=======
	.quad	Ltmp40
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp41
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp42
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp43
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for create_max_heap
	.quad	Ltmp44
	.short	24
	.short	0
	.p2align	3
                                        ## live roots for swap
	.quad	Ltmp45
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp46
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp47
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp48
	.short	56
	.short	0
	.p2align	3
                                        ## live roots for max_heapify
	.quad	Ltmp49
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp50
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp51
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp52
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp53
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp54
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp55
	.short	72
	.short	0
	.p2align	3
                                        ## live roots for create_array_test
	.quad	Ltmp56
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp57
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp58
>>>>>>> a82b116507b3ffa5397d54e2b1c57e036dbd1933:llvm_byte_code/test/heap_sort.tig-opt.s
	.short	40
	.short	0
	.p2align	3
.subsections_via_symbols