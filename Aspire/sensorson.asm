$MOD842                     ; Use 8052&ADuC832 predefined symbols

			MOV A,#0EH
			ACALL KOMUT
			ACALL DELAY
			MOV A,#01H
			ACALL KOMUT
			ACALL DELAY
			MOV A,#06H
			ACALL KOMUT
			ACALL DELAY
			MOV A,#38H
			ACALL KOMUT
			ACALL DELAY
LED     EQU     P3.4            ; P3.4 drives red LED on eval board
CHAN    EQU     0               ; convert this ADC input channel..
                                ; ..chan values can be 0 thru 6
;____________________________________________________________________
                                                  ; BEGINNING OF CODE
CSEG

;ORG 0000H

        JMP     MAIN            ; jump to main program
;____________________________________________________________________


;====================================================================
                                                       ; MAIN PROGRAM
ORG 004BH

MAIN:

; Set up UART
	MOV	T3CON,#083H
	MOV	T3FD,#02DH
    MOV     SCON,#52h

; PRECONFIGURE...

        MOV     ADCCON1,#0CCh   ; power up ADC
        MOV     ADCCON2,#CHAN   ; select channel to convert

; PERFORM REPEATED SINGLE CONVERSIONS...

ADC_OKU:

		ACALL    DLY00
		SETB    SCONV 				; ADC ISR is called upon completion
		JNB     ADCI,$
		MOV A,#01H

		ACALL KOMUT
		ACALL DELAY
		MOV A,#'A'
    		CALL DATAW
   		 CALL DELAY
    		MOV A,#'D'
    		CALL DATAW
    		CALL DELAY
   		MOV A,#'C'
    		CALL DATAW
    		CALL DELAY
    		MOV A,#':'
    		CALL DATAW
    		CALL DELAY
		MOV     A,ADCDATAH
		PUSH ACC
		ACALL    SENDVAL
		MOV     A,ADCDATAL
		ACALL    SENDVAL
	       ;	MOV	A,#10
               ;	ACALL 	SENDCHAR
	       ;	MOV	A,#13
		;ACALL	SENDCHAR
		MOV R2,#03H
	SAY:
		POP ACC


	DAAA:

		DEC A

		JZ BESINCIARALIK

		DJNZ R2,DAAA




		MOV R2 ,#03H

	DBBB:
		DEC A

		JZ DORDUNCUARALIK
		DJNZ R2,DBBB


		MOV R2,#03H
DCCC:

	DEC A

	JZ UCUNCUARALIK
	DJNZ R2,DCCC




	MOV R2 ,#03H

DDDD:
	DEC A

	JZ IKINCIARALIK

	DJNZ R2,DDDD


ILKARALIK:
    JMP ILKARALIK1
IKINCIARALIK:
    JMP IKINCIARALIK1
UCUNCUARALIK:
    JMP UCUNCUARALIK1
DORDUNCUARALIK:
    JMP DORDUNCUARALIK1
BESINCIARALIK:
    JMP BESINCIARALIK1

ILKARALIK1:
    MOV A,#0C0H
    ACALL KOMUT
    ACALL DELAY
    CLR P3.7
    CLR P3.6
    CLR P3.5
    CLR P3.4
    CLR P3.3
    CLR P3.2
    SETB P3.7

    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'E'
    CALL DATAW
    CALL DELAY
    MOV A,#'M'
    CALL DATAW
    CALL DELAY
    MOV A,#'O'
    CALL DATAW
    CALL DELAY
    MOV A,#'R'
    CALL DATAW
    CALL DELAY
    MOV A,#'A'
    CALL DATAW
    CALL DELAY
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'I'
    CALL DATAW
    CALL DELAY
    MOV A,#':'
    CALL DATAW
    CALL DELAY
    MOV A,#'½'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    MOV A,#'-'
    CALL DATAW
    CALL DELAY
    MOV A,#'2'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    ACALL    DLY00
     ACALL    DLY00
     ACALL    DLY00
    CLR C
    JMP ADC_OKU
IKINCIARALIK1:
MOV A,#0C0H
    ACALL KOMUT
    ACALL DELAY
    CLR P3.7
    CLR P3.6
    CLR P3.5
    CLR P3.4
    CLR P3.3
    CLR P3.2
    SETB P3.7
    SETB P3.6
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'E'
    CALL DATAW
    CALL DELAY
    MOV A,#'M'
    CALL DATAW
    CALL DELAY
    MOV A,#'O'
    CALL DATAW
    CALL DELAY
    MOV A,#'R'
    CALL DATAW
    CALL DELAY
    MOV A,#'A'
    CALL DATAW
    CALL DELAY
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'I'
    CALL DATAW
    CALL DELAY
    MOV A,#':'
    CALL DATAW
    CALL DELAY
    MOV A,#'½'
    CALL DATAW
    CALL DELAY
    MOV A,#'2'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    MOV A,#'-'
    CALL DATAW
    CALL DELAY
    MOV A,#'4'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    CLR C
    JMP ADC_OKU
