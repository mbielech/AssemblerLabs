	.text
	.type isoutside, @function
	.global isoutside	

# %rdi - x
# %rsi - a
# %rdx - b

isoutside:	
	CMP	%rsi,	%rdx
	JGE	max
	
	MOV	%rdx,	%r14	#min
	MOV	%rsi,	%r15	#max
	JMP dalej1
	
max:
	MOV %rdx,	%r15 	#max
	MOV %rsi,	%r14 	#min
	
dalej1:
	CMP	%r15,	%rdi
	JG return1
	
	CMP %r14,	%rdi
	JL return2
	
	MOV $0, %rax
	RET
	
return1:
	MOV $1,		%rax
	RET
	
return2:
	MOV $-1,	%rax
	RET
