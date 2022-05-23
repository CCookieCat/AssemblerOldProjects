MOV R0, #0
MOV R1, #0
MOV R2, #0

loop1:
JNB P3.3, half
MOV DPTR, #tableFull
LJMP checkDirection
half:
MOV DPTR, #tableHalf
checkDirection:
JB P3.2, backward
INC R0
LJMP checkMax
backward:
DEC R0

checkMax:
Anl 00, #7 ;check R0=7 & reset

MOV A,R0
MOVC A,@A + DPTR
MOV P2, A

;Fast or slow
;JNB P1.0, slow
MOV R1, P1

LCALL wait

LJMP loop1


wait:
;MOV R1, #255
wait1:
MOV R2, #255
wait2:
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
DJNZ R2, wait2
DJNZ R1, wait1
RET




tableFull:
db 9
db 10
db 6
db 5
db 9
db 10
db 6
db 5

tableHalf:
db 1001b
db 1000b
db 1010b
db 0010b
db 0110b
db 0100b
db 0101b
db 0001b

END