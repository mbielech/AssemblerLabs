	.text
	.type maxdifa, @function
	.global maxdifa	

# a - %rdi
# b - %rsi
# c - %rdx
# d - %rcx
 
maxdifa:	
	MOV %rdi,	%r12	# max
	MOV	%rdi,	%r11	# min
	
	CMP %rsi,	%r12
	JGE	dalej
	MOV %rsi,	%r12
	
dalej:

	CMP %rdx,	%r12
	JGE	dalej2
	MOV %rdx,	%r12
	
dalej2:

	CMP %rcx,	%r12
	JGE	dalej3
	MOV %rcx,	%r12
	
dalej3:

	CMP %rsi,	%r11
	JLE	dalej4
	MOV %rsi,	%r11
	
dalej4:

	CMP %rdx,	%r11
	JLE	dalej5
	MOV %rdx,	%r11
	
dalej5:

	CMP %rcx,	%r11
	JLE	dalej6
	MOV %rcx,	%r11
	
dalej6:

	SUB	%r11,	%r12
	MOV	%r12,	%rax
	RET
