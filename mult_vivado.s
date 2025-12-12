addi zero,zero,0
addi t1,zero,15
sw t1,0(sp) #15
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #14
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #13
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #12
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #11
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #10
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #9
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #8
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #7
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #6
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #5
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #4
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #3
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #2
addi sp,sp,4
addi t1,t1,-1
sw t1,0(sp) #1
addi sp,sp,4#I inladen op 60
addi t1,zero,1
sw t1,0(sp) #1
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #2
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #3
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #4
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #5
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #6
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #7
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #8
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #9
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #10
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #11
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #12
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #13
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #14
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #15
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #16
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #17
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #18
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #19
addi sp,sp,4
addi t1,t1,1
sw t1,0(sp) #20
addi sp,sp,4
addi t1,t1,1


li a0, 0 #adress W
li a1, 60 #adress I

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
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4
        bne t5, s7, mini_loop
        addi s6, s6, 4
    bne t4, s6, mem_loop

#begin mult

mul a5,t4,t5 #size w
li s6, 60 #begin I
addi s7, a2,0 #begin w'
addi a6,t5,0 #a6=t5
srl a5,a5,t2 # /4
addi s1,a5,0 #grootte array (niet bytes)
add a6,a6,s6 # eindaddres i loop
add a5,a5,s7 #eindaddres w loop

forforloop:
addi s9,zero,0

forloop:
    lw t0,0(s6)  #i
    lw t1,0(s7)  #W
    addi s6,s6,4 #index i +4
    mul s8,t0,t1 #result mul   
    addi s7,s7,4 #index w +4
    add s9,s9,s8 #tussenres+mul result
    bne a6,s6,forloop #zolang niet door 1 rij I loopen(t5=4*widthI)
    ##else
    addi a4,a4,4 #volgend adress opslaan
    sw s9,0(a4) #result opslaan
    sub s6,s6,t5 #index i to start
    bne s7,a5,forforloop #zolang w< size w loop
    
    add s6,s6,t5 #index i to end
    sub s7,s7,s1 #reset w
    add a6,a6,t5 # eindaddres i loop
    bne s6,a2, forforloop #zolang index i =! 

exit:
addi zero,zero,0
j exit