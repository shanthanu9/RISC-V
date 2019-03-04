#####################################################################
#Matrix multiplication
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#matrics are A and B, product stored in C
#Matrix A
#1,2,3
#4,5,6
#Matrix B
#6,5
#4,3
#2,1
#Expected matrix C
#20 18
#56 41
#####################################################################

	.option nopic
	.data
	.globl A
A:
	.dword 1,2,3,4,5,6
	.equ ROWA, 2
	.equ COLA, 3
	.globl B
B:
	.dword 6,5,4,3,2,1
	.equ ROWB, 3
	.equ COLB, 2
	.globl C
C:
	.dword 0,0,0,0 			#2X2 matrix
	.equ ROWC, 2
	.equ COLC, 2
	.equ SIZE, 4
	.section .rodata
LC0:
	.string "The product matrix is\n"
LC1:
	.string "%d "
LC2:
	.string "\n"
	.text
	.globl main
	.type main,@function
main:
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	la a0,A
	la a1,B
	jal ra,mat_mul
	lui a0,%hi(LC0)
	addi a0,a0,%lo(LC0)
	jal ra,printf
	la t1,C
	li t0,0
	li t2,SIZE
for:
	beq t0,t2,end_for
	lui a0,%hi(LC1)
	addi a0,a0,%lo(LC1)
	ld a1,0(t1)
	jal ra,printf
	addi t1,t1,8
	addi t0,t0,1
	li t4,2
	bne t0,t4,for
	lui a0,%hi(LC2)
	addi a0,a0,%lo(LC2)
	jal ra,printf
	j for
end_for:
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jalr x0,0(ra)
	.globl mat_mul
	.type mat_mul,@function
mat_mul:						#function takes two arguements, A and B, and stores result in global variable C 
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	li t0,0
for1:
	li t1,ROWA
	beq t0,t1,end_for1
	li t1,0
for2:
	li t2,COLB
	beq t1,t2,end_for2
	li t2,0
for3:
	li t3,COLA
	beq t2,t3,end_for3
	
	la t3,C						#load c[t0][t1] into t3
	li a0,COLC
	mul t4,t0,a0
	add t4,t4,t1
	li a0,8
	mul t4,t4,a0
	add t3,t3,t4
	addi sp,sp,-8
	sd t3,0(sp)
	ld t3,0(t3)
	
	la t4,A						#load a[t0][t2] into t4
	li a0,COLA
	mul t5,t0,a0
	add t5,t5,t2
	li a0,8
	mul t5,t5,a0
	add t4,t4,t5
	ld t4,0(t4)
	
	la t5,B						#load b[t2][t1] into t5
	li a0,COLB
	mul t6,t2,a0
	add t6,t6,t1
	li a0,8
	mul t6,t6,a0
	add t5,t5,t6
	ld t5,0(t5)
	
	mul t6,t5,t4
	add t3,t3,t6

	ld t4,0(sp)					#store computed sum back in c[t0][t1]
	addi sp,sp,8
	sd t3,0(t4)

	addi t2,t2,1	
	j for3
end_for3:
	addi t1,t1,1
	j for2
end_for2:
	addi t0,t0,1
	j for1 
end_for1:
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jalr x0,0(ra)

