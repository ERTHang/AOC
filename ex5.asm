	.text
	.golbl main
main:
	li $v0,5
	syscall
	beq $v0,0,eixox
	slt $t1,$zero,$v0
	beq $t1,1,pos
	j neg
pos:
	li $v0,5
	syscall
	beq $v0,0,eixoy
	slt $t1,$zero,$v0
	beq $t1,1,quad1
	j quad4
neg:
	li $v0,5
	syscall
	slt $t1,$zero,$v0
	beq $t1,1,quad2
	j quad3
eixox:
	la $a0,eixoxlab
	li $v0,5
	syscall
	beq $v0,0,origem
	j print
eixoy:
	la $a0,eixoylab
	j print
quad1:
	la $a0,quad1lab
	j print
quad2:
	la $a0,quad2lab
	j print
quad3:
	la $a0,quad3lab
	j print
quad4:
	la $a0,quad4lab
	j print
origem:
	la $a0,origemlab
print:
	li $v0,4
	syscall
end:
	li $v0,10
	syscall
	.data
eixoxlab:
	.asciiz "eixo x\n"
eixoylab:
	.asciiz "eixo y\n"
quad1lab:
	.asciiz "1 quadrante"
quad2lab:
	.asciiz "2 quadrante"
quad3lab:
	.asciiz "3 quadrante"
quad4lab:
	.asciiz "4 quadrante"
origemlab:
	.asciiz "origem"
