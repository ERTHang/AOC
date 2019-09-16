	.text
	.golbl main
main:
	la $s0,c
	la $s1,c
loop:
	lw $t1,($s0)
loop2:
	lw $t2,($s1)
	mul $a0, $t1, $t2
	li $v0,1
	syscall
	beq $t2,10,bef_loop
	la $a0, espaco
	li $v0,4
	syscall
	addi $s1,$s1,4
	j loop2
bef_loop:
	la $a0,ln
	li $v0,4
	syscall
	beq $t1,10,end
	la $s1,c
	addi $s0,$s0,4
	j loop
end:
	li $v0,10
	syscall
	.data
	c: .word 2 3 4 5 6 7 8 9 10
espaco:
	.asciiz ", "
ln:
	.asciiz "\n"
