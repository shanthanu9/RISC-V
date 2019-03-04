
#####################################################################
#load from global section and first memory location of data segment.
#Add them and store their result in 100th double word of data segment
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#'a' is loaded from the global data section
#####################################################################

	.option nopic
	.data
a: 
	.dword 9
	.text
	.align 1
	.global main
	.type main,@function
main:
	la t0,a
	ld t0,0(t0)
	ld t1,0(sp)
	add t2,t0,t1
	addi sp,sp,-800
	sd t2,0(sp)
	ret





