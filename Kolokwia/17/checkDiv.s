	.text
	.type checkDivA, @function
	.global checkDivA	

# a - rdi
# b - rsi
# c - rdx

checkDivA:
	CMP		$0, 	%rdx	# if(c==0)
	JNE 	else
	
	MOV 	%rsi,	%rbx
	MOV		%rdi,	%rax
	
	XOR		%edx,	%edx	# EDX = 0
	DIV		%ebx			# EDX:EAX div EBX
	CMP		$0,		%dl
	JE		return1			
	MOV		$0,		%rax	# niepodzielna
	JMP 	f_e
	
return1:					# podzielna
	MOV		$1, 	%rax
	JMP		f_e	

else:
	XOR		%r10,	%r10	# sum
	
	MOV		$1,		%r12	# iterator od 1 do 64
	MOV		$1,		%r11	# maska danego bitu		
	
	MOV		$64,	%rcx	# data count

next:
	
	MOV 	%r12,	%rbx	# przez co dzielimy
	MOV		%rdi,	%rax	# co dzielimy
	
	XOR		%rdx,	%rdx	# EDX = 0
	DIV		%rbx			# EDX:EAX div EBX
	
	CMP		$0,		%rdx
	JNE		continue
	
	OR		%r11,	%r10	# ustaw odpowiedni bit w sum
	
continue:

	SHL		$1,		%r11	# przesuniecie maski
	
	INC		%r12			# iterator ++
	LOOP	next			# { rcx--; if( rcx ) goto next }
	
	MOV		%r10,	%rax	# return sum
f_e:
	RET

