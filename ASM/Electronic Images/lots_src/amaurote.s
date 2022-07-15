; AMAUROTE MUSIC (Converted from Speccy!)

letsgo		CLR.L	-(SP)		;Enter Supervisor & Save sp
		MOVE.W	#$20,-(SP)
		TRAP	#1
		LEA	6(SP),SP
		MOVEQ	#1,D0
		BSR	R0_CHANGE
.vblp		MOVE.W	#37,-(SP)
		TRAP	#14
		ADDQ.L	#2,SP
		BSR	R0_PLAY
		MOVE.W	#2,-(SP)
		MOVE.W	#1,-(SP)
		TRAP	#13
		ADD.L	#4,SP
		TST.L	D0
		BEQ	.vblp
		CLR.W	-(SP)
		TRAP	#1

R0_PLAY		BRA	R0_49335
R0_CHANGE	;D0=0 TO 2
R0_49152	MULU	#14,D0
		MOVE.L	#R0_50402,A0
		ADD.L	D0,A0
		MOVE.W	(A0)+,R0_49379
		MOVE.L	#R0_49238,A1
		MOVE.L	#2,D0
R0_49183	MOVE.L	(A0)+,A2
		MOVE.W	#1,32(A1)
		MOVE.W	#0,(A1)
		MOVE.W	#0,58(A1)
		MOVE.L	A2,6(A1)
		MOVE.L	(A2),A2
		MOVE.L	#4,10(A1)
		MOVE.L	A2,2(A1)
		ADD.L	#64,A1
		DBRA	D0,R0_49183
		MOVE.W	#0,R0_49954
		MOVE.W	#1,R0_49334
		MOVE.W	#1,R0_50401
		RTS

R0_49954	DC.W	0

R0_49238	DC.W	0
	DC.L	R0_50650
	DC.L	R0_50458
	DC.W	2,0,0,0
	DC.L	R0_50345
	DC.L	R0_50345+1
	DC.W	0,0,0,1,2,72,15,0,17,1,8,8,15,2,1,1,0,0,9
R0_49270	DC.W	0
	DC.L	R0_50929
	DC.L	R0_50522
	DC.W	2,0,0,0
	DC.L	R0_50345
	DC.L	R0_50345+1
	DC.W	0,0,0,1,2,75,15,0,17,1,8,8,15,2,1,1,0,0,18
R0_49302	DC.W	0
	DC.L	R0_51140
	DC.L	R0_50586
	DC.W	2,0,0,0
	DC.L	R0_50345
	DC.L	R0_50345+1
	DC.W	0,0,0,1,2,84,15,0,18,2,4,4,15,2,1,1,0,0,36
R0_49334	DC.W	0
	;
R0_49343	DC.W	51
R0_49379	DC.W	02
R0_49420	DC.W	051
	;
	;
R0_49335	CLR.L	D0
	CLR.L	D1
	CLR.L	D2
	CLR.L	D3
	CLR.L	D4
	CLR.L	D5
	CLR.L	D6
	CLR.L	D7
	MOVE.W	R0_50401,D0
	AND.W	D0,D0
	BEQ	R0_49424
R0_49342	MOVE.W	R0_49343,R0_49420
	SUB.W	#1,R0_49334
	BNE	R0_49380
	MOVE.W	R0_49334,D0
	MOVE.L	#R0_49238,A0
	JSR	R0_49720
	MOVE.L	#R0_49270,A0
	JSR	R0_49720
	MOVE.L	#R0_49302,A0
	JSR	R0_49720
R0_49378	MOVE.W	R0_49379,R0_49334
R0_49380	MOVE.L	#R0_49238,A0
	JSR	R0_49878
	MOVE.W	D3,R0_50149
	MOVE.W	D1,R0_50150
	MOVE.W	D2,R0_50157
	MOVE.L	#R0_49270,A0
	JSR	R0_49878
	MOVE.W	D3,R0_50151
	MOVE.W	D1,R0_50152
	MOVE.W	D2,R0_50158
	MOVE.L	#R0_49302,A0
	JSR	R0_49878
	MOVE.W	D3,R0_50153
	MOVE.W	D1,R0_50154
	MOVE.W	D2,R0_50159
R0_49419	MOVE.W	#51,R0_50155
R0_49424	MOVE.W	R0_50401,D3
	AND.W	D3,D3
	BNE	R0_49449
	RTS
R0_49431	MOVE.W	#0,R0_50401
	JSR	R0_49479
	MOVE.W	#0,R0_50157
	MOVE.W	#0,R0_50158
	MOVE.W	#0,R0_50159
	RTS
