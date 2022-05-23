MOV DPTR, #seg7
endlos:
MOV A, P1
MOV B, #100
DIV AB
PUSH ACC ;Accu in Stack
MOV A,B
MOV B, #10
DIV AB
MOVC A, @A+DPTR
MOV P2,A
MOV A,B
MOVC A, @A+DPTR
MOV P0, A
POP ACC
JZ null
SETB P0.0
DEC A
JZ null
SETB P2.0

null:
MOV R0, #255
warte:
NOP
NOP
DJNZ R0,warte
LJMP endlos

seg7:
db 01111110b ;0
db 00010010b ;1
db 10111100b ;2
db 10110110b ;3
db 11010010b ;4
db 11100110b ;5
db 11101110b ;6
db 00110010b ;7
db 11111110b ;8
db 11110110b ;9
db 11111010b ;A
db 11001110b ;B
db 01101100b ;C
db 10011110b ;D
db 11101100b ;E
db 11101000b ;F
	


END