	.text
	.globl main
main:
	ori $v0,$zero, 5
	syscall
	ori $a0, $v0, 0
	jal fib
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall
	j end
fib:
	slti $t0, $a0, 2
	bne $t0, $zero, fib0
	addi $sp, $sp, -16
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	sw $a0, 8($sp)
	addi $a0, $a0, -1
	jal fib
	sw $v0, 12($sp)
	lw $a0, 8($sp)
	addi $a0, $a0, -2
	jal fib
	lw $s0, 12($sp)
	add $v0, $s0, $v0
	lw $ra, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 16
	jr $ra
fib0:
	ori $v0, $zero, 1
	jr $ra
end:
	li $v0, 10
	syscall
	