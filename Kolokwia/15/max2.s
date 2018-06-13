	.text
	.type max2a, @function
	.global max2a

# a - rdi
# b - rsi

max2a:	
	MOV		%esi,	%r15d	# x = b
	ADD		%edi,	%r15d	# x = a + b
	
	MOV		%esi,	%eax	# rax = b
	MUL		%edi			# rax = a * b  (RAX = RAX * RDI)
	MOV		%eax,	%r14d	# y = a * b
	
	MOV		%esi,	%r13d	# z = b
	NEG		%r13d			# z = -b
	ADD		%edi,	%r13d	# z = a - b
	
	
	MOV		%r15d,	%r12d	# max = x
	
	CMP 	%r14d,	%r12d	# if(max < y)
	JGE		ynotmax
	
	MOV 	%r14d,	%r12d	# max = y
	
ynotmax:

	CMP 	%r13d,	%r12d	# if(max < z)
	JGE		znotmax
	
	MOV 	%r13d,	%r12d	# max = z
	
znotmax:
	
	MOV		%r12d,	%eax	# return max;
	RET
