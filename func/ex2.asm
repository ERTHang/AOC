	.text
	.globl main
main:
	li $a1, 0
	li $a2, 1
	li $a3, 1
	li $v0, 5
	syscall
	slt $t0, $zero, $v0
	beq $t0, $zero, end
	ori $a0, $v0, 0
	jal return
	ori $a0, $v0, 0
	li $v0, 1
	syscall
	j main
	
return:
	move $v0, $a2
	bne $a3, $a0, fib
	jr $ra
fib:
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	add $t0, $a1, $a2
	move $a1, $a2
	move $a2, $t0
	addi $a3, $a3, 1
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	j return
end:
	li $v0, 10
	syscall
	 
