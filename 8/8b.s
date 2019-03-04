
#####################################################################
#To find factorial using recursion
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#Assume num >= 0
#####################################################################

	.option nopic 
	.data
	.global a
num:
	.dword 10					#computing factorial of 10 
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
	addi s0,sp,16
	la a0,num
	ld a0,0(a0)
	jal ra,fac
	mv a2,a1
	lui a0,%hi(LC0)	
	addi a0,a0,%lo(LC0)
	la a1,num
	ld a1,0(a1)
	jal ra,printf
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jalr x0,0(ra)	
	.global fac
	.type fac,@function
fac:
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	bne a0,x0,else
if:							#Base case: arguement is 0
	li a1,1
	j end_if
else:							#Recursive case
	addi a0,a0,-1
	jal ra,fac
	addi a0,a0,1
	mul a1,a1,a0
end_if:
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jalr x0,0(ra)	
