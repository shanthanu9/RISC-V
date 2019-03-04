
#####################################################################
#Initialise contiguous chunk of memory for 10 2 digit numbers
#and find their sum. Store sum in x5
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#array contains 10 2 digits numbers
#Expected sum is 564
#####################################################################

	.option nopic
	.data
	.global array
array:
	.half 34,44,68,13,96,38,43,51,87,90
	.text
	.global main
	.type main,@function
main:
	li x7,0
	li x6,10
	li x5,0
	la x28,array
loop:
	lh x29,0(x28)
	add x5,x5,x29
	addi x28,x28,2
	addi x7,x7,1
	ble x7,x6,loop
	ret
