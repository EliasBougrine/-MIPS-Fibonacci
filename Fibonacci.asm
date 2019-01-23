.data


prompt: .asciiz "\n \n Enter an integer: "
message1: .asciiz "\n The Fibonacci number associated is: "
message2: .asciiz "\n Fib(0) = 1"
message3: .asciiz "\n Fib(1) = 1"



.text


main:

#Prompt the user to enter an integer
li $v0, 4
la $a0, prompt
syscall


#Get the number entered by the user
li $v0, 5
syscall


#Store the number entered by the user in $t3
move $t3 , $v0


#If the integer is 0, return the value of Fib(0) = 1
beq $t3, 0, IntegerIs0


#If the integer is 1, return the value of Fib(1) = 1
beq $t3, 1, IntegerIs1


#Define the usefull data and variables
li $t0 , 1    #Fib(0)
li $t1 , 1    #Fib(1)
li $t2 , 1    #Counter


loop:

beq $t2 , $t3 , end     #Condition if
add $t4 , $t0 , $t1
add $t2 , $t2 ,1
move $t0 , $t1
move $t1 , $t4
j loop


end:

#Display message
li $v0, 4
la $a0, message1
syscall


#Print the Fibonacci number
li $v0, 1
move $a0, $t4
syscall


#Syscall to end
li $v0, 10
syscall


IntegerIs0:
li $v0, 4
la $a0, message2
syscall
li $v0, 10
syscall


IntegerIs1:
li $v0, 4
la $a0, message3
syscall
li $v0, 10
syscall
