	.text
	.type isoutside, @function
	.global isoutside	

# %rdi - x
# %rsi - a
# %rdx - b

isoutside:	
	CMP	%rsi,	%rdx	# if(b > a)
	JG	bmax
	
	# b < a
	
	CMP	%rdi,	%rsi	# if(a < x)
	JL	xmax	
	
	# b < a && x < a
	
	CMP	%rdi,	%rdx	# if(b > x)
	JG	xmin
	
	# b < x < a
	
	MOV	$0,		%rax
	RET
	
bmax:

	# a < b

	CMP	%rdi,	%rdx	# if(b < x)
	JL	xmax
	
	# a < b && x < b 
	
	CMP	%rdi,	%rsi	# if(a > x)
	JG	xmin
	
	# a < x < b
	
	MOV	$0,	%rax
	RET

xmax:

	# x > a && x > b

	MOV	$1,	%rax
	RET
	
xmin:

	# x < a && x < b

	MOV	$-1,	%rax	
	RET

