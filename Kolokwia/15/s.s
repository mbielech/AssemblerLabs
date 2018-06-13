	.text
	.type sum, @function
	.global sum	

# %rdi - a
# %rsi - b

sum:

# %r15 - max
# %r14 - min
# %r13 - sum

	CMP %rdi, %rsi
	JG cmp2
	mov %rsi, %r14
	mov %rdi, %r15
	
cmp2:
	mov %rdi, %r14
	mov %rsi, %r15
	xor %r13, %r13
for:
	cmp %r14, %r15
	jl end
	add %r14, %r13
	inc %r14
	jmp for
	
end:
	mov %r13, %rax
	ret
