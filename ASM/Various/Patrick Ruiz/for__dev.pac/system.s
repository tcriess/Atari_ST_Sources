;*** G�n�ration de la Biblioth�que ***

 OUTPUT D:\MC68030.882\DEVPAC.HIS\SYSTEM\SYSTEM.GS

_P	MACRO
	SECTION TEXT
	ENDM

_D	MACRO
	SECTION DATA
	EVEN
	ENDM

_M	MACRO
	SECTION BSS
	EVEN
	ENDM

PW	MACRO p
	MOVE \1,-(SP)
	ENDM

PL	MACRO p
	MOVE.L \1,-(SP)
	ENDM

TOSTable MACRO
	_M
BasePage	DS.L 1
CommandLine	DS.L 1
NotePad 	DS.L 16
		DS.L 256
Stack		DS.L 1
	_P
	ENDM

GEMTable	MACRO
		TOSTable
	_D
VDIAddressArray DC.L CONTRL,INTIN,PTSIN,INTOUT,PTSOUT
AESAddressArray DC.L CONTRL,GLOBAL,INTIN,INTOUT,ADDRIN,ADDROUT
CONTRL		DS.W 12
	_M
GLOBAL: 	DS.W 3
		DS.L 6
INTIN:		DS.W 128
INTOUT: 	DS.W 128
ADDRIN: 	DS.L 2
ADDROUT:	DS.L 1
PTSIN:		DS.W 64*2
PTSOUT: 	DS.W 12*2
ScreenWidth		DS.W 1
ScreenHeight		DS.W 1
ScreenColor		DS.W 1 ;(0:True Color)
ScreenCellWidth 	DS.W 1
ScreenCellHeight	DS.W 1
ScreenBoxWidth		DS.W 1
ScreenBoxHeight 	DS.W 1
	_P
	ENDM

 INCLUDE   CHIPS.S
 INCLUDE SYS_VAR.S
 INCLUDE   XBIOS.S
 INCLUDE    BIOS.S
 INCLUDE     TOS.S
 INCLUDE GEM_VDI.S
 INCLUDE GEM_AES.S

TOS_APP MACRO
	TOSTable
	MOVEA.L 4(SP),A3
	MOVE.L	A3,BasePage
	LEA	128(A3),A0
	MOVE.L	A0,CommandLine
	LEA	Stack,SP
	MOVE.L	#256,D3
	ADD.L	12(A3),D3
	ADD.L	20(A3),D3
	ADD.L	28(A3),D3
	MEMO_SHRINK A3,D3
	BRA.S	i0i
o0o	PROG_END
i0i
	ENDM

GEM_APP MACRO
	GEMTable
	MOVEA.L 4(SP),A3
	MOVE.L	A3,BasePage
	LEA	128(A3),A0
	MOVE.L	A0,CommandLine
	LEA	Stack,SP
	MOVE.L	#256,D3
	ADD.L	12(A3),D3
	ADD.L	20(A3),D3
	ADD.L	28(A3),D3
	MEMO_SHRINK A3,D3
	APPL_INIT
	GRAF_HANDLE
	MOVE	D0,CONTRL+12
	GRPH_OPEN
	BRA.S	i0i
o0o	GRPH_CLOSE
	APPL_EXIT
	PROG_END
i0i
	ENDM

GEM_ACC MACRO
	GEMTable
	LEA	Stack,SP
	APPL_INIT
	GRAF_HANDLE
	MOVE	D0,CONTRL+12
	GRPH_OPEN
	ENDM

GEM_APP_ACC	MACRO
	GEMTable
	_M
.app	DS.B 1
	_P
	LEA	GEM_APP_ACC(PC),A0
	LEA	-256(A0),A3
	MOVE.L	A3,BasePage
	LEA	128(A3),A0
	MOVE.L	A0,CommandLine
	LEA	Stack,SP
	MOVE.L	#256,D3
	ADD.L	12(A3),D3
	ADD.L	20(A3),D3
	ADD.L	28(A3),D3
	TST.L	36(A3)
	SNE	.app
	BEQ.S	.L2
	MEMO_SHRINK A3,D3
.L2	APPL_INIT
	GRAF_HANDLE
	MOVE	D0,CONTRL+12
	GRPH_OPEN
	BRA.S	i0i
o0o	GRPH_CLOSE
	APPL_EXIT
	PROG_END
i0i
	ENDM

False	=0
True	=-1
KB	=1024

NULL	=0
CR	=10
LF	=13
ESC	=27