UCUNCUARALIK1:
MOV A,#0C0H
    ACALL KOMUT
    ACALL DELAY
    CLR P3.7
    CLR P3.6
    CLR P3.5
    CLR P3.4
    CLR P3.3
    CLR P3.2
    SETB P3.7
    SETB P3.6
    SETB P3.5
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'E'
    CALL DATAW
    CALL DELAY
    MOV A,#'M'
    CALL DATAW
    CALL DELAY
    MOV A,#'O'
    CALL DATAW
    CALL DELAY
    MOV A,#'R'
    CALL DATAW
    CALL DELAY
    MOV A,#'A'
    CALL DATAW
    CALL DELAY
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'I'
    CALL DATAW
    CALL DELAY
    MOV A,#':'
    CALL DATAW
    CALL DELAY
    MOV A,#'½'
    CALL DATAW
    CALL DELAY
    MOV A,#'4'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    MOV A,#'-'
    CALL DATAW
    CALL DELAY
    MOV A,#'6'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    CLR C
    JMP ADC_OKU
DORDUNCUARALIK1:
MOV A,#0C0H
    ACALL KOMUT
    ACALL DELAY
    CLR P3.7
    CLR P3.6
    CLR P3.5
    CLR P3.4
    CLR P3.3
    CLR P3.2
    SETB P3.7
    SETB P3.6
    SETB P3.5
    SETB P3.4
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'E'
    CALL DATAW
    CALL DELAY
    MOV A,#'M'
    CALL DATAW
    CALL DELAY
    MOV A,#'O'
    CALL DATAW
    CALL DELAY
    MOV A,#'R'
    CALL DATAW
    CALL DELAY
    MOV A,#'A'
    CALL DATAW
    CALL DELAY
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'I'
    CALL DATAW
    CALL DELAY
    MOV A,#':'
    CALL DATAW
    CALL DELAY
    MOV A,#'½'
    CALL DATAW
    CALL DELAY
    MOV A,#'6'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    MOV A,#'-'
    CALL DATAW
    CALL DELAY
    MOV A,#'8'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    CLR C
    JMP ADC_OKU
BESINCIARALIK1:

    MOV A,#0C0H
    ACALL KOMUT
    ACALL DELAY
    CLR P3.7
    CLR P3.6
    CLR P3.5
    CLR P3.4
    CLR P3.3
    CLR P3.2
    SETB P3.7
    SETB P3.6
    SETB P3.5
    SETB P3.4
    SETB P3.3
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'E'
    CALL DATAW
    CALL DELAY
    MOV A,#'M'
    CALL DATAW
    CALL DELAY
    MOV A,#'O'
    CALL DATAW
    CALL DELAY
    MOV A,#'R'
    CALL DATAW
    CALL DELAY
    MOV A,#'A'
    CALL DATAW
    CALL DELAY
    MOV A,#'N'
    CALL DATAW
    CALL DELAY
    MOV A,#'I'
    CALL DATAW
    CALL DELAY
    MOV A,#':'
    CALL DATAW
    CALL DELAY
    MOV A,#'½'
    CALL DATAW
    CALL DELAY
    MOV A,#'8'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    MOV A,#'-'
    CALL DATAW
    CALL DELAY
    MOV A,#'1'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    MOV A,#'0'
    CALL DATAW
    CALL DELAY
    CLR C
    JMP ADC_OKU


	DELAY: MOV R1,#60
		DELAY2:	MOV R0,#255
			DJNZ R0,$
			DJNZ R1,DELAY2
			RET
		DLY00: MOV R2, #50
		DLY11: MOV R1,#60
		DLY22:	MOV R0,#255
			DJNZ R0,$
			DJNZ R1,DLY22
			DJNZ R2,DLY11
			RET
    KOMUT:
    MOV P0,A
    CLR P2.0  ;RS
    CLR P2.1  ;R/W
    SETB P2.2 ;E
    ACALL DELAY
    CLR P2.2
    RET
DATAW:
    MOV P0,A
    SETB P2.0  ;RS
    CLR P2.1  ;R/W
    SETB P2.2 ;E
    ACALL DELAY
    CLR P2.2
    RET
     SENDCHAR:
			MOV     SBUF,A
			JNB     TI,$
			CLR     TI
			ACALL DATAW
			RET
	SENDVAL:
			PUSH    ACC
			SWAP    A
			ACALL    HEX2ASCII
			ACALL    SENDCHAR        ; send high nibble
			POP     ACC
			PUSH    ACC
			ACALL    HEX2ASCII
			ACALL    SENDCHAR        ; send low nibble
			POP     ACC
			RET
	HEX2ASCII:
			ANL     A,#00Fh
			CJNE    A,#00Ah,$+3
			JC      IO0030
			ADD     A,#007h
	IO0030: ADD     A,#'0'
			RET

END



