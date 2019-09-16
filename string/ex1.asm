	.text
	.golbl main
main:
	li $s0,2
loop:
	li $v0,5
	syscall
	beq $v0,$zero,end
	div $v0,$s0
	mfhi $t1
	beq $t1,$zero,par
	j impar
par:
	la $a0, parlab
	li $v0,4
	syscall
	j loop
impar:
	la $a0,imparlab
	li $v0,4
	syscall
	j loop
end:
	li $v0,10
	syscall
	.data
parlab:
	.asciiz "par\n"
imparlab:
	.asciiz "impar\n"
