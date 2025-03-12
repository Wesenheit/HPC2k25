	.text
	.file	"dft.cpp"
                                        # Start of file scope inline assembly
	.globl	_ZSt21ios_base_library_initv

                                        # End of file scope inline assembly
	.globl	_Z7timeNowv                     # -- Begin function _Z7timeNowv
	.p2align	4, 0x90
	.type	_Z7timeNowv,@function
_Z7timeNowv:                            # @_Z7timeNowv
	.cfi_startproc
# %bb.0:                                # %entry
	jmp	_ZNSt6chrono3_V212system_clock3nowEv@PLT # TAILCALL
.Lfunc_end0:
	.size	_Z7timeNowv, .Lfunc_end0-_Z7timeNowv
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function _Z8compressjiPKhPfS1_
.LCPI1_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI1_1:
	.quad	0x401921fb54442d18              # double 6.2831853071795862
	.text
	.globl	_Z8compressjiPKhPfS1_
	.p2align	4, 0x90
	.type	_Z8compressjiPKhPfS1_,@function
_Z8compressjiPKhPfS1_:                  # @_Z8compressjiPKhPfS1_
	.cfi_startproc
# %bb.0:                                # %entry
	testl	%esi, %esi
	jle	.LBB1_7
# %bb.1:                                # %entry
	testl	%edi, %edi
	je	.LBB1_7
# %bb.2:                                # %for.cond1.preheader.us.preheader
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %r15
	movq	%rdx, %r12
	movl	%edi, %ebx
	cvtsi2sd	%rbx, %xmm0
	movl	%esi, %eax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	xorl	%eax, %eax
	movq	%rax, (%rsp)                    # 8-byte Spill
	leaq	20(%rsp), %rbp
	leaq	16(%rsp), %r14
	movsd	%xmm1, 40(%rsp)                 # 8-byte Spill
	movq	%r8, 32(%rsp)                   # 8-byte Spill
	.p2align	4, 0x90
