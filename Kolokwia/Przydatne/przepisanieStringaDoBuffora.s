.text
        .type funa, @function
        .global funa
#rdi buf
#rsi a
 
funa:
	XOR	%r15,			%r15			# licznik = 0

next:
	
	MOV	(%rsi,%r15,1),	%r9b			# zapisz znak z a do tmp

	CMP	$0,				%r9b			# if(a[i]!=0)
	JE	end
	
	
	MOV %r9b,			(%rdi,%r15,1)	# zapisz znak z tmp do buffer

	INC	%r15							# licznik++
    JMP next

end:
	MOV	%rdi,			%rax
	RET
