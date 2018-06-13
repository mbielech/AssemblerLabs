	.text
	.type sum, @function
	.global sum	

# %rdi - a
# %rsi - b

sum:

	CMP		%rdi,	%rsi	# if(b > a)
	JG 		notchange
	
	# b <= a
	
	XCHG	%rdi,	%rsi	# zamien a z b
	
notchange:

	# a < b

	MOV		%rdi,	%r15	# sum = a
	
next:
	
	CMP 	%rdi,	%rsi	# if(a == b)
	JE		end
	
	INC		%rdi			# a++
	ADD		%rdi,	%r15	# sum += a
	
	JMP		next
	
end:	

	MOV		%r15,	%rax	# return sum
	RET

