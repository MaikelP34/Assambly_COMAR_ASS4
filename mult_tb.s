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
#test som en load address
li s2, 0
addi s3, s2, 0
addi s2, s2, 4 #0(s2) = 14
addi t6, zero, 2 #rekenwaarde

#test lw na elkaar met != en = registers
lw t1, 0(s2) #14
lw t2, 8(s2) #12
lw t3, 4(s2) #13
lw t3, 4(s3) #14

#test shift logic
sll t1, t1, t6 #56
srl t2, t2, t6 # /4 -> 3

#test sub
sub t1, t1, t2 #56-3 = 53

#test lw + sw
lw t4, 0(s2) #14
sw t1, 0(s2) #44
lw t4, 0(s2) #44

addi t5, zero, 5
addi t4, zero, 1
testloop:
    sub t5, t5, t4
    mul s3, t5, t6 #[8,6,4,2,0]
    bne t5, zero, testloop

addi