endlos:
MOV DPTR, #spalte1
LCALL spalte
MOV P0, #0Fh
LCALL warte
MOV DPTR, #spalte2
LCALL spalte
MOV P0, #17h
LCALL warte
MOV DPTR, #spalte3
LCALL spalte
MOV P0, #1Bh
LCALL warte
MOV DPTR, #spalte4
LCALL spalte
MOV P0, #1Dh
LCALL warte
MOV DPTR, #spalte5
LCALL spalte
MOV P0, #1Eh
LCALL warte

LJMP endlos



warte:
MOV R0, #255
schleife:
NOP
NOP
DJNZ R0, schleife
RET

spalte:
MOV A,P1
SUBB A, #65
MOVC A, @A+DPTR
MOV P0, 1fh
MOV P2, A
RET

;----a----b----c----d----e----f----g----h----i----j----k----l----m----n----o----p----q----r----s----t----u----v----w----x----y----z
spalte1:
db 3Fh, 7Fh, 3Eh, 7Fh, 7Fh, 7Fh, 7Fh, 7Fh, 00h, 42h, 7Fh, 7Fh, 7Fh, 7Fh, 3Eh, 7Fh, 3Eh, 7Fh, 31h, 40h, 7Eh, 78h, 7Ch, 63h, 40h, 43h
	
spalte2:
db 48h, 49h, 41h, 41h, 49h, 48h, 41h, 08h, 00h, 41h, 08h, 01h, 20h, 30h, 41h, 48h, 41h, 48h, 49h, 40h, 01h, 06h, 03h, 14h, 20h, 45h 

spalte3:
db 48h, 49h, 41h, 41h, 49h, 48h, 41h, 08h, 7Fh, 41h, 14h, 01h, 10h, 1Ch, 41h, 48h, 45h, 4Ch, 49h, 7Fh, 01h, 01h, 0Dh, 08h, 1Fh, 49h
	
spalte4:
db 48h, 49h, 41h, 41h, 49h, 48h, 49h, 08h, 00h, 41h, 22h, 01h, 20h, 06h, 41h, 48h, 43h, 4Ah, 49h, 40h, 01h, 06h, 03h, 14h, 20h, 51h
	
spalte5:
db 3Fh, 36h, 22h, 3Eh, 41h, 40h, 4Fh, 7Fh, 00h, 7Eh, 41h, 01h, 7Fh, 7Fh, 3Eh, 30h, 3Fh, 31h, 43h, 40h, 7Eh, 78h, 7Ch, 63h, 40h, 61h
	
END