R0_49449	MOVE.B	#0,$FFFF8800.W
	MOVE.B	R0_50149+1,$FFFF8802.W
	MOVE.B	#1,$FFFF8800.W
	MOVE.B	R0_50150+1,$FFFF8802.W
	MOVE.B	#2,$FFFF8800.W
	MOVE.B	R0_50151+1,$FFFF8802.W
	MOVE.B	#3,$FFFF8800.W
	MOVE.B	R0_50152+1,$FFFF8802.W
	MOVE.B	#4,$FFFF8800.W
	MOVE.B	R0_50153+1,$FFFF8802.W
	MOVE.B	#5,$FFFF8800.W
	MOVE.B	R0_50154+1,$FFFF8802.W
	MOVE.B	#6,$FFFF8800.W
	MOVE.B	R0_50155+1,$FFFF8802.W
	MOVE.B	#7,$FFFF8800.W
	MOVE.B	R0_50156+1,D0
	OR.B	#%11000000,D0
	MOVE.B	D0,$FFFF8802.W
	MOVE.B	#8,$FFFF8800.W
	MOVE.B	R0_50157+1,$FFFF8802.W
	MOVE.B	#9,$FFFF8800.W
	MOVE.B	R0_50158+1,$FFFF8802.W
	MOVE.B	#10,$FFFF8800.W
	MOVE.B	R0_50159+1,$FFFF8802.W
	MOVE.B	#11,$FFFF8800.W
	MOVE.B	R0_50160+1,$FFFF8802.W
	MOVE.B	#12,$FFFF8800.W
	MOVE.B	R0_50161+1,$FFFF8802.W
	RTS
	;
	;
	;
;R0_49469	LD BC,65533
;	OUT (C),D
;	LD B,191
;	OUT (C),E
;	RET
R0_49479	MOVE.B	#8,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#9,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#10,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#0,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#1,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#2,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#3,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#4,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#5,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#6,$FFFF8800.W
	MOVE.B	#0,$FFFF8802.W
	MOVE.B	#7,$FFFF8800.W
	MOVE.B	#255,$FFFF8802.W
	RTS
	;
	;
	;
R0_49509	DC.L 	R0_49711
	DC.L 	R0_49688
	DC.L 	R0_49693
	DC.L 	R0_49699
	DC.L 	R0_49634
	DC.L 	R0_49682
	DC.L 	R0_49678
	DC.L 	R0_49532
	DC.L 	R0_49663
	DC.L 	R0_49656
	DC.L 	R0_49598
	DC.L 	R0_49577
	DC.L 	R0_49618
	DC.L 	R0_49705
	DC.L 	R0_49524
R0_49524	MOVE.W	#0,R0_50401
	ADD.L	#4,SP
	BRA	R0_49479
R0_50122	DC.W	56
R0_49532	MOVE.L	10(A0),D4
	MOVE.L	6(A0),A1
	ADD.L	D4,A1
	ADD.L	#4,D4
	MOVE.L	(A1),A2
	CMP.L	#0,A2
	BNE	R0_49566
	MOVE.L	6(A0),A1
	MOVE.L	#4,D4
	MOVE.L	(A1),A2
R0_49566	MOVE.L	D4,10(A0)
	CLR.L	D0
	BRA	R0_49734
R0_49577	MOVE.W	62(A0),D2
	MOVE.W	D2,D5
	AND.W	#7,D2
	MOVE.W	R0_50122,D1
	EOR.W	D1,D2
	AND.W	D5,D2
	EOR.W	D1,D2
	MOVE.W	D2,R0_50122
	MOVE.W	#1,60(A0)
	BRA	R0_49734
R0_49598	MOVE.W	62(A0),D2
	MOVE.W	D2,D5
	AND.W	#56,D2
	MOVE.W	R0_50122,D1
	EOR.W	D1,D2
	AND.W	D5,D2
	EOR.W	D1,D2
	MOVE.W	D2,R0_50122
	MOVE.W	#0,60(A0)
	BRA	R0_49734
R0_49618	MOVE.W	62(A0),D2
	NOT.W	D2
	AND.W	R0_50122,D2
	MOVE.W	D2,R0_50122
	MOVE.W	#1,60(A0)
	BRA	R0_49734
R0_49634	CLR.L	D2
	MOVE.B	(A2)+,D2
	MOVE.W	#0,14(A0)
	MOVE.W	#0,16(A0)
	MOVE.W	D2,26(A0)
	BSET	#2,1(A0)
	MOVE.B	(A2)+,D2
	MOVE.W	D2,28(A0)
	BRA	R0_49734
