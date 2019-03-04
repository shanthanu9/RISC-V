#####################################################################
#Reverse given string
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#The given string is "scam"
#####################################################################

	.option nopic
	.data
	.global str
	.type str,@object
str:
	.byte 's','c','a','m'
	.global rev
rev:						#to store the reversed string
	.space 4 
	.section .rodata
LC0:
	.string "The reverse of \"scam\" is "
	.text
	.global main
	.type main,@function
main:
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	la t0,str
	add t2,sp,0 				#save stack's current positon
for:						#put characters of the string into the stack
	ld t1,0(t0) 				#required character stored in t1
	beq t1,x0,end_for
	addi sp,sp,-1
	sb t1,0(sp)
	addi t0,t0,1
	jal x0, for
end_for:
	la t0,rev
for1:						#pop from the stack
	beq t2,sp,end_for1
	lb t1,0(sp)
	sw t1,0(t0)
	addi t0,t0,1
	addi sp,sp,1
	jal x0,for1
end_for1:
	lui a0,%hi(LC0)
	addi a0,a0,%lo(LC0)
	jal ra,printf
	lui a0,%hi(rev)
	addi a0,a0,%lo(rev)
	jal ra,printf
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	ret

