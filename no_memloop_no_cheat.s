#380 cycles in vivado

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
li a0, 0 #adress W
li a1, 80 #adress I
li a4,140


#begin mult
mult:
addi s6, a0,0 #index I
addi s7, a1,0 #index W

addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,0(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul

#-----------------------
lw t0,4(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 

#-----------------------
lw t0,8(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,12(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,16(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
addi zero, zero, 0
addi zero, zero, 0 
#//////////////////////
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
addi zero, zero, 0
sw s9,0(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,0(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,4(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,8(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,12(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,16(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,4(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,0(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,4(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,8(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,12(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,16(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,8(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0


#-----------------------
lw t0,20(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,24(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,28(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,32(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,36(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,12(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,20(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,24(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,28(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,32(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,36(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,16(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,20(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,24(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,28(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,32(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,36(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,20(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#######################

#-----------------------
lw t0,40(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,44(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,48(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
#-----------------------
lw t0,52(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,56(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
sw s9,24(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,40(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,44(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,48(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,52(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,56(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,28(a4) #result opslaan 
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,40(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,44(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,48(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,52(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,56(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,32(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#######################

#-----------------------
lw t0,60(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,64(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,68(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,72(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,76(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,36(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,60(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
#-----------------------
lw t0,64(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,68(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
#-----------------------
lw t0,72(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#-----------------------
lw t0,76(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result

sw s9,40(a4) #result opslaan
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,60(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,64(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,68(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,72(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0
mul s8,t0,t1 #result mul
#-----------------------
lw t0,76(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0

mul s8,t0,t1 #result mul
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
sw s9,44(a4) #result opslaan
#######  STOP COUNTING CYCLES 

addi s11, zero, 0  #indication of program end!  