R0_49656	MOVE.B	(A2)+,D2
	MOVE.W	D2,R0_49954
	BRA	R0_49734
R0_49663	MOVE.B	(A2)+,D2
	MOVE.W	D2,54(A0)
	MOVE.B	(A2)+,D2
	MOVE.W	D2,52(A0)
	MOVE.W	D2,56(A0)
	BRA	R0_49734
R0_49678	BSET	#7,1(A0)
R0_49682	BSET	#3,1(A0)
	BRA	R0_49734
R0_49688	MOVE.W	D0,58(A0)
	BRA	R0_49734
R0_49693	MOVE.W	#64,58(A0)
	BRA	R0_49734
R0_49699	MOVE.W	#192,58(A0)
	BRA	R0_49734
R0_49705	BSET	#1,1(A0)
	BRA	R0_49734
R0_49711	MOVE.W	#0,38(A0)
	BCLR	#5,1(A0)
	BRA	R0_49778
R0_49720	SUB.W	#1,32(A0)
	BNE	R0_49791
	MOVE.W	#0,(A0)
	MOVE.L	2(A0),A2
R0_49734	CLR.L	D2
	MOVE.B	(A2)+,D2
	AND.B	D2,D2
	BMI	R0_49808
	MOVE.W	D2,36(A0)
	BTST	#0,61(A0)
	BEQ	R0_49752
	MOVE.W	D2,R0_49343
R0_49752	MOVE.W	50(A0),D2
	MOVE.W	D2,38(A0)
	BSET	#5,1(A0)
	BSET	#6,1(A0)
	MOVE.W	40(A0),D2
	MOVE.W	D2,44(A0)
	MOVE.W	46(A0),D2
	MOVE.W	D2,48(A0)
R0_49778	MOVE.W	34(A0),D2
	MOVE.W	D2,32(A0)
	MOVE.L	A2,2(A0)
	RTS
R0_49791	MOVE.W	(A0),D2
	BTST	#3,D2
	BEQ	EXIT
	LSL.B	#1,D2
	BCC	R0_49804
	ADD.W	#1,36(A0)
EXIT	RTS
R0_49804	SUB.W	#1,36(A0)
	RTS
R0_49808	CMP.B	#192,D2
	BLT	R0_49870
	ADD.B	#32,D2
	BCS	R0_49843
	ADD.B	#16,D2
	BCS	R0_49849
	ADD.B	#16,D2
	MOVE.L	#R0_50330,A1
	ADD.L	D2,A1
	CLR.L	D2
	MOVE.B	(A1),D2
	ADD.L	D2,A1
	MOVE.L	A1,18(A0)
	MOVE.L	A1,22(A0)
	BRA	R0_49734
R0_49843	ADD.W	#1,D2
	MOVE.W	D2,34(A0)
	BRA	R0_49734
R0_49849	MOVE.W	D2,50(A0)
	MOVE.B	(A2)+,D2
	MOVE.W	D2,40(A0)
	MOVE.B	(A2)+,D2
	MOVE.W	D2,42(A0)
	MOVE.B	(A2)+,D2
	MOVE.W	D2,46(A0)
	BRA	R0_49734
R0_49870	MOVE.L	#R0_49509,A1
	AND.W	#127,D2
	ADD.L	D2,D2
	ADD.L	D2,D2
	ADD.L	D2,A1
	MOVE.L	(A1),A1
	JMP 	(A1)
R0_49878	MOVE.W	(A0),D5
	BTST	#5,D5
	BEQ	R0_49953
	MOVE.W	44(A0),D2
	SUB.W	#16,D2
	BCC	R0_49929
	BTST 	#6,D5
	BEQ	R0_49934
	ADD.B	39(A0),D2
	BCC	R0_49902
	SUBX.W	D2,D2
R0_49902	ADD.W	#16,D2
	MOVE.W	D2,38(A0)
	MOVE.W	48(A0),D2
	SUB.W	#16,D2
	BCC	R0_49924
	BCLR	#6,D5
	MOVE.W	42(A0),D2
	MOVE.W	D2,44(A0)
	BRA	R0_49953
R0_49924	MOVE.W	D2,48(A0)
	BRA	R0_49953
R0_49929	MOVE.W	D2,44(A0)
	BRA	R0_49953
R0_49934	NOT.W	D2
	SUB.W	#15,D2
	ADD.B	39(A0),D2
	BCS	R0_49943
	SUB.W	D2,D2
