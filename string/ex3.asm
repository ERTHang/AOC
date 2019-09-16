	.text
	.golbl main
main:
	la $t0,c
	li $v0,5
	syscall
	ori $s0,$v0,0
loop:
	lw $t1,($t0)
	divu $a0,$s0,$t1
	mul $t2,$a0,$t1
	sub $s0,$s0,$t2
print:
	li $v0,1
	syscall
	la $a0, barra
	li $v0,4
	syscall
	addi $t0,$t0,4
	beq $t1,1,barran
	j loop
barran:
	la $a0, ln
	li $v0,4
	syscall
end:
	li $v0,10
	syscall
	.data
	c: .word 365 30 1
barra:
	.asciiz "/"
ln:
	.asciiz "\n"
