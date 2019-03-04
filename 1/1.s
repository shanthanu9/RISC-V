#####################################################################
#load two numbers into x5, x6. Add them and store sum in x7
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 2, 2018
#global variables a and b are loaded into x5 and x6
#####################################################################

	.option nopic
	.data
	.global a
a:
	.dword 10
	.global b
b: 
	.dword 11
	.text
	.global main
	.type main,@function
main:
	la x5,a
	ld x5,0(x5)
	la x6,b
	ld x6,0(x6)
	add x7,x5,x6
	ret