R0_49943	MOVE.W	D2,38(A0)
	SUB.W	#1,48(A0)
	BNE	R0_49953
	BCLR	#5,D5
R0_49953	MOVE.W	R0_49954,D2
	ADD.W	36(A0),D2
	MOVE.W	D2,D0
	MOVE.L	22(A0),A1
	CLR.L	D2
	MOVE.B	(A1),D2
	CMP.W 	#135,D2
	BLT	R0_49977
	MOVE.L	18(A0),A1
	MOVE.B	(A1),D2
R0_49977	ADD.L	#1,A1
	MOVE.L	A1,22(A0)
	ADD.W	D0,D2
	MOVE.L	#R0_50162-24,A1
	ADD.L	D2,D2
	ADD.L	D2,A1
	CLR.L	D6
	CLR.L	D7
	MOVE.B	(A1)+,D6
	MOVE.B	(A1),D7
	MOVE.W	58(A0),D3	
	BTST	#6,D3
	BEQ	R0_50075
	MOVE.L	D2,D1
	MOVE.W	52(A0),D0
	ADD.W	D0,D0
	MOVE.W	56(A0),D2
	BTST	#7,D3
	BEQ	R0_50020
	BTST	#0,D5
	BNE	R0_50050
R0_50020	BTST	#5,D3
	BNE	R0_50036
	SUB.W	54(A0),D2
	BCC	R0_50047
	BSET	#5,59(A0)
	SUB.W	D2,D2
	BRA	R0_50047
R0_50036	ADD.W	54(A0),D2
	CMP.W	D0,D2
	BLT	R0_50047
	BCLR	#5,59(A0)
	MOVE.W	D0,D2
R0_50047	MOVE.W	D2,56(A0)
R0_50050	EXG	D6,D3
	EXG	D7,D1
	DIVU.W	#2,D0
	SUB.W	D0,D2
	BCC	R0_50061
	MOVE.W	D2,D6
	MOVE.W	D7,D2
	MOVE.W	#0,D7
	MOVE.W	#255,D7
	BRA	R0_50063
R0_50061	MOVE.W	D2,D6
	MOVE.W	D7,D2
	MOVE.W	#0,D7
R0_50063	ADD.B	#160,D2
	BCS	R0_50073
R0_50065	ADD.B	D6,D6
	ADDX.B	D7,D7
	ADD.B	#24,D2
	BCC	R0_50065
R0_50073	ADD.B	D6,D3
	ADDX.B	D7,D1
	EXG	D1,D7
	EXG	D3,D6
R0_50075	MOVE.W	D5,D2
	EOR.W	#1,D2
	MOVE.W	D2,(A0)
	BTST	#2,D5
	BEQ	R0_50118
	MOVE.W	28(A0),D0
	SUB.W	#1,D0
	BNE	R0_50115
	MOVE.W	26(A0),D5
	BTST	#7,D5
	BEQ	R0_50098
	SUB.L	#1,D0
R0_50098	MOVE.L	14(A0),A1
	ADD.L	D5,A1
	MOVE.L	D0,-(SP)
	LSL.L	#8,D0
	ADD.L	D0,A1
	MOVE.L	(SP)+,D0
	MOVE.L	A1,14(A0)
	ADD.L	D6,A1
	MOVE.L	D7,-(SP)
	LSL.L	#8,D7
	ADD.L	D7,A1
	MOVE.L	(SP)+,D7
	MOVE.L	A1,D1
	MOVE.L	A1,D3
	AND.L	#$FF00,D1
	AND.L	#$FF,D3
	LSR.L	#8,D1
	EXG	D6,D3
	EXG	D7,D1
	BRA	R0_50118
R0_50115	MOVE.W	D0,28(A0)
R0_50118	NOT.B	D2
	AND.W	#03,D2
	BNE	R0_50135
R0_50121	MOVE.W	R0_49343,D2
	EOR.W	#8,D2
	MOVE.W	D2,R0_49420
	MOVE.W	#7,D2
	BRA	R0_50136
R0_50135	MOVE.W	R0_50122,D2
	BRA	R0_50136
R0_50136	MOVE.W	R0_50156,D1
R0_50138	EOR.W	D1,D2
	AND.W	62(A0),D2
	EOR.W	D1,D2
	MOVE.W	D2,R0_50156
	EXG	D6,D3
	EXG	D7,D1
	MOVE.W	38(A0),D2
	RTS

