###this section starts by filling the I and W matrices. 
addi x1, x0, 0  # i = 0
addi x4, x0, 20 #matrix 1 ==> 20 elements
addi x5, x0, 15 #matrix 2 ==> 15 elements
addi x31, x0, 2 #shift for word address

# loop
loop_m1:
    sll x2, x1, x31  #i ==> word address 'SSLI does not exist'
    addi x1, x1, 1 # i = i+1    
### you can leave out the following two lines in the hardware version, 
##and replace it with following single line, as x6 is not used for us!
    sw x1, 0(x2)     
    bne x4, x1, loop_m1


addi x7, x0, 0 #j
loop_m2:
    sll x2, x1, x31  #i ==> word address 'SSLI does not exist'
    sub x8, x5, x7  
    addi x1, x1, 1 # i = i+1   
    addi x7, x7, 1 # j = j+1      
### you can leave out the following two lines in the hardware version, 
##and replace it with following single line, as x6 is not used for us!
    sw x8, 0(x2)     
    bne x5, x7, loop_m2  #return to loop m2

addi x9, x9, 0
addi x10, x10, 1

##matrix multiply
## set all registers!

addi x20, x0, 0  # I input address starting point
addi x21, x0, 80 # W input address starting point
addi x22, x0, 140 # output address starting point
addi x4, x0, 5   # C loop size
addi x5, x0, 3   #k loop size
addi x11, x0, 4   #B loop size
addi x23, x0, 0  ## C loop index starts with 0
addi x24, x0, 0  ## K loop index starts with 0
addi x25, x0, 0  ## B loop index starts with 0
addi x10, x0, 0  ## acc result


#### Program starts!! 
addi x27, x0, 1  ##program start          

##### START COUNTING CYCLES FROM HERE (in HW version!!!)
### as long as x27 = high!
## INSERT YOUR OWN CODE HERE!
## Do not change the code above!






#######  STOP COUNTING CYCLES 
addi x27, x0, 0  #indication of program end!  