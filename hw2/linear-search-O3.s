00010054 <_start>:
   10054:  lui  a5,0x10
   10058:  addi a5,a5,336   # a5 = &arr
   1005c:  lw   a4,0(a5)    # a4 = arr[0]
   10060:  lw   t5,8(a5)    # t5 = arr[2]
   10064:  lw   t4,12(a5)   # t4 = arr[3]
   10068:  lw   t3,16(a5)   # t3 = arr[4]
   1006c:  lw   t1,20(a5)   # t1 = arr[5]
   10070:  lw   a7,24(a5)   # a7 = arr[6]
   10074:  lw   a6,28(a5)   # a6 = arr[7]
   10078:  lw   a0,32(a5)   # a0 = arr[8]
   1007c:  lw   a1,36(a5)   # a1 = arr[9]
   10080:  not  a2,a4       # a2 = ~arr[0] (for 1008c)
   10084:  lw   a3,4(a5)    # a3 = arr[1]

   10088:  addi sp,sp,-48   # ready for store something into stack
   1008c:  srai a5,a2,0x1f  # a5 = (~arr[0])'s sign extension (for 100b0)
   10090:  sw   t5,16(sp)   # store arr[2] into stack
   10094:  sw   t4,20(sp)   # store arr[3] into stack
   10098:  sw   t3,24(sp)   # store arr[4] into stack
   1009c:  sw   t1,28(sp)   # store arr[5] into stack
   100a0:  sw   a7,32(sp)   # store arr[6] into stack
   100a4:  sw   a6,36(sp)   # store arr[7] into stack
   100a8:  sw   a0,40(sp)   # store arr[8] into stack
   100ac:  sw   a1,44(sp)   # store arr[9] into stack

   100b0:  and  a4,a4,a5    # a4 = max(arr[0], max = 0) (mind blowing!!)

   100b4:  bge  a3,a4,100bc # if (arr[1] >= a4) goto 100bc
   100b8:  mv   a3,a4       # else a3 = a4
   100bc:  lw   a5,16(sp)   # a5 = arr[2]
                            # => a3 = max(arr[1], a4), and then load arr[2] to a5

   100c0:  bge  a5,a3,100c8 # if (arr[2] >= a3) goto 100c8
   100c4:  mv   a5,a3       # else a5 = a3
   100c8:  lw   a4,20(sp)   # a4 = arr[3]
                            # => a5 = max(arr[2], a3), and then load arr[3] to a4

   100cc:  bge  a4,a5,100d4 # if (arr[3] >= a5) goto 100d4
   100d0:  mv   a4,a5       # else a4 = a5
   100d4:  lw   a5,24(sp)   # a5 = arr[4]
                            # => a4 = max(arr[3], a5), and then load arr[4] to a5

   100d8:  bge  a5,a4,100e0 # if (arr[4] >= a4) goto 100e0
   100dc:  mv   a5,a4       # else a5 = a4
   100e0:  lw   a4,28(sp)   # a4 = arr[5]
                            # => a5 = max(arr[4], a4), and then load arr[5] to a4

   100e4:  bge  a4,a5,100ec # if (arr[5] >= a5) goto 100ec
   100e8:  mv   a4,a5       # else a4 = a5
   100ec:  lw   a5,32(sp)   # a5 = arr[6]
                            # => a4 = max(arr[5], a5), and then load arr[6] to a5

   100f0:  bge  a5,a4,100f8 # if (arr[6] >= a4) goto 100f8
   100f4:  mv   a5,a4       # else a5 = a4
   100f8:  lw   a4,36(sp)   # a4 = arr[7]
                            # => a5 = max(arr[6], a4), and then load arr[7] to a4

   100fc:  bge  a4,a5,10104 # if (arr[7] >= a5) goto 10104
   10100:  mv   a4,a5       # else a4 = a5
   10104:  lw   a5,40(sp)   # a5 = arr[8]
                            # => a4 = max(arr[7], a5), and then load arr[8] to a5

   10108:  bge  a5,a4,10110 # if (arr[8] >= a4) goto 10110
   1010c:  mv   a5,a4       # else a5 = a4
   10110:  lw   a2,44(sp)   # a2 = arr[9]
                            # => a5 = max(arr[8], a4), and then load arr[9] to a2

   10114:  bge  a2,a5,1011c # if (arr[9] >= a5) goto 1011c
   10118:  mv   a2,a5       # else a2 = a5
                            # => a2 = max(arr[9], a5), so a2 = the largest number in arr

   1011c:  lui  a5,0x10
   10120:  addi a5,a5,376   # a5 = str
   10124:  li   a4,84       # a4 = "T" （first char in str）
   10128:  lui  a3,0x40002  # a3 = tx

   1012c:  sb   a4,0(a3)    # send a4 to tx
   10130:  addi a5,a5,1     # str++
   10134:  lbu  a4,0(a5)    # a4 = next char in str
   10138:  bnez a4,1012c    # while (*str)

   1013c:  lui  a5,0x40000  # a5 = tx2
   10140:  sw   a2,8(a5)    # send a2 to tx2
   10144:  li   a0,0        # set return value
   10148:  addi sp,sp,48    # reset stack pointer
   1014c:  ret              # return 0