R0_50149	DC.W 	118
R0_50150	DC.W 	0
R0_50151	DC.W 	99
R0_50152	DC.W 	0
R0_50153	DC.W 	58
R0_50154	DC.W	0
R0_50155	DC.W 	51
R0_50156	DC.W 	56
R0_50157	DC.W 	15
R0_50158	DC.W 	15
R0_50159	DC.W 	15
R0_50160	DC.W 	0
R0_50161	DC.W 	0
R0_50162	DC.B 	248,14,16,14,96,13,128,12,216,11,40,11,136,10,0
R0_50177	DC.B 	9,96,9,224,8,88,8
	DC.B 	224,7,124,7,8,7,176,6,64,6,236,5,148,5
	DC.B 	68,5,248,4,176,4,112,4,44,4,240,3,190,3,132
	DC.B 	3,88,3,32,3,246,2,202,2,162,2,124,2
	DC.B 	88,2,56,2,22,2,248,1,223,1,194,1,172,1
	DC.B 	144,1,123,1,101,1,81,1,62,1,44,1,28,1
	DC.B 	11,1,252,0,239,0,225,0,214,0,200,0,189,0
	DC.B 	178,0,168,0,159,0,150,0,142,0,133,0,126,0
	DC.B 	119,0,112,0,107,0,100,0,94,0,89,0,84,0
	DC.B 	79,0,75,0,71,0,66,0,63,0,59,0,56,0,53,0
	DC.B 	50,0,47,0,44,0,42,0,39,0,37,0,35,0,33,0,31,0
	;
	;UNKNOWN TABLE
	;
R0_50330	DC.B 	15,16,19,22,25,29,32,35,38,41,43,45,47,49
	DC.B 	51
R0_50345	DC.B 	0,135
	DC.B 	0,3,7,135
	DC.B 	0,4,7,135
	DC.B 	0,2,7,135
	DC.B 	0,4,7,12,135
	DC.B 	7,12,15,135
	DC.B 	7,12,16,135
	DC.B 	3,7,12,135
	DC.B 	4,7,12,135
	DC.B 	0,12,135
	DC.B 	0,3,135
	DC.B	0,4,135
	DC.B 	0,5,135
	DC.B	0,7,135
	DC.B 	0,0,0,0,12,135
	EVEN
R0_50401	DC.W 	0
R0_50402	DC.W 	6
	DC.L 	R0_50458 
	DC.L 	R0_50522 
	DC.L 	R0_50586 
R0_50409	DC.W 6
	DC.L 	R0_51349 
	DC.L 	R0_51367 
	DC.L 	R0_51377 
R0_50416	DC.W 5
	DC.L 	R0_51608 
	DC.L 	R0_51622 
	DC.L 	R0_51626 
R0_50423	DC.W 3
	DC.L 	R0_51833 
	DC.L 	R0_51837 
	DC.L 	R0_51841 
R0_50430	DC.W 3
	DC.L 	R0_51981 
	DC.L 	R0_51985 
	DC.L 	R0_51989 
R0_50437	DC.W 2
	DC.L 	R0_52089 
	DC.L 	R0_52093 
	DC.L 	R0_52097 
R0_50444	DC.W 3
	DC.L 	R0_52171 
	DC.L 	R0_52175 
	DC.L 	R0_52179 
R0_50451	DC.W 2
	DC.L 	R0_52245 
	DC.L 	R0_52249 
	DC.L 	R0_52253 
R0_50458	DC.L 	R0_50650 
	DC.L 	R0_50716 
	DC.L 	R0_50671 
	DC.L 	R0_50747 
	DC.L 	R0_50671 
	DC.L 	R0_50747 
	DC.L 	R0_50770 
	DC.L 	R0_50770 
	DC.L 	R0_50770 
	DC.L 	R0_50799 
	DC.L 	R0_50799 
	DC.L 	R0_50815 
	DC.L 	R0_50836 
	DC.L 	R0_50861 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_50895 
	DC.L 	R0_52336 
	DC.L 	0
R0_50522	DC.L 	R0_50929 
	DC.L 	R0_50952 
	DC.L 	R0_50671 
	DC.L 	R0_50991 
	DC.L 	R0_50671 
	DC.L 	R0_50991 
	DC.L	R0_51014 
	DC.L 	R0_51014 
	DC.L 	R0_51014 
	DC.L 	R0_51043 
	DC.L 	R0_51043 
	DC.L 	R0_51061 
	DC.L 	R0_51082 
	DC.L 	R0_51106 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_51163 
	DC.L 	R0_52336 
	DC.L 	0
