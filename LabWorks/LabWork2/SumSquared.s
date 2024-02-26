.data  # data that will store the value of n
n: .word 12 # n is a adress in memory that we will access in the code

.text
main: # main function
    
    la t0, n  # load the adress to the variable t0
    lw t0, 0(t0) # get the first value of the adress n
    addi t2, x0, 2 # this variable will store the value of 2, which we use to check if our number is even or odd
    jal ra, sumSquare # jal - linking the function with an expected return to this function
  
    
    addi a0, x0, 1 # output the datatype 1 - int
    add a1, x0, s2 # output message
    ecall
    
    addi a0, x0, 10 # Exit
    ecall

sumSquare: # Function sumSquare
    addi sp, sp, -4 # open the stack pointer
    sw ra, 0(sp) # sw - save word ( value ) im the stack pointer
    rem t1, t0, t2 # find the remainder when we divide n ( t0 ) by 2 ( t2 )
      
    blt t0, x0, finish # Check if number is < 0
    
    
    add s2, x0, x0 # create a variable s2 that is going to store our summed value
    beq t1, x0, even # check if the remainder ( t1 ) is 0, if it is then the number is even
    addi t0, t0, -1 # we should start from the number before if it is odd
even:  # when number is even, we do :
    blt t0, t2, end # if number is less than 2, then we just end, because we know that the least number it could be is 2, then we just add 1 at the end
    jal ra, square # link the function square, that will square our number, and then come back to this function with the result
    add s2, s2, t3 # we are adding the squared number to our sum
    addi t0, t0, -2 # decrement 2 each time 
    j even # loop back
    
    


end: # function when we want to end the program
    
    addi s2, s2, 1 # we should add 1 at the end, whether our initial value is even or odd
    lw ra, 0(sp)  # load the value into the stack
    addi sp, sp , 4  # close the stack pointer
    
    ret # return to the previus function because we don't want to go to square function
    

square: 
    mul t3, t0, t0 # Square the value of t0, and store it as t3
    ret # return to previous function
    
    
finish: # This function is for checking if number < 0
    mv s2, x0  # change num to 0
    ret

    
    