00010150 <__BSS_END__-0x104c>:
   10150:  00000009  #   9
   10154:  0000001c  #  28
   10158:  0000003f  #  63
   1015c:  00000058  #  88
   10160:  00000034  #  52
   10164:  00000009  #   9
   10168:  0000004b  #  75
   1016c:  00000006  #   6
   10170:  0000001a  #  26
   10174:  00000007  #   7
   10178:  54        # 'T'
   10179:  68        # 'h'
   1017a:  65        # 'e'
   1017b:  20        # ' '
   1017c:  6c        # 'l'
   1017d:  61        # 'a'
   1017e:  72        # 'r'
   1017f:  67        # 'g'
   10180:  65        # 'e'
   10181:  73        # 's'
   10182:  74        # 't'
   10183:  20        # ' '
   10184:  6e        # 'n'
   10185:  75        # 'u'
   10186:  6d        # 'm'
   10187:  62        # 'b'
   10188:  65        # 'e'
   10189:  72        # 'r'
   1018a:  20        # ' '
   1018b:  69        # 'i'
   1018c:  6e        # 'n'
   1018d:  20        # ' '
   1018e:  74        # 't'
   1018f:  68        # 'h'
   10190:  65        # 'e'
   10191:  20        # ' '
   10192:  61        # 'a'
   10193:  72        # 'r'
   10194:  72        # 'r'
   10195:  61        # 'a'
   10196:  79        # 'y'
   10197:  20        # ' '
   10198:  69        # 'i'
   10199:  73        # 's'
   1019a:  20        # ' '
   1019b:  00        # '\0'

##### Original dump file as below #####

linear-search:     file format elf32-littleriscv


Disassembly of section .text:

00010054 <_start>:
   10054:	000107b7          	lui	a5,0x10
   10058:	15078793          	addi	a5,a5,336 # 10150 <_start+0xfc>
   1005c:	0007a703          	lw	a4,0(a5)
   10060:	0087af03          	lw	t5,8(a5)
   10064:	00c7ae83          	lw	t4,12(a5)
   10068:	0107ae03          	lw	t3,16(a5)
   1006c:	0147a303          	lw	t1,20(a5)
   10070:	0187a883          	lw	a7,24(a5)
   10074:	01c7a803          	lw	a6,28(a5)
   10078:	0207a503          	lw	a0,32(a5)
   1007c:	0247a583          	lw	a1,36(a5)
   10080:	fff74613          	not	a2,a4
   10084:	0047a683          	lw	a3,4(a5)
   10088:	fd010113          	addi	sp,sp,-48
   1008c:	41f65793          	srai	a5,a2,0x1f
   10090:	01e12823          	sw	t5,16(sp)
   10094:	01d12a23          	sw	t4,20(sp)
   10098:	01c12c23          	sw	t3,24(sp)
   1009c:	00612e23          	sw	t1,28(sp)
   100a0:	03112023          	sw	a7,32(sp)
   100a4:	03012223          	sw	a6,36(sp)
   100a8:	02a12423          	sw	a0,40(sp)
   100ac:	02b12623          	sw	a1,44(sp)
   100b0:	00f77733          	and	a4,a4,a5
   100b4:	00e6d463          	bge	a3,a4,100bc <_start+0x68>
   100b8:	00070693          	mv	a3,a4
   100bc:	01012783          	lw	a5,16(sp)
   100c0:	00d7d463          	bge	a5,a3,100c8 <_start+0x74>
   100c4:	00068793          	mv	a5,a3
   100c8:	01412703          	lw	a4,20(sp)
   100cc:	00f75463          	bge	a4,a5,100d4 <_start+0x80>
   100d0:	00078713          	mv	a4,a5
   100d4:	01812783          	lw	a5,24(sp)
   100d8:	00e7d463          	bge	a5,a4,100e0 <_start+0x8c>
   100dc:	00070793          	mv	a5,a4
   100e0:	01c12703          	lw	a4,28(sp)
   100e4:	00f75463          	bge	a4,a5,100ec <_start+0x98>
   100e8:	00078713          	mv	a4,a5
   100ec:	02012783          	lw	a5,32(sp)
   100f0:	00e7d463          	bge	a5,a4,100f8 <_start+0xa4>
   100f4:	00070793          	mv	a5,a4
   100f8:	02412703          	lw	a4,36(sp)
   100fc:	00f75463          	bge	a4,a5,10104 <_start+0xb0>
   10100:	00078713          	mv	a4,a5
   10104:	02812783          	lw	a5,40(sp)
   10108:	00e7d463          	bge	a5,a4,10110 <_start+0xbc>
   1010c:	00070793          	mv	a5,a4
   10110:	02c12603          	lw	a2,44(sp)
   10114:	00f65463          	bge	a2,a5,1011c <_start+0xc8>
   10118:	00078613          	mv	a2,a5
   1011c:	000107b7          	lui	a5,0x10
   10120:	17878793          	addi	a5,a5,376 # 10178 <_start+0x124>
   10124:	05400713          	li	a4,84
   10128:	400026b7          	lui	a3,0x40002
   1012c:	00e68023          	sb	a4,0(a3) # 40002000 <__global_pointer$+0x3fff0664>
   10130:	00178793          	addi	a5,a5,1
   10134:	0007c703          	lbu	a4,0(a5)
   10138:	fe071ae3          	bnez	a4,1012c <_start+0xd8>
   1013c:	400007b7          	lui	a5,0x40000
   10140:	00c7a423          	sw	a2,8(a5) # 40000008 <__global_pointer$+0x3ffee66c>
   10144:	00000513          	li	a0,0
   10148:	03010113          	addi	sp,sp,48
   1014c:	00008067          	ret

