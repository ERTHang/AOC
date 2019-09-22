	.text
	.globl main
main:
	ori $v0,$zero, 5
	syscall
	ori $a0, $v0, 0
	ori $v0, $zero, 0
	jal bin
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall
	j end
bin:
	beq $a0, $zero, bin2
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	divu $a0, $a0, 2
	mfhi $t0
	sw $t0, 8($sp)
	jal bin
bin2:
	lw $t0, 8($sp)
	mul $v0, $v0, 10
	add $v0, $v0, $t0
	lw $t0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra
	
end:
	li $v0, 10
	syscall
	
