.data
#Matrix O = Matrix I * Matrix W
W: .word 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1       # 5x3 matrix
I: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 # 4x5 matrix

.text
#TODO mult terug maken
##this instruction can be left out for our hardware version!

la a0, W #adress W
la a1, I #adress I

###this section starts by filling the I and W matrices. 

addi sp,a0, 0 #start stack in mem

addi s2, zero, 20 #length I
addi s3, zero, 15 #length W

addi s4, zero, 5 #rows W
addi s5, zero, 3 #collums W

addi t2, zero, 2 #cnst 2


sll t3, s2, t2 #length * 4
add a4, a1, t3 #eind adress I
add a2,a4,zero #a2=a4=begin w'

sll t4, s5, t2 #aantal collums *4
sll t5, s4, t2 #aantal rows *4

mem_loop:
    add sp, a0, s6 #sp adress + index i
    addi s7, zero, 0 #reset index j
    mini_loop:
        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4
        addi s7, s7, 4
        bne t5, s7, mini_loop
    addi s6, s6, 4
    bne t4, s6, mem_loop


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


mul a5,t4,t5 #size w
la s6, I
addi s7, a2,0
addi a6,t5,0 #a6=t5
srli a5,a5,2 # /4
addi s1,a5,0
add a6,a6,s6 # eindaddres i loop
add a5,a5,s7 #eindaddres w loop
forforloop:
lw s9,0(a4)  #tussenresultaat inladen
forloop:
    lw t0,0(s6)  #i
    addi s6,s6,4 #index i +4
    lw t1,0(s7)  #W
    mul s8,t0,t1 #result mul   
    addi s7,s7,4 #index w +4
    add s9,s9,s8 #tussenres+mul result
    bne a6,s6,forloop #zolang niet door 1 rij I loopen(t5=4*widthI)
    ##else
    sw s9,0(a4)
    addi a4,a4,4
    sub s6,s6,t5 #index i to start
    bne s7,a5,forforloop #zolang w< size w loop
    
    add s6,s6,t5 #index i to end
    sub s7,s7,s1 #reset w
    add a6,a6,t5 # eindaddres i loop
    bne s6,a2, forforloop