R0_50586	DC.L R0_51140 
	DC.L R0_51176 
	DC.L R0_51163 
	DC.L R0_51215 
	DC.L R0_51163 
	DC.L R0_51215 
	DC.L R0_51238 
	DC.L R0_51238 
	DC.L R0_51238 
	DC.L R0_51267 
	DC.L R0_51267 
	DC.L R0_51284 
	DC.L R0_51309 
	DC.L R0_51333 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_50895 
	DC.L R0_52336 
	DC.L 0
R0_50650	DC.B 136,4,8,130,192,138,219,33,81,71,229,53,241
	DC.B 65,229,53,241,69,255,53,135
R0_50671	DC.B 225,139,192,223,0,17,6,1,222,0,17,6,4
	DC.B 221,0,17,6,8,220,0,17,6,12,219,0,17
	DC.B 6,17,218,0,17,6,22,217,0,17,6,26,215
	DC.B 0,17,6,241,31,135
R0_50716	DC.B 136,2,4,130,192,138,216,33,81,71,247,70,214
	DC.B 33,81,71,247,70,212,33,81,71,247,70,210,33
	DC.B 81,69,255,70,135
R0_50747	DC.B 136,2,4,130,192,138,219,33,81,71,229,70,241
	DC.B 72,229,34,241,36,229,22,249,24,135
R0_50770	DC.B 136,1,2,130,192,138,227,217,33,81,71,89,215
	DC.B 33,81,71,89,213,33,81,71,89,243,211,33,81
	DC.B 71,89,135
R0_50799	DC.B 136,4,8,130,206,138,219,33,65,71,229,68,62
	DC.B 243,51,135
R0_50815	DC.B 136,4,8,130,192,138,219,33,65,71,227,66,61
	DC.B 235,65,231,133,19,133,19,135
R0_50836	DC.B 136,1,2,130,192,138,219,33,81,71,233,77,74
	DC.B 243,72,136,2,4,130,233,65,62,243,60,135
R0_50861	DC.B 136,1,2,130,192,138,219,33,113,71,228,72,79
	DC.B 233,77,228,72,79,233,77,136,2,4,228,60,67
	DC.B 233,65,228,60,67,233,65,135
R0_50895	DC.B 136,2,4,130,192,138,223,0,17,7,225,17,17
	DC.B 140,17,138,17,17,140,17,138,17,140,17,138,17
	DC.B 17,17,17,17,17,17,17,135
R0_50929	DC.B 136,4,8,130,192,138,219,33,81,71,225,128,245
	DC.B 58,225,128,245,61,225,128,253,58,135
R0_50952	DC.B 136,2,4,130,192,138,216,33,81,71,225,128,245
	DC.B 78,214,33,81,71,225,128,245,78,212,33,81,71
	DC.B 225,128,245,78,210,33,81,69,225,128,253,78,135
R0_50991	DC.B 136,2,4,130,192,138,219,33,81,71,225,128,245
	DC.B 69,225,128,245,33,225,128,253,21,135
R0_51014	DC.B 136,1,2,130,192,138,227,217,33,81,71,90,215
	DC.B 33,81,71,90,213,33,81,71,90,243,211,33,81
	DC.B 71,90,135
R0_51043	DC.B 136,4,8,130,206,138,219,33,65,71,225,128,229
	DC.B 67,56,241,50,135
R0_51061	DC.B 136,4,8,130,192,138,219,33,65,71,227,70,66
	DC.B 235,69,231,133,23,133,23,135
R0_51082	DC.B 136,1,2,130,192,138,219,33,81,71,233,80,79
	DC.B 243,75,136,2,4,233,68,67,243,63,135
R0_51106	DC.B 136,1,2,130,192,138,219,33,113,71,228,75,82
	DC.B 233,80,228,76,83,233,81,136,2,4,228,63,70
	DC.B 233,68,228,64,71,233,69,135
R0_51140	DC.B 136,4,8,130,192,138,219,33,81,71,227,128,243
	DC.B 66,227,128,243,70,227,128,251,65,135
R0_51163	DC.B 136,2,4,130,138,215,0,241,1,255,192,94,135
R0_51176	DC.B 136,2,4,130,192,138,216,33,81,71,227,128,243
	DC.B 77,214,33,81,71,227,128,243,77,212,33,81,71
	DC.B 227,128,243,77,210,33,81,69,227,128,251,77,135
R0_51215	DC.B 136,2,4,130,192,138,219,33,81,71,227,128,243
	DC.B 73,227,128,243,37,227,128,251,25,135
R0_51238	DC.B 136,1,2,130,192,138,227,217,33,81,71,91,215
	DC.B 33,81,71,91,213,33,81,71,91,243,211,33,81
	DC.B 71,91,135