.LBB1_3:                                # %for.cond1.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
	xorps	%xmm0, %xmm0
	cvtsi2sdl	(%rsp), %xmm0           # 4-byte Folded Reload
	mulsd	.LCPI1_1(%rip), %xmm0
	movsd	%xmm0, 48(%rsp)                 # 8-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB1_4:                                # %for.body4.us
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r13d, %xmm0
	mulsd	48(%rsp), %xmm0                 # 8-byte Folded Reload
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movzbl	(%r12,%r13), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	movss	%xmm1, 12(%rsp)                 # 4-byte Spill
	movq	%rbp, %rdi
	movq	%r14, %rsi
	callq	sincosf@PLT
	movq	32(%rsp), %r8                   # 8-byte Reload
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	mulss	16(%rsp), %xmm0
	movq	(%rsp), %rdi                    # 8-byte Reload
	addss	(%r15,%rdi,4), %xmm0
	movss	%xmm0, (%r15,%rdi,4)
	movzbl	(%r12,%r13), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	20(%rsp), %xmm0
	movss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	%xmm1, (%r8,%rdi,4)
	movsd	40(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	incq	%r13
	cmpq	%r13, %rbx
	jne	.LBB1_4
# %bb.5:                                # %for.cond1.for.cond.cleanup3_crit_edge.us
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	(%rsp), %rdi                    # 8-byte Reload
	incq	%rdi
	movq	%rdi, %rax
	movq	%rdi, (%rsp)                    # 8-byte Spill
	cmpq	24(%rsp), %rdi                  # 8-byte Folded Reload
	jne	.LBB1_3
# %bb.6:
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	.cfi_restore %r12
	.cfi_restore %r13
	.cfi_restore %r14
	.cfi_restore %r15
	.cfi_restore %rbp
.LBB1_7:                                # %for.cond.cleanup
	retq
.Lfunc_end1:
	.size	_Z8compressjiPKhPfS1_, .Lfunc_end1-_Z8compressjiPKhPfS1_
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _Z10decompressjiPhPKfS1_
.LCPI2_0:
	.long	0x3f800000                      # float 1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI2_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI2_2:
	.quad	0x401921fb54442d18              # double 6.2831853071795862
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI2_3:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI2_4:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
.LCPI2_5:
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	8                               # 0x8
	.text
	.globl	_Z10decompressjiPhPKfS1_
	.p2align	4, 0x90
	.type	_Z10decompressjiPhPKfS1_,@function
_Z10decompressjiPhPKfS1_:               # @_Z10decompressjiPhPKfS1_
	.cfi_startproc
# %bb.0:                                # %entry
	testl	%edi, %edi
	je	.LBB2_17
# %bb.1:                                # %if.end.i.i.i.i.i.i.i
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
	subq	$392, %rsp                      # imm = 0x188
	.cfi_def_cfa_offset 448
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movl	%edi, %ebx
	movl	%edi, %ebp
	leaq	(,%rbp,4), %r14
	movq	%r14, %rdi
	movl	%esi, 16(%rsp)                  # 4-byte Spill
	callq	_Znwm@PLT
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	memset@PLT
	movl	16(%rsp), %eax                  # 4-byte Reload
	movq	%rbp, %rdx
	cvtsi2ss	%rbp, %xmm0
	movss	.LCPI2_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movaps	%xmm1, 160(%rsp)                # 16-byte Spill
	testl	%eax, %eax
	jle	.LBB2_2
# %bb.8:                                # %for.cond2.preheader.us.preheader
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rdx, %xmm0
	movl	%eax, %ecx
	movq	%rcx, 120(%rsp)                 # 8-byte Spill
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	andl	$-8, %ecx
	movq	%rcx, 184(%rsp)                 # 8-byte Spill
	movsd	.LCPI2_1(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	unpcklpd	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movl	%eax, %ebx
	shrl	$3, %ebx
	shlq	$5, %rbx
	xorl	%r9d, %r9d
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	20(%rsp), %r10
	leaq	28(%rsp), %r11
	movq	%r13, 200(%rsp)                 # 8-byte Spill
	movq	%rdx, 192(%rsp)                 # 8-byte Spill
	movq	32(%rsp), %rdi                  # 8-byte Reload
	movapd	%xmm1, 224(%rsp)                # 16-byte Spill
	movapd	%xmm0, 272(%rsp)                # 16-byte Spill
	movq	%rbx, 216(%rsp)                 # 8-byte Spill
	jmp	.LBB2_9
	.p2align	4, 0x90
.LBB2_15:                               # %for.cond2.for.cond.cleanup4_crit_edge.us
                                        #   in Loop: Header=BB2_9 Depth=1
	movq	32(%rsp), %rdi                  # 8-byte Reload
	movq	208(%rsp), %r9                  # 8-byte Reload
	movss	%xmm2, (%rdi,%r9,4)
	mulss	160(%rsp), %xmm2                # 16-byte Folded Reload
	cvttss2si	%xmm2, %eax
	movq	200(%rsp), %rcx                 # 8-byte Reload
	movb	%al, (%rcx,%r9)
	incq	%r9
	cmpq	192(%rsp), %r9                  # 8-byte Folded Reload
	movl	16(%rsp), %eax                  # 4-byte Reload
	leaq	24(%rsp), %rcx
	leaq	20(%rsp), %r10
	leaq	28(%rsp), %r11
	je	.LBB2_16
.LBB2_9:                                # %for.cond2.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_12 Depth 2
                                        #     Child Loop BB2_14 Depth 2
	xorps	%xmm4, %xmm4
	cvtsi2sd	%r9d, %xmm4
	mulsd	.LCPI2_2(%rip), %xmm4
	movss	(%rdi,%r9,4), %xmm2             # xmm2 = mem[0],zero,zero,zero
	cmpl	$8, %eax
	movq	%r9, 208(%rsp)                  # 8-byte Spill
	movapd	%xmm4, 240(%rsp)                # 16-byte Spill
	jae	.LBB2_11
# %bb.10:                               #   in Loop: Header=BB2_9 Depth=1
	xorl	%r13d, %r13d
	movq	120(%rsp), %rbx                 # 8-byte Reload
	jmp	.LBB2_14
	.p2align	4, 0x90
.LBB2_11:                               # %vector.ph80
                                        #   in Loop: Header=BB2_9 Depth=1
	xorps	%xmm5, %xmm5
	xorps	%xmm6, %xmm6
	movss	%xmm2, %xmm6                    # xmm6 = xmm2[0],xmm6[1,2,3]
	unpcklpd	%xmm4, %xmm4                    # xmm4 = xmm4[0,0]
	movapd	%xmm4, 288(%rsp)                # 16-byte Spill
	xorl	%r13d, %r13d
	movdqa	.LCPI2_3(%rip), %xmm1           # xmm1 = [0,1,2,3]
	movq	%rcx, %rbx
	movq	%r10, %r14
	movq	%r11, %rbp
	.p2align	4, 0x90
.LBB2_12:                               # %vector.body85
                                        #   Parent Loop BB2_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm1, 96(%rsp)                 # 16-byte Spill
	movaps	%xmm6, 352(%rsp)                # 16-byte Spill
	movaps	%xmm5, 368(%rsp)                # 16-byte Spill
	movdqa	%xmm1, %xmm0
	paddd	.LCPI2_4(%rip), %xmm0
	cvtdq2pd	96(%rsp), %xmm1                 # 16-byte Folded Reload
	pshufd	$78, 96(%rsp), %xmm2            # 16-byte Folded Reload
                                        # xmm2 = mem[2,3,0,1]
	cvtdq2pd	%xmm2, %xmm2
	cvtdq2pd	%xmm0, %xmm3
	pshufd	$78, %xmm0, %xmm0               # xmm0 = xmm0[2,3,0,1]
	cvtdq2pd	%xmm0, %xmm0
	movapd	288(%rsp), %xmm4                # 16-byte Reload
	mulpd	272(%rsp), %xmm4                # 16-byte Folded Reload
	mulpd	%xmm4, %xmm1
	mulpd	%xmm4, %xmm2
	mulpd	%xmm4, %xmm3
	mulpd	%xmm0, %xmm4
	cvtpd2ps	%xmm2, %xmm0
	movapd	%xmm0, 128(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm1, %xmm1
	movapd	%xmm1, 304(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm4, %xmm0
	movapd	%xmm0, 144(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm3, %xmm0
	movapd	%xmm0, 256(%rsp)                # 16-byte Spill
	movups	(%r12,%r13), %xmm0
	movaps	%xmm0, 320(%rsp)                # 16-byte Spill
	movups	16(%r12,%r13), %xmm0
	movaps	%xmm0, 336(%rsp)                # 16-byte Spill
	movapd	%xmm1, %xmm0
	leaq	80(%rsp), %rdi
	leaq	76(%rsp), %rsi
	callq	sincosf@PLT
	movaps	304(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	sincosf@PLT
	movaps	128(%rsp), %xmm0                # 16-byte Reload
	movq	%rbp, %rdi
	leaq	84(%rsp), %rsi
	callq	sincosf@PLT
	movaps	128(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	leaq	92(%rsp), %rdi
	leaq	88(%rsp), %rsi
	callq	sincosf@PLT
	movss	76(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movss	20(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	movss	84(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	88(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movlhps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	mulps	320(%rsp), %xmm2                # 16-byte Folded Reload
	movaps	%xmm2, 128(%rsp)                # 16-byte Spill
	movaps	256(%rsp), %xmm0                # 16-byte Reload
	leaq	48(%rsp), %rdi
	leaq	44(%rsp), %rsi
	callq	sincosf@PLT
	movaps	256(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	leaq	56(%rsp), %rdi
	leaq	52(%rsp), %rsi
	callq	sincosf@PLT
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	leaq	64(%rsp), %rdi
	leaq	60(%rsp), %rsi
	callq	sincosf@PLT
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	leaq	72(%rsp), %rdi
	leaq	68(%rsp), %rsi
	callq	sincosf@PLT
	movaps	352(%rsp), %xmm6                # 16-byte Reload
	movss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	52(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	60(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	68(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	mulps	336(%rsp), %xmm0                # 16-byte Folded Reload
	movups	(%r15,%r13), %xmm1
	movups	16(%r15,%r13), %xmm2
	movss	80(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	movss	24(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	unpcklps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movss	28(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movss	92(%rsp), %xmm5                 # xmm5 = mem[0],zero,zero,zero
	unpcklps	%xmm5, %xmm4                    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
	movaps	368(%rsp), %xmm5                # 16-byte Reload
	movlhps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0]
	mulps	%xmm1, %xmm3
	addps	128(%rsp), %xmm3                # 16-byte Folded Reload
	addps	%xmm3, %xmm6
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	56(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm1                    # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	movss	64(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	movss	72(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	unpcklps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movlhps	%xmm3, %xmm1                    # xmm1 = xmm1[0],xmm3[0]
	mulps	%xmm2, %xmm1
	addps	%xmm0, %xmm1
	addps	%xmm1, %xmm5
	movdqa	96(%rsp), %xmm1                 # 16-byte Reload
	paddd	.LCPI2_5(%rip), %xmm1
	addq	$32, %r13
	cmpq	%r13, 216(%rsp)                 # 8-byte Folded Reload
	jne	.LBB2_12
# %bb.13:                               # %middle.block77
                                        #   in Loop: Header=BB2_9 Depth=1
	addps	%xmm6, %xmm5
	movaps	%xmm5, %xmm0
	unpckhpd	%xmm5, %xmm0                    # xmm0 = xmm0[1],xmm5[1]
	addps	%xmm5, %xmm0
	movaps	%xmm0, %xmm2
	shufps	$85, %xmm0, %xmm2               # xmm2 = xmm2[1,1],xmm0[1,1]
	addss	%xmm0, %xmm2
	movq	184(%rsp), %rax                 # 8-byte Reload
	movq	%rax, %r13
	movq	120(%rsp), %rbx                 # 8-byte Reload
	cmpq	%rbx, %rax
	movapd	224(%rsp), %xmm1                # 16-byte Reload
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %rsi
	movapd	240(%rsp), %xmm4                # 16-byte Reload
	je	.LBB2_15
	.p2align	4, 0x90
.LBB2_14:                               # %for.body5.us
                                        #   Parent Loop BB2_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm2, 96(%rsp)                 # 16-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r13d, %xmm0
	mulsd	%xmm4, %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	(%r12,%r13,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, 144(%rsp)                # 4-byte Spill
	movq	%r8, %rdi
	callq	sincosf@PLT
	movapd	240(%rsp), %xmm4                # 16-byte Reload
	movaps	96(%rsp), %xmm2                 # 16-byte Reload
	leaq	8(%rsp), %rsi
	leaq	12(%rsp), %r8
	movapd	224(%rsp), %xmm1                # 16-byte Reload
	movss	144(%rsp), %xmm3                # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	mulss	8(%rsp), %xmm3
	movss	(%r15,%r13,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	12(%rsp), %xmm0
	addss	%xmm3, %xmm0
	addss	%xmm0, %xmm2
	incq	%r13
	cmpq	%r13, %rbx
	jne	.LBB2_14
	jmp	.LBB2_15
.LBB2_17:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	.cfi_restore %rbp
	.cfi_restore %r12
	.cfi_restore %r13
	.cfi_restore %r14
	.cfi_restore %r15
	retq
.LBB2_2:                                # %for.cond2.preheader.preheader
	.cfi_def_cfa_offset 448
	.cfi_offset %rbx, -56
	.cfi_offset %rbp, -16
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpl	$8, %ebx
	jae	.LBB2_4
# %bb.3:
	xorl	%eax, %eax
	movq	32(%rsp), %rdi                  # 8-byte Reload
	jmp	.LBB2_7
.LBB2_4:                                # %vector.ph
	movl	%edx, %eax
	andl	$-8, %eax
	movaps	160(%rsp), %xmm0                # 16-byte Reload
	shufps	$0, %xmm0, %xmm0                # xmm0 = xmm0[0,0,0,0]
	xorl	%ecx, %ecx
	movq	32(%rsp), %rdi                  # 8-byte Reload
	.p2align	4, 0x90
.LBB2_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	(%rdi,%rcx,4), %xmm1
	movups	16(%rdi,%rcx,4), %xmm2
	mulps	%xmm0, %xmm1
	mulps	%xmm0, %xmm2
	cvttps2dq	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	cvttps2dq	%xmm2, %xmm2
	packuswb	%xmm2, %xmm2
	packuswb	%xmm2, %xmm2
	movd	%xmm1, (%r13,%rcx)
	movd	%xmm2, 4(%r13,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %rax
	jne	.LBB2_5
# %bb.6:                                # %middle.block
	cmpq	%rdx, %rax
	je	.LBB2_16
	.p2align	4, 0x90
.LBB2_7:                                # %for.cond2.preheader
                                        # =>This Inner Loop Header: Depth=1
	movss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	160(%rsp), %xmm0                # 16-byte Folded Reload
	cvttss2si	%xmm0, %ecx
	movb	%cl, (%r13,%rax)
	incq	%rax
	cmpq	%rax, %rdx
	jne	.LBB2_7
.LBB2_16:                               # %if.then.i.i.i
	addq	$392, %rsp                      # imm = 0x188
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT                      # TAILCALL
.Lfunc_end2:
	.size	_Z10decompressjiPhPKfS1_, .Lfunc_end2-_Z10decompressjiPhPKfS1_
	.cfi_endproc
                                        # -- End function
	.globl	_Z11compressParjiPKhPfS1_       # -- Begin function _Z11compressParjiPKhPfS1_
	.p2align	4, 0x90
	.type	_Z11compressParjiPKhPfS1_,@function
_Z11compressParjiPKhPfS1_:              # @_Z11compressParjiPKhPfS1_
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, 12(%rsp)
	movl	%esi, 8(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%r8, 16(%rsp)
	leaq	16(%rsp), %r10
	leaq	24(%rsp), %r11
	leaq	.L__unnamed_1(%rip), %rdi
	leaq	_Z11compressParjiPKhPfS1_.omp_outlined(%rip), %rdx
	leaq	8(%rsp), %rcx
	leaq	12(%rsp), %r8
	leaq	32(%rsp), %r9
	movl	$5, %esi
	xorl	%eax, %eax
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$56, %rsp
	.cfi_adjust_cfa_offset -56
	retq
.Lfunc_end3:
	.size	_Z11compressParjiPKhPfS1_, .Lfunc_end3-_Z11compressParjiPKhPfS1_
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function _Z11compressParjiPKhPfS1_.omp_outlined
.LCPI4_0:
	.quad	0x401921fb54442d18              # double 6.2831853071795862
	.text
	.p2align	4, 0x90
	.type	_Z11compressParjiPKhPfS1_.omp_outlined,@function
_Z11compressParjiPKhPfS1_.omp_outlined: # @_Z11compressParjiPKhPfS1_.omp_outlined
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	(%rdx), %r13d
	testl	%r13d, %r13d
	jle	.LBB4_12
# %bb.1:                                # %entry
	movq	%rcx, %r15
	movl	(%rcx), %ebp
	testl	%ebp, %ebp
	je	.LBB4_12
# %bb.2:                                # %omp.precond.then
	movq	%r9, %rbx
	movq	%r8, %r14
	imulq	%rbp, %r13
	decq	%r13
	movq	$0, 40(%rsp)
	movq	%r13, 8(%rsp)
	movq	$1, 48(%rsp)
	movl	$0, 36(%rsp)
	movl	(%rdi), %esi
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	56(%rsp), %rax
	leaq	.L__unnamed_2(%rip), %rdi
	leaq	44(%rsp), %rcx
	leaq	48(%rsp), %r8
	leaq	16(%rsp), %r9
	movl	%esi, 28(%rsp)                  # 4-byte Spill
	movl	$34, %edx
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_for_static_init_8@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	8(%rsp), %rax
	cmpq	%r13, %rax
	cmovlq	%rax, %r13
	movq	%r13, 8(%rsp)
	movq	40(%rsp), %r12
	cmpq	%r13, %r12
	jg	.LBB4_11
	.p2align	4, 0x90
.LBB4_3:                                # %omp.inner.for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
                                        #     Child Loop BB4_9 Depth 2
	movq	%r12, %rax
	shrq	$32, %rax
	je	.LBB4_4
# %bb.5:                                #   in Loop: Header=BB4_3 Depth=1
	movq	%r12, %rax
	cqto
	idivq	%rbp
	movq	%rax, %r13
	jmp	.LBB4_6
	.p2align	4, 0x90
.LBB4_4:                                #   in Loop: Header=BB4_3 Depth=1
	movl	%r12d, %eax
	xorl	%edx, %edx
	divl	%ebp
                                        # kill: def $edx killed $edx def $rdx
	movl	%eax, %r13d
.LBB4_6:                                #   in Loop: Header=BB4_3 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r13d, %xmm0
	mulsd	.LCPI4_0(%rip), %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sd	%edx, %xmm1
	mulsd	%xmm0, %xmm1
	movl	(%r15), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	divsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	movq	(%r14), %rax
	movslq	%edx, %rcx
	movzbl	(%rax,%rcx), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	movss	%xmm1, 24(%rsp)                 # 4-byte Spill
	leaq	32(%rsp), %rdi
	leaq	28(%rsp), %rsi
	callq	sincosf@PLT
	movss	24(%rsp), %xmm2                 # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	movss	28(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	mulss	32(%rsp), %xmm2
	movq	(%rbx), %rdx
	movslq	%r13d, %rcx
	movd	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	.p2align	4, 0x90
.LBB4_7:                                # %atomicrmw.start
                                        #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movd	%xmm1, %eax
	addss	%xmm0, %xmm1
	movd	%xmm1, %esi
	lock		cmpxchgl	%esi, (%rdx,%rcx,4)
	movd	%eax, %xmm1
	jne	.LBB4_7
# %bb.8:                                # %atomicrmw.end
                                        #   in Loop: Header=BB4_3 Depth=1
	movq	112(%rsp), %rax
	movq	(%rax), %rdx
	movd	(%rdx,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	.p2align	4, 0x90
.LBB4_9:                                # %atomicrmw.start78
                                        #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movd	%xmm0, %eax
	subss	%xmm2, %xmm0
	movd	%xmm0, %esi
	lock		cmpxchgl	%esi, (%rdx,%rcx,4)
	movd	%eax, %xmm0
	jne	.LBB4_9
# %bb.10:                               # %atomicrmw.end77
                                        #   in Loop: Header=BB4_3 Depth=1
	cmpq	8(%rsp), %r12
	leaq	1(%r12), %r12
	jl	.LBB4_3
.LBB4_11:                               # %omp.loop.exit
	leaq	.L__unnamed_2(%rip), %rdi
	movl	20(%rsp), %esi                  # 4-byte Reload
	callq	__kmpc_for_static_fini@PLT
.LBB4_12:                               # %omp.precond.end
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	_Z11compressParjiPKhPfS1_.omp_outlined, .Lfunc_end4-_Z11compressParjiPKhPfS1_.omp_outlined
	.cfi_endproc
                                        # -- End function
	.globl	_Z13decompressParjiPhPKfS1_     # -- Begin function _Z13decompressParjiPhPKfS1_
	.p2align	4, 0x90
	.type	_Z13decompressParjiPhPKfS1_,@function
_Z13decompressParjiPhPKfS1_:            # @_Z13decompressParjiPhPKfS1_
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%edi, 12(%rsp)
	movl	%esi, 8(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%r8, 16(%rsp)
	movl	%edi, %r15d
	testl	%edi, %edi
	je	.LBB5_1
# %bb.2:                                # %if.end.i.i.i.i.i.i.i
	leaq	(,%r15,4), %r14
	movq	%r14, %rdi
	callq	_Znwm@PLT
	movq	%rax, %rbx
	leaq	(%rax,%r15,4), %r15
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	memset@PLT
	movq	%r15, %rax
	jmp	.LBB5_3
.LBB5_1:                                # %_ZNSt12_Vector_baseIfSaIfEEC2EmRKS0_.exit.thread.i
	shlq	$2, %r15
	xorl	%ebx, %ebx
	xorl	%eax, %eax
.LBB5_3:                                # %invoke.cont
	movq	%rbx, 40(%rsp)
	movq	%r15, 56(%rsp)
	movq	%rax, 48(%rsp)
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	40(%rsp), %r10
	leaq	24(%rsp), %r11
	leaq	32(%rsp), %rbx
	leaq	.L__unnamed_1(%rip), %rdi
	leaq	_Z13decompressParjiPhPKfS1_.omp_outlined(%rip), %rdx
	leaq	20(%rsp), %rcx
	leaq	16(%rsp), %r8
	leaq	48(%rsp), %r9
	movl	$6, %esi
	xorl	%eax, %eax
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_5
# %bb.4:                                # %if.then.i.i.i
	callq	_ZdlPv@PLT
.LBB5_5:                                # %_ZNSt6vectorIfSaIfEED2Ev.exit
	addq	$64, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	_Z13decompressParjiPhPKfS1_, .Lfunc_end5-_Z13decompressParjiPhPKfS1_
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function _Z13decompressParjiPhPKfS1_.omp_outlined
.LCPI6_0:
	.quad	0x401921fb54442d18              # double 6.2831853071795862
	.text
	.p2align	4, 0x90
	.type	_Z13decompressParjiPhPKfS1_.omp_outlined,@function
_Z13decompressParjiPhPKfS1_.omp_outlined: # @_Z13decompressParjiPhPKfS1_.omp_outlined
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
	movq	%r9, 56(%rsp)                   # 8-byte Spill
	movl	(%rdx), %ebp
	testq	%rbp, %rbp
	je	.LBB6_11
# %bb.1:                                # %entry
	movl	(%rcx), %eax
	testl	%eax, %eax
	jle	.LBB6_11
# %bb.2:                                # %omp.precond.then
	movq	%r8, %rbx
	movq	%rdx, %r14
	movl	%eax, 16(%rsp)                  # 4-byte Spill
	movslq	%eax, %r15
	imulq	%r15, %rbp
	decq	%rbp
	movq	$0, 32(%rsp)
	movq	%rbp, (%rsp)
	movq	$1, 64(%rsp)
	movl	$0, 28(%rsp)
	movl	(%rdi), %esi
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	72(%rsp), %rax
	leaq	.L__unnamed_2(%rip), %rdi
	leaq	36(%rsp), %rcx
	leaq	40(%rsp), %r8
	leaq	8(%rsp), %r9
	movl	%esi, 20(%rsp)                  # 4-byte Spill
	movl	$34, %edx
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_for_static_init_8@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	(%rsp), %rax
	cmpq	%rbp, %rax
	cmovlq	%rax, %rbp
	movq	%rbp, (%rsp)
	movq	32(%rsp), %r12
	cmpq	%rbp, %r12
	jg	.LBB6_10
# %bb.3:                                # %omp.inner.for.body.preheader
	movq	%r15, 40(%rsp)                  # 8-byte Spill
	movq	%r14, 48(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB6_4:                                # %omp.inner.for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_8 Depth 2
	movq	%r12, %rax
	orq	%r15, %rax
	shrq	$32, %rax
	je	.LBB6_5
# %bb.6:                                #   in Loop: Header=BB6_4 Depth=1
	movq	%r12, %rax
	cqto
	idivq	%r15
	jmp	.LBB6_7
	.p2align	4, 0x90
.LBB6_5:                                #   in Loop: Header=BB6_4 Depth=1
	movl	%r12d, %eax
	xorl	%edx, %edx
	divl	16(%rsp)                        # 4-byte Folded Reload
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
.LBB6_7:                                #   in Loop: Header=BB6_4 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	mulsd	.LCPI6_0(%rip), %xmm1
	movl	(%r14), %ecx
	xorps	%xmm2, %xmm2
	cvtsi2sd	%rcx, %xmm2
	mulsd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	xorps	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	movslq	%eax, %rbp
	movq	%rbx, %r15
	movq	(%rbx), %rbx
	movq	56(%rsp), %rax                  # 8-byte Reload
	movq	(%rax), %r13
	movslq	%edx, %r14
	leaq	24(%rsp), %rdi
	leaq	20(%rsp), %rsi
	callq	sincosf@PLT
	movss	24(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	20(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	mulss	(%r13,%r14,4), %xmm1
	movq	128(%rsp), %rax
	movq	(%rax), %rax
	mulss	(%rax,%r14,4), %xmm0
	addss	%xmm1, %xmm0
	movd	(%rbx,%rbp,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	.p2align	4, 0x90
.LBB6_8:                                # %atomicrmw.start
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movd	%xmm1, %eax
	addss	%xmm0, %xmm1
	movd	%xmm1, %ecx
	lock		cmpxchgl	%ecx, (%rbx,%rbp,4)
	movd	%eax, %xmm1
	jne	.LBB6_8
# %bb.9:                                # %atomicrmw.end
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	%r15, %rbx
	movq	(%r15), %rax
	movss	(%rax,%rbp,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	48(%rsp), %r14                  # 8-byte Reload
	movl	(%r14), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ss	%rax, %xmm1
	divss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	movq	136(%rsp), %rcx
	movq	(%rcx), %rcx
	movb	%al, (%rcx,%rbp)
	cmpq	(%rsp), %r12
	leaq	1(%r12), %r12
	movq	40(%rsp), %r15                  # 8-byte Reload
	jl	.LBB6_4
.LBB6_10:                               # %omp.loop.exit
	leaq	.L__unnamed_2(%rip), %rdi
	movl	12(%rsp), %esi                  # 4-byte Reload
	callq	__kmpc_for_static_fini@PLT
.LBB6_11:                               # %omp.precond.end
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	_Z13decompressParjiPhPKfS1_.omp_outlined, .Lfunc_end6-_Z13decompressParjiPhPKfS1_.omp_outlined
	.cfi_endproc
                                        # -- End function
	.globl	_Z15compressParFastjiPKhPfS1_   # -- Begin function _Z15compressParFastjiPKhPfS1_
	.p2align	4, 0x90
	.type	_Z15compressParFastjiPKhPfS1_,@function
_Z15compressParFastjiPKhPfS1_:          # @_Z15compressParFastjiPKhPfS1_
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception0
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edi, 12(%rsp)
	movl	%esi, 8(%rsp)
	movq	%rdx, 144(%rsp)
	movq	%rcx, 136(%rsp)
	movq	%r8, 128(%rsp)
	movl	%edi, %r13d
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 16(%rsp)
	movq	$0, 32(%rsp)
	testl	%edi, %edi
	je	.LBB7_1
# %bb.2:                                # %if.end.i.i.i.i.i.i.i
	leaq	(,%r13,4), %r14
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_Znwm@PLT
	movq	%rax, %rbx
	movq	%rax, 16(%rsp)
	leaq	(%rax,%r13,4), %r15
	movq	%r15, 32(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	memset@PLT
	movq	%r15, 24(%rsp)
.Ltmp0:
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_Znwm@PLT
.Ltmp1:
# %bb.3:                                # %call5.i.i.i.i4.i.i.noexc40
	movq	%rax, %r15
	movq	%rax, 104(%rsp)
	leaq	(%rax,%r13,4), %r12
	movq	%r12, 120(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	memset@PLT
	movq	%r12, 112(%rsp)
.Ltmp3:
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_Znwm@PLT
.Ltmp4:
# %bb.4:                                # %call5.i.i.i.i4.i.i.noexc57
	movq	%rax, %r12
	movq	%rax, 80(%rsp)
	leaq	(%rax,%r13,4), %rbp
	movq	%rbp, 96(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	memset@PLT
	movq	%rbp, 88(%rsp)
.Ltmp6:
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_Znwm@PLT
.Ltmp7:
# %bb.5:                                # %call5.i.i.i.i4.i.i.noexc74
	movq	%rax, 48(%rsp)
	movq	%rax, 56(%rsp)
	leaq	(%rax,%r13,4), %rbx
	movq	%rbx, 64(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	memset@PLT
	jmp	.LBB7_6
.LBB7_1:                                # %invoke.cont.thread
	shlq	$2, %r13
	movaps	%xmm0, 16(%rsp)
	movq	%r13, 32(%rsp)
	movups	%xmm0, 104(%rsp)
	movq	%r13, 120(%rsp)
	movups	%xmm0, 80(%rsp)
	movq	%r13, 96(%rsp)
	movaps	%xmm0, 48(%rsp)
	movq	%r13, 64(%rsp)
	xorl	%ebx, %ebx
.LBB7_6:                                # %invoke.cont16
	movq	%rbx, 56(%rsp)
	.cfi_escape 0x2e, 0x30
	leaq	128(%rsp), %r10
	leaq	144(%rsp), %r11
	leaq	136(%rsp), %rbx
	leaq	48(%rsp), %r14
	leaq	80(%rsp), %r15
	leaq	104(%rsp), %r12
	leaq	.L__unnamed_1(%rip), %rdi
	leaq	_Z15compressParFastjiPKhPfS1_.omp_outlined(%rip), %rdx
	leaq	8(%rsp), %rcx
	leaq	12(%rsp), %r8
	leaq	16(%rsp), %r9
	movl	$9, %esi
	movl	$0, %eax
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	movq	48(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_8
# %bb.7:                                # %if.then.i.i.i
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB7_8:                                # %_ZNSt6vectorIfSaIfEED2Ev.exit
	movq	80(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_10
# %bb.9:                                # %if.then.i.i.i78
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB7_10:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit79
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_12
# %bb.11:                               # %if.then.i.i.i81
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB7_12:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit82
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_14
# %bb.13:                               # %if.then.i.i.i84
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB7_14:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit85
	addq	$152, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB7_17:                               # %if.then.i.i.i87
	.cfi_def_cfa_offset 208
.Ltmp8:
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	movq	%r12, %rdi
	callq	_ZdlPv@PLT
	jmp	.LBB7_18
.LBB7_16:                               # %lpad10
.Ltmp5:
	movq	%rax, %r14
.LBB7_18:                               # %if.then.i.i.i90
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_Unwind_Resume@PLT
.LBB7_15:                               # %lpad5
.Ltmp2:
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end7:
	.size	_Z15compressParFastjiPKhPfS1_, .Lfunc_end7-_Z15compressParFastjiPKhPfS1_
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2, 0x0
GCC_except_table7:
.Lexception0:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    # >> Call Site 1 <<
	.uleb128 .Ltmp0-.Lfunc_begin0           #   Call between .Lfunc_begin0 and .Ltmp0
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp0-.Lfunc_begin0           # >> Call Site 2 <<
	.uleb128 .Ltmp1-.Ltmp0                  #   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp2-.Lfunc_begin0           #     jumps to .Ltmp2
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp1-.Lfunc_begin0           # >> Call Site 3 <<
	.uleb128 .Ltmp3-.Ltmp1                  #   Call between .Ltmp1 and .Ltmp3
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp3-.Lfunc_begin0           # >> Call Site 4 <<
	.uleb128 .Ltmp4-.Ltmp3                  #   Call between .Ltmp3 and .Ltmp4
	.uleb128 .Ltmp5-.Lfunc_begin0           #     jumps to .Ltmp5
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp4-.Lfunc_begin0           # >> Call Site 5 <<
	.uleb128 .Ltmp6-.Ltmp4                  #   Call between .Ltmp4 and .Ltmp6
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp6-.Lfunc_begin0           # >> Call Site 6 <<
	.uleb128 .Ltmp7-.Ltmp6                  #   Call between .Ltmp6 and .Ltmp7
	.uleb128 .Ltmp8-.Lfunc_begin0           #     jumps to .Ltmp8
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp7-.Lfunc_begin0           # >> Call Site 7 <<
	.uleb128 .Lfunc_end7-.Ltmp7             #   Call between .Ltmp7 and .Lfunc_end7
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end0:
	.p2align	2, 0x0
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function _Z15compressParFastjiPKhPfS1_.omp_outlined
.LCPI8_0:
	.quad	0x401921fb54442d18              # double 6.2831853071795862
.LCPI8_2:
	.quad	0x3ff0000000000000              # double 1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI8_1:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI8_3:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.text
	.p2align	4, 0x90
	.type	_Z15compressParFastjiPKhPfS1_.omp_outlined,@function
_Z15compressParFastjiPKhPfS1_.omp_outlined: # @_Z15compressParFastjiPKhPfS1_.omp_outlined
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
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 72(%rsp)                   # 8-byte Spill
	movq	%r8, 64(%rsp)                   # 8-byte Spill
	movq	%rdx, 136(%rsp)                 # 8-byte Spill
	cmpl	$0, (%rdx)
	jle	.LBB8_28
# %bb.1:                                # %for.body.lr.ph
	movq	%rcx, %r13
	movl	(%rdi), %ebp
	xorl	%r12d, %r12d
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	movl	%ebp, 28(%rsp)                  # 4-byte Spill
	jmp	.LBB8_2
	.p2align	4, 0x90
.LBB8_26:                               # %simd.if.end
                                        #   in Loop: Header=BB8_2 Depth=1
	leaq	.L__unnamed_1(%rip), %rdi
	movl	%ebp, %esi
	callq	__kmpc_end_master@PLT
.LBB8_27:                               # %for.inc
                                        #   in Loop: Header=BB8_2 Depth=1
	incq	%r12
	movq	136(%rsp), %rax                 # 8-byte Reload
	movslq	(%rax), %rax
	cmpq	%rax, %r12
	jge	.LBB8_28
.LBB8_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_9 Depth 2
                                        #     Child Loop BB8_12 Depth 2
                                        #     Child Loop BB8_17 Depth 2
                                        #     Child Loop BB8_23 Depth 2
	movl	(%r13), %r14d
	testl	%r14d, %r14d
	je	.LBB8_14
# %bb.3:                                # %omp.precond.then
                                        #   in Loop: Header=BB8_2 Depth=1
	decl	%r14d
	movl	$0, 4(%rsp)
	movl	%r14d, (%rsp)
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_2(%rip), %rdi
	movl	%ebp, %esi
	movl	$34, %edx
	leaq	24(%rsp), %rcx
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %r9
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	$1
	.cfi_adjust_cfa_offset 8
	leaq	44(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_for_static_init_4u@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movl	(%rsp), %eax
	cmpl	%r14d, %eax
	cmovbl	%eax, %r14d
	movl	%r14d, (%rsp)
	movl	4(%rsp), %r13d
	cmpl	%r14d, %r13d
	ja	.LBB8_13
# %bb.4:                                # %omp.inner.for.body.lr.ph
                                        #   in Loop: Header=BB8_2 Depth=1
	xorps	%xmm1, %xmm1
	cvtsi2sd	%r12d, %xmm1
	mulsd	.LCPI8_0(%rip), %xmm1
	movq	80(%rsp), %rax                  # 8-byte Reload
	movl	(%rax), %eax
	cvtsi2sd	%rax, %xmm2
	movq	64(%rsp), %rax                  # 8-byte Reload
	movq	(%rax), %rdx
	movq	72(%rsp), %rax                  # 8-byte Reload
	movq	(%rax), %rcx
	movl	%r14d, %esi
	subl	%r13d, %esi
	incl	%esi
	cmpl	$4, %esi
	movapd	%xmm1, 144(%rsp)                # 16-byte Spill
	movq	%rdx, 88(%rsp)                  # 8-byte Spill
	movq	%rcx, %rbx
	jb	.LBB8_5
# %bb.6:                                # %omp.inner.for.body.lr.ph
                                        #   in Loop: Header=BB8_2 Depth=1
	cmpl	%r13d, %r14d
	jl	.LBB8_5
# %bb.7:                                # %vector.memcheck
                                        #   in Loop: Header=BB8_2 Depth=1
	movslq	%r13d, %rax
	leaq	(%rcx,%rax,4), %rcx
	leaq	(%rdx,%rax,4), %rax
	subq	%rax, %rcx
	cmpq	$16, %rcx
	jae	.LBB8_8
.LBB8_5:                                #   in Loop: Header=BB8_2 Depth=1
	movl	%r13d, %ebp
	leaq	12(%rsp), %r13
	leaq	8(%rsp), %r15
.LBB8_11:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB8_2 Depth=1
	movsd	.LCPI8_2(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm2, %xmm0
	movsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB8_12:                               # %omp.inner.for.body
                                        #   Parent Loop BB8_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorps	%xmm0, %xmm0
	cvtsi2sd	%ebp, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	96(%rsp), %xmm0                 # 8-byte Folded Reload
	cvtsd2ss	%xmm0, %xmm0
	movq	%r13, %rdi
	movq	%r15, %rsi
	callq	sincosf@PLT
	movq	%rbx, %rdx
	movss	12(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	8(%rsp), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	movslq	%ebp, %rax
	movq	88(%rsp), %rcx                  # 8-byte Reload
	movss	%xmm1, (%rcx,%rax,4)
	movapd	144(%rsp), %xmm1                # 16-byte Reload
	movss	%xmm0, (%rbx,%rax,4)
	leal	1(%rax), %ebp
	cmpl	%r14d, %eax
	jb	.LBB8_12
.LBB8_13:                               # %omp.loop.exit
                                        #   in Loop: Header=BB8_2 Depth=1
	leaq	.L__unnamed_2(%rip), %rdi
	movl	28(%rsp), %ebp                  # 4-byte Reload
	movl	%ebp, %esi
	callq	__kmpc_for_static_fini@PLT
	movq	80(%rsp), %r13                  # 8-byte Reload
.LBB8_14:                               # %omp.precond.end
                                        #   in Loop: Header=BB8_2 Depth=1
	leaq	.L__unnamed_3(%rip), %r14
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	__kmpc_barrier@PLT
	movl	(%r13), %ebx
	testl	%ebx, %ebx
	je	.LBB8_19
# %bb.15:                               # %omp.precond.then29
                                        #   in Loop: Header=BB8_2 Depth=1
	addl	$7, %ebx
	shrl	$3, %ebx
	decl	%ebx
	movl	$0, 4(%rsp)
	movl	%ebx, (%rsp)
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_2(%rip), %rdi
	movl	%ebp, %esi
	movl	$34, %edx
	leaq	24(%rsp), %rcx
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %r9
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	$1
	.cfi_adjust_cfa_offset 8
	leaq	44(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_for_static_init_4u@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movl	(%rsp), %eax
	cmpl	%ebx, %eax
	cmovbl	%eax, %ebx
	movl	%ebx, (%rsp)
	movl	4(%rsp), %eax
	leal	1(%rbx), %ecx
	cmpl	%ecx, %eax
	jae	.LBB8_18
# %bb.16:                               # %omp.inner.for.body44.lr.ph
                                        #   in Loop: Header=BB8_2 Depth=1
	movq	64(%rsp), %rcx                  # 8-byte Reload
	movq	(%rcx), %rcx
	movq	288(%rsp), %rdx
	movq	(%rdx), %rdx
	movq	72(%rsp), %rsi                  # 8-byte Reload
	movq	(%rsi), %rsi
	movq	296(%rsp), %rdi
	movq	(%rdi), %rdi
	subl	%eax, %ebx
	incl	%ebx
	shll	$3, %eax
	.p2align	4, 0x90
.LBB8_17:                               # %omp.inner.for.body44
                                        #   Parent Loop BB8_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cltq
	movss	(%rcx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%rax,4)
	movss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leaq	(,%rax,4), %r8
	movss	%xmm0, (%rdi,%rax,4)
	movq	%r8, %r9
	orq	$4, %r9
	movss	(%rcx,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r9)
	movss	(%rsi,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movq	%r8, %r10
	movss	%xmm0, (%rdi,%r9)
	orq	$8, %r10
	movss	(%rcx,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r10)
	movss	(%rsi,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r10)
	movq	%r8, %r9
	orq	$12, %r9
	movss	(%rcx,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r9)
	movss	(%rsi,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movq	%r8, %r10
	movss	%xmm0, (%rdi,%r9)
	orq	$16, %r10
	movss	(%rcx,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r10)
	movss	(%rsi,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r10)
	movq	%r8, %r9
	orq	$20, %r9
	movss	(%rcx,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r9)
	movss	(%rsi,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movq	%r8, %r10
	movss	%xmm0, (%rdi,%r9)
	orq	$24, %r10
	movss	(%rcx,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r10)
	movss	(%rsi,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r10)
	orq	$28, %r8
	movss	(%rcx,%r8), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r8)
	movss	(%rsi,%r8), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r8)
	addl	$8, %eax
	decl	%ebx
	jne	.LBB8_17
.LBB8_18:                               # %omp.loop.exit75
                                        #   in Loop: Header=BB8_2 Depth=1
	leaq	.L__unnamed_2(%rip), %rdi
	movl	%ebp, %esi
	callq	__kmpc_for_static_fini@PLT
.LBB8_19:                               # %omp.precond.end76
                                        #   in Loop: Header=BB8_2 Depth=1
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	__kmpc_barrier@PLT
	leaq	.L__unnamed_1(%rip), %rdi
	movl	%ebp, %esi
	callq	__kmpc_master@PLT
	testl	%eax, %eax
	je	.LBB8_27
# %bb.20:                               # %omp_if.then
                                        #   in Loop: Header=BB8_2 Depth=1
	movl	(%r13), %eax
	testq	%rax, %rax
	je	.LBB8_26
# %bb.21:                               # %omp.inner.for.cond87.preheader
                                        #   in Loop: Header=BB8_2 Depth=1
	movq	312(%rsp), %rcx
	movq	(%rcx), %rcx
	movq	288(%rsp), %rdx
	movq	(%rdx), %rdx
	movq	304(%rsp), %rsi
	movq	(%rsi), %rsi
	movq	296(%rsp), %rdi
	movq	(%rdi), %rdi
	movq	320(%rsp), %r8
	movq	(%r8), %r8
	leal	2147483647(%rax), %r10d
	xorl	%r9d, %r9d
	cmpl	$-2147483645, %r10d             # imm = 0x80000003
	jb	.LBB8_24
# %bb.22:                               # %vector.ph
                                        #   in Loop: Header=BB8_2 Depth=1
	movl	%eax, %r9d
	andl	$-4, %r9d
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB8_23:                               # %vector.body
                                        #   Parent Loop BB8_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	3(%rcx,%r10), %r11d
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r11d, %xmm0
	mulss	12(%rdx,%r10,4), %xmm0
	addss	(%rsi,%r12,4), %xmm0
	movss	%xmm0, (%rsi,%r12,4)
	movzbl	3(%rcx,%r10), %r11d
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r11d, %xmm0
	movss	(%r8,%r12,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	mulss	12(%rdi,%r10,4), %xmm0
	subss	%xmm0, %xmm1
	movss	%xmm1, (%r8,%r12,4)
	addq	$4, %r10
	cmpl	%r10d, %r9d
	jne	.LBB8_23
	jmp	.LBB8_25
.LBB8_8:                                # %vector.ph200
                                        #   in Loop: Header=BB8_2 Depth=1
	movl	%esi, 24(%rsp)                  # 4-byte Spill
	movl	%esi, %eax
	andl	$-4, %eax
	leal	(%rax,%r13), %ebp
	movd	%r13d, %xmm0
	pshufd	$0, %xmm0, %xmm3                # xmm3 = xmm0[0,0,0,0]
	paddd	.LCPI8_1(%rip), %xmm3
	unpcklpd	%xmm1, %xmm1                    # xmm1 = xmm1[0,0]
	movapd	%xmm1, 176(%rsp)                # 16-byte Spill
	movsd	.LCPI8_2(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm2, 128(%rsp)                # 8-byte Spill
	divsd	%xmm2, %xmm0
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	movapd	%xmm0, 160(%rsp)                # 16-byte Spill
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movl	%eax, %r15d
	.p2align	4, 0x90
.LBB8_9:                                # %vector.body205
                                        #   Parent Loop BB8_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm3, 208(%rsp)                # 16-byte Spill
	cvtdq2pd	%xmm3, %xmm0
	pshufd	$78, %xmm3, %xmm1               # xmm1 = xmm3[2,3,0,1]
	cvtdq2pd	%xmm1, %xmm1
	movapd	176(%rsp), %xmm2                # 16-byte Reload
	mulpd	160(%rsp), %xmm2                # 16-byte Folded Reload
	mulpd	%xmm2, %xmm0
	mulpd	%xmm1, %xmm2
	cvtpd2ps	%xmm2, %xmm1
	movapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	cvtpd2ps	%xmm0, %xmm0
	movapd	%xmm0, 192(%rsp)                # 16-byte Spill
	leaq	36(%rsp), %rdi
	leaq	32(%rsp), %rsi
	callq	sincosf@PLT
	movaps	192(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	leaq	44(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	sincosf@PLT
	movaps	96(%rsp), %xmm0                 # 16-byte Reload
	leaq	52(%rsp), %rdi
	leaq	48(%rsp), %rsi
	callq	sincosf@PLT
	movaps	96(%rsp), %xmm0                 # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	leaq	60(%rsp), %rdi
	leaq	56(%rsp), %rsi
	callq	sincosf@PLT
	movdqa	208(%rsp), %xmm3                # 16-byte Reload
	movq	%rbx, %rcx
	movss	32(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	40(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	56(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movslq	%r13d, %r13
	movq	88(%rsp), %rax                  # 8-byte Reload
	movups	%xmm0, (%rax,%r13,4)
	movss	36(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	44(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	52(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	60(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movups	%xmm0, (%rbx,%r13,4)
	paddd	.LCPI8_3(%rip), %xmm3
	addl	$4, %r13d
	addl	$-4, %r15d
	jne	.LBB8_9
# %bb.10:                               # %middle.block197
                                        #   in Loop: Header=BB8_2 Depth=1
	movq	120(%rsp), %rax                 # 8-byte Reload
	cmpl	%eax, 24(%rsp)                  # 4-byte Folded Reload
	leaq	12(%rsp), %r13
	leaq	8(%rsp), %r15
	movapd	144(%rsp), %xmm1                # 16-byte Reload
	movsd	128(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	jne	.LBB8_11
	jmp	.LBB8_13
	.p2align	4, 0x90
.LBB8_24:                               # %omp.inner.for.body91
                                        #   in Loop: Header=BB8_2 Depth=1
	movslq	%r9d, %r9
	movzbl	(%rcx,%r9), %r10d
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r10d, %xmm0
	mulss	(%rdx,%r9,4), %xmm0
	addss	(%rsi,%r12,4), %xmm0
	movss	%xmm0, (%rsi,%r12,4)
	movzbl	(%rcx,%r9), %r10d
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r10d, %xmm0
	mulss	(%rdi,%r9,4), %xmm0
	movss	(%r8,%r12,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	%xmm1, (%r8,%r12,4)
	incl	%r9d
.LBB8_25:                               # %omp.inner.for.body91
                                        #   in Loop: Header=BB8_2 Depth=1
	cmpl	%r9d, %eax
	jne	.LBB8_24
	jmp	.LBB8_26
.LBB8_28:                               # %for.cond.cleanup
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	_Z15compressParFastjiPKhPfS1_.omp_outlined, .Lfunc_end8-_Z15compressParFastjiPKhPfS1_.omp_outlined
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _Z17decompressParFastjiPhPKfS1_
.LCPI9_0:
	.long	0x3f800000                      # float 1
	.text
	.globl	_Z17decompressParFastjiPhPKfS1_
	.p2align	4, 0x90
	.type	_Z17decompressParFastjiPhPKfS1_,@function
_Z17decompressParFastjiPhPKfS1_:        # @_Z17decompressParFastjiPhPKfS1_
.Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception1
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rbx
	movl	%edi, 8(%rsp)
	movl	%esi, 12(%rsp)
	movq	%rcx, 176(%rsp)
	movq	%r8, 168(%rsp)
	movl	%edi, %r14d
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 16(%rsp)
	movq	$0, 32(%rsp)
	testl	%edi, %edi
	je	.LBB9_1
# %bb.2:                                # %if.end.i.i.i.i.i.i.i
	leaq	(,%r14,4), %r15
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_Znwm@PLT
	movq	%rax, 16(%rsp)
	leaq	(%rax,%r14,4), %r12
	movq	%r12, 32(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movq	%r12, 24(%rsp)
.Ltmp9:
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_Znwm@PLT
.Ltmp10:
# %bb.3:                                # %call5.i.i.i.i4.i.i.noexc67
	movq	%rax, 128(%rsp)
	leaq	(%rax,%r14,4), %r13
	movq	%r13, 144(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, 152(%rsp)                 # 8-byte Spill
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movq	%r13, 136(%rsp)
.Ltmp12:
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_Znwm@PLT
.Ltmp13:
# %bb.4:                                # %call5.i.i.i.i4.i.i.noexc84
	movq	%rax, %r13
	movq	%rax, 104(%rsp)
	leaq	(%rax,%r14,4), %rbp
	movq	%rbp, 120(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movq	%rbp, 112(%rsp)
.Ltmp15:
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_Znwm@PLT
.Ltmp16:
# %bb.5:                                # %call5.i.i.i.i4.i.i.noexc101
	movq	%rax, %rbp
	movq	%rax, 80(%rsp)
	leaq	(%rax,%r14,4), %r12
	movq	%r12, 96(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movq	%r12, 88(%rsp)
.Ltmp18:
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_Znwm@PLT
.Ltmp19:
# %bb.6:                                # %call5.i.i.i.i4.i.i.noexc118
	movq	%rax, 48(%rsp)
	movq	%rax, 56(%rsp)
	leaq	(%rax,%r14,4), %r14
	movq	%r14, 64(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	jmp	.LBB9_7
.LBB9_1:                                # %invoke.cont.thread
	shlq	$2, %r14
	movaps	%xmm0, 16(%rsp)
	movq	%r14, 32(%rsp)
	movups	%xmm0, 128(%rsp)
	movq	%r14, 144(%rsp)
	movups	%xmm0, 104(%rsp)
	movq	%r14, 120(%rsp)
	movups	%xmm0, 80(%rsp)
	movq	%r14, 96(%rsp)
	movaps	%xmm0, 48(%rsp)
	movq	%r14, 64(%rsp)
	xorl	%r14d, %r14d
.LBB9_7:                                # %invoke.cont21
	movq	%r14, 56(%rsp)
	.cfi_escape 0x2e, 0x30
	leaq	168(%rsp), %r10
	leaq	176(%rsp), %r11
	leaq	16(%rsp), %r15
	leaq	48(%rsp), %r12
	leaq	80(%rsp), %r13
	leaq	104(%rsp), %rbp
	leaq	.L__unnamed_1(%rip), %rdi
	leaq	_Z17decompressParFastjiPhPKfS1_.omp_outlined(%rip), %rdx
	xorl	%r14d, %r14d
	leaq	12(%rsp), %rcx
	leaq	8(%rsp), %r8
	leaq	128(%rsp), %r9
	movl	$9, %esi
	movl	$0, %eax
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	movl	8(%rsp), %eax
	testq	%rax, %rax
	je	.LBB9_17
# %bb.8:                                # %omp.inner.for.cond.preheader
	xorps	%xmm0, %xmm0
	cvtsi2ss	%rax, %xmm0
	movq	16(%rsp), %rcx
	leal	2147483647(%rax), %edx
	cmpl	$-2147483645, %edx              # imm = 0x80000003
	jb	.LBB9_12
# %bb.9:                                # %vector.ph
	movl	%eax, %r14d
	andl	$-4, %r14d
	movss	.LCPI9_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	shufps	$0, %xmm1, %xmm1                # xmm1 = xmm1[0,0,0,0]
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB9_10:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	(%rcx,%rdx,4), %xmm2
	mulps	%xmm1, %xmm2
	cvttps2dq	%xmm2, %xmm2
	packuswb	%xmm2, %xmm2
	packuswb	%xmm2, %xmm2
	movd	%xmm2, (%rbx,%rdx)
	addq	$4, %rdx
	cmpl	%edx, %r14d
	jne	.LBB9_10
# %bb.11:                               # %middle.block
	cmpl	%r14d, %eax
	je	.LBB9_17
.LBB9_12:                               # %scalar.ph
	movl	%eax, %esi
	subl	%r14d, %esi
	leal	-1(%rsi), %edx
	testb	$1, %sil
	je	.LBB9_14
# %bb.13:                               # %omp.inner.for.body.prol
	movslq	%r14d, %rsi
	movss	(%rcx,%rsi,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	cvttss2si	%xmm1, %edi
	movb	%dil, (%rbx,%rsi)
	incl	%r14d
.LBB9_14:                               # %omp.inner.for.body.prol.loopexit
	testl	%edx, %edx
	je	.LBB9_17
# %bb.15:                               # %omp.inner.for.body.preheader
	movss	.LCPI9_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	.p2align	4, 0x90
.LBB9_16:                               # %omp.inner.for.body
                                        # =>This Inner Loop Header: Depth=1
	movslq	%r14d, %r14
	movss	(%rcx,%r14,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %edx
	movb	%dl, (%rbx,%r14)
	leal	1(%r14), %edx
	movslq	%edx, %rdx
	movss	(%rcx,%rdx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %esi
	movb	%sil, (%rbx,%rdx)
	addl	$2, %r14d
	cmpl	%r14d, %eax
	jne	.LBB9_16
.LBB9_17:                               # %simd.if.end
	movq	48(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB9_19
# %bb.18:                               # %if.then.i.i.i122
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB9_19:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit123
	movq	80(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB9_21
# %bb.20:                               # %if.then.i.i.i125
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB9_21:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit126
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB9_23
# %bb.22:                               # %if.then.i.i.i128
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB9_23:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit129
	movq	128(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB9_25
# %bb.24:                               # %if.then.i.i.i131
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB9_25:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit132
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB9_27
# %bb.26:                               # %if.then.i.i.i134
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB9_27:                               # %_ZNSt6vectorIfSaIfEED2Ev.exit135
	addq	$184, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB9_30:                               # %if.then.i.i.i
	.cfi_def_cfa_offset 240
.Ltmp20:
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	movq	%rbp, %rdi
	callq	_ZdlPv@PLT
	jmp	.LBB9_32
.LBB9_31:                               # %lpad15
.Ltmp17:
	movq	%rax, %rbx
.LBB9_32:                               # %if.then.i.i.i137
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	callq	_ZdlPv@PLT
	jmp	.LBB9_33
.LBB9_29:                               # %lpad10
.Ltmp14:
	movq	%rax, %rbx
.LBB9_33:                               # %if.then.i.i.i140
	.cfi_escape 0x2e, 0x00
	movq	152(%rsp), %rdi                 # 8-byte Reload
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	movq	160(%rsp), %rdi                 # 8-byte Reload
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.LBB9_28:                               # %lpad5
.Ltmp11:
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	movq	160(%rsp), %rdi                 # 8-byte Reload
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end9:
	.size	_Z17decompressParFastjiPhPKfS1_, .Lfunc_end9-_Z17decompressParFastjiPhPKfS1_
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2, 0x0
GCC_except_table9:
.Lexception1:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end1-.Lcst_begin1
.Lcst_begin1:
	.uleb128 .Lfunc_begin1-.Lfunc_begin1    # >> Call Site 1 <<
	.uleb128 .Ltmp9-.Lfunc_begin1           #   Call between .Lfunc_begin1 and .Ltmp9
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp9-.Lfunc_begin1           # >> Call Site 2 <<
	.uleb128 .Ltmp10-.Ltmp9                 #   Call between .Ltmp9 and .Ltmp10
	.uleb128 .Ltmp11-.Lfunc_begin1          #     jumps to .Ltmp11
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp10-.Lfunc_begin1          # >> Call Site 3 <<
	.uleb128 .Ltmp12-.Ltmp10                #   Call between .Ltmp10 and .Ltmp12
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp12-.Lfunc_begin1          # >> Call Site 4 <<
	.uleb128 .Ltmp13-.Ltmp12                #   Call between .Ltmp12 and .Ltmp13
	.uleb128 .Ltmp14-.Lfunc_begin1          #     jumps to .Ltmp14
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp13-.Lfunc_begin1          # >> Call Site 5 <<
	.uleb128 .Ltmp15-.Ltmp13                #   Call between .Ltmp13 and .Ltmp15
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp15-.Lfunc_begin1          # >> Call Site 6 <<
	.uleb128 .Ltmp16-.Ltmp15                #   Call between .Ltmp15 and .Ltmp16
	.uleb128 .Ltmp17-.Lfunc_begin1          #     jumps to .Ltmp17
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp16-.Lfunc_begin1          # >> Call Site 7 <<
	.uleb128 .Ltmp18-.Ltmp16                #   Call between .Ltmp16 and .Ltmp18
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp18-.Lfunc_begin1          # >> Call Site 8 <<
	.uleb128 .Ltmp19-.Ltmp18                #   Call between .Ltmp18 and .Ltmp19
	.uleb128 .Ltmp20-.Lfunc_begin1          #     jumps to .Ltmp20
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp19-.Lfunc_begin1          # >> Call Site 9 <<
	.uleb128 .Lfunc_end9-.Ltmp19            #   Call between .Ltmp19 and .Lfunc_end9
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end1:
	.p2align	2, 0x0
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function _Z17decompressParFastjiPhPKfS1_.omp_outlined
.LCPI10_0:
	.quad	0x401921fb54442d18              # double 6.2831853071795862
.LCPI10_2:
	.quad	0x3ff0000000000000              # double 1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI10_1:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI10_3:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.text
	.p2align	4, 0x90
	.type	_Z17decompressParFastjiPhPKfS1_.omp_outlined,@function
_Z17decompressParFastjiPhPKfS1_.omp_outlined: # @_Z17decompressParFastjiPhPKfS1_.omp_outlined
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
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 72(%rsp)                   # 8-byte Spill
	movq	%r8, 64(%rsp)                   # 8-byte Spill
	movq	%rdx, 136(%rsp)                 # 8-byte Spill
	cmpl	$0, (%rdx)
	jle	.LBB10_31
# %bb.1:                                # %for.body.lr.ph
	movq	%rcx, %r13
	movl	(%rdi), %ebp
	xorl	%r12d, %r12d
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	movl	%ebp, 28(%rsp)                  # 4-byte Spill
	jmp	.LBB10_2
	.p2align	4, 0x90
.LBB10_29:                              # %simd.if.end
                                        #   in Loop: Header=BB10_2 Depth=1
	leaq	.L__unnamed_1(%rip), %rdi
	movl	%ebp, %esi
	callq	__kmpc_end_master@PLT
.LBB10_30:                              # %for.inc
                                        #   in Loop: Header=BB10_2 Depth=1
	incq	%r12
	movq	136(%rsp), %rax                 # 8-byte Reload
	movslq	(%rax), %rax
	cmpq	%rax, %r12
	jge	.LBB10_31
.LBB10_2:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_9 Depth 2
                                        #     Child Loop BB10_12 Depth 2
                                        #     Child Loop BB10_17 Depth 2
                                        #     Child Loop BB10_23 Depth 2
                                        #     Child Loop BB10_28 Depth 2
	movl	(%r13), %r14d
	testl	%r14d, %r14d
	je	.LBB10_14
# %bb.3:                                # %omp.precond.then
                                        #   in Loop: Header=BB10_2 Depth=1
	decl	%r14d
	movl	$0, 4(%rsp)
	movl	%r14d, (%rsp)
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_2(%rip), %rdi
	movl	%ebp, %esi
	movl	$34, %edx
	leaq	24(%rsp), %rcx
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %r9
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	$1
	.cfi_adjust_cfa_offset 8
	leaq	44(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_for_static_init_4u@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movl	(%rsp), %eax
	cmpl	%r14d, %eax
	cmovbl	%eax, %r14d
	movl	%r14d, (%rsp)
	movl	4(%rsp), %r13d
	cmpl	%r14d, %r13d
	ja	.LBB10_13
# %bb.4:                                # %omp.inner.for.body.lr.ph
                                        #   in Loop: Header=BB10_2 Depth=1
	xorps	%xmm1, %xmm1
	cvtsi2sd	%r12d, %xmm1
	mulsd	.LCPI10_0(%rip), %xmm1
	movq	80(%rsp), %rax                  # 8-byte Reload
	movl	(%rax), %eax
	cvtsi2sd	%rax, %xmm2
	movq	64(%rsp), %rax                  # 8-byte Reload
	movq	(%rax), %rdx
	movq	72(%rsp), %rax                  # 8-byte Reload
	movq	(%rax), %rcx
	movl	%r14d, %esi
	subl	%r13d, %esi
	incl	%esi
	cmpl	$4, %esi
	movapd	%xmm1, 144(%rsp)                # 16-byte Spill
	movq	%rdx, 88(%rsp)                  # 8-byte Spill
	movq	%rcx, %rbx
	jb	.LBB10_5
# %bb.6:                                # %omp.inner.for.body.lr.ph
                                        #   in Loop: Header=BB10_2 Depth=1
	cmpl	%r13d, %r14d
	jl	.LBB10_5
# %bb.7:                                # %vector.memcheck
                                        #   in Loop: Header=BB10_2 Depth=1
	movslq	%r13d, %rax
	leaq	(%rcx,%rax,4), %rcx
	leaq	(%rdx,%rax,4), %rax
	subq	%rax, %rcx
	cmpq	$16, %rcx
	jae	.LBB10_8
.LBB10_5:                               #   in Loop: Header=BB10_2 Depth=1
	movl	%r13d, %ebp
	leaq	12(%rsp), %r13
	leaq	8(%rsp), %r15
.LBB10_11:                              # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB10_2 Depth=1
	movsd	.LCPI10_2(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm2, %xmm0
	movsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB10_12:                              # %omp.inner.for.body
                                        #   Parent Loop BB10_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorps	%xmm0, %xmm0
	cvtsi2sd	%ebp, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	96(%rsp), %xmm0                 # 8-byte Folded Reload
	cvtsd2ss	%xmm0, %xmm0
	movq	%r13, %rdi
	movq	%r15, %rsi
	callq	sincosf@PLT
	movq	%rbx, %rdx
	movss	12(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	8(%rsp), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	movslq	%ebp, %rax
	movq	88(%rsp), %rcx                  # 8-byte Reload
	movss	%xmm1, (%rcx,%rax,4)
	movapd	144(%rsp), %xmm1                # 16-byte Reload
	movss	%xmm0, (%rbx,%rax,4)
	leal	1(%rax), %ebp
	cmpl	%r14d, %eax
	jb	.LBB10_12
.LBB10_13:                              # %omp.loop.exit
                                        #   in Loop: Header=BB10_2 Depth=1
	leaq	.L__unnamed_2(%rip), %rdi
	movl	28(%rsp), %ebp                  # 4-byte Reload
	movl	%ebp, %esi
	callq	__kmpc_for_static_fini@PLT
	movq	80(%rsp), %r13                  # 8-byte Reload
.LBB10_14:                              # %omp.precond.end
                                        #   in Loop: Header=BB10_2 Depth=1
	leaq	.L__unnamed_3(%rip), %r14
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	__kmpc_barrier@PLT
	movl	(%r13), %ebx
	testl	%ebx, %ebx
	je	.LBB10_19
# %bb.15:                               # %omp.precond.then29
                                        #   in Loop: Header=BB10_2 Depth=1
	addl	$7, %ebx
	shrl	$3, %ebx
	decl	%ebx
	movl	$0, 4(%rsp)
	movl	%ebx, (%rsp)
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_2(%rip), %rdi
	movl	%ebp, %esi
	movl	$34, %edx
	leaq	24(%rsp), %rcx
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %r9
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	$1
	.cfi_adjust_cfa_offset 8
	leaq	44(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_for_static_init_4u@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movl	(%rsp), %eax
	cmpl	%ebx, %eax
	cmovbl	%eax, %ebx
	movl	%ebx, (%rsp)
	movl	4(%rsp), %eax
	leal	1(%rbx), %ecx
	cmpl	%ecx, %eax
	jae	.LBB10_18
# %bb.16:                               # %omp.inner.for.body44.lr.ph
                                        #   in Loop: Header=BB10_2 Depth=1
	movq	64(%rsp), %rcx                  # 8-byte Reload
	movq	(%rcx), %rcx
	movq	288(%rsp), %rdx
	movq	(%rdx), %rdx
	movq	72(%rsp), %rsi                  # 8-byte Reload
	movq	(%rsi), %rsi
	movq	296(%rsp), %rdi
	movq	(%rdi), %rdi
	subl	%eax, %ebx
	incl	%ebx
	shll	$3, %eax
	.p2align	4, 0x90
.LBB10_17:                              # %omp.inner.for.body44
                                        #   Parent Loop BB10_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cltq
	movss	(%rcx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%rax,4)
	movss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leaq	(,%rax,4), %r8
	movss	%xmm0, (%rdi,%rax,4)
	movq	%r8, %r9
	orq	$4, %r9
	movss	(%rcx,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r9)
	movss	(%rsi,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movq	%r8, %r10
	movss	%xmm0, (%rdi,%r9)
	orq	$8, %r10
	movss	(%rcx,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r10)
	movss	(%rsi,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r10)
	movq	%r8, %r9
	orq	$12, %r9
	movss	(%rcx,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r9)
	movss	(%rsi,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movq	%r8, %r10
	movss	%xmm0, (%rdi,%r9)
	orq	$16, %r10
	movss	(%rcx,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r10)
	movss	(%rsi,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r10)
	movq	%r8, %r9
	orq	$20, %r9
	movss	(%rcx,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r9)
	movss	(%rsi,%r9), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movq	%r8, %r10
	movss	%xmm0, (%rdi,%r9)
	orq	$24, %r10
	movss	(%rcx,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r10)
	movss	(%rsi,%r10), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r10)
	orq	$28, %r8
	movss	(%rcx,%r8), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdx,%r8)
	movss	(%rsi,%r8), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rdi,%r8)
	addl	$8, %eax
	decl	%ebx
	jne	.LBB10_17
.LBB10_18:                              # %omp.loop.exit75
                                        #   in Loop: Header=BB10_2 Depth=1
	leaq	.L__unnamed_2(%rip), %rdi
	movl	%ebp, %esi
	callq	__kmpc_for_static_fini@PLT
.LBB10_19:                              # %omp.precond.end76
                                        #   in Loop: Header=BB10_2 Depth=1
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	__kmpc_barrier@PLT
	leaq	.L__unnamed_1(%rip), %rdi
	movl	%ebp, %esi
	callq	__kmpc_master@PLT
	testl	%eax, %eax
	je	.LBB10_30
# %bb.20:                               # %omp_if.then
                                        #   in Loop: Header=BB10_2 Depth=1
	movl	(%r13), %eax
	testq	%rax, %rax
	je	.LBB10_29
# %bb.21:                               # %omp.inner.for.cond87.preheader
                                        #   in Loop: Header=BB10_2 Depth=1
	movq	312(%rsp), %rcx
	movq	(%rcx), %rcx
	movq	288(%rsp), %rdx
	movq	(%rdx), %rdx
	movq	320(%rsp), %rsi
	movq	(%rsi), %rsi
	movq	296(%rsp), %rdi
	movq	(%rdi), %rdi
	movq	304(%rsp), %r8
	movq	(%r8), %r8
	leal	2147483647(%rax), %r10d
	xorl	%r9d, %r9d
	cmpl	$-2147483641, %r10d             # imm = 0x80000007
	jb	.LBB10_25
# %bb.22:                               # %vector.ph
                                        #   in Loop: Header=BB10_2 Depth=1
	movl	%eax, %r9d
	andl	$-8, %r9d
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB10_23:                              # %vector.body
                                        #   Parent Loop BB10_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%rcx,%r12,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	shufps	$0, %xmm0, %xmm0                # xmm0 = xmm0[0,0,0,0]
	movups	(%rdx,%r10,4), %xmm1
	movups	16(%rdx,%r10,4), %xmm2
	mulps	%xmm0, %xmm1
	mulps	%xmm0, %xmm2
	movss	(%rsi,%r12,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	shufps	$0, %xmm0, %xmm0                # xmm0 = xmm0[0,0,0,0]
	movups	(%rdi,%r10,4), %xmm3
	movups	16(%rdi,%r10,4), %xmm4
	mulps	%xmm0, %xmm3
	addps	%xmm1, %xmm3
	mulps	%xmm0, %xmm4
	addps	%xmm2, %xmm4
	movups	(%r8,%r10,4), %xmm0
	addps	%xmm3, %xmm0
	movups	16(%r8,%r10,4), %xmm1
	addps	%xmm4, %xmm1
	movups	%xmm0, (%r8,%r10,4)
	movups	%xmm1, 16(%r8,%r10,4)
	addq	$8, %r10
	cmpl	%r10d, %r9d
	jne	.LBB10_23
# %bb.24:                               # %middle.block
                                        #   in Loop: Header=BB10_2 Depth=1
	cmpl	%r9d, %eax
	je	.LBB10_29
.LBB10_25:                              # %scalar.ph
                                        #   in Loop: Header=BB10_2 Depth=1
	movl	%eax, %r10d
	subl	%r9d, %r10d
	testb	$1, %r10b
	je	.LBB10_27
# %bb.26:                               # %omp.inner.for.body91.prol
                                        #   in Loop: Header=BB10_2 Depth=1
	movslq	%r9d, %r11
	movss	(%rdx,%r11,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	(%rcx,%r12,4), %xmm0
	movss	(%rdi,%r11,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	mulss	(%rsi,%r12,4), %xmm1
	addss	%xmm0, %xmm1
	addss	(%r8,%r11,4), %xmm1
	movss	%xmm1, (%r8,%r11,4)
	incl	%r9d
.LBB10_27:                              # %omp.inner.for.body91.prol.loopexit
                                        #   in Loop: Header=BB10_2 Depth=1
	decl	%r10d
	je	.LBB10_29
	.p2align	4, 0x90
.LBB10_28:                              # %omp.inner.for.body91
                                        #   Parent Loop BB10_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%r9d, %r9
	movss	(%rdx,%r9,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	mulss	(%rcx,%r12,4), %xmm0
	movss	(%rdi,%r9,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	mulss	(%rsi,%r12,4), %xmm1
	addss	%xmm0, %xmm1
	addss	(%r8,%r9,4), %xmm1
	movss	%xmm1, (%r8,%r9,4)
	leal	1(%r9), %r10d
	movslq	%r10d, %r10
	movss	(%rdx,%r10,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	(%rcx,%r12,4), %xmm0
	movss	(%rdi,%r10,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	mulss	(%rsi,%r12,4), %xmm1
	addss	%xmm0, %xmm1
	addss	(%r8,%r10,4), %xmm1
	movss	%xmm1, (%r8,%r10,4)
	addl	$2, %r9d
	cmpl	%r9d, %eax
	jne	.LBB10_28
	jmp	.LBB10_29
.LBB10_8:                               # %vector.ph200
                                        #   in Loop: Header=BB10_2 Depth=1
	movl	%esi, 24(%rsp)                  # 4-byte Spill
	movl	%esi, %eax
	andl	$-4, %eax
	leal	(%rax,%r13), %ebp
	movd	%r13d, %xmm0
	pshufd	$0, %xmm0, %xmm3                # xmm3 = xmm0[0,0,0,0]
	paddd	.LCPI10_1(%rip), %xmm3
	unpcklpd	%xmm1, %xmm1                    # xmm1 = xmm1[0,0]
	movapd	%xmm1, 176(%rsp)                # 16-byte Spill
	movsd	.LCPI10_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm2, 128(%rsp)                # 8-byte Spill
	divsd	%xmm2, %xmm0
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	movapd	%xmm0, 160(%rsp)                # 16-byte Spill
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movl	%eax, %r15d
	.p2align	4, 0x90
.LBB10_9:                               # %vector.body205
                                        #   Parent Loop BB10_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm3, 208(%rsp)                # 16-byte Spill
	cvtdq2pd	%xmm3, %xmm0
	pshufd	$78, %xmm3, %xmm1               # xmm1 = xmm3[2,3,0,1]
	cvtdq2pd	%xmm1, %xmm1
	movapd	176(%rsp), %xmm2                # 16-byte Reload
	mulpd	160(%rsp), %xmm2                # 16-byte Folded Reload
	mulpd	%xmm2, %xmm0
	mulpd	%xmm1, %xmm2
	cvtpd2ps	%xmm2, %xmm1
	movapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	cvtpd2ps	%xmm0, %xmm0
	movapd	%xmm0, 192(%rsp)                # 16-byte Spill
	leaq	36(%rsp), %rdi
	leaq	32(%rsp), %rsi
	callq	sincosf@PLT
	movaps	192(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	leaq	44(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	sincosf@PLT
	movaps	96(%rsp), %xmm0                 # 16-byte Reload
	leaq	52(%rsp), %rdi
	leaq	48(%rsp), %rsi
	callq	sincosf@PLT
	movaps	96(%rsp), %xmm0                 # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	leaq	60(%rsp), %rdi
	leaq	56(%rsp), %rsi
	callq	sincosf@PLT
	movdqa	208(%rsp), %xmm3                # 16-byte Reload
	movq	%rbx, %rcx
	movss	32(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	40(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	56(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movslq	%r13d, %r13
	movq	88(%rsp), %rax                  # 8-byte Reload
	movups	%xmm0, (%rax,%r13,4)
	movss	36(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	44(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	52(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	60(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movups	%xmm0, (%rbx,%r13,4)
	paddd	.LCPI10_3(%rip), %xmm3
	addl	$4, %r13d
	addl	$-4, %r15d
	jne	.LBB10_9
# %bb.10:                               # %middle.block197
                                        #   in Loop: Header=BB10_2 Depth=1
	movq	120(%rsp), %rax                 # 8-byte Reload
	cmpl	%eax, 24(%rsp)                  # 4-byte Folded Reload
	leaq	12(%rsp), %r13
	leaq	8(%rsp), %r15
	movapd	144(%rsp), %xmm1                # 16-byte Reload
	movsd	128(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	jne	.LBB10_11
	jmp	.LBB10_13
.LBB10_31:                              # %for.cond.cleanup
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end10:
	.size	_Z17decompressParFastjiPhPKfS1_.omp_outlined, .Lfunc_end10-_Z17decompressParFastjiPhPKfS1_.omp_outlined
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI11_0:
	.quad	0x4060000000000000              # double 128
.LCPI11_2:
	.quad	0x3ff0000000000000              # double 1
.LCPI11_3:
	.quad	0x401921fb54442d18              # double 6.2831853071795862
.LCPI11_4:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI11_1:
	.long	0x40800000                      # float 4
.LCPI11_5:
	.long	0x3f800000                      # float 1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI11_6:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI11_7:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
.LCPI11_8:
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	8                               # 0x8
.LCPI11_9:
	.zero	16
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception2
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
	subq	$1016, %rsp                     # imm = 0x3F8
	.cfi_def_cfa_offset 1072
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	976(%rsp), %r14
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 224(%rsp)
	movq	$0, 240(%rsp)
	movq	%r14, 960(%rsp)
	movabsq	$3343197528519702629, %rax      # imm = 0x2E656C706D617865
	movq	%rax, 976(%rsp)
	movl	$1886216750, 983(%rsp)          # imm = 0x706D622E
	movq	$11, 968(%rsp)
	movb	$0, 987(%rsp)
.Ltmp21:
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	leaq	960(%rsp), %rsi
	callq	_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Ltmp22:
# %bb.1:                                # %invoke.cont2
	movq	960(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_3
# %bb.2:                                # %if.then.i.i
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB11_3:                               # %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
	movl	270(%rsp), %ebp
	movl	274(%rsp), %r12d
	cvtsi2sd	%rbp, %xmm1
	movsd	.LCPI11_0(%rip), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	mulss	.LCPI11_1(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.11(%rip), %rsi
	movb	$1, %al
	callq	fprintf@PLT
	movq	%r12, %rax
	shlq	$8, %rax
	leaq	(%rax,%rax,2), %rbx
.Ltmp24:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Znam@PLT
.Ltmp25:
# %bb.4:                                # %call13.i.noexc
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
	movq	%r14, 232(%rsp)
.Ltmp26:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Znam@PLT
.Ltmp27:
# %bb.5:                                # %call16.i.noexc
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
	movq	%r14, 240(%rsp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, 472(%rsp)                # 4-byte Spill
	movabsq	$2361183241434822607, %r15      # imm = 0x20C49BA5E353F7CF
	testq	%r12, %r12
	je	.LBB11_31
# %bb.6:                                # %for.cond17.preheader.us.i.preheader
	testq	%rbp, %rbp
	jne	.LBB11_12
# %bb.7:                                # %for.body21.us.i.us.preheader
	xorl	%r13d, %r13d
	movq	%r12, %rbx
	.p2align	4, 0x90
.LBB11_8:                               # %for.body21.us.i.us
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r13
	decq	%rbx
	jne	.LBB11_8
# %bb.9:                                # %for.body21.us.i.us.1.preheader
	movq	%r12, %rbx
	.p2align	4, 0x90
.LBB11_10:                              # %for.body21.us.i.us.1
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r13
	decq	%rbx
	jne	.LBB11_10
	.p2align	4, 0x90
.LBB11_11:                              # %for.body21.us.i.us.2
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r13
	decq	%r12
	jne	.LBB11_11
	jmp	.LBB11_30
.LBB11_12:                              # %for.cond17.preheader.us.i.preheader439
	movsd	.LCPI11_2(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	8(%rsp), %xmm0                  # 8-byte Folded Reload
	movsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	movq	%r12, 512(%rsp)                 # 8-byte Spill
	movq	%rbp, 144(%rsp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB11_13:                              # %for.body21.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_14 Depth 2
                                        #       Child Loop BB11_15 Depth 3
	movq	%r13, 112(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rbx, 368(%rsp)                 # 8-byte Spill
	movq	%rbx, %r12
	shlq	$8, %r12
	movq	232(%rsp), %r13
	addq	%r12, %r13
	addq	240(%rsp), %r12
	movq	%rax, 352(%rsp)                 # 8-byte Spill
	movq	224(%rsp), %rbx
	movq	%r14, 384(%rsp)                 # 8-byte Spill
	addq	%r14, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB11_14:                              # %for.cond1.preheader.us.i
                                        #   Parent Loop BB11_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_15 Depth 3
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14d, %xmm0
	mulsd	.LCPI11_3(%rip), %xmm0
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
	xorl	%r15d, %r15d
	movq	144(%rsp), %rbp                 # 8-byte Reload
	.p2align	4, 0x90
.LBB11_15:                              # %for.body4.us.i
                                        #   Parent Loop BB11_13 Depth=1
                                        #     Parent Loop BB11_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r15d, %xmm0
	mulsd	160(%rsp), %xmm0                # 8-byte Folded Reload
	mulsd	8(%rsp), %xmm0                  # 8-byte Folded Reload
	cvtsd2ss	%xmm0, %xmm0
	movzbl	(%rbx,%r15), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	movss	%xmm1, 48(%rsp)                 # 4-byte Spill
	.cfi_escape 0x2e, 0x00
	leaq	764(%rsp), %rdi
	leaq	760(%rsp), %rsi
	callq	sincosf@PLT
	movss	48(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	mulss	760(%rsp), %xmm0
	addss	(%r13,%r14,4), %xmm0
	movss	%xmm0, (%r13,%r14,4)
	movzbl	(%rbx,%r15), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	764(%rsp), %xmm0
	movss	(%r12,%r14,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	%xmm1, (%r12,%r14,4)
	incq	%r15
	cmpq	%r15, %rbp
	jne	.LBB11_15
# %bb.16:                               # %for.cond1.for.cond.cleanup3_crit_edge.us.i
                                        #   in Loop: Header=BB11_14 Depth=2
	incq	%r14
	cmpq	$64, %r14
	jne	.LBB11_14
# %bb.17:                               # %_Z8compressjiPKhPfS1_.exit
                                        #   in Loop: Header=BB11_13 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	352(%rsp), %rax                 # 8-byte Folded Reload
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	112(%rsp), %r13                 # 8-byte Reload
	addq	%rdx, %r13
	movq	368(%rsp), %rbx                 # 8-byte Reload
	incq	%rbx
	movq	384(%rsp), %r14                 # 8-byte Reload
	movq	144(%rsp), %rbp                 # 8-byte Reload
	addq	%rbp, %r14
	movq	512(%rsp), %r12                 # 8-byte Reload
	cmpq	%r12, %rbx
	jne	.LBB11_13
# %bb.18:                               # %for.body21.us.i.1.preheader
	movq	%r12, %r14
	imulq	%rbp, %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB11_19:                              # %for.body21.us.i.1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_20 Depth 2
                                        #       Child Loop BB11_21 Depth 3
	movq	%r13, 112(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rbx, 368(%rsp)                 # 8-byte Spill
	leaq	(%rbx,%r12), %r13
	shlq	$8, %r13
	movq	232(%rsp), %r12
	addq	%r13, %r12
	addq	240(%rsp), %r13
	movq	%rax, 352(%rsp)                 # 8-byte Spill
	movq	224(%rsp), %rbx
	movq	%r14, 384(%rsp)                 # 8-byte Spill
	addq	%r14, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB11_20:                              # %for.cond1.preheader.us.i.1
                                        #   Parent Loop BB11_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_21 Depth 3
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14d, %xmm0
	mulsd	.LCPI11_3(%rip), %xmm0
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
	xorl	%r15d, %r15d
	movq	144(%rsp), %rbp                 # 8-byte Reload
	.p2align	4, 0x90
.LBB11_21:                              # %for.body4.us.i.1
                                        #   Parent Loop BB11_19 Depth=1
                                        #     Parent Loop BB11_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r15d, %xmm0
	mulsd	160(%rsp), %xmm0                # 8-byte Folded Reload
	mulsd	8(%rsp), %xmm0                  # 8-byte Folded Reload
	cvtsd2ss	%xmm0, %xmm0
	movzbl	(%rbx,%r15), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	movss	%xmm1, 48(%rsp)                 # 4-byte Spill
	.cfi_escape 0x2e, 0x00
	leaq	756(%rsp), %rdi
	leaq	752(%rsp), %rsi
	callq	sincosf@PLT
	movss	48(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	mulss	752(%rsp), %xmm0
	addss	(%r12,%r14,4), %xmm0
	movss	%xmm0, (%r12,%r14,4)
	movzbl	(%rbx,%r15), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	756(%rsp), %xmm0
	movss	(%r13,%r14,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	%xmm1, (%r13,%r14,4)
	incq	%r15
	cmpq	%r15, %rbp
	jne	.LBB11_21
# %bb.22:                               # %for.cond1.for.cond.cleanup3_crit_edge.us.i.1
                                        #   in Loop: Header=BB11_20 Depth=2
	incq	%r14
	cmpq	$64, %r14
	jne	.LBB11_20
# %bb.23:                               # %_Z8compressjiPKhPfS1_.exit.1
                                        #   in Loop: Header=BB11_19 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	352(%rsp), %rax                 # 8-byte Folded Reload
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	112(%rsp), %r13                 # 8-byte Reload
	addq	%rdx, %r13
	movq	368(%rsp), %rbx                 # 8-byte Reload
	incq	%rbx
	movq	384(%rsp), %r14                 # 8-byte Reload
	movq	144(%rsp), %rbp                 # 8-byte Reload
	addq	%rbp, %r14
	movq	512(%rsp), %r12                 # 8-byte Reload
	cmpq	%r12, %rbx
	jne	.LBB11_19
# %bb.24:                               # %for.cond17.for.cond.cleanup20_crit_edge.us.i.1
	leaq	(%r12,%r12), %rax
	movq	%rax, 528(%rsp)                 # 8-byte Spill
	movq	%r12, %r14
	imulq	%rbp, %r14
	addq	%r14, %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB11_25:                              # %for.body21.us.i.2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_26 Depth 2
                                        #       Child Loop BB11_27 Depth 3
	movq	%r13, 112(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	528(%rsp), %rcx                 # 8-byte Reload
	movq	%rbx, 368(%rsp)                 # 8-byte Spill
	leaq	(%rbx,%rcx), %r13
	shlq	$8, %r13
	movq	232(%rsp), %r12
	addq	%r13, %r12
	addq	240(%rsp), %r13
	movq	%rax, 352(%rsp)                 # 8-byte Spill
	movq	224(%rsp), %rbx
	movq	%r14, 384(%rsp)                 # 8-byte Spill
	addq	%r14, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB11_26:                              # %for.cond1.preheader.us.i.2
                                        #   Parent Loop BB11_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_27 Depth 3
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14d, %xmm0
	mulsd	.LCPI11_3(%rip), %xmm0
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
	xorl	%r15d, %r15d
	movq	144(%rsp), %rbp                 # 8-byte Reload
	.p2align	4, 0x90
.LBB11_27:                              # %for.body4.us.i.2
                                        #   Parent Loop BB11_25 Depth=1
                                        #     Parent Loop BB11_26 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r15d, %xmm0
	mulsd	160(%rsp), %xmm0                # 8-byte Folded Reload
	mulsd	8(%rsp), %xmm0                  # 8-byte Folded Reload
	cvtsd2ss	%xmm0, %xmm0
	movzbl	(%rbx,%r15), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	movss	%xmm1, 48(%rsp)                 # 4-byte Spill
	.cfi_escape 0x2e, 0x00
	leaq	748(%rsp), %rdi
	leaq	744(%rsp), %rsi
	callq	sincosf@PLT
	movss	48(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	mulss	744(%rsp), %xmm0
	addss	(%r12,%r14,4), %xmm0
	movss	%xmm0, (%r12,%r14,4)
	movzbl	(%rbx,%r15), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	748(%rsp), %xmm0
	movss	(%r13,%r14,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	%xmm1, (%r13,%r14,4)
	incq	%r15
	cmpq	%r15, %rbp
	jne	.LBB11_27
# %bb.28:                               # %for.cond1.for.cond.cleanup3_crit_edge.us.i.2
                                        #   in Loop: Header=BB11_26 Depth=2
	incq	%r14
	cmpq	$64, %r14
	jne	.LBB11_26
# %bb.29:                               # %_Z8compressjiPKhPfS1_.exit.2
                                        #   in Loop: Header=BB11_25 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	352(%rsp), %rax                 # 8-byte Folded Reload
	movabsq	$2361183241434822607, %r15      # imm = 0x20C49BA5E353F7CF
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	112(%rsp), %r13                 # 8-byte Reload
	addq	%rdx, %r13
	movq	368(%rsp), %rbx                 # 8-byte Reload
	incq	%rbx
	movq	384(%rsp), %r14                 # 8-byte Reload
	movq	144(%rsp), %rbp                 # 8-byte Reload
	addq	%rbp, %r14
	cmpq	512(%rsp), %rbx                 # 8-byte Folded Reload
	jne	.LBB11_25
.LBB11_30:                              # %for.cond.cleanup.loopexit97.i
	movq	%r13, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rdx, %xmm0
	mulsd	.LCPI11_4(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 472(%rsp)                # 4-byte Spill
.LBB11_31:                              # %for.cond.cleanup.i
	movl	$64, 248(%rsp)
	movq	224(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_33
# %bb.32:                               # %delete.notnull.i
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_33:                              # %invoke.cont5
	movq	$0, 224(%rsp)
	movl	270(%rsp), %ebx
	movl	274(%rsp), %r14d
	movq	%rbx, %rax
	imulq	%r14, %rax
	movq	%rax, 336(%rsp)                 # 8-byte Spill
	leaq	(%rax,%rax,2), %rdi
.Ltmp29:
	.cfi_escape 0x2e, 0x00
	callq	_Znam@PLT
.Ltmp30:
# %bb.34:                               # %call.i131.noexc
	movq	%rax, 224(%rsp)
	xorps	%xmm0, %xmm0
	testq	%r14, %r14
	je	.LBB11_43
# %bb.35:                               # %for.cond7.preheader.us.i.preheader
	testq	%rbx, %rbx
	movq	%r14, 424(%rsp)                 # 8-byte Spill
	jne	.LBB11_86
# %bb.36:                               # %for.body11.us.i.us.preheader
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB11_37:                              # %for.body11.us.i.us
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbx, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r12
	decq	%r14
	jne	.LBB11_37
# %bb.38:                               # %for.body11.us.i.us.1.preheader
	movq	424(%rsp), %r14                 # 8-byte Reload
	.p2align	4, 0x90
.LBB11_39:                              # %for.body11.us.i.us.1
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbx, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r12
	decq	%r14
	jne	.LBB11_39
# %bb.40:                               # %for.body11.us.i.us.2.preheader
	movq	424(%rsp), %r14                 # 8-byte Reload
	.p2align	4, 0x90
.LBB11_41:                              # %for.body11.us.i.us.2
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbx, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r12
	decq	%r14
	jne	.LBB11_41
.LBB11_42:                              # %for.cond.cleanup.loopexit85.i
	movq	%r12, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rdx, %xmm0
	mulsd	.LCPI11_4(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
.LBB11_43:                              # %for.cond.cleanup.i144
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
	movq	232(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_45
# %bb.44:                               # %delete.notnull.i147
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_45:                              # %delete.end.i
	leaq	232(%rsp), %rbx
	movq	240(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_47
# %bb.46:                               # %delete.notnull52.i
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_47:                              # %invoke.cont7
	movss	472(%rsp), %xmm2                # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	movss	8(%rsp), %xmm3                  # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	cvtss2sd	%xmm3, %xmm1
	addss	%xmm2, %xmm3
	xorps	%xmm2, %xmm2
	cvtss2sd	%xmm3, %xmm2
	xorps	%xmm3, %xmm3
	movups	%xmm3, (%rbx)
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.2(%rip), %rdi
	movb	$3, %al
	callq	printf@PLT
	leaq	880(%rsp), %r14
	movq	%r14, 864(%rsp)
	movq	$18, 64(%rsp)
.Ltmp41:
	.cfi_escape 0x2e, 0x00
	leaq	864(%rsp), %rdi
	leaq	64(%rsp), %rsi
	xorl	%edx, %edx
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.Ltmp42:
# %bb.48:                               # %call2.i10.i.noexc161
	movq	%rax, 864(%rsp)
	movq	64(%rsp), %rcx
	movq	%rcx, 880(%rsp)
	movups	.L.str.3(%rip), %xmm0
	movups	%xmm0, (%rax)
	movw	$28781, 16(%rax)                # imm = 0x706D
	movq	%rcx, 872(%rsp)
	movq	864(%rsp), %rax
	movb	$0, (%rax,%rcx)
.Ltmp44:
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	leaq	864(%rsp), %rsi
	callq	_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Ltmp45:
# %bb.49:                               # %invoke.cont18
	movq	864(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_51
# %bb.50:                               # %if.then.i.i165
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB11_51:                              # %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit169
	.cfi_escape 0x2e, 0x00
	callq	omp_get_max_threads@PLT
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.4(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	944(%rsp), %r14
	movq	%r14, 928(%rsp)
	movabsq	$3343197528519702629, %rax      # imm = 0x2E656C706D617865
	movq	%rax, 944(%rsp)
	movl	$1886216750, 951(%rsp)          # imm = 0x706D622E
	movq	$11, 936(%rsp)
	movb	$0, 955(%rsp)
.Ltmp47:
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	leaq	928(%rsp), %rsi
	callq	_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Ltmp48:
# %bb.52:                               # %invoke.cont31
	movq	928(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_54
# %bb.53:                               # %if.then.i.i186
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB11_54:                              # %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit190
	movl	270(%rsp), %r15d
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r15, %xmm0
	movl	274(%rsp), %r13d
	movsd	.LCPI11_0(%rip), %xmm1          # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	mulss	.LCPI11_1(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.11(%rip), %rsi
	movb	$1, %al
	callq	fprintf@PLT
	movq	%r13, %r12
	shlq	$8, %r12
	leaq	(%r12,%r12,2), %rbx
.Ltmp50:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Znam@PLT
.Ltmp51:
# %bb.55:                               # %call13.i.noexc238
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
	movq	%r14, 232(%rsp)
.Ltmp52:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Znam@PLT
.Ltmp53:
# %bb.56:                               # %call16.i.noexc240
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
	movq	%r14, 240(%rsp)
	testq	%r13, %r13
	je	.LBB11_64
# %bb.57:                               # %for.body21.us.i211.preheader
	movq	%r13, 48(%rsp)                  # 8-byte Spill
	xorl	%r13d, %r13d
	movq	%r15, 8(%rsp)                   # 8-byte Spill
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	movq	8(%rsp), %r15                   # 8-byte Reload
	.p2align	4, 0x90
.LBB11_58:                              # %for.body21.us.i211
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	movq	224(%rsp), %rax
	addq	%rbp, %rax
	movq	232(%rsp), %rcx
	addq	%r13, %rcx
	movq	240(%rsp), %rdx
	addq	%r13, %rdx
	movl	%r15d, 24(%rsp)
	movl	$64, 16(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	.cfi_escape 0x2e, 0x10
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$5, %esi
	leaq	_Z11compressParjiPKhPfS1_.omp_outlined(%rip), %rdx
	leaq	16(%rsp), %rcx
	leaq	24(%rsp), %r8
	leaq	64(%rsp), %r9
	xorl	%eax, %eax
	leaq	32(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	subq	%r14, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %rbx
	addq	%r15, %rbp
	addq	$256, %r13                      # imm = 0x100
	cmpq	%r13, %r12
	jne	.LBB11_58
# %bb.59:                               # %for.body21.us.i211.1.preheader
	movq	48(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %r13
	imulq	8(%rsp), %r13                   # 8-byte Folded Reload
	movq	8(%rsp), %r15                   # 8-byte Reload
	.p2align	4, 0x90
.LBB11_60:                              # %for.body21.us.i211.1
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	movq	224(%rsp), %rax
	addq	%r13, %rax
	movq	232(%rsp), %rcx
	addq	%r12, %rcx
	movq	240(%rsp), %rdx
	addq	%r12, %rdx
	movl	%r15d, 24(%rsp)
	movl	$64, 16(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	.cfi_escape 0x2e, 0x10
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$5, %esi
	leaq	_Z11compressParjiPKhPfS1_.omp_outlined(%rip), %rdx
	leaq	16(%rsp), %rcx
	leaq	24(%rsp), %r8
	leaq	64(%rsp), %r9
	xorl	%eax, %eax
	leaq	32(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %rbx
	addq	$256, %r12                      # imm = 0x100
	addq	%r15, %r13
	decq	%rbp
	jne	.LBB11_60
# %bb.61:                               # %for.cond17.for.cond.cleanup20_crit_edge.us.i227.1
	movq	48(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %r12
	shlq	$9, %r12
	movq	%rbp, %r13
	imulq	8(%rsp), %r13                   # 8-byte Folded Reload
	addq	%r13, %r13
	movq	8(%rsp), %r15                   # 8-byte Reload
	.p2align	4, 0x90
.LBB11_62:                              # %for.body21.us.i211.2
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	movq	224(%rsp), %rax
	addq	%r13, %rax
	movq	232(%rsp), %rcx
	addq	%r12, %rcx
	movq	240(%rsp), %rdx
	addq	%r12, %rdx
	movl	%r15d, 24(%rsp)
	movl	$64, 16(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	.cfi_escape 0x2e, 0x10
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$5, %esi
	leaq	_Z11compressParjiPKhPfS1_.omp_outlined(%rip), %rdx
	leaq	16(%rsp), %rcx
	leaq	24(%rsp), %r8
	leaq	64(%rsp), %r9
	xorl	%eax, %eax
	leaq	32(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	subq	%r14, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %rbx
	addq	$256, %r12                      # imm = 0x100
	addq	%r15, %r13
	decq	%rbp
	jne	.LBB11_62
# %bb.63:                               # %for.cond17.for.cond.cleanup20_crit_edge.us.i227.2
	movq	%rbx, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	cvtsi2sd	%rdx, %xmm0
	mulsd	.LCPI11_4(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	jmp	.LBB11_65
.LBB11_64:
	xorps	%xmm0, %xmm0
.LBB11_65:                              # %for.cond.cleanup.i231
	movss	%xmm0, 144(%rsp)                # 4-byte Spill
	movl	$64, 248(%rsp)
	movq	224(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_67
# %bb.66:                               # %delete.notnull.i235
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_67:                              # %invoke.cont36
	movq	$0, 224(%rsp)
	movl	270(%rsp), %ebp
	movl	274(%rsp), %ebx
	movq	%rbp, %r14
	imulq	%rbx, %r14
	leaq	(%r14,%r14,2), %rdi
.Ltmp55:
	.cfi_escape 0x2e, 0x00
	callq	_Znam@PLT
.Ltmp56:
# %bb.68:                               # %call.i249.noexc
	movq	%rax, 224(%rsp)
	testq	%rbx, %rbx
	je	.LBB11_85
# %bb.69:                               # %for.cond7.preheader.us.i255.preheader
	movq	%rbx, 8(%rsp)                   # 8-byte Spill
	leaq	(,%rbp,4), %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	testl	%ebp, %ebp
	je	.LBB11_167
# %bb.70:                               # %for.body11.us.i260.preheader
	movq	%r14, 112(%rsp)                 # 8-byte Spill
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	movq	%rbp, 160(%rsp)                 # 8-byte Spill
	movq	48(%rsp), %r13                  # 8-byte Reload
	jmp	.LBB11_72
	.p2align	4, 0x90
.LBB11_71:                              # %.noexc292
                                        #   in Loop: Header=BB11_72 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r12, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r14
	incq	%rbx
	movq	160(%rsp), %rbp                 # 8-byte Reload
	addq	%rbp, %r15
	cmpq	%rbx, 8(%rsp)                   # 8-byte Folded Reload
	je	.LBB11_75
.LBB11_72:                              # %for.body11.us.i260
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r12
	movslq	248(%rsp), %rax
	movq	224(%rsp), %rcx
	addq	%r15, %rcx
	movl	%eax, 20(%rsp)
	imulq	%rbx, %rax
	shlq	$2, %rax
	movq	232(%rsp), %rdx
	addq	%rax, %rdx
	addq	240(%rsp), %rax
	movl	%ebp, 16(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rax, 24(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
.Ltmp58:
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	callq	_Znwm@PLT
.Ltmp59:
# %bb.73:                               # %call5.i.i.i.i4.i.i3.i.noexc
                                        #   in Loop: Header=BB11_72 Depth=1
	movq	%rax, 64(%rsp)
	leaq	(%rax,%rbp,4), %rbp
	movq	%rbp, 80(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r13, %rdx
	callq	memset@PLT
	movq	%rbp, 72(%rsp)
	.cfi_escape 0x2e, 0x20
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$6, %esi
	leaq	_Z13decompressParjiPhPKfS1_.omp_outlined(%rip), %rdx
	leaq	24(%rsp), %rcx
	leaq	28(%rsp), %r8
	leaq	72(%rsp), %r9
	xorl	%eax, %eax
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	40(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	56(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_71
# %bb.74:                               # %if.then.i.i.i.i428
                                        #   in Loop: Header=BB11_72 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
	jmp	.LBB11_71
.LBB11_75:                              # %for.body11.us.i260.1.preheader
	xorl	%ebx, %ebx
	movq	8(%rsp), %r15                   # 8-byte Reload
	movq	112(%rsp), %r13                 # 8-byte Reload
	jmp	.LBB11_77
	.p2align	4, 0x90
.LBB11_76:                              # %.noexc292.1
                                        #   in Loop: Header=BB11_77 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r12, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r14
	incq	%rbx
	movq	%rbp, %r13
	movq	160(%rsp), %rbp                 # 8-byte Reload
	addq	%rbp, %r13
	movq	8(%rsp), %r15                   # 8-byte Reload
	cmpq	%rbx, %r15
	je	.LBB11_80
.LBB11_77:                              # %for.body11.us.i260.1
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r12
	movslq	248(%rsp), %rax
	leaq	(%r15,%rbx), %rcx
	movq	224(%rsp), %rdx
	imulq	%rax, %rcx
	shlq	$2, %rcx
	movq	232(%rsp), %rsi
	addq	%rcx, %rsi
	addq	240(%rsp), %rcx
	movq	%rbp, %r15
	movq	%r13, %rbp
	addq	%r13, %rdx
	movl	%r15d, 16(%rsp)
	movl	%eax, 20(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rcx, 24(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
.Ltmp61:
	.cfi_escape 0x2e, 0x00
	movq	48(%rsp), %r13                  # 8-byte Reload
	movq	%r13, %rdi
	callq	_Znwm@PLT
.Ltmp62:
# %bb.78:                               # %call5.i.i.i.i4.i.i3.i.noexc.1
                                        #   in Loop: Header=BB11_77 Depth=1
	movq	%rax, 64(%rsp)
	leaq	(%rax,%r15,4), %r15
	movq	%r15, 80(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r13, %rdx
	callq	memset@PLT
	movq	%r15, 72(%rsp)
	.cfi_escape 0x2e, 0x20
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$6, %esi
	leaq	_Z13decompressParjiPhPKfS1_.omp_outlined(%rip), %rdx
	leaq	24(%rsp), %rcx
	leaq	28(%rsp), %r8
	leaq	72(%rsp), %r9
	xorl	%eax, %eax
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	40(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	56(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_76
# %bb.79:                               # %if.then.i.i.i.i428.1
                                        #   in Loop: Header=BB11_77 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
	jmp	.LBB11_76
.LBB11_80:                              # %for.cond7.for.cond.cleanup10_crit_edge.us.i277.1
	leaq	(%r15,%r15), %r13
	movq	%r15, %rax
	movq	%rbp, %r15
	imulq	%rax, %r15
	addq	%r15, %r15
	jmp	.LBB11_82
	.p2align	4, 0x90
.LBB11_81:                              # %.noexc292.2
                                        #   in Loop: Header=BB11_82 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r12, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r14
	incq	%r13
	movq	160(%rsp), %rbp                 # 8-byte Reload
	addq	%rbp, %r15
	decq	8(%rsp)                         # 8-byte Folded Spill
	je	.LBB11_179
.LBB11_82:                              # %for.body11.us.i260.2
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r12
	movslq	248(%rsp), %rax
	movq	224(%rsp), %rcx
	addq	%r15, %rcx
	movl	%eax, 20(%rsp)
	imulq	%r13, %rax
	shlq	$2, %rax
	movq	232(%rsp), %rdx
	addq	%rax, %rdx
	addq	240(%rsp), %rax
	movl	%ebp, 16(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rax, 24(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
.Ltmp64:
	.cfi_escape 0x2e, 0x00
	movq	%rbp, %rbx
	movq	48(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %rdi
	callq	_Znwm@PLT
.Ltmp65:
# %bb.83:                               # %call5.i.i.i.i4.i.i3.i.noexc.2
                                        #   in Loop: Header=BB11_82 Depth=1
	movq	%rax, 64(%rsp)
	leaq	(%rax,%rbx,4), %rbx
	movq	%rbx, 80(%rsp)
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%rbp, %rdx
	callq	memset@PLT
	movq	%rbx, 72(%rsp)
	.cfi_escape 0x2e, 0x20
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$6, %esi
	leaq	_Z13decompressParjiPhPKfS1_.omp_outlined(%rip), %rdx
	leaq	24(%rsp), %rcx
	leaq	28(%rsp), %r8
	leaq	72(%rsp), %r9
	xorl	%eax, %eax
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	40(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	56(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_81
# %bb.84:                               # %if.then.i.i.i.i428.2
                                        #   in Loop: Header=BB11_82 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
	jmp	.LBB11_81
.LBB11_85:
	xorps	%xmm0, %xmm0
	jmp	.LBB11_180
.LBB11_86:                              # %for.body11.us.i.preheader
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rbx, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ss	%rbx, %xmm1
	leaq	(,%rbx,4), %r15
	movss	.LCPI11_5(%rip), %xmm2          # xmm2 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm2
	movsd	.LCPI11_2(%rip), %xmm1          # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	leaq	-1(%rbx), %rax
	movq	%rax, 544(%rsp)                 # 8-byte Spill
	movl	%ebx, %eax
	andl	$-8, %eax
	movq	%rax, 400(%rsp)                 # 8-byte Spill
	movaps	%xmm2, 768(%rsp)                # 16-byte Spill
	shufps	$0, %xmm2, %xmm2                # xmm2 = xmm2[0,0,0,0]
	movaps	%xmm2, 992(%rsp)                # 16-byte Spill
	movq	%rbx, 208(%rsp)                 # 8-byte Spill
                                        # kill: def $ebx killed $ebx killed $rbx def $rbx
	andl	$3, %ebx
	movq	%rbx, 408(%rsp)                 # 8-byte Spill
	movl	$4, %eax
	movq	%rax, 328(%rsp)                 # 8-byte Spill
	movl	$3, %eax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 192(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	movq	%r15, 552(%rsp)                 # 8-byte Spill
	jmp	.LBB11_88
	.p2align	4, 0x90
.LBB11_87:                              # %if.then.i.i.i.i411
                                        #   in Loop: Header=BB11_88 Depth=1
	.cfi_escape 0x2e, 0x00
	movq	%r8, %rdi
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	200(%rsp), %rax                 # 8-byte Folded Reload
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	%r12, %rax
	movq	432(%rsp), %r12                 # 8-byte Reload
	addq	%rdx, %r12
	addq	%rax, 328(%rsp)                 # 8-byte Folded Spill
	addq	%rax, 184(%rsp)                 # 8-byte Folded Spill
	addq	%rax, 176(%rsp)                 # 8-byte Folded Spill
	addq	$4, 192(%rsp)                   # 8-byte Folded Spill
	movq	424(%rsp), %r14                 # 8-byte Reload
	movq	320(%rsp), %rax                 # 8-byte Reload
	cmpq	%r14, %rax
	movq	552(%rsp), %r15                 # 8-byte Reload
	je	.LBB11_113
.LBB11_88:                              # %for.body11.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_105 Depth 2
                                        #     Child Loop BB11_109 Depth 2
                                        #     Child Loop BB11_112 Depth 2
                                        #     Child Loop BB11_92 Depth 2
                                        #       Child Loop BB11_95 Depth 3
                                        #       Child Loop BB11_98 Depth 3
	movq	%r12, 432(%rsp)                 # 8-byte Spill
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbp
	movslq	248(%rsp), %r13
	movq	224(%rsp), %rbx
	movq	232(%rsp), %r12
	movq	240(%rsp), %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
.Ltmp32:
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_Znwm@PLT
.Ltmp33:
# %bb.89:                               # %call5.i.i.i.i4.i.i43.i.noexc
                                        #   in Loop: Header=BB11_88 Depth=1
	leaq	1(%r14), %rcx
	movq	%rcx, 320(%rsp)                 # 8-byte Spill
	movl	%r13d, %ecx
	movq	%rcx, 416(%rsp)                 # 8-byte Spill
	movq	%r14, %rcx
	movq	208(%rsp), %r14                 # 8-byte Reload
	imulq	%r14, %rcx
	addq	%rbx, %rcx
	movq	%rcx, 136(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movq	416(%rsp), %rcx                 # 8-byte Reload
	testl	%ecx, %ecx
	movq	%rbp, 200(%rsp)                 # 8-byte Spill
	jle	.LBB11_99
# %bb.90:                               # %for.cond2.preheader.us.i.preheader
                                        #   in Loop: Header=BB11_88 Depth=1
	movl	%ecx, %eax
	andl	$-8, %eax
	movq	%rax, 440(%rsp)                 # 8-byte Spill
	movq	%r13, %rsi
	imulq	192(%rsp), %rsi                 # 8-byte Folded Reload
	leaq	(%r12,%rsi), %rbx
	addq	$16, %rbx
	movq	104(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi), %r15
	addq	$16, %r15
	movl	%ecx, %edx
	shrl	$3, %edx
	shlq	$5, %rdx
	addq	%rsi, %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	addq	%r12, %rsi
	movq	%rsi, 464(%rsp)                 # 8-byte Spill
	xorl	%esi, %esi
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	leaq	508(%rsp), %rdi
	movq	96(%rsp), %r8                   # 8-byte Reload
	movq	%rcx, %r14
	leaq	500(%rsp), %rbp
	movq	%rdx, 448(%rsp)                 # 8-byte Spill
	movq	%r13, 344(%rsp)                 # 8-byte Spill
	jmp	.LBB11_92
	.p2align	4, 0x90
.LBB11_91:                              # %for.cond2.for.cond.cleanup4_crit_edge.us.i
                                        #   in Loop: Header=BB11_92 Depth=2
	movq	96(%rsp), %r8                   # 8-byte Reload
	movq	456(%rsp), %rsi                 # 8-byte Reload
	movss	%xmm0, (%r8,%rsi,4)
	mulss	768(%rsp), %xmm0                # 16-byte Folded Reload
	cvttss2si	%xmm0, %eax
	movq	136(%rsp), %rcx                 # 8-byte Reload
	movb	%al, (%rcx,%rsi)
	incq	%rsi
	movq	208(%rsp), %r12                 # 8-byte Reload
	cmpq	%r12, %rsi
	leaq	508(%rsp), %rdi
	movq	344(%rsp), %r13                 # 8-byte Reload
	movq	448(%rsp), %rdx                 # 8-byte Reload
	je	.LBB11_87
.LBB11_92:                              # %for.cond2.preheader.us.i
                                        #   Parent Loop BB11_88 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_95 Depth 3
                                        #       Child Loop BB11_98 Depth 3
	xorps	%xmm1, %xmm1
	cvtsi2sd	%esi, %xmm1
	mulsd	.LCPI11_3(%rip), %xmm1
	movss	(%r8,%rsi,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	cmpl	$8, %r13d
	movq	%rsi, 456(%rsp)                 # 8-byte Spill
	movsd	%xmm1, 216(%rsp)                # 8-byte Spill
	jae	.LBB11_94
# %bb.93:                               #   in Loop: Header=BB11_92 Depth=2
	xorl	%r12d, %r12d
	leaq	504(%rsp), %r13
	jmp	.LBB11_97
	.p2align	4, 0x90
.LBB11_94:                              # %vector.ph
                                        #   in Loop: Header=BB11_92 Depth=2
	xorps	%xmm4, %xmm4
	xorps	%xmm5, %xmm5
	movss	%xmm0, %xmm5                    # xmm5 = xmm0[0],xmm5[1,2,3]
	mulsd	%xmm1, %xmm2
	unpcklpd	%xmm2, %xmm2                    # xmm2 = xmm2[0,0]
	movapd	%xmm2, 784(%rsp)                # 16-byte Spill
	xorl	%r12d, %r12d
	movdqa	.LCPI11_6(%rip), %xmm1          # xmm1 = [0,1,2,3]
	movq	%rdx, %r13
	.p2align	4, 0x90
.LBB11_95:                              # %vector.body
                                        #   Parent Loop BB11_88 Depth=1
                                        #     Parent Loop BB11_92 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm5, 352(%rsp)                # 16-byte Spill
	movaps	%xmm4, 512(%rsp)                # 16-byte Spill
	movdqa	%xmm1, 48(%rsp)                 # 16-byte Spill
	movdqa	%xmm1, %xmm0
	pshufd	$78, 48(%rsp), %xmm1            # 16-byte Folded Reload
                                        # xmm1 = mem[2,3,0,1]
	cvtdq2pd	%xmm1, %xmm1
	cvtdq2pd	48(%rsp), %xmm2                 # 16-byte Folded Reload
	paddd	.LCPI11_7(%rip), %xmm0
	pshufd	$78, %xmm0, %xmm3               # xmm3 = xmm0[2,3,0,1]
	cvtdq2pd	%xmm3, %xmm3
	cvtdq2pd	%xmm0, %xmm0
	movapd	784(%rsp), %xmm4                # 16-byte Reload
	mulpd	%xmm4, %xmm2
	mulpd	%xmm4, %xmm1
	mulpd	%xmm4, %xmm0
	mulpd	%xmm4, %xmm3
	cvtpd2ps	%xmm1, %xmm1
	movapd	%xmm1, 112(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm2, %xmm2
	movapd	%xmm2, 528(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm3, %xmm1
	movapd	%xmm1, 160(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm0, %xmm0
	movapd	%xmm0, 144(%rsp)                # 16-byte Spill
	movups	-16(%rbx,%r12), %xmm0
	movaps	%xmm0, 368(%rsp)                # 16-byte Spill
	movups	(%rbx,%r12), %xmm0
	movaps	%xmm0, 384(%rsp)                # 16-byte Spill
	.cfi_escape 0x2e, 0x00
	movapd	%xmm2, %xmm0
	leaq	716(%rsp), %rsi
	movq	%rdi, %rbp
	callq	sincosf@PLT
	movaps	528(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	724(%rsp), %rdi
	leaq	720(%rsp), %rsi
	callq	sincosf@PLT
	.cfi_escape 0x2e, 0x00
	movaps	112(%rsp), %xmm0                # 16-byte Reload
	leaq	732(%rsp), %rdi
	leaq	728(%rsp), %rsi
	callq	sincosf@PLT
	movaps	112(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	740(%rsp), %rdi
	leaq	736(%rsp), %rsi
	callq	sincosf@PLT
	movss	716(%rsp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	720(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	movss	728(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	736(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movlhps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	mulps	368(%rsp), %xmm2                # 16-byte Folded Reload
	addps	352(%rsp), %xmm2                # 16-byte Folded Reload
	movaps	%xmm2, 112(%rsp)                # 16-byte Spill
	.cfi_escape 0x2e, 0x00
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	leaq	688(%rsp), %rdi
	leaq	684(%rsp), %rsi
	callq	sincosf@PLT
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	696(%rsp), %rdi
	leaq	692(%rsp), %rsi
	callq	sincosf@PLT
	.cfi_escape 0x2e, 0x00
	movaps	160(%rsp), %xmm0                # 16-byte Reload
	leaq	704(%rsp), %rdi
	leaq	700(%rsp), %rsi
	callq	sincosf@PLT
	movaps	160(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	712(%rsp), %rdi
	leaq	708(%rsp), %rsi
	callq	sincosf@PLT
	movq	%rbp, %rdi
	movss	684(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	692(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	700(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	708(%rsp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	mulps	384(%rsp), %xmm0                # 16-byte Folded Reload
	addps	512(%rsp), %xmm0                # 16-byte Folded Reload
	movups	-16(%r15,%r12), %xmm1
	movups	(%r15,%r12), %xmm2
	movss	508(%rsp), %xmm5                # xmm5 = mem[0],zero,zero,zero
	movss	724(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm5                    # xmm5 = xmm5[0],xmm3[0],xmm5[1],xmm3[1]
	movss	732(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	movss	740(%rsp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	unpcklps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movlhps	%xmm3, %xmm5                    # xmm5 = xmm5[0],xmm3[0]
	mulps	%xmm1, %xmm5
	addps	112(%rsp), %xmm5                # 16-byte Folded Reload
	movss	688(%rsp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	movss	696(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm4                    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1]
	movss	704(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	712(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm1                    # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	movlhps	%xmm1, %xmm4                    # xmm4 = xmm4[0],xmm1[0]
	movdqa	48(%rsp), %xmm1                 # 16-byte Reload
	mulps	%xmm2, %xmm4
	addps	%xmm0, %xmm4
	paddd	.LCPI11_8(%rip), %xmm1
	addq	$32, %r12
	cmpq	%r12, %r13
	jne	.LBB11_95
# %bb.96:                               # %middle.block
                                        #   in Loop: Header=BB11_92 Depth=2
	addps	%xmm5, %xmm4
	movaps	%xmm4, %xmm1
	unpckhpd	%xmm4, %xmm1                    # xmm1 = xmm1[1],xmm4[1]
	addps	%xmm4, %xmm1
	movaps	%xmm1, %xmm0
	shufps	$85, %xmm1, %xmm0               # xmm0 = xmm0[1,1],xmm1[1,1]
	addss	%xmm1, %xmm0
	movq	440(%rsp), %rcx                 # 8-byte Reload
	movq	%rcx, %r12
	movq	%r14, %rax
	cmpq	%r14, %rcx
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	leaq	504(%rsp), %r13
	leaq	500(%rsp), %rbp
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	je	.LBB11_91
.LBB11_97:                              # %for.body5.us.i.preheader
                                        #   in Loop: Header=BB11_92 Depth=2
	movaps	%xmm0, %xmm3
	.p2align	4, 0x90
.LBB11_98:                              # %for.body5.us.i
                                        #   Parent Loop BB11_88 Depth=1
                                        #     Parent Loop BB11_92 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	%xmm3, 48(%rsp)                 # 4-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r12d, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	sincosf@PLT
	movq	%r14, %rcx
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	movss	500(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movq	464(%rsp), %rax                 # 8-byte Reload
	mulss	(%rax,%r12,4), %xmm1
	movss	504(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	48(%rsp), %xmm1                 # 4-byte Folded Reload
	movq	104(%rsp), %rax                 # 8-byte Reload
	mulss	(%rax,%r12,4), %xmm0
	addss	%xmm1, %xmm0
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	incq	%r12
	movaps	%xmm0, %xmm3
	cmpq	%r12, %r14
	jne	.LBB11_98
	jmp	.LBB11_91
	.p2align	4, 0x90
.LBB11_99:                              # %for.cond2.preheader.i.preheader
                                        #   in Loop: Header=BB11_88 Depth=1
	movq	320(%rsp), %rcx                 # 8-byte Reload
	cmpl	$8, %r14d
	movq	%r14, %r12
	movaps	768(%rsp), %xmm2                # 16-byte Reload
	jae	.LBB11_101
# %bb.100:                              #   in Loop: Header=BB11_88 Depth=1
	xorl	%ecx, %ecx
	movq	96(%rsp), %r8                   # 8-byte Reload
	jmp	.LBB11_107
.LBB11_101:                             # %vector.memcheck
                                        #   in Loop: Header=BB11_88 Depth=1
	movq	96(%rsp), %r8                   # 8-byte Reload
	leaq	(%r8,%r15), %rax
	cmpq	%rax, 136(%rsp)                 # 8-byte Folded Reload
	jae	.LBB11_104
# %bb.102:                              # %vector.memcheck
                                        #   in Loop: Header=BB11_88 Depth=1
	movq	%rcx, %rax
	imulq	%r12, %rax
	addq	%rbx, %rax
	cmpq	%rax, %r8
	jae	.LBB11_104
# %bb.103:                              #   in Loop: Header=BB11_88 Depth=1
	xorl	%ecx, %ecx
	jmp	.LBB11_107
.LBB11_104:                             # %vector.body532.preheader
                                        #   in Loop: Header=BB11_88 Depth=1
	movq	328(%rsp), %rax                 # 8-byte Reload
	addq	%rbx, %rax
	xorl	%ecx, %ecx
	movaps	992(%rsp), %xmm3                # 16-byte Reload
	movq	400(%rsp), %rdx                 # 8-byte Reload
	.p2align	4, 0x90
.LBB11_105:                             # %vector.body532
                                        #   Parent Loop BB11_88 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	(%r8,%rcx,4), %xmm0
	movups	16(%r8,%rcx,4), %xmm1
	mulps	%xmm3, %xmm0
	mulps	%xmm3, %xmm1
	cvttps2dq	%xmm0, %xmm0
	packuswb	%xmm0, %xmm0
	packuswb	%xmm0, %xmm0
	cvttps2dq	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	movd	%xmm0, -4(%rax,%rcx)
	movd	%xmm1, (%rax,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB11_105
# %bb.106:                              # %middle.block524
                                        #   in Loop: Header=BB11_88 Depth=1
	movq	%rdx, %rcx
	cmpq	%r12, %rdx
	je	.LBB11_87
	.p2align	4, 0x90
.LBB11_107:                             # %scalar.ph525
                                        #   in Loop: Header=BB11_88 Depth=1
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	%rcx, %rax
	testb	$3, %dl
	je	.LBB11_110
# %bb.108:                              # %for.cond2.preheader.i.prol.preheader
                                        #   in Loop: Header=BB11_88 Depth=1
	movq	184(%rsp), %rax                 # 8-byte Reload
	leaq	(%rbx,%rax), %rdx
	movq	408(%rsp), %rsi                 # 8-byte Reload
	movq	%rcx, %rax
	.p2align	4, 0x90
.LBB11_109:                             # %for.cond2.preheader.i.prol
                                        #   Parent Loop BB11_88 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edi
	movb	%dil, (%rdx,%rax)
	incq	%rax
	decq	%rsi
	jne	.LBB11_109
.LBB11_110:                             # %for.cond2.preheader.i.prol.loopexit
                                        #   in Loop: Header=BB11_88 Depth=1
	movq	544(%rsp), %rdx                 # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$3, %rdx
	jb	.LBB11_87
# %bb.111:                              # %for.cond2.preheader.i.preheader708
                                        #   in Loop: Header=BB11_88 Depth=1
	addq	176(%rsp), %rbx                 # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB11_112:                             # %for.cond2.preheader.i
                                        #   Parent Loop BB11_88 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -3(%rbx,%rax)
	movss	4(%r8,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -2(%rbx,%rax)
	movss	8(%r8,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -1(%rbx,%rax)
	movss	12(%r8,%rax,4), %xmm0           # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, (%rbx,%rax)
	addq	$4, %rax
	cmpq	%rax, %r12
	jne	.LBB11_112
	jmp	.LBB11_87
.LBB11_113:                             # %for.body11.us.i.1.preheader
	leaq	1(%r14), %rax
	movq	%rax, 408(%rsp)                 # 8-byte Spill
	movq	208(%rsp), %rax                 # 8-byte Reload
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	%rcx, 400(%rsp)                 # 8-byte Spill
	movq	336(%rsp), %rcx                 # 8-byte Reload
	leaq	4(%rcx), %rdx
	movq	%rdx, 176(%rsp)                 # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	andl	$3, %eax
	movq	%rax, 328(%rsp)                 # 8-byte Spill
	leaq	3(%rcx), %rax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	leaq	(,%r14,4), %rax
	movq	%rax, 192(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	jmp	.LBB11_115
	.p2align	4, 0x90
.LBB11_114:                             # %if.then.i.i.i.i411.1
                                        #   in Loop: Header=BB11_115 Depth=1
	.cfi_escape 0x2e, 0x00
	movq	%r9, %rdi
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	416(%rsp), %rax                 # 8-byte Folded Reload
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	%r12, %rax
	movq	432(%rsp), %r12                 # 8-byte Reload
	addq	%rdx, %r12
	movq	200(%rsp), %rcx                 # 8-byte Reload
	incq	%rcx
	addq	%rax, 176(%rsp)                 # 8-byte Folded Spill
	addq	%rax, 336(%rsp)                 # 8-byte Folded Spill
	addq	%rax, 184(%rsp)                 # 8-byte Folded Spill
	addq	$4, 192(%rsp)                   # 8-byte Folded Spill
	movq	424(%rsp), %r14                 # 8-byte Reload
	movq	%rcx, %rax
	movq	%rcx, 200(%rsp)                 # 8-byte Spill
	cmpq	%r14, %rcx
	movq	552(%rsp), %r15                 # 8-byte Reload
	je	.LBB11_140
.LBB11_115:                             # %for.body11.us.i.1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_132 Depth 2
                                        #     Child Loop BB11_136 Depth 2
                                        #     Child Loop BB11_139 Depth 2
                                        #     Child Loop BB11_119 Depth 2
                                        #       Child Loop BB11_122 Depth 3
                                        #       Child Loop BB11_125 Depth 3
	movq	%r12, 432(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r13
	movslq	248(%rsp), %rbp
	movq	224(%rsp), %rbx
	movq	232(%rsp), %r12
	movq	240(%rsp), %rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
.Ltmp35:
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	_Znwm@PLT
.Ltmp36:
# %bb.116:                              # %call5.i.i.i.i4.i.i43.i.noexc.1
                                        #   in Loop: Header=BB11_115 Depth=1
	movq	%rax, %rdi
	movl	%ebp, %eax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	movq	200(%rsp), %rax                 # 8-byte Reload
	addq	%r14, %rax
	movq	208(%rsp), %r14                 # 8-byte Reload
	imulq	%r14, %rax
	addq	%rbx, %rax
	movq	%rax, 344(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	movq	%rdi, 136(%rsp)                 # 8-byte Spill
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movq	104(%rsp), %rcx                 # 8-byte Reload
	testl	%ecx, %ecx
	movq	%r13, 416(%rsp)                 # 8-byte Spill
	jle	.LBB11_126
# %bb.117:                              # %for.cond2.preheader.us.i.preheader.1
                                        #   in Loop: Header=BB11_115 Depth=1
	movl	%ecx, %eax
	andl	$-8, %eax
	movq	%rax, 320(%rsp)                 # 8-byte Spill
	movq	%rbp, %rdx
	imulq	192(%rsp), %rdx                 # 8-byte Folded Reload
	leaq	(%r12,%rdx), %rbx
	addq	$16, %rbx
	movq	96(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rdx), %r15
	addq	$16, %r15
	movl	%ecx, %r14d
	shrl	$3, %r14d
	shlq	$5, %r14
	addq	%rdx, %rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	addq	%r12, %rdx
	movq	%rdx, 464(%rsp)                 # 8-byte Spill
	xorl	%edx, %edx
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	leaq	496(%rsp), %rdi
	movq	136(%rsp), %r9                  # 8-byte Reload
	leaq	488(%rsp), %rax
	movq	%r14, 440(%rsp)                 # 8-byte Spill
	movq	%rbp, 448(%rsp)                 # 8-byte Spill
	jmp	.LBB11_119
	.p2align	4, 0x90
.LBB11_118:                             # %for.cond2.for.cond.cleanup4_crit_edge.us.i.1
                                        #   in Loop: Header=BB11_119 Depth=2
	movq	136(%rsp), %r9                  # 8-byte Reload
	movq	456(%rsp), %rdx                 # 8-byte Reload
	movss	%xmm0, (%r9,%rdx,4)
	mulss	768(%rsp), %xmm0                # 16-byte Folded Reload
	cvttss2si	%xmm0, %eax
	movq	344(%rsp), %rcx                 # 8-byte Reload
	movb	%al, (%rcx,%rdx)
	incq	%rdx
	movq	208(%rsp), %r12                 # 8-byte Reload
	cmpq	%r12, %rdx
	movq	%rbp, %rax
	leaq	496(%rsp), %rdi
	movq	448(%rsp), %rbp                 # 8-byte Reload
	movq	440(%rsp), %r14                 # 8-byte Reload
	je	.LBB11_114
.LBB11_119:                             # %for.cond2.preheader.us.i.1
                                        #   Parent Loop BB11_115 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_122 Depth 3
                                        #       Child Loop BB11_125 Depth 3
	xorps	%xmm1, %xmm1
	cvtsi2sd	%edx, %xmm1
	mulsd	.LCPI11_3(%rip), %xmm1
	movss	(%r9,%rdx,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	cmpl	$8, %ebp
	movq	%rdx, 456(%rsp)                 # 8-byte Spill
	movsd	%xmm1, 216(%rsp)                # 8-byte Spill
	jae	.LBB11_121
# %bb.120:                              #   in Loop: Header=BB11_119 Depth=2
	xorl	%r12d, %r12d
	movq	%rax, %rbp
	leaq	492(%rsp), %r13
	movq	96(%rsp), %r14                  # 8-byte Reload
	jmp	.LBB11_124
	.p2align	4, 0x90
.LBB11_121:                             # %vector.ph544
                                        #   in Loop: Header=BB11_119 Depth=2
	xorps	%xmm4, %xmm4
	xorps	%xmm5, %xmm5
	movss	%xmm0, %xmm5                    # xmm5 = xmm0[0],xmm5[1,2,3]
	mulsd	%xmm1, %xmm2
	unpcklpd	%xmm2, %xmm2                    # xmm2 = xmm2[0,0]
	movapd	%xmm2, 784(%rsp)                # 16-byte Spill
	xorl	%r12d, %r12d
	movdqa	.LCPI11_6(%rip), %xmm1          # xmm1 = [0,1,2,3]
	leaq	648(%rsp), %r13
	.p2align	4, 0x90
.LBB11_122:                             # %vector.body549
                                        #   Parent Loop BB11_115 Depth=1
                                        #     Parent Loop BB11_119 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm5, 352(%rsp)                # 16-byte Spill
	movaps	%xmm4, 384(%rsp)                # 16-byte Spill
	movdqa	%xmm1, 48(%rsp)                 # 16-byte Spill
	movdqa	%xmm1, %xmm0
	pshufd	$78, 48(%rsp), %xmm1            # 16-byte Folded Reload
                                        # xmm1 = mem[2,3,0,1]
	cvtdq2pd	%xmm1, %xmm1
	cvtdq2pd	48(%rsp), %xmm2                 # 16-byte Folded Reload
	paddd	.LCPI11_7(%rip), %xmm0
	pshufd	$78, %xmm0, %xmm3               # xmm3 = xmm0[2,3,0,1]
	cvtdq2pd	%xmm3, %xmm3
	cvtdq2pd	%xmm0, %xmm0
	movapd	784(%rsp), %xmm4                # 16-byte Reload
	mulpd	%xmm4, %xmm2
	mulpd	%xmm4, %xmm1
	mulpd	%xmm4, %xmm0
	mulpd	%xmm4, %xmm3
	cvtpd2ps	%xmm1, %xmm1
	movapd	%xmm1, 112(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm2, %xmm2
	movapd	%xmm2, 528(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm3, %xmm1
	movapd	%xmm1, 160(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm0, %xmm0
	movapd	%xmm0, 144(%rsp)                # 16-byte Spill
	movups	-16(%rbx,%r12), %xmm0
	movaps	%xmm0, 368(%rsp)                # 16-byte Spill
	movups	(%rbx,%r12), %xmm0
	movaps	%xmm0, 512(%rsp)                # 16-byte Spill
	.cfi_escape 0x2e, 0x00
	movapd	%xmm2, %xmm0
	leaq	656(%rsp), %rsi
	movq	%rdi, %rbp
	callq	sincosf@PLT
	movaps	528(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	664(%rsp), %rdi
	leaq	660(%rsp), %rsi
	callq	sincosf@PLT
	.cfi_escape 0x2e, 0x00
	movaps	112(%rsp), %xmm0                # 16-byte Reload
	leaq	672(%rsp), %rdi
	leaq	668(%rsp), %rsi
	callq	sincosf@PLT
	movaps	112(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	680(%rsp), %rdi
	leaq	676(%rsp), %rsi
	callq	sincosf@PLT
	movss	656(%rsp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	660(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	movss	668(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	676(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movlhps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	mulps	368(%rsp), %xmm2                # 16-byte Folded Reload
	addps	352(%rsp), %xmm2                # 16-byte Folded Reload
	movaps	%xmm2, 112(%rsp)                # 16-byte Spill
	.cfi_escape 0x2e, 0x00
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	leaq	628(%rsp), %rdi
	leaq	624(%rsp), %rsi
	callq	sincosf@PLT
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	636(%rsp), %rdi
	leaq	632(%rsp), %rsi
	callq	sincosf@PLT
	.cfi_escape 0x2e, 0x00
	movaps	160(%rsp), %xmm0                # 16-byte Reload
	leaq	644(%rsp), %rdi
	leaq	640(%rsp), %rsi
	callq	sincosf@PLT
	movaps	160(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	652(%rsp), %rdi
	movq	%r13, %rsi
	callq	sincosf@PLT
	movq	%rbp, %rdi
	movss	624(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	632(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	640(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	648(%rsp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	mulps	512(%rsp), %xmm0                # 16-byte Folded Reload
	addps	384(%rsp), %xmm0                # 16-byte Folded Reload
	movups	-16(%r15,%r12), %xmm1
	movups	(%r15,%r12), %xmm2
	movss	496(%rsp), %xmm5                # xmm5 = mem[0],zero,zero,zero
	movss	664(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm5                    # xmm5 = xmm5[0],xmm3[0],xmm5[1],xmm3[1]
	movss	672(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	movss	680(%rsp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	unpcklps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movlhps	%xmm3, %xmm5                    # xmm5 = xmm5[0],xmm3[0]
	mulps	%xmm1, %xmm5
	addps	112(%rsp), %xmm5                # 16-byte Folded Reload
	movss	628(%rsp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	movss	636(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm4                    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1]
	movss	644(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	652(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm1                    # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	movlhps	%xmm1, %xmm4                    # xmm4 = xmm4[0],xmm1[0]
	movdqa	48(%rsp), %xmm1                 # 16-byte Reload
	mulps	%xmm2, %xmm4
	addps	%xmm0, %xmm4
	paddd	.LCPI11_8(%rip), %xmm1
	addq	$32, %r12
	cmpq	%r12, %r14
	jne	.LBB11_122
# %bb.123:                              # %middle.block541
                                        #   in Loop: Header=BB11_119 Depth=2
	addps	%xmm5, %xmm4
	movaps	%xmm4, %xmm1
	unpckhpd	%xmm4, %xmm1                    # xmm1 = xmm1[1],xmm4[1]
	addps	%xmm4, %xmm1
	movaps	%xmm1, %xmm0
	shufps	$85, %xmm1, %xmm0               # xmm0 = xmm0[1,1],xmm1[1,1]
	addss	%xmm1, %xmm0
	movq	320(%rsp), %rax                 # 8-byte Reload
	movq	%rax, %r12
	cmpq	104(%rsp), %rax                 # 8-byte Folded Reload
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	leaq	492(%rsp), %r13
	leaq	488(%rsp), %rbp
	movq	96(%rsp), %r14                  # 8-byte Reload
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	je	.LBB11_118
.LBB11_124:                             # %for.body5.us.i.1.preheader
                                        #   in Loop: Header=BB11_119 Depth=2
	movaps	%xmm0, %xmm3
	.p2align	4, 0x90
.LBB11_125:                             # %for.body5.us.i.1
                                        #   Parent Loop BB11_115 Depth=1
                                        #     Parent Loop BB11_119 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	%xmm3, 48(%rsp)                 # 4-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r12d, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	sincosf@PLT
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	movss	488(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movq	464(%rsp), %rax                 # 8-byte Reload
	mulss	(%rax,%r12,4), %xmm1
	movss	492(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	48(%rsp), %xmm1                 # 4-byte Folded Reload
	mulss	(%r14,%r12,4), %xmm0
	addss	%xmm1, %xmm0
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	incq	%r12
	movaps	%xmm0, %xmm3
	cmpq	%r12, 104(%rsp)                 # 8-byte Folded Reload
	jne	.LBB11_125
	jmp	.LBB11_118
	.p2align	4, 0x90
.LBB11_126:                             # %for.cond2.preheader.i.1.preheader
                                        #   in Loop: Header=BB11_115 Depth=1
	cmpl	$8, %r14d
	movq	%r14, %r12
	movaps	768(%rsp), %xmm2                # 16-byte Reload
	movaps	992(%rsp), %xmm3                # 16-byte Reload
	jae	.LBB11_128
# %bb.127:                              #   in Loop: Header=BB11_115 Depth=1
	xorl	%ecx, %ecx
	movq	136(%rsp), %r9                  # 8-byte Reload
	jmp	.LBB11_134
.LBB11_128:                             # %vector.memcheck572
                                        #   in Loop: Header=BB11_115 Depth=1
	movq	136(%rsp), %r9                  # 8-byte Reload
	leaq	(%r9,%r15), %rax
	cmpq	%rax, 344(%rsp)                 # 8-byte Folded Reload
	jae	.LBB11_131
# %bb.129:                              # %vector.memcheck572
                                        #   in Loop: Header=BB11_115 Depth=1
	movq	408(%rsp), %rax                 # 8-byte Reload
	movq	200(%rsp), %rcx                 # 8-byte Reload
	addq	%rcx, %rax
	imulq	%r12, %rax
	addq	%rbx, %rax
	cmpq	%rax, %r9
	jae	.LBB11_131
# %bb.130:                              #   in Loop: Header=BB11_115 Depth=1
	xorl	%ecx, %ecx
	jmp	.LBB11_134
.LBB11_131:                             # %vector.body586.preheader
                                        #   in Loop: Header=BB11_115 Depth=1
	movq	176(%rsp), %rax                 # 8-byte Reload
	addq	%rbx, %rax
	xorl	%ecx, %ecx
	movq	400(%rsp), %rdx                 # 8-byte Reload
	.p2align	4, 0x90
.LBB11_132:                             # %vector.body586
                                        #   Parent Loop BB11_115 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	(%r9,%rcx,4), %xmm0
	movups	16(%r9,%rcx,4), %xmm1
	mulps	%xmm3, %xmm0
	mulps	%xmm3, %xmm1
	cvttps2dq	%xmm0, %xmm0
	packuswb	%xmm0, %xmm0
	packuswb	%xmm0, %xmm0
	cvttps2dq	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	movd	%xmm0, -4(%rax,%rcx)
	movd	%xmm1, (%rax,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB11_132
# %bb.133:                              # %middle.block578
                                        #   in Loop: Header=BB11_115 Depth=1
	movq	%rdx, %rcx
	cmpq	%r12, %rdx
	je	.LBB11_114
	.p2align	4, 0x90
.LBB11_134:                             # %scalar.ph579
                                        #   in Loop: Header=BB11_115 Depth=1
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	%rcx, %rax
	testb	$3, %dl
	je	.LBB11_137
# %bb.135:                              # %for.cond2.preheader.i.1.prol.preheader
                                        #   in Loop: Header=BB11_115 Depth=1
	movq	336(%rsp), %rax                 # 8-byte Reload
	leaq	(%rbx,%rax), %rdx
	movq	328(%rsp), %rsi                 # 8-byte Reload
	movq	%rcx, %rax
	.p2align	4, 0x90
.LBB11_136:                             # %for.cond2.preheader.i.1.prol
                                        #   Parent Loop BB11_115 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r9,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %r8d
	movb	%r8b, (%rdx,%rax)
	incq	%rax
	decq	%rsi
	jne	.LBB11_136
.LBB11_137:                             # %for.cond2.preheader.i.1.prol.loopexit
                                        #   in Loop: Header=BB11_115 Depth=1
	movq	544(%rsp), %rdx                 # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$3, %rdx
	jb	.LBB11_114
# %bb.138:                              # %for.cond2.preheader.i.1.preheader706
                                        #   in Loop: Header=BB11_115 Depth=1
	addq	184(%rsp), %rbx                 # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB11_139:                             # %for.cond2.preheader.i.1
                                        #   Parent Loop BB11_115 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r9,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -3(%rbx,%rax)
	movss	4(%r9,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -2(%rbx,%rax)
	movss	8(%r9,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -1(%rbx,%rax)
	movss	12(%r9,%rax,4), %xmm0           # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, (%rbx,%rax)
	addq	$4, %rax
	cmpq	%rax, %r12
	jne	.LBB11_139
	jmp	.LBB11_114
.LBB11_140:                             # %for.cond7.for.cond.cleanup10_crit_edge.us.i.1
	leaq	(%r14,%r14), %rax
	movq	%rax, 328(%rsp)                 # 8-byte Spill
	leaq	1(,%r14,2), %rax
	movq	%rax, 400(%rsp)                 # 8-byte Spill
	movq	208(%rsp), %rcx                 # 8-byte Reload
	movl	%ecx, %eax
	andl	$-8, %eax
	movq	%rax, 1008(%rsp)                # 8-byte Spill
	movq	%rcx, %rax
	imulq	%r14, %rax
	leaq	(%rax,%rax), %rdx
	movq	%rdx, 336(%rsp)                 # 8-byte Spill
	leaq	4(,%rax,2), %rdx
	movq	%rdx, 176(%rsp)                 # 8-byte Spill
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	andl	$3, %ecx
	movq	%rcx, 408(%rsp)                 # 8-byte Spill
	leaq	3(,%rax,2), %rax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	leaq	(,%r14,8), %rax
	movq	%rax, 192(%rsp)                 # 8-byte Spill
	xorl	%r14d, %r14d
	jmp	.LBB11_142
	.p2align	4, 0x90
.LBB11_141:                             # %if.then.i.i.i.i411.2
                                        #   in Loop: Header=BB11_142 Depth=1
	.cfi_escape 0x2e, 0x00
	movq	%r9, %rdi
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	200(%rsp), %rax                 # 8-byte Folded Reload
	movabsq	$2361183241434822607, %r15      # imm = 0x20C49BA5E353F7CF
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	%r12, %rax
	movq	432(%rsp), %r12                 # 8-byte Reload
	addq	%rdx, %r12
	movq	320(%rsp), %r14                 # 8-byte Reload
	incq	%r14
	addq	%rax, 176(%rsp)                 # 8-byte Folded Spill
	addq	%rax, 336(%rsp)                 # 8-byte Folded Spill
	addq	%rax, 184(%rsp)                 # 8-byte Folded Spill
	addq	$4, 192(%rsp)                   # 8-byte Folded Spill
	cmpq	424(%rsp), %r14                 # 8-byte Folded Reload
	je	.LBB11_42
.LBB11_142:                             # %for.body11.us.i.2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_159 Depth 2
                                        #     Child Loop BB11_163 Depth 2
                                        #     Child Loop BB11_166 Depth 2
                                        #     Child Loop BB11_146 Depth 2
                                        #       Child Loop BB11_149 Depth 3
                                        #       Child Loop BB11_152 Depth 3
	movq	%r12, 432(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r13
	movslq	248(%rsp), %rbp
	movq	224(%rsp), %rbx
	movq	232(%rsp), %r12
	movq	240(%rsp), %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
.Ltmp38:
	.cfi_escape 0x2e, 0x00
	movq	552(%rsp), %r15                 # 8-byte Reload
	movq	%r15, %rdi
	callq	_Znwm@PLT
.Ltmp39:
# %bb.143:                              # %call5.i.i.i.i4.i.i43.i.noexc.2
                                        #   in Loop: Header=BB11_142 Depth=1
	movq	%rax, %rdi
	movl	%ebp, %eax
	movq	%rax, 416(%rsp)                 # 8-byte Spill
	movq	328(%rsp), %rax                 # 8-byte Reload
	movq	%r14, 320(%rsp)                 # 8-byte Spill
	addq	%r14, %rax
	movq	208(%rsp), %r14                 # 8-byte Reload
	imulq	%r14, %rax
	addq	%rbx, %rax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	movq	%rdi, 96(%rsp)                  # 8-byte Spill
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movq	416(%rsp), %rax                 # 8-byte Reload
	testl	%eax, %eax
	movq	%r13, 200(%rsp)                 # 8-byte Spill
	jle	.LBB11_153
# %bb.144:                              # %for.cond2.preheader.us.i.preheader.2
                                        #   in Loop: Header=BB11_142 Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	%rcx, 440(%rsp)                 # 8-byte Spill
	movq	%rbp, %rsi
	imulq	192(%rsp), %rsi                 # 8-byte Folded Reload
	leaq	(%r12,%rsi), %rbx
	addq	$16, %rbx
	movq	104(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rsi), %r15
	addq	$16, %r15
	movl	%eax, %r13d
	shrl	$3, %r13d
	shlq	$5, %r13
	addq	%rsi, %rcx
	movq	%rcx, 104(%rsp)                 # 8-byte Spill
	addq	%r12, %rsi
	movq	%rsi, 464(%rsp)                 # 8-byte Spill
	xorl	%esi, %esi
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	leaq	484(%rsp), %rdi
	movq	96(%rsp), %r9                   # 8-byte Reload
	movq	%rax, %r14
	leaq	476(%rsp), %rax
	movq	%r13, 448(%rsp)                 # 8-byte Spill
	movq	%rbp, 344(%rsp)                 # 8-byte Spill
	jmp	.LBB11_146
	.p2align	4, 0x90
.LBB11_145:                             # %for.cond2.for.cond.cleanup4_crit_edge.us.i.2
                                        #   in Loop: Header=BB11_146 Depth=2
	movq	96(%rsp), %r9                   # 8-byte Reload
	movq	456(%rsp), %rsi                 # 8-byte Reload
	movss	%xmm0, (%r9,%rsi,4)
	mulss	768(%rsp), %xmm0                # 16-byte Folded Reload
	cvttss2si	%xmm0, %eax
	movq	136(%rsp), %rcx                 # 8-byte Reload
	movb	%al, (%rcx,%rsi)
	incq	%rsi
	movq	208(%rsp), %r12                 # 8-byte Reload
	cmpq	%r12, %rsi
	movq	%rbp, %rax
	leaq	484(%rsp), %rdi
	movq	344(%rsp), %rbp                 # 8-byte Reload
	movq	448(%rsp), %r13                 # 8-byte Reload
	je	.LBB11_141
.LBB11_146:                             # %for.cond2.preheader.us.i.2
                                        #   Parent Loop BB11_142 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_149 Depth 3
                                        #       Child Loop BB11_152 Depth 3
	xorps	%xmm1, %xmm1
	cvtsi2sd	%esi, %xmm1
	mulsd	.LCPI11_3(%rip), %xmm1
	movss	(%r9,%rsi,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	cmpl	$8, %ebp
	movq	%rsi, 456(%rsp)                 # 8-byte Spill
	movsd	%xmm1, 216(%rsp)                # 8-byte Spill
	jae	.LBB11_148
# %bb.147:                              #   in Loop: Header=BB11_146 Depth=2
	xorl	%r12d, %r12d
	movq	%rax, %rbp
	leaq	480(%rsp), %r13
	jmp	.LBB11_151
	.p2align	4, 0x90
.LBB11_148:                             # %vector.ph598
                                        #   in Loop: Header=BB11_146 Depth=2
	xorps	%xmm4, %xmm4
	xorps	%xmm5, %xmm5
	movss	%xmm0, %xmm5                    # xmm5 = xmm0[0],xmm5[1,2,3]
	mulsd	%xmm1, %xmm2
	unpcklpd	%xmm2, %xmm2                    # xmm2 = xmm2[0,0]
	movapd	%xmm2, 784(%rsp)                # 16-byte Spill
	xorl	%r12d, %r12d
	movdqa	.LCPI11_6(%rip), %xmm1          # xmm1 = [0,1,2,3]
	.p2align	4, 0x90
.LBB11_149:                             # %vector.body603
                                        #   Parent Loop BB11_142 Depth=1
                                        #     Parent Loop BB11_146 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm5, 352(%rsp)                # 16-byte Spill
	movaps	%xmm4, 512(%rsp)                # 16-byte Spill
	movdqa	%xmm1, 48(%rsp)                 # 16-byte Spill
	movdqa	%xmm1, %xmm0
	pshufd	$78, 48(%rsp), %xmm1            # 16-byte Folded Reload
                                        # xmm1 = mem[2,3,0,1]
	cvtdq2pd	%xmm1, %xmm1
	cvtdq2pd	48(%rsp), %xmm2                 # 16-byte Folded Reload
	paddd	.LCPI11_7(%rip), %xmm0
	pshufd	$78, %xmm0, %xmm3               # xmm3 = xmm0[2,3,0,1]
	cvtdq2pd	%xmm3, %xmm3
	cvtdq2pd	%xmm0, %xmm0
	movapd	784(%rsp), %xmm4                # 16-byte Reload
	mulpd	%xmm4, %xmm2
	mulpd	%xmm4, %xmm1
	mulpd	%xmm4, %xmm0
	mulpd	%xmm4, %xmm3
	cvtpd2ps	%xmm1, %xmm1
	movapd	%xmm1, 112(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm2, %xmm2
	movapd	%xmm2, 528(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm3, %xmm1
	movapd	%xmm1, 160(%rsp)                # 16-byte Spill
	cvtpd2ps	%xmm0, %xmm0
	movapd	%xmm0, 144(%rsp)                # 16-byte Spill
	movups	-16(%rbx,%r12), %xmm0
	movaps	%xmm0, 368(%rsp)                # 16-byte Spill
	movups	(%rbx,%r12), %xmm0
	movaps	%xmm0, 384(%rsp)                # 16-byte Spill
	.cfi_escape 0x2e, 0x00
	movapd	%xmm2, %xmm0
	leaq	596(%rsp), %rsi
	movq	%rdi, %rbp
	callq	sincosf@PLT
	movaps	528(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	604(%rsp), %rdi
	leaq	600(%rsp), %rsi
	callq	sincosf@PLT
	.cfi_escape 0x2e, 0x00
	movaps	112(%rsp), %xmm0                # 16-byte Reload
	leaq	612(%rsp), %rdi
	leaq	608(%rsp), %rsi
	callq	sincosf@PLT
	movaps	112(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	620(%rsp), %rdi
	leaq	616(%rsp), %rsi
	callq	sincosf@PLT
	movss	596(%rsp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	600(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	movss	608(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	616(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movlhps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	mulps	368(%rsp), %xmm2                # 16-byte Folded Reload
	addps	352(%rsp), %xmm2                # 16-byte Folded Reload
	movaps	%xmm2, 112(%rsp)                # 16-byte Spill
	.cfi_escape 0x2e, 0x00
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	leaq	568(%rsp), %rdi
	leaq	564(%rsp), %rsi
	callq	sincosf@PLT
	movaps	144(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	576(%rsp), %rdi
	leaq	572(%rsp), %rsi
	callq	sincosf@PLT
	.cfi_escape 0x2e, 0x00
	movaps	160(%rsp), %xmm0                # 16-byte Reload
	leaq	584(%rsp), %rdi
	leaq	580(%rsp), %rsi
	callq	sincosf@PLT
	movaps	160(%rsp), %xmm0                # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	.cfi_escape 0x2e, 0x00
	leaq	592(%rsp), %rdi
	leaq	588(%rsp), %rsi
	callq	sincosf@PLT
	movq	%rbp, %rdi
	movss	564(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	572(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movss	580(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	588(%rsp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movlhps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	mulps	384(%rsp), %xmm0                # 16-byte Folded Reload
	addps	512(%rsp), %xmm0                # 16-byte Folded Reload
	movups	-16(%r15,%r12), %xmm1
	movups	(%r15,%r12), %xmm2
	movss	484(%rsp), %xmm5                # xmm5 = mem[0],zero,zero,zero
	movss	604(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm5                    # xmm5 = xmm5[0],xmm3[0],xmm5[1],xmm3[1]
	movss	612(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	movss	620(%rsp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	unpcklps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movlhps	%xmm3, %xmm5                    # xmm5 = xmm5[0],xmm3[0]
	mulps	%xmm1, %xmm5
	addps	112(%rsp), %xmm5                # 16-byte Folded Reload
	movss	568(%rsp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	movss	576(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm4                    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1]
	movss	584(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	592(%rsp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm1                    # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	movlhps	%xmm1, %xmm4                    # xmm4 = xmm4[0],xmm1[0]
	movdqa	48(%rsp), %xmm1                 # 16-byte Reload
	mulps	%xmm2, %xmm4
	addps	%xmm0, %xmm4
	paddd	.LCPI11_8(%rip), %xmm1
	addq	$32, %r12
	cmpq	%r12, %r13
	jne	.LBB11_149
# %bb.150:                              # %middle.block595
                                        #   in Loop: Header=BB11_146 Depth=2
	addps	%xmm5, %xmm4
	movaps	%xmm4, %xmm1
	unpckhpd	%xmm4, %xmm1                    # xmm1 = xmm1[1],xmm4[1]
	addps	%xmm4, %xmm1
	movaps	%xmm1, %xmm0
	shufps	$85, %xmm1, %xmm0               # xmm0 = xmm0[1,1],xmm1[1,1]
	addss	%xmm1, %xmm0
	movq	440(%rsp), %rcx                 # 8-byte Reload
	movq	%rcx, %r12
	movq	%r14, %rax
	cmpq	%r14, %rcx
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	leaq	480(%rsp), %r13
	leaq	476(%rsp), %rbp
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	je	.LBB11_145
.LBB11_151:                             # %for.body5.us.i.2.preheader
                                        #   in Loop: Header=BB11_146 Depth=2
	movaps	%xmm0, %xmm3
	.p2align	4, 0x90
.LBB11_152:                             # %for.body5.us.i.2
                                        #   Parent Loop BB11_142 Depth=1
                                        #     Parent Loop BB11_146 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	%xmm3, 48(%rsp)                 # 4-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r12d, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	sincosf@PLT
	movq	%r14, %rcx
	movsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	movss	476(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movq	464(%rsp), %rax                 # 8-byte Reload
	mulss	(%rax,%r12,4), %xmm1
	movss	480(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	48(%rsp), %xmm1                 # 4-byte Folded Reload
	movq	104(%rsp), %rax                 # 8-byte Reload
	mulss	(%rax,%r12,4), %xmm0
	addss	%xmm1, %xmm0
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	incq	%r12
	movaps	%xmm0, %xmm3
	cmpq	%r12, %r14
	jne	.LBB11_152
	jmp	.LBB11_145
	.p2align	4, 0x90
.LBB11_153:                             # %for.cond2.preheader.i.2.preheader
                                        #   in Loop: Header=BB11_142 Depth=1
	cmpl	$8, %r14d
	movq	%r14, %r12
	movaps	768(%rsp), %xmm2                # 16-byte Reload
	movaps	992(%rsp), %xmm3                # 16-byte Reload
	jae	.LBB11_155
# %bb.154:                              #   in Loop: Header=BB11_142 Depth=1
	xorl	%ecx, %ecx
	movq	96(%rsp), %r9                   # 8-byte Reload
	jmp	.LBB11_161
.LBB11_155:                             # %vector.memcheck626
                                        #   in Loop: Header=BB11_142 Depth=1
	movq	96(%rsp), %r9                   # 8-byte Reload
	leaq	(%r9,%r15), %rax
	cmpq	%rax, 136(%rsp)                 # 8-byte Folded Reload
	movq	320(%rsp), %rcx                 # 8-byte Reload
	jae	.LBB11_158
# %bb.156:                              # %vector.memcheck626
                                        #   in Loop: Header=BB11_142 Depth=1
	movq	400(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	imulq	%r12, %rax
	addq	%rbx, %rax
	cmpq	%rax, %r9
	jae	.LBB11_158
# %bb.157:                              #   in Loop: Header=BB11_142 Depth=1
	xorl	%ecx, %ecx
	jmp	.LBB11_161
.LBB11_158:                             # %vector.body640.preheader
                                        #   in Loop: Header=BB11_142 Depth=1
	movq	176(%rsp), %rax                 # 8-byte Reload
	addq	%rbx, %rax
	xorl	%ecx, %ecx
	movq	1008(%rsp), %rdx                # 8-byte Reload
	.p2align	4, 0x90
.LBB11_159:                             # %vector.body640
                                        #   Parent Loop BB11_142 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	(%r9,%rcx,4), %xmm0
	movups	16(%r9,%rcx,4), %xmm1
	mulps	%xmm3, %xmm0
	mulps	%xmm3, %xmm1
	cvttps2dq	%xmm0, %xmm0
	packuswb	%xmm0, %xmm0
	packuswb	%xmm0, %xmm0
	cvttps2dq	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	packuswb	%xmm1, %xmm1
	movd	%xmm0, -4(%rax,%rcx)
	movd	%xmm1, (%rax,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB11_159
# %bb.160:                              # %middle.block632
                                        #   in Loop: Header=BB11_142 Depth=1
	movq	%rdx, %rcx
	cmpq	%r12, %rdx
	je	.LBB11_141
	.p2align	4, 0x90
.LBB11_161:                             # %scalar.ph633
                                        #   in Loop: Header=BB11_142 Depth=1
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	%rcx, %rax
	testb	$3, %dl
	je	.LBB11_164
# %bb.162:                              # %for.cond2.preheader.i.2.prol.preheader
                                        #   in Loop: Header=BB11_142 Depth=1
	movq	336(%rsp), %rax                 # 8-byte Reload
	leaq	(%rbx,%rax), %rdx
	movq	408(%rsp), %rsi                 # 8-byte Reload
	movq	%rcx, %rax
	.p2align	4, 0x90
.LBB11_163:                             # %for.cond2.preheader.i.2.prol
                                        #   Parent Loop BB11_142 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r9,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %r8d
	movb	%r8b, (%rdx,%rax)
	incq	%rax
	decq	%rsi
	jne	.LBB11_163
.LBB11_164:                             # %for.cond2.preheader.i.2.prol.loopexit
                                        #   in Loop: Header=BB11_142 Depth=1
	movq	544(%rsp), %rdx                 # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$3, %rdx
	jb	.LBB11_141
# %bb.165:                              # %for.cond2.preheader.i.2.preheader703
                                        #   in Loop: Header=BB11_142 Depth=1
	addq	184(%rsp), %rbx                 # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB11_166:                             # %for.cond2.preheader.i.2
                                        #   Parent Loop BB11_142 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r9,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -3(%rbx,%rax)
	movss	4(%r9,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -2(%rbx,%rax)
	movss	8(%r9,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, -1(%rbx,%rax)
	movss	12(%r9,%rax,4), %xmm0           # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movb	%cl, (%rbx,%rax)
	addq	$4, %rax
	cmpq	%rax, %r12
	jne	.LBB11_166
	jmp	.LBB11_141
.LBB11_167:                             # %for.body11.us.i260.us.preheader
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	movq	48(%rsp), %r13                  # 8-byte Reload
	jmp	.LBB11_169
	.p2align	4, 0x90
.LBB11_168:                             # %.noexc292.us
                                        #   in Loop: Header=BB11_169 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r12, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r14
	incq	%r15
	addq	%rbp, %rbx
	cmpq	%r15, 8(%rsp)                   # 8-byte Folded Reload
	je	.LBB11_171
.LBB11_169:                             # %for.body11.us.i260.us
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r12
	movslq	248(%rsp), %rax
	movq	224(%rsp), %rcx
	addq	%rbx, %rcx
	movl	%eax, 20(%rsp)
	imulq	%r15, %rax
	shlq	$2, %rax
	movq	232(%rsp), %rdx
	addq	%rax, %rdx
	addq	240(%rsp), %rax
	movl	$0, 16(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rax, 24(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	%r13, 80(%rsp)
	.cfi_escape 0x2e, 0x20
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$6, %esi
	leaq	_Z13decompressParjiPhPKfS1_.omp_outlined(%rip), %rdx
	leaq	24(%rsp), %rcx
	leaq	28(%rsp), %r8
	leaq	72(%rsp), %r9
	xorl	%eax, %eax
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	40(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	56(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_168
# %bb.170:                              # %if.then.i.i.i.i428.us
                                        #   in Loop: Header=BB11_169 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
	jmp	.LBB11_168
.LBB11_171:                             # %for.body11.us.i260.us.1.preheader
	movq	%rbp, %rbx
	movq	8(%rsp), %r13                   # 8-byte Reload
	imulq	%r13, %rbx
	xorl	%r15d, %r15d
	jmp	.LBB11_173
	.p2align	4, 0x90
.LBB11_172:                             # %.noexc292.us.1
                                        #   in Loop: Header=BB11_173 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r12, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r14
	incq	%r15
	addq	%rbp, %rbx
	movq	8(%rsp), %r13                   # 8-byte Reload
	cmpq	%r15, %r13
	je	.LBB11_175
.LBB11_173:                             # %for.body11.us.i260.us.1
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r12
	movslq	248(%rsp), %rax
	leaq	(%r15,%r13), %rcx
	movq	224(%rsp), %rdx
	imulq	%rax, %rcx
	shlq	$2, %rcx
	movq	232(%rsp), %rsi
	addq	%rcx, %rsi
	addq	240(%rsp), %rcx
	addq	%rbx, %rdx
	movl	$0, 16(%rsp)
	movl	%eax, 20(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rcx, 24(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	48(%rsp), %rax                  # 8-byte Reload
	movq	%rax, 80(%rsp)
	.cfi_escape 0x2e, 0x20
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$6, %esi
	leaq	_Z13decompressParjiPhPKfS1_.omp_outlined(%rip), %rdx
	leaq	24(%rsp), %rcx
	leaq	28(%rsp), %r8
	leaq	72(%rsp), %r9
	xorl	%eax, %eax
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	40(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	56(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_172
# %bb.174:                              # %if.then.i.i.i.i428.us.1
                                        #   in Loop: Header=BB11_173 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
	jmp	.LBB11_172
.LBB11_175:                             # %for.cond7.for.cond.cleanup10_crit_edge.us.i277.us.1
	leaq	(,%r13,2), %rbx
	movq	%rbp, %r15
	imulq	%r13, %r15
	addq	%r15, %r15
	leaq	.L__unnamed_1(%rip), %r13
	jmp	.LBB11_177
	.p2align	4, 0x90
.LBB11_176:                             # %.noexc292.us.2
                                        #   in Loop: Header=BB11_177 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r12, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r14
	incq	%rbx
	addq	%rbp, %r15
	decq	8(%rsp)                         # 8-byte Folded Spill
	je	.LBB11_179
.LBB11_177:                             # %for.body11.us.i260.us.2
                                        # =>This Inner Loop Header: Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r12
	movslq	248(%rsp), %rax
	movq	224(%rsp), %rcx
	addq	%r15, %rcx
	movl	%eax, 20(%rsp)
	imulq	%rbx, %rax
	shlq	$2, %rax
	movq	232(%rsp), %rdx
	addq	%rax, %rdx
	addq	240(%rsp), %rax
	movl	$0, 16(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rax, 24(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	48(%rsp), %rax                  # 8-byte Reload
	movq	%rax, 80(%rsp)
	.cfi_escape 0x2e, 0x20
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movq	%r13, %rdi
	movl	$6, %esi
	leaq	_Z13decompressParjiPhPKfS1_.omp_outlined(%rip), %rdx
	leaq	24(%rsp), %rcx
	leaq	28(%rsp), %r8
	leaq	72(%rsp), %r9
	xorl	%eax, %eax
	leaq	48(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	40(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	leaq	56(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_176
# %bb.178:                              # %if.then.i.i.i.i428.us.2
                                        #   in Loop: Header=BB11_177 Depth=1
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
	jmp	.LBB11_176
.LBB11_179:                             # %for.cond.cleanup.loopexit85.i280
	movq	%r14, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rdx, %xmm0
	mulsd	.LCPI11_4(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
.LBB11_180:                             # %for.cond.cleanup.i281
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
	movq	232(%rsp), %rdi
	testq	%rdi, %rdi
	leaq	232(%rsp), %rbx
	je	.LBB11_182
# %bb.181:                              # %delete.notnull.i285
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_182:                             # %delete.end.i286
	movq	240(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_184
# %bb.183:                              # %delete.notnull52.i289
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_184:                             # %invoke.cont39
	movss	144(%rsp), %xmm2                # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	movss	8(%rsp), %xmm3                  # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	cvtss2sd	%xmm3, %xmm1
	addss	%xmm2, %xmm3
	xorps	%xmm2, %xmm2
	cvtss2sd	%xmm3, %xmm2
	xorps	%xmm3, %xmm3
	movups	%xmm3, (%rbx)
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.5(%rip), %rdi
	movb	$3, %al
	callq	printf@PLT
	leaq	848(%rsp), %r14
	movq	%r14, 832(%rsp)
	movq	$23, 64(%rsp)
.Ltmp67:
	.cfi_escape 0x2e, 0x00
	leaq	832(%rsp), %rdi
	leaq	64(%rsp), %rsi
	xorl	%edx, %edx
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.Ltmp68:
# %bb.185:                              # %call2.i10.i.noexc306
	movq	%rax, 832(%rsp)
	movq	64(%rsp), %rcx
	movq	%rcx, 848(%rsp)
	movups	.L.str.6(%rip), %xmm0
	movups	%xmm0, (%rax)
	movabsq	$8101239256052294000, %rdx      # imm = 0x706D622E61726170
	movq	%rdx, 15(%rax)
	movq	%rcx, 840(%rsp)
	movq	832(%rsp), %rax
	movb	$0, (%rax,%rcx)
.Ltmp70:
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	leaq	832(%rsp), %rsi
	callq	_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Ltmp71:
# %bb.186:                              # %invoke.cont52
	movq	832(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_188
# %bb.187:                              # %if.then.i.i310
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB11_188:                             # %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit314
	leaq	912(%rsp), %r14
	movq	%r14, 896(%rsp)
	movabsq	$3343197528519702629, %rax      # imm = 0x2E656C706D617865
	movq	%rax, 912(%rsp)
	movl	$1886216750, 919(%rsp)          # imm = 0x706D622E
	movq	$11, 904(%rsp)
	movb	$0, 923(%rsp)
.Ltmp73:
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	leaq	896(%rsp), %rsi
	callq	_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Ltmp74:
# %bb.189:                              # %invoke.cont61
	movq	896(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_191
# %bb.190:                              # %if.then.i.i331
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB11_191:                             # %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit335
.Ltmp76:
	.cfi_escape 0x2e, 0x00
	leaq	_Z15compressParFastjiPKhPfS1_(%rip), %rsi
	leaq	224(%rsp), %rdi
	movl	$64, %edx
	callq	_ZN3BMP8compressEPFvjiPKhPfS2_Em
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
.Ltmp77:
# %bb.192:                              # %invoke.cont66
.Ltmp79:
	.cfi_escape 0x2e, 0x00
	leaq	_Z17decompressParFastjiPhPKfS1_(%rip), %rsi
	leaq	224(%rsp), %rdi
	callq	_ZN3BMP10decompressEPFvjiPhPKfS2_E
.Ltmp80:
# %bb.193:                              # %invoke.cont69
	movss	8(%rsp), %xmm2                  # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	cvtss2sd	%xmm2, %xmm3
	cvtss2sd	%xmm0, %xmm1
	addss	%xmm2, %xmm0
	xorps	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.7(%rip), %rdi
	movaps	%xmm3, %xmm0
	movb	$3, %al
	callq	printf@PLT
	leaq	816(%rsp), %r14
	movq	%r14, 800(%rsp)
	movq	$28, 64(%rsp)
.Ltmp82:
	.cfi_escape 0x2e, 0x00
	leaq	800(%rsp), %rdi
	leaq	64(%rsp), %rsi
	xorl	%edx, %edx
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.Ltmp83:
# %bb.194:                              # %call2.i10.i.noexc348
	movq	%rax, 800(%rsp)
	movq	64(%rsp), %rcx
	movq	%rcx, 816(%rsp)
	movups	.L.str.8+12(%rip), %xmm0
	movups	%xmm0, 12(%rax)
	movups	.L.str.8(%rip), %xmm0
	movups	%xmm0, (%rax)
	movq	%rcx, 808(%rsp)
	movq	800(%rsp), %rax
	movb	$0, (%rax,%rcx)
.Ltmp85:
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	leaq	800(%rsp), %rsi
	callq	_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Ltmp86:
# %bb.195:                              # %invoke.cont82
	movq	800(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_197
# %bb.196:                              # %if.then.i.i352
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPv@PLT
.LBB11_197:                             # %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit356
	movq	224(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_199
# %bb.198:                              # %delete.notnull.i358
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_199:                             # %delete.end.i359
	movq	232(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_201
# %bb.200:                              # %delete.notnull3.i
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_201:                             # %delete.end4.i
	movq	240(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB11_203
# %bb.202:                              # %delete.notnull6.i
	.cfi_escape 0x2e, 0x00
	callq	_ZdaPv@PLT
.LBB11_203:                             # %_ZN3BMPD2Ev.exit
	xorl	%eax, %eax
	addq	$1016, %rsp                     # imm = 0x3F8
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB11_204:                             # %lpad81
	.cfi_def_cfa_offset 1072
.Ltmp87:
	movq	%rax, %rbx
	movq	800(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_233
# %bb.205:                              # %if.then.i.i393
	.cfi_escape 0x2e, 0x00
	jmp	.LBB11_227
.LBB11_206:                             # %lpad79
.Ltmp84:
	jmp	.LBB11_229
.LBB11_207:                             # %lpad68
.Ltmp81:
	jmp	.LBB11_229
.LBB11_208:                             # %lpad65
.Ltmp78:
	jmp	.LBB11_229
.LBB11_209:                             # %lpad60
.Ltmp75:
	movq	%rax, %rbx
	movq	896(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_233
# %bb.210:                              # %if.then.i.i387
	.cfi_escape 0x2e, 0x00
	jmp	.LBB11_227
.LBB11_211:                             # %lpad51
.Ltmp72:
	movq	%rax, %rbx
	movq	832(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_233
# %bb.212:                              # %if.then.i.i381
	.cfi_escape 0x2e, 0x00
	jmp	.LBB11_227
.LBB11_213:                             # %lpad49
.Ltmp69:
	jmp	.LBB11_229
.LBB11_214:                             # %lpad38.loopexit.split-lp
.Ltmp57:
	jmp	.LBB11_229
.LBB11_215:                             # %lpad35
.Ltmp54:
	jmp	.LBB11_229
.LBB11_216:                             # %lpad38.loopexit.us-lcssa.loopexit.split-lp.loopexit.split-lp
.Ltmp66:
	jmp	.LBB11_229
.LBB11_217:                             # %lpad38.loopexit.us-lcssa.loopexit.split-lp.loopexit
.Ltmp63:
	jmp	.LBB11_229
.LBB11_218:                             # %lpad38.loopexit.us-lcssa.loopexit
.Ltmp60:
	jmp	.LBB11_229
.LBB11_219:                             # %lpad30
.Ltmp49:
	movq	%rax, %rbx
	movq	928(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_233
# %bb.220:                              # %if.then.i.i375
	.cfi_escape 0x2e, 0x00
	jmp	.LBB11_227
.LBB11_221:                             # %lpad17
.Ltmp46:
	movq	%rax, %rbx
	movq	864(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_233
# %bb.222:                              # %if.then.i.i369
	.cfi_escape 0x2e, 0x00
	jmp	.LBB11_227
.LBB11_223:                             # %lpad15
.Ltmp43:
	jmp	.LBB11_229
.LBB11_224:                             # %lpad6.loopexit.split-lp
.Ltmp31:
	jmp	.LBB11_229
.LBB11_225:                             # %lpad1
.Ltmp23:
	movq	%rax, %rbx
	movq	960(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB11_233
# %bb.226:                              # %if.then.i.i363
	.cfi_escape 0x2e, 0x00
.LBB11_227:                             # %ehcleanup93
	callq	_ZdlPv@PLT
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	callq	_ZN3BMPD2Ev
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.LBB11_228:                             # %lpad4
.Ltmp28:
	jmp	.LBB11_229
.LBB11_230:                             # %lpad6.loopexit.us-lcssa.loopexit.split-lp.loopexit.split-lp
.Ltmp40:
	jmp	.LBB11_229
.LBB11_231:                             # %lpad6.loopexit.us-lcssa.loopexit.split-lp.loopexit
.Ltmp37:
.LBB11_229:                             # %lpad4
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	callq	_ZN3BMPD2Ev
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.LBB11_232:                             # %lpad6.loopexit.us-lcssa.loopexit
.Ltmp34:
	movq	%rax, %rbx
.LBB11_233:                             # %ehcleanup93
	.cfi_escape 0x2e, 0x00
	leaq	224(%rsp), %rdi
	callq	_ZN3BMPD2Ev
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end11:
	.size	main, .Lfunc_end11-main
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2, 0x0
GCC_except_table11:
.Lexception2:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end2-.Lcst_begin2
.Lcst_begin2:
	.uleb128 .Ltmp21-.Lfunc_begin2          # >> Call Site 1 <<
	.uleb128 .Ltmp22-.Ltmp21                #   Call between .Ltmp21 and .Ltmp22
	.uleb128 .Ltmp23-.Lfunc_begin2          #     jumps to .Ltmp23
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp24-.Lfunc_begin2          # >> Call Site 2 <<
	.uleb128 .Ltmp25-.Ltmp24                #   Call between .Ltmp24 and .Ltmp25
	.uleb128 .Ltmp28-.Lfunc_begin2          #     jumps to .Ltmp28
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp25-.Lfunc_begin2          # >> Call Site 3 <<
	.uleb128 .Ltmp26-.Ltmp25                #   Call between .Ltmp25 and .Ltmp26
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp26-.Lfunc_begin2          # >> Call Site 4 <<
	.uleb128 .Ltmp27-.Ltmp26                #   Call between .Ltmp26 and .Ltmp27
	.uleb128 .Ltmp28-.Lfunc_begin2          #     jumps to .Ltmp28
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp27-.Lfunc_begin2          # >> Call Site 5 <<
	.uleb128 .Ltmp29-.Ltmp27                #   Call between .Ltmp27 and .Ltmp29
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp29-.Lfunc_begin2          # >> Call Site 6 <<
	.uleb128 .Ltmp30-.Ltmp29                #   Call between .Ltmp29 and .Ltmp30
	.uleb128 .Ltmp31-.Lfunc_begin2          #     jumps to .Ltmp31
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp41-.Lfunc_begin2          # >> Call Site 7 <<
	.uleb128 .Ltmp42-.Ltmp41                #   Call between .Ltmp41 and .Ltmp42
	.uleb128 .Ltmp43-.Lfunc_begin2          #     jumps to .Ltmp43
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp44-.Lfunc_begin2          # >> Call Site 8 <<
	.uleb128 .Ltmp45-.Ltmp44                #   Call between .Ltmp44 and .Ltmp45
	.uleb128 .Ltmp46-.Lfunc_begin2          #     jumps to .Ltmp46
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp47-.Lfunc_begin2          # >> Call Site 9 <<
	.uleb128 .Ltmp48-.Ltmp47                #   Call between .Ltmp47 and .Ltmp48
	.uleb128 .Ltmp49-.Lfunc_begin2          #     jumps to .Ltmp49
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp50-.Lfunc_begin2          # >> Call Site 10 <<
	.uleb128 .Ltmp51-.Ltmp50                #   Call between .Ltmp50 and .Ltmp51
	.uleb128 .Ltmp54-.Lfunc_begin2          #     jumps to .Ltmp54
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp51-.Lfunc_begin2          # >> Call Site 11 <<
	.uleb128 .Ltmp52-.Ltmp51                #   Call between .Ltmp51 and .Ltmp52
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp52-.Lfunc_begin2          # >> Call Site 12 <<
	.uleb128 .Ltmp53-.Ltmp52                #   Call between .Ltmp52 and .Ltmp53
	.uleb128 .Ltmp54-.Lfunc_begin2          #     jumps to .Ltmp54
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp53-.Lfunc_begin2          # >> Call Site 13 <<
	.uleb128 .Ltmp55-.Ltmp53                #   Call between .Ltmp53 and .Ltmp55
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp55-.Lfunc_begin2          # >> Call Site 14 <<
	.uleb128 .Ltmp56-.Ltmp55                #   Call between .Ltmp55 and .Ltmp56
	.uleb128 .Ltmp57-.Lfunc_begin2          #     jumps to .Ltmp57
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp58-.Lfunc_begin2          # >> Call Site 15 <<
	.uleb128 .Ltmp59-.Ltmp58                #   Call between .Ltmp58 and .Ltmp59
	.uleb128 .Ltmp60-.Lfunc_begin2          #     jumps to .Ltmp60
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp59-.Lfunc_begin2          # >> Call Site 16 <<
	.uleb128 .Ltmp61-.Ltmp59                #   Call between .Ltmp59 and .Ltmp61
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp61-.Lfunc_begin2          # >> Call Site 17 <<
	.uleb128 .Ltmp62-.Ltmp61                #   Call between .Ltmp61 and .Ltmp62
	.uleb128 .Ltmp63-.Lfunc_begin2          #     jumps to .Ltmp63
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp62-.Lfunc_begin2          # >> Call Site 18 <<
	.uleb128 .Ltmp64-.Ltmp62                #   Call between .Ltmp62 and .Ltmp64
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp64-.Lfunc_begin2          # >> Call Site 19 <<
	.uleb128 .Ltmp65-.Ltmp64                #   Call between .Ltmp64 and .Ltmp65
	.uleb128 .Ltmp66-.Lfunc_begin2          #     jumps to .Ltmp66
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp65-.Lfunc_begin2          # >> Call Site 20 <<
	.uleb128 .Ltmp32-.Ltmp65                #   Call between .Ltmp65 and .Ltmp32
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp32-.Lfunc_begin2          # >> Call Site 21 <<
	.uleb128 .Ltmp33-.Ltmp32                #   Call between .Ltmp32 and .Ltmp33
	.uleb128 .Ltmp34-.Lfunc_begin2          #     jumps to .Ltmp34
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp33-.Lfunc_begin2          # >> Call Site 22 <<
	.uleb128 .Ltmp35-.Ltmp33                #   Call between .Ltmp33 and .Ltmp35
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp35-.Lfunc_begin2          # >> Call Site 23 <<
	.uleb128 .Ltmp36-.Ltmp35                #   Call between .Ltmp35 and .Ltmp36
	.uleb128 .Ltmp37-.Lfunc_begin2          #     jumps to .Ltmp37
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp36-.Lfunc_begin2          # >> Call Site 24 <<
	.uleb128 .Ltmp38-.Ltmp36                #   Call between .Ltmp36 and .Ltmp38
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp38-.Lfunc_begin2          # >> Call Site 25 <<
	.uleb128 .Ltmp39-.Ltmp38                #   Call between .Ltmp38 and .Ltmp39
	.uleb128 .Ltmp40-.Lfunc_begin2          #     jumps to .Ltmp40
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp39-.Lfunc_begin2          # >> Call Site 26 <<
	.uleb128 .Ltmp67-.Ltmp39                #   Call between .Ltmp39 and .Ltmp67
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp67-.Lfunc_begin2          # >> Call Site 27 <<
	.uleb128 .Ltmp68-.Ltmp67                #   Call between .Ltmp67 and .Ltmp68
	.uleb128 .Ltmp69-.Lfunc_begin2          #     jumps to .Ltmp69
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp70-.Lfunc_begin2          # >> Call Site 28 <<
	.uleb128 .Ltmp71-.Ltmp70                #   Call between .Ltmp70 and .Ltmp71
	.uleb128 .Ltmp72-.Lfunc_begin2          #     jumps to .Ltmp72
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp73-.Lfunc_begin2          # >> Call Site 29 <<
	.uleb128 .Ltmp74-.Ltmp73                #   Call between .Ltmp73 and .Ltmp74
	.uleb128 .Ltmp75-.Lfunc_begin2          #     jumps to .Ltmp75
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp76-.Lfunc_begin2          # >> Call Site 30 <<
	.uleb128 .Ltmp77-.Ltmp76                #   Call between .Ltmp76 and .Ltmp77
	.uleb128 .Ltmp78-.Lfunc_begin2          #     jumps to .Ltmp78
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp79-.Lfunc_begin2          # >> Call Site 31 <<
	.uleb128 .Ltmp80-.Ltmp79                #   Call between .Ltmp79 and .Ltmp80
	.uleb128 .Ltmp81-.Lfunc_begin2          #     jumps to .Ltmp81
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp82-.Lfunc_begin2          # >> Call Site 32 <<
	.uleb128 .Ltmp83-.Ltmp82                #   Call between .Ltmp82 and .Ltmp83
	.uleb128 .Ltmp84-.Lfunc_begin2          #     jumps to .Ltmp84
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp85-.Lfunc_begin2          # >> Call Site 33 <<
	.uleb128 .Ltmp86-.Ltmp85                #   Call between .Ltmp85 and .Ltmp86
	.uleb128 .Ltmp87-.Lfunc_begin2          #     jumps to .Ltmp87
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp86-.Lfunc_begin2          # >> Call Site 34 <<
	.uleb128 .Lfunc_end11-.Ltmp86           #   Call between .Ltmp86 and .Lfunc_end11
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end2:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text._ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"axG",@progbits,_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.weak	_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE # -- Begin function _ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.p2align	4, 0x90
	.type	_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,@function
_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE: # @_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception3
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
	subq	$584, %rsp                      # imm = 0x248
	.cfi_def_cfa_offset 640
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	leaq	64(%rsp), %r14
	movq	%r14, %rdi
	movl	$4, %edx
	callq	_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@PLT
	leaq	28(%rbx), %rsi
.Ltmp88:
	movl	$54, %edx
	movq	%r14, %rdi
	callq	_ZNSi4readEPcl@PLT
.Ltmp89:
# %bb.1:                                # %invoke.cont
	cmpl	$0, 58(%rbx)
	jne	.LBB12_5
# %bb.2:                                # %invoke.cont
	cmpw	$24, 56(%rbx)
	jne	.LBB12_5
# %bb.3:                                # %invoke.cont
	cmpb	$77, 29(%rbx)
	jne	.LBB12_5
# %bb.4:                                # %invoke.cont
	cmpb	$66, 28(%rbx)
	jne	.LBB12_5
# %bb.9:                                # %if.end
	movl	46(%rbx), %r12d
	movl	50(%rbx), %r14d
	leaq	(%r12,%r12,2), %r15
	movq	%r15, %rdi
	imulq	%r14, %rdi
.Ltmp95:
	callq	_Znam@PLT
.Ltmp96:
# %bb.10:                               # %invoke.cont27
	movq	%rax, (%rbx)
	negl	%r15d
	andl	$3, %r15d
	testq	%r12, %r12
	je	.LBB12_11
# %bb.14:                               # %for.cond.us.preheader
	movq	%rbx, 48(%rsp)                  # 8-byte Spill
	movq	%r15, 24(%rsp)                  # 8-byte Spill
	leaq	(%r14,%r14), %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	leal	-1(%r14), %ebp
	leaq	7(%rsp), %r15
	movl	%r14d, %eax
	movq	%r14, 32(%rsp)                  # 8-byte Spill
	movq	%r12, 16(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB12_15:                              # %for.cond.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_20 Depth 2
	decl	%eax
	js	.LBB12_13
# %bb.16:                               #   in Loop: Header=BB12_15 Depth=1
	movl	%eax, 8(%rsp)                   # 4-byte Spill
	movl	%ebp, 12(%rsp)                  # 4-byte Spill
	movl	%ebp, %r13d
	movq	40(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%r13), %rbp
	imulq	%r12, %rbp
	addq	%r13, %r14
	imulq	%r12, %r14
	imulq	%r12, %r13
	movq	%r12, 56(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB12_20:                              # %for.cond40.preheader.us
                                        #   Parent Loop BB12_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp98:
	movl	$1, %edx
	leaq	64(%rsp), %rbx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_ZNSi4readEPcl@PLT
.Ltmp99:
	movq	48(%rsp), %r12                  # 8-byte Reload
# %bb.17:                               # %invoke.cont45.us
                                        #   in Loop: Header=BB12_20 Depth=2
	movzbl	7(%rsp), %eax
	movq	(%r12), %rcx
	movb	%al, (%rcx,%r13)
.Ltmp100:
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_ZNSi4readEPcl@PLT
.Ltmp101:
# %bb.18:                               # %invoke.cont45.us.1
                                        #   in Loop: Header=BB12_20 Depth=2
	movzbl	7(%rsp), %eax
	movq	(%r12), %rcx
	movb	%al, (%rcx,%r14)
.Ltmp102:
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_ZNSi4readEPcl@PLT
.Ltmp103:
# %bb.19:                               # %invoke.cont45.us.2
                                        #   in Loop: Header=BB12_20 Depth=2
	movzbl	7(%rsp), %eax
	movq	(%r12), %rcx
	movb	%al, (%rcx,%rbp)
	incq	%rbp
	incq	%r14
	incq	%r13
	decq	56(%rsp)                        # 8-byte Folded Spill
	jne	.LBB12_20
# %bb.21:                               # %for.cond35.for.cond.cleanup38_crit_edge.us
                                        #   in Loop: Header=BB12_15 Depth=1
	movl	12(%rsp), %ebp                  # 4-byte Reload
	decl	%ebp
.Ltmp105:
	leaq	64(%rsp), %rdi
	movq	24(%rsp), %rsi                  # 8-byte Reload
	movl	$1, %edx
	callq	_ZNSi5seekgElSt12_Ios_Seekdir@PLT
.Ltmp106:
	movq	32(%rsp), %r14                  # 8-byte Reload
	movq	16(%rsp), %r12                  # 8-byte Reload
	movl	8(%rsp), %eax                   # 4-byte Reload
	jmp	.LBB12_15
.LBB12_11:
	leaq	64(%rsp), %rbx
	.p2align	4, 0x90
.LBB12_12:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	decl	%r14d
	js	.LBB12_13
# %bb.25:                               # %for.cond.cleanup38
                                        #   in Loop: Header=BB12_12 Depth=1
.Ltmp108:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	$1, %edx
	callq	_ZNSi5seekgElSt12_Ios_Seekdir@PLT
.Ltmp109:
	jmp	.LBB12_12
.LBB12_13:                              # %for.cond.cleanup
	leaq	64(%rsp), %rdi
	callq	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@PLT
	addq	$584, %rsp                      # imm = 0x248
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB12_5:                               # %if.then
	.cfi_def_cfa_offset 640
.Ltmp90:
	movq	_ZSt4cerr@GOTPCREL(%rip), %rdi
	leaq	.L.str.9(%rip), %rsi
	movl	$52, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.Ltmp91:
# %bb.6:                                # %invoke.cont15
.Ltmp92:
	movq	_ZSt4cerr@GOTPCREL(%rip), %rdi
	callq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
.Ltmp93:
# %bb.7:                                # %invoke.cont17
	movl	$1, %edi
	callq	exit@PLT
.LBB12_24:                              # %lpad26
.Ltmp97:
	jmp	.LBB12_27
.LBB12_8:                               # %lpad
.Ltmp94:
	jmp	.LBB12_27
.LBB12_26:                              # %lpad59.us-lcssa
.Ltmp110:
	jmp	.LBB12_27
.LBB12_22:                              # %lpad59.us-lcssa.us
.Ltmp107:
	jmp	.LBB12_27
.LBB12_23:                              # %lpad44.us-lcssa.us
.Ltmp104:
.LBB12_27:                              # %ehcleanup67
	movq	%rax, %rbx
	leaq	64(%rsp), %rdi
	callq	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end12:
	.size	_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .Lfunc_end12-_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.cfi_endproc
	.section	.gcc_except_table._ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"aG",@progbits,_ZN3BMP4readENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.p2align	2, 0x0
GCC_except_table12:
.Lexception3:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end3-.Lcst_begin3
.Lcst_begin3:
	.uleb128 .Lfunc_begin3-.Lfunc_begin3    # >> Call Site 1 <<
	.uleb128 .Ltmp88-.Lfunc_begin3          #   Call between .Lfunc_begin3 and .Ltmp88
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp88-.Lfunc_begin3          # >> Call Site 2 <<
	.uleb128 .Ltmp89-.Ltmp88                #   Call between .Ltmp88 and .Ltmp89
	.uleb128 .Ltmp94-.Lfunc_begin3          #     jumps to .Ltmp94
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp95-.Lfunc_begin3          # >> Call Site 3 <<
	.uleb128 .Ltmp96-.Ltmp95                #   Call between .Ltmp95 and .Ltmp96
	.uleb128 .Ltmp97-.Lfunc_begin3          #     jumps to .Ltmp97
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp98-.Lfunc_begin3          # >> Call Site 4 <<
	.uleb128 .Ltmp103-.Ltmp98               #   Call between .Ltmp98 and .Ltmp103
	.uleb128 .Ltmp104-.Lfunc_begin3         #     jumps to .Ltmp104
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp105-.Lfunc_begin3         # >> Call Site 5 <<
	.uleb128 .Ltmp106-.Ltmp105              #   Call between .Ltmp105 and .Ltmp106
	.uleb128 .Ltmp107-.Lfunc_begin3         #     jumps to .Ltmp107
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp108-.Lfunc_begin3         # >> Call Site 6 <<
	.uleb128 .Ltmp109-.Ltmp108              #   Call between .Ltmp108 and .Ltmp109
	.uleb128 .Ltmp110-.Lfunc_begin3         #     jumps to .Ltmp110
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp90-.Lfunc_begin3          # >> Call Site 7 <<
	.uleb128 .Ltmp93-.Ltmp90                #   Call between .Ltmp90 and .Ltmp93
	.uleb128 .Ltmp94-.Lfunc_begin3          #     jumps to .Ltmp94
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp93-.Lfunc_begin3          # >> Call Site 8 <<
	.uleb128 .Lfunc_end12-.Ltmp93           #   Call between .Ltmp93 and .Lfunc_end12
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end3:
	.p2align	2, 0x0
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function _ZN3BMP8compressEPFvjiPKhPfS2_Em
.LCPI13_0:
	.long	1127219200                      # 0x43300000
	.long	1160773632                      # 0x45300000
	.long	0                               # 0x0
	.long	0                               # 0x0
.LCPI13_1:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4530000000000000              # double 1.9342813113834067E+25
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI13_2:
	.long	0x40800000                      # float 4
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI13_3:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
	.section	.text._ZN3BMP8compressEPFvjiPKhPfS2_Em,"axG",@progbits,_ZN3BMP8compressEPFvjiPKhPfS2_Em,comdat
	.weak	_ZN3BMP8compressEPFvjiPKhPfS2_Em
	.p2align	4, 0x90
	.type	_ZN3BMP8compressEPFvjiPKhPfS2_Em,@function
_ZN3BMP8compressEPFvjiPKhPfS2_Em:       # @_ZN3BMP8compressEPFvjiPKhPfS2_Em
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r15
	movq	%rsi, 32(%rsp)                  # 8-byte Spill
	movq	%rdi, %rbx
	movl	46(%rdi), %r14d
	movl	50(%rdi), %r12d
	movq	%rdx, %xmm0
	punpckldq	.LCPI13_0(%rip), %xmm0  # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	subpd	.LCPI13_1(%rip), %xmm0
	movapd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm1                    # xmm1 = xmm1[1],xmm0[1]
	addsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14, %xmm0
	divsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	mulss	.LCPI13_2(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.11(%rip), %rsi
	movb	$1, %al
	callq	fprintf@PLT
	movq	%r15, %rax
	imulq	%r12, %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	%rax, %rcx
	shrq	$62, %rcx
	shlq	$2, %rax
	xorl	%r13d, %r13d
	negq	%rcx
	sbbq	%r13, %r13
	orq	%rax, %r13
	movq	%r13, %rdi
	callq	_Znam@PLT
	movq	%rax, %rbp
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r13, %rdx
	callq	memset@PLT
	movq	%rbp, 8(%rbx)
	movq	%r13, %rdi
	callq	_Znam@PLT
	movq	%rax, %rbp
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r13, %rdx
	callq	memset@PLT
	movq	%rbp, 16(%rbx)
	testq	%r12, %r12
	je	.LBB13_1
# %bb.2:                                # %for.body21.us.preheader
	movq	%r15, %rax
	shlq	$2, %rax
	movq	%r14, (%rsp)                    # 8-byte Spill
	xorl	%r14d, %r14d
	movq	%r12, 8(%rsp)                   # 8-byte Spill
	movq	%r15, 16(%rsp)                  # 8-byte Spill
	movq	%rbx, %r15
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	movq	%r15, 48(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB13_3:                               # %for.body21.us
                                        # =>This Inner Loop Header: Depth=1
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbp
	movq	(%r15), %rdx
	addq	%rbx, %rdx
	movq	8(%r15), %rcx
	addq	%r14, %rcx
	movq	16(%r15), %r8
	addq	%r14, %r8
	movq	(%rsp), %r15                    # 8-byte Reload
	movl	%r15d, %edi
	movq	16(%rsp), %rsi                  # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	callq	*32(%rsp)                       # 8-byte Folded Reload
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	subq	%rbp, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r13
	movq	24(%rsp), %rax                  # 8-byte Reload
	addq	%r15, %rbx
	movq	48(%rsp), %r15                  # 8-byte Reload
	addq	%rax, %r14
	decq	%r12
	jne	.LBB13_3
# %bb.4:                                # %for.body21.us.1.preheader
	movq	40(%rsp), %rax                  # 8-byte Reload
	leaq	(,%rax,4), %r14
	movq	8(%rsp), %rbx                   # 8-byte Reload
	movq	%rbx, %r12
	imulq	(%rsp), %r12                    # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB13_5:                               # %for.body21.us.1
                                        # =>This Inner Loop Header: Depth=1
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbp
	movq	(%r15), %rdx
	addq	%r12, %rdx
	movq	8(%r15), %rcx
	addq	%r14, %rcx
	movq	16(%r15), %r8
	addq	%r14, %r8
	movq	(%rsp), %r15                    # 8-byte Reload
	movl	%r15d, %edi
	movq	16(%rsp), %rsi                  # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	callq	*32(%rsp)                       # 8-byte Folded Reload
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbp, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r13
	addq	24(%rsp), %r14                  # 8-byte Folded Reload
	addq	%r15, %r12
	movq	48(%rsp), %r15                  # 8-byte Reload
	decq	%rbx
	jne	.LBB13_5
# %bb.6:                                # %for.cond17.for.cond.cleanup20_crit_edge.us.1
	movq	40(%rsp), %r12                  # 8-byte Reload
	shlq	$3, %r12
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	%rax, %r14
	imulq	(%rsp), %r14                    # 8-byte Folded Reload
	addq	%r14, %r14
	movq	%r15, %rbx
	.p2align	4, 0x90
.LBB13_7:                               # %for.body21.us.2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbp
	movq	(%rbx), %rdx
	addq	%r14, %rdx
	movq	8(%rbx), %rcx
	addq	%r12, %rcx
	movq	16(%rbx), %r8
	addq	%r12, %r8
	movq	%rbx, %r15
	movq	(%rsp), %rbx                    # 8-byte Reload
	movl	%ebx, %edi
	movq	16(%rsp), %rsi                  # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	callq	*32(%rsp)                       # 8-byte Folded Reload
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movabsq	$2361183241434822607, %rsi      # imm = 0x20C49BA5E353F7CF
	subq	%rbp, %rax
	imulq	%rsi
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	8(%rsp), %rax                   # 8-byte Reload
	addq	%rdx, %r13
	addq	24(%rsp), %r12                  # 8-byte Folded Reload
	addq	%rbx, %r14
	movq	%r15, %rbx
	decq	%rax
	jne	.LBB13_7
# %bb.8:                                # %for.cond17.for.cond.cleanup20_crit_edge.us.2
	movq	%r13, %rax
	imulq	%rsi
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	cvtsi2sd	%rdx, %xmm0
	mulsd	.LCPI13_3(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	16(%rsp), %r15                  # 8-byte Reload
	movl	%r15d, 24(%rbx)
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB13_11
.LBB13_10:                              # %delete.notnull
	movss	%xmm0, (%rsp)                   # 4-byte Spill
	callq	_ZdaPv@PLT
	movss	(%rsp), %xmm0                   # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
.LBB13_11:                              # %delete.end
	movq	$0, (%rbx)
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB13_1:
	.cfi_def_cfa_offset 112
	xorps	%xmm0, %xmm0
	movl	%r15d, 24(%rbx)
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.LBB13_10
	jmp	.LBB13_11
.Lfunc_end13:
	.size	_ZN3BMP8compressEPFvjiPKhPfS2_Em, .Lfunc_end13-_ZN3BMP8compressEPFvjiPKhPfS2_Em
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function _ZN3BMP10decompressEPFvjiPhPKfS2_E
.LCPI14_0:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
	.section	.text._ZN3BMP10decompressEPFvjiPhPKfS2_E,"axG",@progbits,_ZN3BMP10decompressEPFvjiPhPKfS2_E,comdat
	.weak	_ZN3BMP10decompressEPFvjiPhPKfS2_E
	.p2align	4, 0x90
	.type	_ZN3BMP10decompressEPFvjiPhPKfS2_E,@function
_ZN3BMP10decompressEPFvjiPhPKfS2_E:     # @_ZN3BMP10decompressEPFvjiPhPKfS2_E
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
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	46(%rdi), %r13d
	movl	50(%rdi), %ebp
	movq	%r13, %r15
	imulq	%rbp, %r15
	leaq	(%r15,%r15,2), %rdi
	callq	_Znam@PLT
	leaq	8(%rbx), %r14
	movq	%rax, (%rbx)
	testq	%rbp, %rbp
	je	.LBB14_1
# %bb.2:                                # %for.body11.us.preheader
	movq	%r14, 24(%rsp)                  # 8-byte Spill
	xorl	%r14d, %r14d
	movq	%r13, %rsi
	xorl	%r13d, %r13d
	movq	%r12, 8(%rsp)                   # 8-byte Spill
	xorl	%r12d, %r12d
	movq	%rbp, %rax
	movq	%rbp, 16(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB14_3:                               # %for.body11.us
                                        # =>This Inner Loop Header: Depth=1
	movq	%rsi, %rbp
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movslq	24(%rbx), %rsi
	movq	(%rbx), %rdx
	addq	%r14, %rdx
	movq	%rsi, %r8
	imulq	%r13, %r8
	shlq	$2, %r8
	movq	8(%rbx), %rcx
	addq	%r8, %rcx
	addq	16(%rbx), %r8
	movl	%ebp, %edi
                                        # kill: def $esi killed $esi killed $rsi
	callq	*8(%rsp)                        # 8-byte Folded Reload
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rbp, %rsi
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	subq	32(%rsp), %rax                  # 8-byte Folded Reload
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	16(%rsp), %rax                  # 8-byte Reload
	addq	%rdx, %r12
	incq	%r13
	addq	%rbp, %r14
	cmpq	%r13, %rax
	jne	.LBB14_3
# %bb.4:                                # %for.body11.us.1.preheader
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB14_5:                               # %for.body11.us.1
                                        # =>This Inner Loop Header: Depth=1
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r13
	movslq	24(%rbx), %rsi
	movq	16(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%r14), %r8
	movq	(%rbx), %rdx
	addq	%r15, %rdx
	imulq	%rsi, %r8
	shlq	$2, %r8
	movq	8(%rbx), %rcx
	addq	%r8, %rcx
	addq	16(%rbx), %r8
	movl	%ebp, %edi
                                        # kill: def $esi killed $esi killed $rsi
	callq	*8(%rsp)                        # 8-byte Folded Reload
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r13, %rax
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	movq	16(%rsp), %rax                  # 8-byte Reload
	addq	%rdx, %r12
	incq	%r14
	addq	%rbp, %r15
	cmpq	%r14, %rax
	jne	.LBB14_5
# %bb.6:                                # %for.cond7.for.cond.cleanup10_crit_edge.us.1
	movq	%rbp, %rsi
	leaq	(%rax,%rax), %r15
	movq	%rbp, %r14
	imulq	%rax, %r14
	addq	%r14, %r14
	movq	%rbp, %r13
	movq	%rax, %rbp
	.p2align	4, 0x90
.LBB14_7:                               # %for.body11.us.2
                                        # =>This Inner Loop Header: Depth=1
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movslq	24(%rbx), %rsi
	movq	(%rbx), %rdx
	addq	%r14, %rdx
	movq	%rsi, %r8
	imulq	%r15, %r8
	shlq	$2, %r8
	movq	8(%rbx), %rcx
	addq	%r8, %rcx
	addq	16(%rbx), %r8
	movl	%r13d, %edi
                                        # kill: def $esi killed $esi killed $rsi
	callq	*8(%rsp)                        # 8-byte Folded Reload
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movabsq	$2361183241434822607, %rcx      # imm = 0x20C49BA5E353F7CF
	subq	16(%rsp), %rax                  # 8-byte Folded Reload
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	addq	%rdx, %r12
	incq	%r15
	addq	%r13, %r14
	decq	%rbp
	jne	.LBB14_7
# %bb.8:                                # %for.cond7.for.cond.cleanup10_crit_edge.us.2
	movq	%r12, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	cvtsi2sd	%rdx, %xmm0
	mulsd	.LCPI14_0(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
	movq	24(%rsp), %r14                  # 8-byte Reload
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB14_11
.LBB14_10:                              # %delete.notnull
	callq	_ZdaPv@PLT
.LBB14_11:                              # %delete.end
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB14_13
# %bb.12:                               # %delete.notnull52
	callq	_ZdaPv@PLT
.LBB14_13:                              # %delete.end53
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14)
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB14_1:
	.cfi_def_cfa_offset 96
	xorps	%xmm0, %xmm0
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	jne	.LBB14_10
	jmp	.LBB14_11
.Lfunc_end14:
	.size	_ZN3BMP10decompressEPFvjiPhPKfS2_E, .Lfunc_end14-_ZN3BMP10decompressEPFvjiPhPKfS2_E
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"axG",@progbits,_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.weak	_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE # -- Begin function _ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.p2align	4, 0x90
	.type	_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,@function
_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE: # @_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception4
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
	subq	$568, %rsp                      # imm = 0x238
	.cfi_def_cfa_offset 624
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	leaq	56(%rsp), %r14
	movq	%r14, %rdi
	movl	$4, %edx
	callq	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@PLT
	leaq	28(%rbx), %rsi
.Ltmp111:
	movl	$54, %edx
	movq	%r14, %rdi
	callq	_ZNSo5writeEPKcl@PLT
.Ltmp112:
# %bb.1:                                # %invoke.cont
	movl	50(%rbx), %eax
	movq	%rax, %r14
                                        # kill: def $eax killed $eax killed $rax
	decl	%eax
	js	.LBB15_14
# %bb.2:                                # %for.cond15.preheader.lr.ph
	movl	46(%rbx), %edx
	movl	56(%rbx), %ecx
	imull	%edx, %ecx
	shrl	$3, %ecx
	negl	%ecx
	andl	$3, %ecx
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	movl	%edx, %ecx
	decl	%ecx
	js	.LBB15_3
# %bb.6:                                # %for.cond15.preheader.us.preheader
	movl	%ecx, %ecx
	movl	%eax, %esi
	leaq	(%rsi,%r14,2), %rax
	imulq	%rdx, %rax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	incq	%rcx
	movq	%rcx, 40(%rsp)                  # 8-byte Spill
	addq	%rsi, %r14
	imulq	%rdx, %r14
	movq	%rdx, %rbp
	imulq	%rsi, %rbp
	leaq	56(%rsp), %r15
	leaq	15(%rsp), %r12
	movq	%rdx, 32(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB15_7:                               # %for.cond15.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_11 Depth 2
	movq	%rsi, 48(%rsp)                  # 8-byte Spill
	movq	40(%rsp), %r13                  # 8-byte Reload
	.p2align	4, 0x90
.LBB15_11:                              # %for.cond19.preheader.us
                                        #   Parent Loop BB15_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %rax
	addq	%rbp, %rax
	movzbl	-1(%r13,%rax), %eax
	movb	%al, 15(%rsp)
.Ltmp117:
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	_ZNSo5writeEPKcl@PLT
.Ltmp118:
# %bb.8:                                # %invoke.cont30.us
                                        #   in Loop: Header=BB15_11 Depth=2
	movq	(%rbx), %rax
	addq	%r14, %rax
	movzbl	-1(%r13,%rax), %eax
	movb	%al, 15(%rsp)
.Ltmp119:
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	_ZNSo5writeEPKcl@PLT
.Ltmp120:
# %bb.9:                                # %invoke.cont30.us.1
                                        #   in Loop: Header=BB15_11 Depth=2
	movq	(%rbx), %rax
	addq	24(%rsp), %rax                  # 8-byte Folded Reload
	movzbl	-1(%r13,%rax), %eax
	movb	%al, 15(%rsp)
.Ltmp121:
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	_ZNSo5writeEPKcl@PLT
.Ltmp122:
# %bb.10:                               # %invoke.cont30.us.2
                                        #   in Loop: Header=BB15_11 Depth=2
	decq	%r13
	jg	.LBB15_11
# %bb.12:                               # %for.cond15.for.cond.cleanup17_crit_edge.us
                                        #   in Loop: Header=BB15_7 Depth=1
	movb	$0, 15(%rsp)
.Ltmp124:
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	16(%rsp), %rdx                  # 8-byte Reload
	callq	_ZNSo5writeEPKcl@PLT
.Ltmp125:
# %bb.13:                               # %invoke.cont37.us
                                        #   in Loop: Header=BB15_7 Depth=1
	movq	48(%rsp), %rcx                  # 8-byte Reload
	leaq	-1(%rcx), %rsi
	movq	32(%rsp), %rdx                  # 8-byte Reload
	subq	%rdx, 24(%rsp)                  # 8-byte Folded Spill
	subq	%rdx, %r14
	subq	%rdx, %rbp
	testq	%rcx, %rcx
	jg	.LBB15_7
	jmp	.LBB15_14
.LBB15_3:
	leaq	56(%rsp), %rbx
	leaq	15(%rsp), %r15
	.p2align	4, 0x90
.LBB15_4:                               # %for.cond15.preheader
                                        # =>This Inner Loop Header: Depth=1
	movb	$0, 15(%rsp)
.Ltmp114:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	16(%rsp), %rdx                  # 8-byte Reload
	callq	_ZNSo5writeEPKcl@PLT
.Ltmp115:
# %bb.5:                                # %invoke.cont37
                                        #   in Loop: Header=BB15_4 Depth=1
	movq	%r14, %rax
	decl	%eax
	movq	%rax, %r14
	testl	%eax, %eax
	jg	.LBB15_4
.LBB15_14:                              # %for.cond.cleanup
	leaq	64(%rsp), %rdi
.Ltmp127:
	callq	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv@PLT
.Ltmp128:
# %bb.15:                               # %call.i.noexc
	testq	%rax, %rax
	jne	.LBB15_17
# %bb.16:                               # %if.then.i
	movq	56(%rsp), %rax
	movq	-24(%rax), %rax
	leaq	(%rsp,%rax), %rdi
	addq	$56, %rdi
	movl	88(%rsp,%rax), %esi
	orl	$4, %esi
.Ltmp129:
	callq	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
.Ltmp130:
.LBB15_17:                              # %invoke.cont43
	leaq	56(%rsp), %rdi
	callq	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	addq	$568, %rsp                      # imm = 0x238
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB15_20:                              # %lpad
	.cfi_def_cfa_offset 624
.Ltmp113:
	jmp	.LBB15_23
.LBB15_22:                              # %lpad42
.Ltmp131:
	jmp	.LBB15_23
.LBB15_21:                              # %lpad36.us-lcssa
.Ltmp116:
	jmp	.LBB15_23
.LBB15_18:                              # %lpad36.us-lcssa.us
.Ltmp126:
	jmp	.LBB15_23
.LBB15_19:                              # %lpad29.us-lcssa.us
.Ltmp123:
.LBB15_23:                              # %ehcleanup47
	movq	%rax, %rbx
	leaq	56(%rsp), %rdi
	callq	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end15:
	.size	_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .Lfunc_end15-_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.cfi_endproc
	.section	.gcc_except_table._ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"aG",@progbits,_ZN3BMP5writeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.p2align	2, 0x0
GCC_except_table15:
.Lexception4:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end4-.Lcst_begin4
.Lcst_begin4:
	.uleb128 .Lfunc_begin4-.Lfunc_begin4    # >> Call Site 1 <<
	.uleb128 .Ltmp111-.Lfunc_begin4         #   Call between .Lfunc_begin4 and .Ltmp111
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp111-.Lfunc_begin4         # >> Call Site 2 <<
	.uleb128 .Ltmp112-.Ltmp111              #   Call between .Ltmp111 and .Ltmp112
	.uleb128 .Ltmp113-.Lfunc_begin4         #     jumps to .Ltmp113
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp117-.Lfunc_begin4         # >> Call Site 3 <<
	.uleb128 .Ltmp122-.Ltmp117              #   Call between .Ltmp117 and .Ltmp122
	.uleb128 .Ltmp123-.Lfunc_begin4         #     jumps to .Ltmp123
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp124-.Lfunc_begin4         # >> Call Site 4 <<
	.uleb128 .Ltmp125-.Ltmp124              #   Call between .Ltmp124 and .Ltmp125
	.uleb128 .Ltmp126-.Lfunc_begin4         #     jumps to .Ltmp126
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp114-.Lfunc_begin4         # >> Call Site 5 <<
	.uleb128 .Ltmp115-.Ltmp114              #   Call between .Ltmp114 and .Ltmp115
	.uleb128 .Ltmp116-.Lfunc_begin4         #     jumps to .Ltmp116
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp127-.Lfunc_begin4         # >> Call Site 6 <<
	.uleb128 .Ltmp130-.Ltmp127              #   Call between .Ltmp127 and .Ltmp130
	.uleb128 .Ltmp131-.Lfunc_begin4         #     jumps to .Ltmp131
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp130-.Lfunc_begin4         # >> Call Site 7 <<
	.uleb128 .Lfunc_end15-.Ltmp130          #   Call between .Ltmp130 and .Lfunc_end15
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end4:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text._ZN3BMPD2Ev,"axG",@progbits,_ZN3BMPD2Ev,comdat
	.weak	_ZN3BMPD2Ev                     # -- Begin function _ZN3BMPD2Ev
	.p2align	4, 0x90
	.type	_ZN3BMPD2Ev,@function
_ZN3BMPD2Ev:                            # @_ZN3BMPD2Ev
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.LBB16_2
# %bb.1:                                # %delete.notnull
	callq	_ZdaPv@PLT
.LBB16_2:                               # %delete.end
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB16_4
# %bb.3:                                # %delete.notnull3
	callq	_ZdaPv@PLT
.LBB16_4:                               # %delete.end4
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB16_5
# %bb.6:                                # %delete.notnull6
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdaPv@PLT                      # TAILCALL
.LBB16_5:                               # %delete.end7
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end16:
	.size	_ZN3BMPD2Ev, .Lfunc_end16-_ZN3BMPD2Ev
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_4,@object           # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_4:
	.asciz	";unknown;unknown;0;0;;"
	.size	.L__unnamed_4, 23

	.type	.L__unnamed_2,@object           # @1
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3, 0x0
.L__unnamed_2:
	.long	0                               # 0x0
	.long	514                             # 0x202
	.long	0                               # 0x0
	.long	22                              # 0x16
	.quad	.L__unnamed_4
	.size	.L__unnamed_2, 24

	.type	.L__unnamed_1,@object           # @2
	.p2align	3, 0x0
.L__unnamed_1:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	22                              # 0x16
	.quad	.L__unnamed_4
	.size	.L__unnamed_1, 24

	.type	.L__unnamed_3,@object           # @3
	.p2align	3, 0x0
.L__unnamed_3:
	.long	0                               # 0x0
	.long	66                              # 0x42
	.long	0                               # 0x0
	.long	22                              # 0x16
	.quad	.L__unnamed_4
	.size	.L__unnamed_3, 24

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"example.bmp"
	.size	.L.str.1, 12

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Compress time: %.2lfs\nDecompress time: %.2lfs\nTotal: %.2lfs\n"
	.size	.L.str.2, 61

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"example_result.bmp"
	.size	.L.str.3, 19

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"using %i threads\n"
	.size	.L.str.4, 18

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"(Naive)\n Compress time: %.2lfs\nDecompress time: %.2lfs\nTotal: %.2lfs\n"
	.size	.L.str.5, 70

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"example_result_para.bmp"
	.size	.L.str.6, 24

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"(Fast)\n Compress time: %.2lfs\nDecompress time: %.2lfs\nTotal: %.2lfs\n"
	.size	.L.str.7, 69

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"example_result_para_fast.bmp"
	.size	.L.str.8, 29

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"Invalid file format. Must be 24-bit uncompressed BMP"
	.size	.L.str.9, 53

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Compression ratio %.2f\n"
	.size	.L.str.11, 24

	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"aGw",@progbits,DW.ref.__gxx_personality_v0,comdat
	.p2align	3, 0x0
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"AMD clang version 17.0.6 (CLANG: AOCC_5.0.0-Build#1377 2024_09_24)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __gxx_personality_v0
	.addrsig_sym _Z11compressParjiPKhPfS1_.omp_outlined
	.addrsig_sym _Z13decompressParjiPhPKfS1_.omp_outlined
	.addrsig_sym _Z15compressParFastjiPKhPfS1_
	.addrsig_sym _Z15compressParFastjiPKhPfS1_.omp_outlined
	.addrsig_sym _Z17decompressParFastjiPhPKfS1_
	.addrsig_sym _Z17decompressParFastjiPhPKfS1_.omp_outlined
	.addrsig_sym _Unwind_Resume
	.addrsig_sym _ZSt4cerr
