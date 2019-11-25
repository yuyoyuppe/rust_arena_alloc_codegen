	.text
	.def	 @feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 1
	.file	"bad_cpp.cpp"
	.def	 "?both_ok@@YAXPAUBig@@@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000003000000020000000100000000 # -- Begin function ?both_ok@@YAXPAUBig@@@Z
	.section	.rdata,"dr",discard,__xmm@00000003000000020000000100000000
	.p2align	4
__xmm@00000003000000020000000100000000:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
	.globl	__xmm@00000001000000010000000100000001
	.section	.rdata,"dr",discard,__xmm@00000001000000010000000100000001
	.p2align	4
__xmm@00000001000000010000000100000001:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.globl	__xmm@00000002000000020000000200000002
	.section	.rdata,"dr",discard,__xmm@00000002000000020000000200000002
	.p2align	4
__xmm@00000002000000020000000200000002:
	.long	2                       # 0x2
	.long	2                       # 0x2
	.long	2                       # 0x2
	.long	2                       # 0x2
	.globl	__xmm@00000014000000140000001400000014
	.section	.rdata,"dr",discard,__xmm@00000014000000140000001400000014
	.p2align	4
__xmm@00000014000000140000001400000014:
	.long	20                      # 0x14
	.long	20                      # 0x14
	.long	20                      # 0x14
	.long	20                      # 0x14
	.globl	__xmm@00000008000000080000000800000008
	.section	.rdata,"dr",discard,__xmm@00000008000000080000000800000008
	.p2align	4
__xmm@00000008000000080000000800000008:
	.long	8                       # 0x8
	.long	8                       # 0x8
	.long	8                       # 0x8
	.long	8                       # 0x8
	.text
	.globl	"?both_ok@@YAXPAUBig@@@Z"
	.p2align	4, 0x90
"?both_ok@@YAXPAUBig@@@Z":              # @"?both_ok@@YAXPAUBig@@@Z"
# %bb.0:
	subl	$2048, %esp             # imm = 0x800
	movl	2052(%esp), %eax
	movdqa	__xmm@00000003000000020000000100000000, %xmm0 # xmm0 = [0,1,2,3]
	movdqa	__xmm@00000001000000010000000100000001, %xmm1 # xmm1 = [1,1,1,1]
	movdqa	__xmm@00000002000000020000000200000002, %xmm3 # xmm3 = [2,2,2,2]
	movdqa	__xmm@00000014000000140000001400000014, %xmm4 # xmm4 = [20,20,20,20]
	movdqa	__xmm@00000008000000080000000800000008, %xmm5 # xmm5 = [8,8,8,8]
	movl	$-2048, %ecx            # imm = 0xF800
	pxor	%xmm2, %xmm2
	.p2align	4, 0x90
LBB0_1:                                 # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm6
	paddd	%xmm5, %xmm0
	pand	%xmm1, %xmm6
	pcmpeqd	%xmm2, %xmm6
	movdqa	%xmm6, %xmm7
	pand	%xmm4, %xmm6
	pandn	%xmm3, %xmm7
	por	%xmm7, %xmm6
	movdqu	%xmm6, 2048(%esp,%ecx)
	movdqu	%xmm6, 2064(%esp,%ecx)
	addl	$32, %ecx
	jne	LBB0_1
# %bb.2:
	movl	%esp, %ecx
	pushl	$2048                   # imm = 0x800
	pushl	%ecx
	pushl	%eax
	calll	_memcpy
	addl	$2060, %esp             # imm = 0x80C
	retl
                                        # -- End function
	.section	.drectve,"yn"
	.ascii	" /FAILIFMISMATCH:\"_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\""
