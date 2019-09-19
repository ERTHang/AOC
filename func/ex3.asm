	.text
	.globl main
main:
	li $v0, 5
	li $s0, 10
	li $a1, 0
	syscall
	ori $a0, $v0, 0
	jal num
	move $a0, $v0
	li $v0, 1
	syscall
	j end
num:
	div $a0, $s0
	mflo $a0
	addi $a1, $a1, 1
	beq $a0, $zero, retorno
	j num
retorno:
	move $v0, $a1
	jr $ra
end:
	li $v0, 10
	syscall
	