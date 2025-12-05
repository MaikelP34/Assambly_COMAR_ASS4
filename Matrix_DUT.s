.data
#Matrix O = Matrix I * Matrix W
v: .word
W: .word 15,14,131,12,11,10,9,8,7,6,5,4,3,2,1       # 5x3 matrix
I: .word 11,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 # 4x5 matrix
O: .space 48  # 4x3 matrix output space (4*3)

.text
#TODO mult terug maken
##this instruction can be left out for our hardware version!
la s5, v #not needed for our RISC-V

###this section starts by filling the I and W matrices. 
la a2, I
addi sp, s5, 0
addi a4, sp, 0 #begin van stack
addi ra, zero, 0
addi t0, zero, 20
addi t1, zero, 15
addi t2, zero, 2
addi t5, zero, 5
addi t6, zero, 3


la a3, W #adress W
addi ra, zero, 0 #index i
sll t4, t0, t2 #length array 1 *4
add a5, a2, t4

sll t6, t6, t2
sll t5, t5, t2

addi s1, zero, 0 #index j


loop_m2_col:
    add sp, s5, s6
    addi ra, zero, 0 #index i
    loop_m2_2:
        lw t3, 0(sp)
        sw t3, 0(a5)
        add sp, sp, t6
        addi a5, a5, 4
        addi ra, ra, 4
        bne ra, t5, loop_m2_2
    addi s6, s6, 4

    bne s6, t6, loop_m2_col



##matrix multiply
## set all registers!

####### we don't need to have the next three lines in our HW version!!

#### Program starts!! 
addi s11, zero, 1  ##program start          

#TODO : onze code start hier
##### START COUNTING CYCLES FROM HERE (in HW version!!!)
### as long as s11 = high!
## INSERT YOUR OWN CODE HERE!
## Do not change the code above!

#inladen Matrix I in stack

#int I[4][5]; int W[5][3]; int O[4][3];
#I: .word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 # horizontaal opgeslagen
#W: .word 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 # verticaal opgeslagen

# free registers: a2, a3, a4, a5, a6, a7, s2, s3, s10, t3, t4, t5
# a2 : adress I[b][c]
# a3 : adress W[c][k]
# a4 :
# a5 :
# a6 : 
# a7 : 
# s2 : 
# s3 : 
# s10 : 
# t3 : mul input 1
# t4 : mul input 2
# t5 : mul result

# formula for adress in matrix based on Colomns and Rows: 
# adress = ((row_index * number_of_columns) + column_index) * 4 --> relative to base adress


#TODO variables to 0 for safety?

#ecall to end program
addi a0, zero, 10
ecall