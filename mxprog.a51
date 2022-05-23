LJMP haupt
org 0003h
LJMP ISR_EX0

org 0013h;SOUND
LJMP ISR_T1

haupt:
MOV DPTR, #tab

MOV TL0,#221
MOV TH0,#221
MOV TMOD, #00000010b
MOV TCON, #00010001b
MOV IE, #10000001b
CLR A
MOV B, #110b
MOV R2, #0



endlos:
LJMP endlos


ISR_EX0:
MOV TCON, #00000001b
MOV R2, #0
MOV R0, #0
MOV A, TL0
CPL A
DIV AB
INC A
INC B
MOV R2, B
MOV R0, A
MOVC A,@A+DPTR
MOV P2, A ;Seg7
MOV A, R2
MOVC A,@A+DPTR
MOV P0, A ;Seg7
;VERGLEICHE
CJNE R0, #2, nicht
CJNE R2, #1, verloren
LJMP gewonnen

;TON
ISR_T1:
CPL P2.0
CLR TF1
LCall Reset
RETI


nicht:
CJNE R0, #1,verloren
CJNE R2, #2, verloren
LJMP gewonnen

verloren:
;SetzeVerliererTon
MOV TL1, #6d
MOV TH1, #95d
MOV TMOD, #00100000b
MOV TCON, #01000000b
MOV IE, #0001000b

gewonnen:
;SetzeSigerTon
CLR P2.0
MOV TL1, #6d
MOV TH1, #6d
MOV TMOD, #00100000b
MOV TCON, #01000000b
MOV IE, #00001000b
INC R3 ;Kontrollausgabe Siege
RET
 
Reset:
inc R7 ;Kontrollausgabe Spiele
CLR A
MOV B, #110b
;MOV R2, #0
MOV TCON, #00010001b
MOV IE, #10000001b
RETI



tab:
DB 01111110b,00010010b,10111100b,10110110b,11010010b
DB 11100110b,11101110b,00110010b,11111110b,11110110b
	
END