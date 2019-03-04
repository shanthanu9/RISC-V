
#####################################################################
#print "Hello World"
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#LC0 is declared in read only section, stores string "Hello World"
#####################################################################

	.option nopic
	.section .rodata
LC0:
	.string "Hello World"
	.text
	.global main
	.type main,@function
main:
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	lui a0,%hi(LC0)
	addi a0,a0,%lo(LC0)
	jal ra,printf
	ld ra,8(sp)
	ld s0,0(sp)
	addi sp,sp,16
	jalr x0,0(ra)