Disassembly of section .rodata:

00010150 <__BSS_END__-0x104c>:
   10150:	0009                	c.nop	2
   10152:	0000                	unimp
   10154:	001c                	0x1c
   10156:	0000                	unimp
   10158:	0000003f 00000058 	0x580000003f
   10160:	0034                	addi	a3,sp,8
   10162:	0000                	unimp
   10164:	0009                	c.nop	2
   10166:	0000                	unimp
   10168:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
   1016c:	0006                	c.slli	zero,0x1
   1016e:	0000                	unimp
   10170:	001a                	c.slli	zero,0x6
   10172:	0000                	unimp
   10174:	00000007          	0x7
   10178:	6854                	flw	fa3,20(s0)
   1017a:	2065                	jal	10222 <_start+0x1ce>
   1017c:	616c                	flw	fa1,68(a0)
   1017e:	6772                	flw	fa4,28(sp)
   10180:	7365                	lui	t1,0xffff9
   10182:	2074                	fld	fa3,192(s0)
   10184:	756e                	flw	fa0,248(sp)
   10186:	626d                	lui	tp,0x1b
   10188:	7265                	lui	tp,0xffff9
   1018a:	6920                	flw	fs0,80(a0)
   1018c:	206e                	fld	ft0,216(sp)
   1018e:	6874                	flw	fa3,84(s0)
   10190:	2065                	jal	10238 <_start+0x1e4>
   10192:	7261                	lui	tp,0xffff8
   10194:	6172                	flw	ft2,28(sp)
   10196:	2079                	jal	10224 <_start+0x1d0>
   10198:	7369                	lui	t1,0xffffa
   1019a:	0020                	addi	s0,sp,8

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	5078                	lw	a4,100(s0)
   8:	6361                	lui	t1,0x18
   a:	4e47206b          	0x4e47206b
   e:	2055                	jal	b2 <_start-0xffa2>
  10:	4952                	lw	s2,20(sp)
  12:	562d4353          	0x562d4353
  16:	4520                	lw	s0,72(a0)
  18:	626d                	lui	tp,0x1b
  1a:	6465                	lui	s0,0x19
  1c:	6564                	flw	fs1,76(a0)
  1e:	2064                	fld	fs1,192(s0)
  20:	2c434347          	0x2c434347
  24:	3620                	fld	fs0,104(a2)
  26:	2d34                	fld	fa3,88(a0)
  28:	6962                	flw	fs2,24(sp)
  2a:	2974                	fld	fa3,208(a0)
  2c:	3820                	fld	fs0,112(s0)
  2e:	322e                	fld	ft4,232(sp)
  30:	302e                	fld	ft0,232(sp)
	...
