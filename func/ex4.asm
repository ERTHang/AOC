	.text
	.globl main
main:
	li $a0, 2
	li $a1, 3
	li $a2, 4
	li $a3, 5
	li $v0, 5
	syscall
	addi $sp, $sp, -4
	sw $v0, 0($sp)
	jal func
	addi $sp, $sp, 4
	move $a0, $v0
	li $v0, 1
	syscall
	j end
	
func:
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	lw $s0, 12($sp)
	# x ^ 2
	mul $s1, $s0, $s0
	# x ^ 3
	mul $s2, $s1, $s0
	#A) a * x ^ 3
	mul $s2, $s2, $a0
	#B) b * x ^ 2
	mul $s1, $s1, $a1
	#C) c * x
	mul $s0, $s0, $a2
	#D) A + B
	add $s2, $s2, $s1
	#E) C + D
	add $s0, $s0, $s2
	#E + d
	add $v0, $s0, $a3
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
end:
	li $v0, 10
	syscall
	