R0_51267	DC.B 136,4,8,130,206,138,219,33,65,71,227,128,229
	DC.B 63,245,55,135
R0_51284	DC.B 136,1,2,130,192,138,221,0,81,7,227,203,78
	DC.B 204,73,235,203,77,192,231,133,26,133,26,135
R0_51309	DC.B 136,1,2,130,192,138,219,33,81,71,233,84,82
	DC.B 243,79,136,1,2,233,72,70,243,67,135
R0_51333	DC.B 136,1,1,130,192,138,223,0,129,8,243,92,91
	DC.B 92,91,135
	EVEN
R0_51349	DC.L R0_51387 
	DC.L R0_51387 
	DC.L R0_51419 
	DC.L R0_51419 
	DC.L R0_51447 
	DC.L R0_51447 
	DC.L R0_51387 
	DC.L R0_51387 
	DC.L 0
R0_51367	DC.L R0_51475 
	DC.L R0_51503 
	DC.L R0_51531 
	DC.L R0_51559 
	DC.L 0
R0_51377	DC.L R0_51587 
	DC.L R0_51603 
	DC.L R0_51587 
	DC.L R0_51603 
	DC.L 0
R0_51387	DC.B 136,2,4,225,130,223,0,17,4,192,138,30,30
	DC.B 139,141,39,138,30,30,30,139,141,51,220,0,17
	DC.B 4,129,140,196,78,135
R0_51419	DC.B 130,223,0,17,4,192,138,23,23,139,141,39,138
	DC.B 23,23,23,139,141,51,220,0,17,4,129,140,196
	DC.B 83,135
R0_51447	DC.B 130,223,0,17,4,192,138,28,28,139,141,39,138
	DC.B 28,28,28,139,141,51,220,0,17,4,129,140,196
	DC.B 76,135
R0_51475	DC.B 136,2,4,130,138,221,0,18,4,225,205,66,66
	DC.B 66,66,66,66,66,66,66,66,66,66,66,66,66
	DC.B 66,135
R0_51503	DC.B 136,2,4,130,138,221,0,18,4,225,202,68,68
	DC.B 68,68,68,68,68,68,68,68,68,68,68,68,68
	DC.B 68,135
R0_51531	DC.B 136,2,4,130,138,221,0,18,4,225,205,64,64
	DC.B 64,64,64,64,64,64,64,64,64,64,64,64,64
	DC.B 64,135
R0_51559	DC.B 136,2,4,130,138,221,0,18,4,225,204,61,61
	DC.B 61,61,61,61,61,61,61,61,61,61,61,61,61
	DC.B 61,135
R0_51587	DC.B 136,1,2,130,206,231,138,218,81,33,54,83,82
	DC.B 81,80,135
R0_51603	DC.B 83,82,80,78,135
	EVEN
R0_51608	DC.L R0_51660 
	DC.L R0_51660 
	DC.L R0_51660 
	DC.L R0_51686 
	DC.L R0_51686 
	DC.L R0_51686 
	DC.L 0
R0_51622	DC.L R0_51702 
	DC.L 0
R0_51626	DC.L R0_52339 
	DC.L R0_51715 
	DC.L R0_51738 
	DC.L R0_51754 
	DC.L R0_51770 
	DC.L R0_51738 
	DC.L R0_51786 
	DC.L R0_51802 
	DC.L R0_52342 
	DC.L R0_51715 
	DC.L R0_51738 
	DC.L R0_51754 
	DC.L R0_51770 
	DC.L R0_51738 
	DC.L R0_51786 
	DC.L R0_51802 
	DC.L 0
R0_51660	DC.B 136,4,8,130,225,223,0,18,2,192,138,26,38
	DC.B 139,141,51,138,38,26,140,141,39,138,26,38,135
R0_51686	DC.B 138,14,26,139,141,51,138,26,14,140,141,39,138
	DC.B 14,26,135
R0_51702	DC.B 136,2,4,130,138,216,0,241,1,239,201,74,135
R0_51715	DC.B 136,1,2,130,138,201,225,222,0,17,8,62,221
	DC.B 0,17,8,62,220,0,17,8,62,135
R0_51738	DC.B 222,0,17,8,57,221,0,17,8,57,220,0,17
	DC.B 8,57,135
R0_51754	DC.B 222,0,17,8,58,221,0,17,8,58,220,0,17
	DC.B 8,58,135
R0_51770	DC.B 222,0,17,8,55,221,0,17,8,55,220,0,17
	DC.B 8,55,135
