
#####################################################################
#To find factorial using loop
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#Assume num >= 0
#####################################################################

	.option nopic 
	.data
	.global a
num:
	.dword 5					#finding factorial of 5
	.section .rodata
LC0:
	.string "%d! = %d"
	.text
	.global main
	.type main,@function
main:
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	la t2,num
	ld t2,0(t2)
	li t1,0
	li t0,1						#factorial stored in t0
for:
	addi t1,t1,1
	mul t0,t0,t1
	blt t1,t2,for
	lui a0,%hi(LC0)
	addi a0,a0,%lo(LC0)
	la a1,num
	ld a1,0(a1)
	mv a2,t0
	jal ra,printf
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jalr x0,0(ra)	

