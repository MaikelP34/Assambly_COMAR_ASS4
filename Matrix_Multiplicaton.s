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

for1:
    for2:
        for3:

            #O[b][k] += I[b][c] * W[c][k]

            #


        addi tp, tp, 1
        blt s7, tp, for3

    addi t0, t0, 1
    blt s8, t0, for2

addi a1, a1, 1
blt s9, a1, for1











#######  STOP COUNTING CYCLES 
addi s11, zero, 0  #indication of program end!  