R0_51786	DC.B 222,0,17,8,49,221,0,17,8,49,220,0,17
	DC.B 8,49,135
R0_51802	DC.B 222,0,17,8,50,221,0,17,8,50,220,0,17
	DC.B 8,50,219,0,17,8,50,218,0,17,8,50,217
	DC.B 0,17,8,50,135
	EVEN
R0_51833	DC.L R0_51845 
	DC.L 0
R0_51837	DC.L R0_51891 
	DC.L 0
R0_51841	DC.L R0_51936 
	DC.L 0
R0_51845	DC.B 136,1,2,130,138,192,225,223,0,17,8,79,79
	DC.B 77,77,75,75,72,72,67,67,65,65,63,63,60
	DC.B 60,43,43,41,41,39,39,36,36,223,0,145,5
	DC.B 239,132,20,24,43,142,135
R0_51891	DC.B 136,1,2,130,138,192,225,223,0,17,8,82,82
	DC.B 80,80,79,79,75,75,70,70,68,68,67,67,63
	DC.B 63,46,46,44,44,43,43,39,39,223,0,145,5
	DC.B 239,132,20,24,36,135
R0_51936	DC.B 136,1,2,130,138,192,225,223,0,17,8,84,84
	DC.B 84,84,84,84,84,84,72,72,72,72,72,72,72
	DC.B 72,48,48,48,48,48,48,48,48,223,0,113,5
	DC.B 239,132,20,24,24,135
	EVEN
R0_51981	DC.L R0_51993 
	DC.L 0
R0_51985	DC.L R0_52024 
	DC.L 0
R0_51989	DC.L R0_52059 
	DC.L 0
R0_51993	DC.B 136,1,2,130,138,192,225,221,0,17,7,36,36
	DC.B 38,38,40,40,41,41,43,43,45,47,223,0,17
	DC.B 2,231,48,142,135
R0_52024	DC.B 136,1,2,130,138,225,223,0,17,7,200,48,48
	DC.B 194,55,55,193,57,57,200,53,53,55,55,198,53
	DC.B 55,223,0,17,2,231,200,60,135
R0_52059	DC.B 136,1,2,130,138,192,225,221,0,17,7,60,60
	DC.B 62,62,64,64,65,65,67,67,69,71,223,0,17
	DC.B 2,231,72,135
	EVEN
R0_52089	DC.L R0_52101 
	DC.L 0
R0_52093	DC.L R0_52125 
	DC.L 0
R0_52097	DC.L R0_52148 
	DC.L 0
R0_52101	DC.B 136,2,4,130,138,192,223,0,17,5,226,49,48
	DC.B 49,232,48,226,44,43,44,232,43,142,135
R0_52125	DC.B 136,2,4,130,138,192,223,0,17,5,226,52,51
	DC.B 52,232,51,226,47,46,47,232,46,135
R0_52148	DC.B 136,2,4,130,138,192,223,0,17,5,226,56,55
	DC.B 56,232,55,226,39,38,39,232,38,135
	EVEN
R0_52171	DC.L R0_52183 
	DC.L 0
R0_52175	DC.L R0_52204 
	DC.L 0
R0_52179	DC.L R0_52224 
	DC.L 0
R0_52183	DC.B 136,1,2,130,138,192,223,0,65,5,227,63,225
	DC.B 62,63,62,63,231,60,142,135
R0_52204	DC.B 136,1,2,130,138,192,223,0,65,5,227,68,225
	DC.B 67,68,67,68,231,67,135
R0_52224	DC.B 136,1,2,130,138,192,223,0,33,6,227,67,225
	DC.B 68,69,70,71,231,201,72,135
	EVEN
R0_52245	DC.L R0_52257 
	DC.L 0
R0_52249	DC.L R0_52284 
	DC.L 0
R0_52253	DC.L R0_52310 
	DC.L 0
R0_52257	DC.B 136,1,2,130,138,192,223,0,17,8,225,60,72
	DC.B 60,72,60,72,60,72,60,72,60,72,239,59,142
	DC.B 135
R0_52284	DC.B 136,1,2,130,138,192,223,0,17,8,225,63,75
	DC.B 63,75,63,75,63,75,63,75,63,75,239,71,135
R0_52310	DC.B 136,1,2,130,138,192,223,0,18,4,225,84,84
	DC.B 84,84,84,84,84,84,84,84,84,84,239,83,135
R0_52336	DC.B 239,128,135
R0_52339	DC.B 137,0,135
R0_52342	DC.B 137,12,135,0,135,67,68,231,67,135
	END