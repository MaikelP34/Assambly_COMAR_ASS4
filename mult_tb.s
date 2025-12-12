.data
W: .word 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1       # values

.text
#test som en load address
la s2, W
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