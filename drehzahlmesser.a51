LJMP haupt
org 000Bh
LJMP ISR_EX0
org 0003h
LJMP ISR_ET0

haupt:
MOV DPTR,#tab

MOV TL0,#F0h
MOV TH0,#60h
MOV TMOD, #00000010b
MOV TCON, #00010001b
MOV IE, #10000001b


endlos:
LJMP endlos

Vergleich:

Ausgabe:
MOV R0, A ;Wertübergabe
MOVC A,@A+DPTR
MOV P2, A ;Anzeige Seg7

ISR_EX0: 
MOV TCON, #00000001b
MOV TL0,#20
MOV TH0,#30
MOV TMOD, #00000001b
MOV TCON, #00010000b
MOV IE, #10000010b
LCall Rechne
RETI

Rechne:
CPL A

ISR_ET0:
INC R1
RETI

END