	.text
	.type copyTabA, @function
	.global copyTabA	

# int* tab		%rdi 
# int len		%rsi
# int* copy 	%rdx 


copyTabA:
	
	XOR	%r11,	%r11	# iterator = 0 .. len
	MOV	%rsi,	%rcx	# count = len
	
next:
	
	MOV (%rdi,%r11,4), 	%r12d
	MOV %r12d,			(%rdx,%r11,4)

	INC	%r11
	LOOP next
	
	XOR	%rax,	%rax
	RET
