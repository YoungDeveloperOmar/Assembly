.data  # Data to store 
n: .word -1 # value of n that is in our memory. We will access it in the code

.text # Main code part
main: # main function
    la t1, n # load the adress to the t1 of the n in data
    lw t1, 0(t1) # load the value of n into t1
    jal square # enter the function square and then return back
    
    addi a0, x0, 1 # data type for the output int
    add a1, x0, t2 # output number squared
    ecall # print
    
    addi a0, x0, 10 # Exit
    ecall
    
square:  # Function square that 
    blt t1, x0 , finish # check if number is less than 0
    mul t2, t1, t1 # square the number
    ret # return back to function
    
    
finish:
    mv t2, x0 # change value to 0
    ret # return to square
    