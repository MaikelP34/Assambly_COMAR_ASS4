.data

v: .word

.text

##this instruction can be left out for our hardware version!
la t1, v #not needed for our RISC-V

###this section starts by filling the I and W matrices. 
addi ra, zero, 0  # i = 0
addi tp, zero, 20 #matrix 1 ==> 20 elements
addi t0, zero, 15 #matrix 2 ==> 15 elements
addi t6, zero, 2 #shift for word address

# loop
loop_m1:
    sll sp, ra, t6  #i ==> word address 'SSLI does not exist'
    addi ra, ra, 1 # i = i+1    
### you can leave out the following two lines in the hardware version, 
##and replace it with following single line, as t1 is not used for us!
## sw ra, 0(sp)     
    add gp, sp, t1 #address in memory
    sw ra, 0(gp)
    bne tp, ra, loop_m1


addi t2, zero, 0 #j
loop_m2:
    sll sp, ra, t6  #i ==> word address 'SSLI does not exist'
    addi ra, ra, 1 # i = i+1   
    sub s0, t0, t2  
    addi t2, t2, 1 # j = j+1      
### you can leave out the following two lines in the hardware version, 
##and replace it with following single line, as t1 is not used for us!
## sw s0, 0(sp)     
    add gp, sp, t1 #address in memory
    sw s0, 0(gp)
    bne t0, t2, loop_m2  #return to loop m2

addi s1, s1, 0
addi a0, a0, 1

##matrix multiply
## set all registers!

addi s4, zero, 0  # I input address starting point
addi s5, zero, 80 # W input address starting point
addi s6, zero, 140 # output address starting point
addi tp, zero, 5   # C loop size
addi t0, zero, 3   #k loop size
addi a1, zero, 4   #B loop size
addi s7, zero, 0  ## C loop index starts with 0
addi s8, zero, 0  ## K loop index starts with 0
addi s9, zero, 0  ## B loop index starts with 0
addi a0, zero, 0  ## acc result

####### we don't need to have the next three lines in our HW version!!
add s4, s4, t1
add s5, s5, t1
add s6, s6, t1


#### Program starts!! 
addi s11, zero, 1  ##program start          

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

addi sp, s4, 0 # Stack pointer at I[0][0]

#TODO variables to 0 for safety?

for1:

    for2:
    
        for3:

            # Adress of I[b][c]
            mul a2, s9, tp # (row_index * number_of_columns)
            add a2, a2, s7 # ((row_index * number_of_columns) + column_index)
            sll a2, a2, t6 # ((row_index * number_of_columns) + column_index) * 4

            # moving pointer
            add sp, a2, zero

            lw t3, 0(sp) #Good?

            # Adress of W[c][k]
            mul a3, s7, t0 # (row_index * number_of_columns)
            add a3, a3, s8 # ((row_index * number_of_columns) + column_index)
            sll a3, a3, t6 # ((row_index * number_of_columns) + column_index) * 4

            # moving pointer
            add sp, a3, zero

            lw t4, 0(sp) #Good?

            # Mul + Add --> temp
            mul t5, t3, t4
            add a0, a0, t5
             
        addi s7, s7, 1
        blt s7, tp, for3

    addi s8, s8, 1
    blt s8, t0, for2

addi s9, s9, 1
blt s9, a1, for1

#ecall to end program
addi a7, zero, 10
ecall












#######  STOP COUNTING CYCLES 
addi s11, zero, 0  #indication of program end!  