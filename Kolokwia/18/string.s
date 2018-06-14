	.text
	.type stringA, @function
	.global stringA	

# %rdi - char* buf
# %rsi - int a
# %rdx - int b
# %rcx - int charset
# %r8  - int* count

stringA:
	
	XOR	%r15,	%r15			# i = 0
	XOR %rax,	%rax			# sum = 0
	
	XOR	%r9,	%r9				# r9 = 0
	MOV	%r9d,	(%r8,%r9,4)		# count = 0
	XOR	%r14,	%r14			# nasz count = 0
	
# ---------- WHILE ----------------------	

next:
	MOV	(%rdi,%r15,1),	%r10b	# buf[i]
	CMP	$0,				%r10b	# if(buf[i]!=0)	
	JE	end
	
	CMP	%r15,	%rsi	# if(i >= a)
	JG	continue
	
	CMP	%r15,	%rdx	# if(i <= b)
	JL	continue
	
	CMP	$0,		%rcx	# if(charset == 0)
	JNE not0
	
	XOR	%r11,	%r11
	MOV	%r10b,	%r11b
	ADD	%r11,	%rax
	INC %r14
	
not0:

	CMP	$1,		%rcx	# if(charset == 1)
	JNE not1
	
	CMP	$'0',	%r10b
	JL	not1
	CMP	$'9',	%r10b
	JG	not1
	
	XOR	%r11,	%r11
	MOV	%r10b,	%r11b
	ADD	%r11,	%rax
	INC %r14
	
not1:

	CMP	$2,		%rcx	# if(charset == 2)
	JNE not2
	
	CMP	$'A',	%r10b
	JL	not2
	CMP	$'Z',	%r10b
	JG	not2
	
	XOR	%r11,	%r11
	MOV	%r10b,	%r11b
	ADD	%r11,	%rax
	INC %r14
	
not2:

	CMP	$3,		%rcx	# if(charset == 3)
	JNE not3
	
	CMP	$'a',	%r10b
	JL	not3
	CMP	$'z',	%r10b
	JG	not3
	
	XOR	%r11,	%r11
	MOV	%r10b,	%r11b
	ADD	%r11,	%rax
	INC %r14
	
not3:

	CMP	$4,		%rcx	# if(charset == 4)
	JNE continue
	
	CMP	$'a',	%r10b
	JL	notaz
	CMP	$'z',	%r10b
	JG	notaz
	
	XOR	%r11,	%r11
	MOV	%r10b,	%r11b
	ADD	%r11,	%rax
	INC %r14
	
notaz:

	CMP	$'A',	%r10b
	JL	continue
	CMP	$'Z',	%r10b
	JG	continue
	
	XOR	%r11,	%r11
	MOV	%r10b,	%r11b
	ADD	%r11,	%rax
	INC %r14
	
continue:
	INC %r15			# i++
	JMP	next
end:

# END------- WHILE ----------------------

	MOV	%r14d,	(%r8,%r9,4)
	RET
