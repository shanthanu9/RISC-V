#####################################################################
#Function to compute the sum of elemets in the array
#Compute the average using the the above sum
#Written By Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
#Date: September 4, 2018
#The elements are present in array variable
#####################################################################

	.option nopic
	.section .rodata
	.global LC0
LC0:
	.string "The sum is %d\nThe average is %d"
	.data
	.global a
array:
	.dword 1,2,3
	.equ SIZE, 3
	.text
	.global main
	.type main,@function
main:
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	li a0,SIZE			#length of array in a1
	la a1,array			#base address of array in a0
	jal ra,sum
	
	div a2,a1,a0			#for displaying output
	lui a0,%hi(LC0)
	addi a0,a0,%lo(LC0)
	jal ra,printf

	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jalr x0,0(ra)	
	
	.global sum
	.type sum,@function
sum:					#takes in two arguements: length and base address of the array
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	mv t0,x0
	mv t1,x0
for:
	beq t0,a0,end_for
	ld t2,0(a1)
	add t1,t1,t2
	addi a1,a1,8
	addi t0,t0,1
	jal x0,for
end_for:
	mv a1,t1			#sum is stored in a1
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jalr x0,0(ra)

