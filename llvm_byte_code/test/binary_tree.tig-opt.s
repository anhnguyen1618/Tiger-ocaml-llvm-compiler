	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/binary_tree__code_begin"
"_camlLlvm_byte_code/test/binary_tree__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/binary_tree__data_begin"
"_camlLlvm_byte_code/test/binary_tree__data_begin":
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
	movl	$24, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %r15
	movl	$5, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movl	$24, %edi
	callq	_malloc
Ltmp1:
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	movl	$1, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movl	$24, %edi
	callq	_malloc
Ltmp2:
	movq	%rax, %rbx
	movl	$2, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movl	$24, %edi
	callq	_malloc
Ltmp3:
	movq	%rax, %r12
	movl	$3, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movl	$24, %edi
	callq	_malloc
Ltmp4:
	movq	%rax, %r13
	movl	$6, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movl	$24, %edi
	callq	_malloc
Ltmp5:
	movq	%rax, %rbp
	movl	$8, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movl	$24, %edi
	callq	_malloc
Ltmp6:
	movq	%rax, %r14
	movl	$9, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	leaq	L___unnamed_1(%rip), %rsi
	movq	%r15, %rdi
	callq	_tig_check_null_pointer
Ltmp7:
	movq	%rbx, 8(%r15)
	leaq	L___unnamed_2(%rip), %rsi
	movq	%r15, %rdi
	callq	_tig_check_null_pointer
Ltmp8:
	movq	%rbp, 16(%r15)
	leaq	L___unnamed_3(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp9:
	movq	8(%rsp), %rax           ## 8-byte Reload
	movq	%rax, 8(%rbx)
	leaq	L___unnamed_4(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp10:
	movq	%r12, 16(%rbx)
	leaq	L___unnamed_5(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp11:
	movq	%r13, 8(%rbp)
	leaq	L___unnamed_6(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp12:
	movq	%r14, 16(%rbp)
	leaq	16(%rsp), %rbx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_eval_sum
Ltmp13:
	movl	%eax, %edi
	callq	_tig_print_int
Ltmp14:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_eval_sum
Ltmp15:
	movl	$34, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp16:
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_sum               ## -- Begin function eval_sum
	.p2align	4, 0x90
_eval_sum:                              ## @eval_sum
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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	xorl	%ebp, %ebp
	leaq	L___unnamed_7(%rip), %r12
	leaq	L___unnamed_8(%rip), %r13
	jmp	LBB1_1
	.p2align	4, 0x90
LBB1_2:                                 ## %else
                                        ##   in Loop: Header=BB1_1 Depth=1
	movq	%rbx, %rdi
	leaq	L___unnamed_9(%rip), %rsi
	callq	_tig_check_null_pointer
Ltmp18:
	addl	(%rbx), %ebp
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	_tig_check_null_pointer
Ltmp19:
	movq	8(%rbx), %rsi
	movq	%r14, %rdi
	callq	_eval_sum
Ltmp20:
	movl	%eax, %r15d
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	_tig_check_null_pointer
Ltmp21:
	movq	16(%rbx), %rbx
	addl	%r15d, %ebp
LBB1_1:                                 ## %tailrecurse
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	_tig_nillable
Ltmp17:
	testl	%eax, %eax
	je	LBB1_2
## %bb.3:                               ## %merge
	movl	%ebp, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_9:
	.asciz	"test/binary_tree.tig::7.17: Nil pointer exception!"

	.p2align	4               ## @1
L___unnamed_7:
	.asciz	"test/binary_tree.tig::7.38: Nil pointer exception!"

	.p2align	4               ## @2
L___unnamed_8:
	.asciz	"test/binary_tree.tig::7.60: Nil pointer exception!"

	.p2align	4               ## @3
L___unnamed_1:
	.asciz	"test/binary_tree.tig::17.8: Nil pointer exception!"

	.p2align	4               ## @4
L___unnamed_2:
	.asciz	"test/binary_tree.tig::18.8: Nil pointer exception!"

	.p2align	4               ## @5
L___unnamed_3:
	.asciz	"test/binary_tree.tig::19.5: Nil pointer exception!"

	.p2align	4               ## @6
L___unnamed_4:
	.asciz	"test/binary_tree.tig::20.5: Nil pointer exception!"

	.p2align	4               ## @7
L___unnamed_5:
	.asciz	"test/binary_tree.tig::21.5: Nil pointer exception!"

	.p2align	4               ## @8
L___unnamed_6:
	.asciz	"test/binary_tree.tig::22.5: Nil pointer exception!"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/binary_tree__code_end"
"_camlLlvm_byte_code/test/binary_tree__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/binary_tree__data_end"
"_camlLlvm_byte_code/test/binary_tree__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/binary_tree__frametable"
"_camlLlvm_byte_code/test/binary_tree__frametable":
	.short	22
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp5
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp8
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp12
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp13
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp14
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp15
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp16
	.short	72
	.short	0
	.p2align	3
                                        ## live roots for eval_sum
	.quad	Ltmp17
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp18
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp19
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp20
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp21
	.short	56
	.short	0
	.p2align	3
.subsections_via_symbols
