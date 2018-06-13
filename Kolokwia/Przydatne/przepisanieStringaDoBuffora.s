.text
        .type funa, @function
        .global funa
#rdi buf
#rsi a
 
funa:
	
	MOV	%rdi,	%r12	# buffor
	MOV	%rsi,	%r11	# a

next:

	CMP $0,		(%r11)	# if(a[i]!=0)
	JE	end
	
	MOV	(%r11), %r9b	# zapisz znak z a do tmp
	MOV %r9b,	(%r12)	# zapisz znak z tmp do buffer

	INC	%r11			# a* = (a+1)*
	INC %r12			# buffor* = (buffor+1)*

    JMP next

end:
	MOV	%rdi,	%rax
	RET
