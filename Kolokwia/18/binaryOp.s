	.text
	.type binA, @function
	.global binA	

# %rdi - char* result
# %rsi - char* arg1
# %rdx - char* arg2
# %rcx - int operation

binA:
	
# -------------- dlugosc arg1 --------------------

	XOR	%r15,	%r15	# licznik

next1:	

	MOV	(%rsi,%r15,1),	%r9b	# arg1[i]
	CMP	$0,				%r9b	# if( == NULL)
	JE 	end1
	
	INC	%r15
	JMP	next1
	
end1:

	MOV	%r15,	%r14	# lenght of arg1
	
# END----------- dlugosc arg1 --------------------

# -------------- dlugosc arg2 --------------------

	XOR	%r15,	%r15	# licznik

next2:	

	MOV	(%rdx,%r15,1),	%r9b	# arg1[i]
	CMP	$0,				%r9b	# if( == NULL)
	JE 	end2
	
	INC	%r15
	JMP	next2
	
end2:

	MOV	%r15,	%r13	# lenght of arg2
	
# END----------- dlugosc arg2 --------------------

	XOR	%r15,	%r15	# ilosc operacji z zerami
	CMP	%r13,	%r14	# if(len(arg1)==len(arg2))
	JE	rowne
	JMP	nierowne
rowne:
	MOV	%rsi,	%r13	# rowne
	MOV	%rdx,	%r14	# rowne
	JMP allOk
	
nierowne:
	
	JG	lenArg1Greater
	
	MOV	%r13,	%r15
	SUB	%r14,	%r15
	
	MOV	%rsi,	%r13	# mniejsze
	MOV	%rdx,	%r14	# wieksze
	
	JMP	allOk
	
lenArg1Greater:
	
	MOV	%r14,	%r15
	SUB	%r13,	%r15
	
	MOV	%rdx,	%r13	# mniejsze
	MOV	%rsi,	%r14	# wieksze
	
allOk:
	XOR	%r8,	%r8		# i = 0
	XOR	%r9,	%r9		# just 0
	ADD	$'0',	%r9

next:
	CMP	$0,	%r15
	JE	endnext
	
	CMP	$0,		%rcx
	JNE	opNot0
	
	MOV	(%r14,%r8,1),	%r10b
	MOV	%r10b,			(%rdi,%r8,1)
	
opNot0:
	
	CMP	$1,		%rcx
	JNE	opNot1
	
	MOV	%r9b,			(%rdi,%r8,1)
	
opNot1:
	
	CMP	$2,		%rcx
	JNE	opNot2
	
	MOV	(%r14,%r8,1),	%r10b
	MOV	%r10b,			(%rdi,%r8,1)
	
opNot2:

	CMP	$3,		%rcx
	JNE	opNot3
	
	MOV	(%r14,%r8,1),	%r10b
	MOV	%r10b,			(%rdi,%r8,1)
	
opNot3:
	
	INC	%r8
	DEC	%r15
	JMP next
	
endnext:
	
# r8 - licznik dla dluzszego r14
# r9 - licznik dla krotszego r13
	XOR	%r9,	%r9

nextWhile:

	MOV	(%r14,%r8,1),	%r15b
	CMP	$0,				%r15b
	JE end
	
	MOV	(%r13,%r9,1),	%r12b
	
	SUB	$'0',			%r15b
	SUB	$'0',			%r12b
	
	CMP	$0,		%rcx
	JNE	optNot0
	
	ADD	%r15b,			%r12b
	ADD	$'0',			%r12b
	MOV	%r12b,			(%rdi,%r8,1)
	
optNot0:
	
	CMP	$1,		%rcx
	JNE	optNot1
	
	AND	%r15b,			%r12b
	ADD	$'0',			%r12b
	MOV	%r12b,			(%rdi,%r8,1)
	
optNot1:
	
	CMP	$2,		%rcx
	JNE	optNot2
	
	OR	%r15b,			%r12b
	ADD	$'0',			%r12b
	MOV	%r12b,			(%rdi,%r8,1)
	
optNot2:

	CMP	$3,		%rcx
	JNE	optNot3
	
	XOR	%r15b,			%r12b
	ADD	$'0',			%r12b
	MOV	%r12b,			(%rdi,%r8,1)
	
optNot3:
	
	INC	%r8
	INC	%r9
	JMP nextWhile
	
end:
	MOV	%rdi,	%rax
	RET
	

