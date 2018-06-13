	.text
	.type checkDivA, @function
	.global checkDivA	

# a - rdi
# b - rsi
# c - rdx

checkDivA:
	CMP	$0,	%rdx	#c==0
	JNE	cnot0
	XOR	%rdx, %rdx
	MOV	%rdi,	%rax
	MOV	%rsi,	%rbx
	DIV	%rbx		# EDX:EAX div EBX
	CMP	$0,	%rdx
	JE	return1		
	MOV	$0,	%rax
	RET
	
return1:
	MOV	$1,	%rax
	RET
	
cnot0:	
	XOR	%r15,	%r15	#sum=0;
	MOV	$1,		%r14	#i=1
	MOV	$1,		%r13	#maska
next:
	XOR	%rdx, %rdx
	MOV	%rdi,	%rax
	MOV	%r14,	%rbx
	DIV	%rbx		# EDX:EAX div EBX
	CMP	$0,	%rdx	#if(a%i==0)
	JNE bit0
	OR	%r13,	%r15	#ustawiam dany bit na 1
	
bit0:
	SHL	$1,		%r13	#pzesuwam maske o bit w lewo
	INC	%r14			#i++
	CMP	$64,	%r14	#if(i<=64)
	JG	return
	JMP	next
	
return:
	MOV	%r15,	%rax
	RET

