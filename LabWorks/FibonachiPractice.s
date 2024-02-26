.data
.word 2, 4, 6, 8
n: .word 9

.text
main:
    add t0, x0, x0
    addi t1, x0, 1
    la t3, n
    lw t3, 0(t3)
fib:
    beq t3, x0, finish # beq = branch if equal. So in this case the value we stored in t3 variable will be checked. If value of t3 == 0  (x0), then we finish the program 
    add t2, t1, t0 # If t3 is not 0, we are moving to this line, where we say that the value of t2 will change. t2 = value of t1 + value of t0
    mv t0, t1 # Here we change t
    mv t1, t2
    addi t3, t3, -1
    j fib
finish:
    addi a0, x0, 1
    addi a1, t0, 0
    ecall # print integer ecall
    addi a0, x0, 10
    ecall # terminate ecall