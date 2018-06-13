	.text
	.type greatest, @function
	.global greatest	

# a - rdi
# b - rsi
# c - rdx

greatest:	
	CMP		%rdi, 	%rsi	# if(b > a)
	JA 		else
	
	# b <= a
	
	CMP 	%rdi, 	%rdx	# if(c > a)
	JA 		else
	
	# c <= a
	
	# a == max
	
	MOV 	%rdi, 	%rax	# return a
	RET
	
else:

	# a != max

	CMP 	%rsi, 	%rdx	# if(c > b)
	JA 		retC
	
	# c <= b
	
	# b == max
	
	MOV 	%rsi, 	%rax	# return b
	RET
	
retC:

	# c == max

	MOV 	%rdx, 	%rax	# return c
	RET

