#377 cycles in vivada
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
addi sp,sp,4 #I inladen op 60
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
    #mini_loop:
        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        #bne t5, s7, mini_loop
        addi s6, s6, 4
        
        add sp, a0, s6 #sp adress + index i
    addi s7, zero, 0 #reset index j
    #mini_loop:
        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        #bne t5, s7, mini_loop
        addi s6, s6, 4

        add sp, a0, s6 #sp adress + index i
    addi s7, zero, 0 #reset index j
    #mini_loop:
        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        lw t3, 0(sp) #laad eerste matrix waarde in
        add sp, sp, t4 #stack +4
        addi s7, s7, 4
        sw t3, 0(a4) #sla op
        addi a4, a4, 4

        #bne t5, s7, mini_loop
        addi s6, s6, 4
    #bne t4, s6, mem_loop
    addi s11,zero,1

#begin mult
mult:
# mul a5,t4,t5 #size w
li s6, 60 #index I
addi s7, a2,0 #index W
#addi a6,t5,0 #a6=t5
#srl a5,a5,t2 # /4
#addi s1,a5,0
# add a6,a6,s6 # eindaddres i loop
# add a5,a5,s7 #eindaddres w loop

addi s9, zero, 0
addi s8, zero, 0

#addi a4,a4,4 #volgend adress opslaan
#-----------------------
lw t0,0(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4

#-----------------------
lw t0,4(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 

#-----------------------
lw t0,8(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,12(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,16(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
addi zero, zero, 0
addi zero, zero, 0 
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan
addi zero, zero, 0
addi zero, zero, 0
sw s9,0(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,0(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,4(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,8(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,12(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,16(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,4(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,0(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,4(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,8(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,12(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,16(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,8(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#######################

#-----------------------
lw t0,20(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,24(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,28(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,32(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,36(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,12(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,20(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,24(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,28(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,32(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,36(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,16(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,20(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,24(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,28(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,32(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,36(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,20(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#######################

#-----------------------
lw t0,40(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,44(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,48(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,52(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,56(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,24(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,40(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,44(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
 
#-----------------------
lw t0,48(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,52(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,56(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,28(a4) #result opslaan --gaat misssss
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,40(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,44(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,48(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,52(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,56(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,32(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#######################

#-----------------------
lw t0,60(s6)  #i
lw t1,0(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,64(s6)  #i
lw t1,4(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,68(s6)  #i
lw t1,8(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,72(s6)  #i
lw t1,12(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,76(s6)  #i
lw t1,16(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,36(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,60(s6)  #i
lw t1,20(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,64(s6)  #i
lw t1,24(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,68(s6)  #i
lw t1,28(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,72(s6)  #i
lw t1,32(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,76(s6)  #i
lw t1,36(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,40(a4) #result opslaan
#sub s6,s6,t5 #index i to start
addi s9, zero, 0
addi s8, zero, 0

#-----------------------
lw t0,60(s6)  #i
lw t1,40(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,64(s6)  #i
lw t1,44(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,68(s6)  #i
lw t1,48(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,72(s6)  #i
lw t1,52(s7)  #W
add s9,s9,s8 #tussenres+mul result
#addi s6,s6,4 #index i +4
addi zero, zero, 0
mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 
#-----------------------
lw t0,76(s6)  #i
lw t1,56(s7)  #W
add s9,s9,s8 #tussenres+mul result
addi zero, zero, 0

mul s8,t0,t1 #result mul
#addi s7,s7,4 #index w +4
 addi zero, zero, 0
addi zero, zero, 0
#//////////////////////
add s9,s9,s8 #tussenres+mul result
#addi a4,a4,4 #volgend adress opslaan

sw s9,44(a4) #result opslaan


#######################
    addi s11,zero,0
#ecall to end program
exit:
addi a0, zero, 10
ecall