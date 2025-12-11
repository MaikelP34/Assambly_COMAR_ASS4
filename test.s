start:
    addi s1,zero,1
    addi s2,zero,2
    addi s3,zero,3
    addi s4,zero,4

    addi t1,s4,4
    sw t1,0(s1)

    addi t1,zero,4
    sw s1,0(t1)

    add zero,zero,zero
    lw t1,0(t1)
    beq t1,s1,start