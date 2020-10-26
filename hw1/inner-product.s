.data
arr1: .word 1, 2, 3 # a[3] = {1, 2, 3}
arr2: .word 4, 5, 6 # b[3] = {4, 5, 6}
len:  .word 3       # array length = 3
str:  .string "The inner product of two vectors is "

.text
# s1 = arr1 base address
# s2 = arr2 base address
# s3 = array length
# s4 = sum
# t0 = i
# t1 = a[i]
# t2 = b[i]
# t3 = a[i] * b[i] (assume no overflow, lower 32 bits)

main:
    la  s1, arr1      # s1 = a
    la  s2, arr2      # s2 = b
    lw  s3, len       # s3 = 3
    add s4, x0, x0    # sum = 0
    add t0, x0, x0    # i = 0
    jal ra, loop      # jump to for loop
    jal ra, print     # jump to for loop
    li  a7, 10        # end program
    ecall

loop:
    lw   t1, 0(s1)    # t1 = a[i]
    addi s1, s1, 4    # ++a (address move forward)
    lw   t2, 0(s2)    # t2 = b[i]
    addi s2, s2, 4    # ++b
    mul  t3, t1, t2   # t3 = a[i] * b[i]
    add  s4, s4, t3   # sum += a[i] * b[i]
    addi t0, t0, 1    # ++i
    blt  t0, s3, loop # if i < 3, go to loop
    jr   ra           # else, return to main

print:
    la  a0, str       # load string
    li  a7, 4         # print string
    ecall
    add a0, s4, x0    # load result
    li  a7, 1         # print integer
    ecall
    jr ra             # go back to main
