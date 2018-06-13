.text
        .type funa, @function
        .global funa
#rdi buf
#rsi a
#rdx b
 
funa:
	
	MOV	%rdi,	%r12	# buffor
	MOV	%rsi,	%r11	# a
	MOV	%rdx,	%r10	# b

next:

	CMP $0,		(%r10)	# if(b[i]!=0)
	JE	end
	
	MOV	(%r11), %r9b	# zapisz znak z a do tmp
	MOV %r9b,	(%r12)	# zapisz znak z tmp do buffer

	INC	%r11			# a* = (a+1)*
	INC %r12			# buffor* = (buffor+1)*
	
	MOV	(%r10), %r9b	# zapisz znak z b do tmp
	MOV %r9b,	(%r12)	# zapisz znak z tmp do buffer

	INC	%r10			# b* = (b+1)*
	INC %r12			# buffor* = (buffor+1)*

    JMP next

end:
	MOV	%rdi,	%rax
	RET
