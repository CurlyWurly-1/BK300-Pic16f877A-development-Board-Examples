opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 13 "F:\Experiment_15\AT24C02.C"
	psect config,class=CONFIG,delta=2 ;#
# 13 "F:\Experiment_15\AT24C02.C"
	dw 0x3F32 ;#
	FNCALL	_main,_Board_init
	FNCALL	_main,_write
	FNCALL	_main,_read
	FNCALL	_main,_delay_250ms
	FNCALL	_write,_i2cstart
	FNCALL	_write,_i2cwrite
	FNCALL	_write,_i2cstop
	FNCALL	_read,_i2cstart
	FNCALL	_read,_i2cwrite
	FNCALL	_read,_i2cread
	FNCALL	_read,_i2cstop
	FNCALL	_i2cread,_bitin
	FNCALL	_i2cread,_bitout
	FNCALL	_i2cwrite,_bitout
	FNCALL	_i2cwrite,_bitin
	FNCALL	_i2cstop,_delay
	FNCALL	_i2cstart,_delay
	FNROOT	_main
	global	_addressbuf
	global	_eepromdi
	global	_eepromdo
	global	_PORTD
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:
_PORTD	set	8
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_ADCON1
_ADCON1	set	159
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
	global	_TRISA5
_TRISA5	set	1069
	file	"Experiment15-I2C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_eepromdi:
       ds      1

_eepromdo:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_addressbuf:
       ds      1

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Board_init
?_Board_init:	; 0 bytes @ 0x0
	global	??_Board_init
??_Board_init:	; 0 bytes @ 0x0
	global	?_delay_250ms
?_delay_250ms:	; 0 bytes @ 0x0
	global	??_delay_250ms
??_delay_250ms:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?_i2cstart
?_i2cstart:	; 0 bytes @ 0x0
	global	?_i2cstop
?_i2cstop:	; 0 bytes @ 0x0
	global	?_bitin
?_bitin:	; 0 bytes @ 0x0
	global	??_bitin
??_bitin:	; 0 bytes @ 0x0
	global	?_bitout
?_bitout:	; 0 bytes @ 0x0
	global	??_bitout
??_bitout:	; 0 bytes @ 0x0
	global	?_i2cwrite
?_i2cwrite:	; 0 bytes @ 0x0
	global	??_i2cwrite
??_i2cwrite:	; 0 bytes @ 0x0
	global	??_i2cread
??_i2cread:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_i2cread
?_i2cread:	; 1 bytes @ 0x0
	global	?_read
?_read:	; 1 bytes @ 0x0
	global	delay_250ms@d
delay_250ms@d:	; 2 bytes @ 0x0
	ds	1
	global	delay@k
delay@k:	; 1 bytes @ 0x1
	ds	1
	global	??_i2cstart
??_i2cstart:	; 0 bytes @ 0x2
	global	??_i2cstop
??_i2cstop:	; 0 bytes @ 0x2
	global	i2cwrite@sedata
i2cwrite@sedata:	; 1 bytes @ 0x2
	global	i2cread@m
i2cread@m:	; 1 bytes @ 0x2
	ds	1
	global	i2cwrite@k
i2cwrite@k:	; 1 bytes @ 0x3
	global	i2cread@redata
i2cread@redata:	; 1 bytes @ 0x3
	ds	1
	global	??_read
??_read:	; 0 bytes @ 0x4
	global	?_write
?_write:	; 0 bytes @ 0x4
	global	write@byte
write@byte:	; 1 bytes @ 0x4
	ds	1
	global	??_write
??_write:	; 0 bytes @ 0x5
	global	read@address
read@address:	; 1 bytes @ 0x5
	global	write@address1
write@address1:	; 1 bytes @ 0x5
	ds	1
	global	read@eebuf3
read@eebuf3:	; 1 bytes @ 0x6
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	1
	global	main@buf
main@buf:	; 1 bytes @ 0x8
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      11
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_read
;;   _write->_i2cwrite
;;   _read->_i2cwrite
;;   _read->_i2cread
;;   _i2cstop->_delay
;;   _i2cstart->_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     405
;;                                              7 COMMON     2     2      0
;;                         _Board_init
;;                              _write
;;                               _read
;;                        _delay_250ms
;; ---------------------------------------------------------------------------------
;; (1) _write                                                2     1      1     150
;;                                              4 COMMON     2     1      1
;;                           _i2cstart
;;                           _i2cwrite
;;                            _i2cstop
;; ---------------------------------------------------------------------------------
;; (1) _read                                                 3     3      0     210
;;                                              4 COMMON     3     3      0
;;                           _i2cstart
;;                           _i2cwrite
;;                            _i2cread
;;                            _i2cstop
;; ---------------------------------------------------------------------------------
;; (2) _i2cread                                              4     4      0      60
;;                                              0 COMMON     4     4      0
;;                              _bitin
;;                             _bitout
;; ---------------------------------------------------------------------------------
;; (2) _i2cwrite                                             4     4      0      60
;;                                              0 COMMON     4     4      0
;;                             _bitout
;;                              _bitin
;; ---------------------------------------------------------------------------------
;; (2) _i2cstop                                              0     0      0      30
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _i2cstart                                             0     0      0      30
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _bitout                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _bitin                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _delay_250ms                                          2     2      0      15
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _Board_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Board_init
;;   _write
;;     _i2cstart
;;       _delay
;;     _i2cwrite
;;       _bitout
;;       _bitin
;;     _i2cstop
;;       _delay
;;   _read
;;     _i2cstart
;;       _delay
;;     _i2cwrite
;;       _bitout
;;       _bitin
;;     _i2cread
;;       _bitin
;;       _bitout
;;     _i2cstop
;;       _delay
;;   _delay_250ms
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0       B       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       E      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 221 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Board_init
;;		_write
;;		_read
;;		_delay_250ms
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Experiment_15\AT24C02.C"
	line	221
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	224
	
l2001:	
;AT24C02.C: 222: unsigned char buf;
;AT24C02.C: 224: ADCON1=0X07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	226
	
l2003:	
;AT24C02.C: 226: Board_init();
	fcall	_Board_init
	line	227
	
l2005:	
;AT24C02.C: 227: RC5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	line	228
	
l2007:	
;AT24C02.C: 228: TRISA&=0B11001111;
	movlw	(0CFh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(133)^080h,f	;volatile
	line	230
	
l2009:	
;AT24C02.C: 230: write(0x18,0X55);
	movlw	(055h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_write)
	movlw	(018h)
	fcall	_write
	line	231
	
l2011:	
;AT24C02.C: 231: write(0x19,0XAA);
	movlw	(0AAh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_write)
	movlw	(019h)
	fcall	_write
	goto	l2013
	line	233
;AT24C02.C: 233: while(1)
	
l737:	
	line	235
	
l2013:	
;AT24C02.C: 234: {
;AT24C02.C: 235: buf=read(0x18);
	movlw	(018h)
	fcall	_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@buf)
	line	236
	
l2015:	
;AT24C02.C: 236: PORTD=buf;
	movf	(main@buf),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	237
	
l2017:	
;AT24C02.C: 237: delay_250ms();
	fcall	_delay_250ms
	line	238
	
l2019:	
;AT24C02.C: 238: delay_250ms();
	fcall	_delay_250ms
	line	240
	
l2021:	
;AT24C02.C: 240: buf=read(0x19);
	movlw	(019h)
	fcall	_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@buf)
	line	241
	
l2023:	
;AT24C02.C: 241: PORTD=buf;
	movf	(main@buf),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	242
	
l2025:	
;AT24C02.C: 242: delay_250ms();
	fcall	_delay_250ms
	line	243
	
l2027:	
;AT24C02.C: 243: delay_250ms();
	fcall	_delay_250ms
	goto	l2013
	line	244
	
l738:	
	line	233
	goto	l2013
	
l739:	
	line	245
	
l740:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_write
psect	text139,local,class=CODE,delta=2
global __ptext139
__ptext139:

;; *************** function _write *****************
;; Defined at:
;;		line 209 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  address1        1    wreg     unsigned char 
;;  byte            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address1        1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_i2cstart
;;		_i2cwrite
;;		_i2cstop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text139
	file	"F:\Experiment_15\AT24C02.C"
	line	209
	global	__size_of_write
	__size_of_write	equ	__end_of_write-_write
	
_write:	
	opt	stack 5
; Regs used in _write: [wreg+status,2+status,0+pclath+cstack]
;write@address1 stored from wreg
	movwf	(write@address1)
	line	210
	
l1999:	
;AT24C02.C: 210: i2cstart();
	fcall	_i2cstart
	line	211
;AT24C02.C: 211: i2cwrite(0xa0);
	movlw	(0A0h)
	fcall	_i2cwrite
	line	212
;AT24C02.C: 212: i2cwrite(address1);
	movf	(write@address1),w
	fcall	_i2cwrite
	line	213
;AT24C02.C: 213: i2cwrite(byte);
	movf	(write@byte),w
	fcall	_i2cwrite
	line	214
;AT24C02.C: 214: i2cstop();
	fcall	_i2cstop
	line	215
	
l734:	
	return
	opt stack 0
GLOBAL	__end_of_write
	__end_of_write:
;; =============== function _write ends ============

	signat	_write,8312
	global	_read
psect	text140,local,class=CODE,delta=2
global __ptext140
__ptext140:

;; *************** function _read *****************
;; Defined at:
;;		line 193 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    5[COMMON] unsigned char 
;;  eebuf3          1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_i2cstart
;;		_i2cwrite
;;		_i2cread
;;		_i2cstop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text140
	file	"F:\Experiment_15\AT24C02.C"
	line	193
	global	__size_of_read
	__size_of_read	equ	__end_of_read-_read
	
_read:	
	opt	stack 5
; Regs used in _read: [wreg+status,2+status,0+pclath+cstack]
;read@address stored from wreg
	line	195
	movwf	(read@address)
	
l1993:	
;AT24C02.C: 194: unsigned char eebuf3;
;AT24C02.C: 195: i2cstart();
	fcall	_i2cstart
	line	196
;AT24C02.C: 196: i2cwrite(0xa0);
	movlw	(0A0h)
	fcall	_i2cwrite
	line	197
;AT24C02.C: 197: i2cwrite(address);
	movf	(read@address),w
	fcall	_i2cwrite
	line	198
;AT24C02.C: 198: i2cstart();
	fcall	_i2cstart
	line	199
;AT24C02.C: 199: i2cwrite(0xa1);
	movlw	(0A1h)
	fcall	_i2cwrite
	line	200
;AT24C02.C: 200: eebuf3=i2cread();
	fcall	_i2cread
	movwf	(??_read+0)+0
	movf	(??_read+0)+0,w
	movwf	(read@eebuf3)
	line	201
;AT24C02.C: 201: i2cstop();
	fcall	_i2cstop
	line	202
	
l1995:	
;AT24C02.C: 202: return eebuf3;
	movf	(read@eebuf3),w
	goto	l731
	
l1997:	
	line	203
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_read
	__end_of_read:
;; =============== function _read ends ============

	signat	_read,4217
	global	_i2cread
psect	text141,local,class=CODE,delta=2
global __ptext141
__ptext141:

;; *************** function _i2cread *****************
;; Defined at:
;;		line 167 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  redata          1    3[COMMON] unsigned char 
;;  m               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_bitin
;;		_bitout
;; This function is called by:
;;		_read
;; This function uses a non-reentrant model
;;
psect	text141
	file	"F:\Experiment_15\AT24C02.C"
	line	167
	global	__size_of_i2cread
	__size_of_i2cread	equ	__end_of_i2cread-_i2cread
	
_i2cread:	
	opt	stack 5
; Regs used in _i2cread: [wreg+status,2+status,0+pclath+cstack]
	line	170
	
l1967:	
;AT24C02.C: 168: unsigned char redata;
;AT24C02.C: 169: unsigned char m;
;AT24C02.C: 170: for(m=0;m<8;m++)
	clrf	(i2cread@m)
	
l1969:	
	movlw	(08h)
	subwf	(i2cread@m),w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l1973
u2230:
	goto	l725
	
l1971:	
	goto	l725
	line	171
	
l724:	
	line	172
	
l1973:	
;AT24C02.C: 171: {
;AT24C02.C: 172: redata=redata<<1;
	movf	(i2cread@redata),w
	movwf	(??_i2cread+0)+0
	addwf	(??_i2cread+0)+0,w
	movwf	(??_i2cread+1)+0
	movf	(??_i2cread+1)+0,w
	movwf	(i2cread@redata)
	line	173
	
l1975:	
;AT24C02.C: 173: bitin();
	fcall	_bitin
	line	174
	
l1977:	
;AT24C02.C: 174: if(eepromdi==1)
	btfss	(_eepromdi/8),(_eepromdi)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l1981
u2240:
	line	176
	
l1979:	
;AT24C02.C: 175: {
;AT24C02.C: 176: redata|=0x01;
	bsf	(i2cread@redata)+(0/8),(0)&7
	line	177
;AT24C02.C: 177: }
	goto	l1983
	line	178
	
l726:	
	line	180
	
l1981:	
;AT24C02.C: 178: else
;AT24C02.C: 179: {
;AT24C02.C: 180: redata&=0xfe;
	movlw	(0FEh)
	movwf	(??_i2cread+0)+0
	movf	(??_i2cread+0)+0,w
	andwf	(i2cread@redata),f
	goto	l1983
	line	181
	
l727:	
	line	182
	
l1983:	
# 182 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text141
	line	170
	movlw	(01h)
	movwf	(??_i2cread+0)+0
	movf	(??_i2cread+0)+0,w
	addwf	(i2cread@m),f
	
l1985:	
	movlw	(08h)
	subwf	(i2cread@m),w
	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l1973
u2250:
	
l725:	
	line	184
;AT24C02.C: 183: }
;AT24C02.C: 184: eepromdo=1;
	bsf	(_eepromdo/8),(_eepromdo)&7
	line	185
	
l1987:	
;AT24C02.C: 185: bitout();
	fcall	_bitout
	line	186
	
l1989:	
;AT24C02.C: 186: return redata;
	movf	(i2cread@redata),w
	goto	l728
	
l1991:	
	line	187
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_i2cread
	__end_of_i2cread:
;; =============== function _i2cread ends ============

	signat	_i2cread,89
	global	_i2cwrite
psect	text142,local,class=CODE,delta=2
global __ptext142
__ptext142:

;; *************** function _i2cwrite *****************
;; Defined at:
;;		line 145 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  sedata          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  sedata          1    2[COMMON] unsigned char 
;;  k               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_bitout
;;		_bitin
;; This function is called by:
;;		_read
;;		_write
;; This function uses a non-reentrant model
;;
psect	text142
	file	"F:\Experiment_15\AT24C02.C"
	line	145
	global	__size_of_i2cwrite
	__size_of_i2cwrite	equ	__end_of_i2cwrite-_i2cwrite
	
_i2cwrite:	
	opt	stack 5
; Regs used in _i2cwrite: [wreg+status,2+status,0+pclath+cstack]
;i2cwrite@sedata stored from wreg
	line	147
	movwf	(i2cwrite@sedata)
	
l1949:	
;AT24C02.C: 146: unsigned char k;
;AT24C02.C: 147: for(k=0;k<8;k++)
	clrf	(i2cwrite@k)
	
l1951:	
	movlw	(08h)
	subwf	(i2cwrite@k),w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l717
u2200:
	goto	l1965
	
l1953:	
	goto	l1965
	line	148
	
l717:	
	line	149
;AT24C02.C: 148: {
;AT24C02.C: 149: if(sedata&0x80)
	btfss	(i2cwrite@sedata),(7)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l719
u2210:
	line	151
	
l1955:	
;AT24C02.C: 150: {
;AT24C02.C: 151: eepromdo=1;
	bsf	(_eepromdo/8),(_eepromdo)&7
	line	152
;AT24C02.C: 152: }
	goto	l1957
	line	153
	
l719:	
	line	155
;AT24C02.C: 153: else
;AT24C02.C: 154: {
;AT24C02.C: 155: eepromdo=0;
	bcf	(_eepromdo/8),(_eepromdo)&7
	goto	l1957
	line	156
	
l720:	
	line	157
	
l1957:	
;AT24C02.C: 156: }
;AT24C02.C: 157: sedata=sedata<<1;
	movf	(i2cwrite@sedata),w
	movwf	(??_i2cwrite+0)+0
	addwf	(??_i2cwrite+0)+0,w
	movwf	(??_i2cwrite+1)+0
	movf	(??_i2cwrite+1)+0,w
	movwf	(i2cwrite@sedata)
	line	158
	
l1959:	
;AT24C02.C: 158: bitout();
	fcall	_bitout
	line	147
	
l1961:	
	movlw	(01h)
	movwf	(??_i2cwrite+0)+0
	movf	(??_i2cwrite+0)+0,w
	addwf	(i2cwrite@k),f
	
l1963:	
	movlw	(08h)
	subwf	(i2cwrite@k),w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l717
u2220:
	goto	l1965
	
l718:	
	line	160
	
l1965:	
;AT24C02.C: 159: }
;AT24C02.C: 160: bitin();
	fcall	_bitin
	line	161
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_i2cwrite
	__end_of_i2cwrite:
;; =============== function _i2cwrite ends ============

	signat	_i2cwrite,4216
	global	_i2cstop
psect	text143,local,class=CODE,delta=2
global __ptext143
__ptext143:

;; *************** function _i2cstop *****************
;; Defined at:
;;		line 71 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_read
;;		_write
;; This function uses a non-reentrant model
;;
psect	text143
	file	"F:\Experiment_15\AT24C02.C"
	line	71
	global	__size_of_i2cstop
	__size_of_i2cstop	equ	__end_of_i2cstop-_i2cstop
	
_i2cstop:	
	opt	stack 5
; Regs used in _i2cstop: [wreg+status,2+status,0+pclath+cstack]
	line	72
	
l1941:	
;AT24C02.C: 72: RA5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	line	73
;AT24C02.C: 73: RA5=0;
	bcf	(45/8),(45)&7
	line	74
# 74 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	75
# 75 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	76
# 76 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	77
# 77 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	78
# 78 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text143
	line	79
;AT24C02.C: 79: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	80
	
l1943:	
;AT24C02.C: 80: delay();
	fcall	_delay
	line	81
	
l1945:	
;AT24C02.C: 81: RA5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	line	82
;AT24C02.C: 82: delay();
	fcall	_delay
	line	83
	
l1947:	
;AT24C02.C: 83: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	84
;AT24C02.C: 84: delay();
	fcall	_delay
	line	85
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_i2cstop
	__end_of_i2cstop:
;; =============== function _i2cstop ends ============

	signat	_i2cstop,88
	global	_i2cstart
psect	text144,local,class=CODE,delta=2
global __ptext144
__ptext144:

;; *************** function _i2cstart *****************
;; Defined at:
;;		line 51 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_read
;;		_write
;; This function uses a non-reentrant model
;;
psect	text144
	file	"F:\Experiment_15\AT24C02.C"
	line	51
	global	__size_of_i2cstart
	__size_of_i2cstart	equ	__end_of_i2cstart-_i2cstart
	
_i2cstart:	
	opt	stack 5
; Regs used in _i2cstart: [wreg+status,2+status,0+pclath+cstack]
	line	52
	
l1933:	
;AT24C02.C: 52: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	53
# 53 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	54
# 54 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	55
# 55 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	56
# 56 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	57
# 57 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text144
	line	58
;AT24C02.C: 58: RA5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	line	59
	
l1935:	
;AT24C02.C: 59: delay();
	fcall	_delay
	line	60
	
l1937:	
;AT24C02.C: 60: RA5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	line	61
;AT24C02.C: 61: delay();
	fcall	_delay
	line	62
	
l1939:	
;AT24C02.C: 62: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	63
;AT24C02.C: 63: delay();
	fcall	_delay
	line	64
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_i2cstart
	__end_of_i2cstart:
;; =============== function _i2cstart ends ============

	signat	_i2cstart,88
	global	_bitout
psect	text145,local,class=CODE,delta=2
global __ptext145
__ptext145:

;; *************** function _bitout *****************
;; Defined at:
;;		line 120 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2cwrite
;;		_i2cread
;; This function uses a non-reentrant model
;;
psect	text145
	file	"F:\Experiment_15\AT24C02.C"
	line	120
	global	__size_of_bitout
	__size_of_bitout	equ	__end_of_bitout-_bitout
	
_bitout:	
	opt	stack 5
; Regs used in _bitout: []
	line	121
	
l1165:	
;AT24C02.C: 121: RA5=eepromdo;
	btfsc	(_eepromdo/8),(_eepromdo)&7
	goto	u51
	goto	u50
	
u51:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	goto	u64
u50:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
u64:
	line	122
# 122 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	123
# 123 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	124
# 124 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	125
# 125 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	126
# 126 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text145
	line	127
;AT24C02.C: 127: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	128
# 128 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	129
# 129 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	130
# 130 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	131
# 131 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	132
# 132 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text145
	line	133
;AT24C02.C: 133: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	134
# 134 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	135
# 135 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	136
# 136 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	137
# 137 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	138
# 138 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text145
	line	139
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_bitout
	__end_of_bitout:
;; =============== function _bitout ends ============

	signat	_bitout,88
	global	_bitin
psect	text146,local,class=CODE,delta=2
global __ptext146
__ptext146:

;; *************** function _bitin *****************
;; Defined at:
;;		line 92 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2cwrite
;;		_i2cread
;; This function uses a non-reentrant model
;;
psect	text146
	file	"F:\Experiment_15\AT24C02.C"
	line	92
	global	__size_of_bitin
	__size_of_bitin	equ	__end_of_bitin-_bitin
	
_bitin:	
	opt	stack 5
; Regs used in _bitin: []
	line	93
	
l1163:	
;AT24C02.C: 93: eepromdi=1;
	bsf	(_eepromdi/8),(_eepromdi)&7
	line	94
;AT24C02.C: 94: TRISA5=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1069/8)^080h,(1069)&7
	line	95
;AT24C02.C: 95: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	96
# 96 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	97
# 97 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	98
# 98 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	99
# 99 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	100
# 100 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text146
	line	101
;AT24C02.C: 101: eepromdi=RA5;
	bcf	(_eepromdi/8),(_eepromdi)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(45/8),(45)&7
	goto	u45
	bsf	(_eepromdi/8),(_eepromdi)&7
u45:

	line	102
# 102 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	103
# 103 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	104
# 104 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	105
# 105 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	106
# 106 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text146
	line	107
;AT24C02.C: 107: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	108
# 108 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	109
# 109 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	110
# 110 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	111
# 111 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	112
# 112 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text146
	line	113
;AT24C02.C: 113: TRISA5=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1069/8)^080h,(1069)&7
	line	114
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_bitin
	__end_of_bitin:
;; =============== function _bitin ends ============

	signat	_bitin,88
	global	_delay
psect	text147,local,class=CODE,delta=2
global __ptext147
__ptext147:

;; *************** function _delay *****************
;; Defined at:
;;		line 41 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2cstart
;;		_i2cstop
;; This function uses a non-reentrant model
;;
psect	text147
	file	"F:\Experiment_15\AT24C02.C"
	line	41
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg+status,2+status,0]
	line	43
	
l1153:	
;AT24C02.C: 42: unsigned char k;
;AT24C02.C: 43: for(k=0;k<180;k++);
	clrf	(delay@k)
	
l1155:	
	movlw	(0B4h)
	subwf	(delay@k),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1159
u20:
	goto	l702
	
l1157:	
	goto	l702
	
l700:	
	
l1159:	
	movlw	(01h)
	movwf	(??_delay+0)+0
	movf	(??_delay+0)+0,w
	addwf	(delay@k),f
	
l1161:	
	movlw	(0B4h)
	subwf	(delay@k),w
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1159
u30:
	goto	l702
	
l701:	
	line	44
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
	global	_delay_250ms
psect	text148,local,class=CODE,delta=2
global __ptext148
__ptext148:

;; *************** function _delay_250ms *****************
;; Defined at:
;;		line 30 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  d               2    0[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text148
	file	"F:\Experiment_15\AT24C02.C"
	line	30
	global	__size_of_delay_250ms
	__size_of_delay_250ms	equ	__end_of_delay_250ms-_delay_250ms
	
_delay_250ms:	
	opt	stack 7
; Regs used in _delay_250ms: [wreg+status,2+status,0]
	line	31
	
l1149:	
;AT24C02.C: 31: unsigned int d=24999;
	movlw	low(061A7h)
	movwf	(delay_250ms@d)
	movlw	high(061A7h)
	movwf	((delay_250ms@d))+1
	line	32
;AT24C02.C: 32: while (--d);
	goto	l1151
	
l695:	
	goto	l1151
	
l694:	
	
l1151:	
	movlw	low(01h)
	subwf	(delay_250ms@d),f
	movlw	high(01h)
	skipc
	decf	(delay_250ms@d+1),f
	subwf	(delay_250ms@d+1),f
	movf	(((delay_250ms@d+1))),w
	iorwf	(((delay_250ms@d))),w
	skipz
	goto	u11
	goto	u10
u11:
	goto	l1151
u10:
	goto	l697
	
l696:	
	line	33
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_delay_250ms
	__end_of_delay_250ms:
;; =============== function _delay_250ms ends ============

	signat	_delay_250ms,88
	global	_Board_init
psect	text149,local,class=CODE,delta=2
global __ptext149
__ptext149:

;; *************** function _Board_init *****************
;; Defined at:
;;		line 18 in file "F:\Experiment_15\BoardConfig.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text149
	file	"F:\Experiment_15\BoardConfig.h"
	line	18
	global	__size_of_Board_init
	__size_of_Board_init	equ	__end_of_Board_init-_Board_init
	
_Board_init:	
	opt	stack 7
; Regs used in _Board_init: [wreg+status,2]
	line	21
	
l1109:	
;BoardConfig.h: 21: TRISA=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	22
;BoardConfig.h: 22: TRISB=0x00;
	clrf	(134)^080h	;volatile
	line	23
;BoardConfig.h: 23: TRISC=0x00;
	clrf	(135)^080h	;volatile
	line	24
;BoardConfig.h: 24: TRISD=0x00;
	clrf	(136)^080h	;volatile
	line	25
;BoardConfig.h: 25: TRISE=0X00;
	clrf	(137)^080h	;volatile
	line	30
	
l1111:	
;BoardConfig.h: 30: PORTD=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	31
	
l1113:	
;BoardConfig.h: 31: RA3=0;
	bcf	(43/8),(43)&7
	line	32
	
l1115:	
;BoardConfig.h: 32: RC5=1;
	bsf	(61/8),(61)&7
	line	33
	
l1117:	
# 33 "F:\Experiment_15\BoardConfig.h"
NOP ;#
psect	text149
	line	34
	
l1119:	
# 34 "F:\Experiment_15\BoardConfig.h"
NOP ;#
psect	text149
	line	35
	
l1121:	
;BoardConfig.h: 35: RC5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	39
	
l1123:	
;BoardConfig.h: 39: RC3=1;
	bsf	(59/8),(59)&7
	line	40
	
l1125:	
# 40 "F:\Experiment_15\BoardConfig.h"
NOP ;#
psect	text149
	line	41
	
l1127:	
# 41 "F:\Experiment_15\BoardConfig.h"
NOP ;#
psect	text149
	line	42
	
l1129:	
;BoardConfig.h: 42: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	46
	
l1131:	
;BoardConfig.h: 46: RC4=1;
	bsf	(60/8),(60)&7
	line	47
	
l1133:	
;BoardConfig.h: 47: PORTD=0X00;
	clrf	(8)	;volatile
	line	48
	
l1135:	
# 48 "F:\Experiment_15\BoardConfig.h"
NOP ;#
psect	text149
	line	49
	
l1137:	
# 49 "F:\Experiment_15\BoardConfig.h"
NOP ;#
psect	text149
	line	50
	
l1139:	
;BoardConfig.h: 50: RC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	52
;BoardConfig.h: 52: PORTD=0XFF;
	movlw	(0FFh)
	movwf	(8)	;volatile
	line	54
	
l1141:	
;BoardConfig.h: 54: RC2=1;
	bsf	(58/8),(58)&7
	line	56
	
l1143:	
;BoardConfig.h: 56: RE0=0;
	bcf	(72/8),(72)&7
	line	57
	
l1145:	
;BoardConfig.h: 57: RE1=0;
	bcf	(73/8),(73)&7
	line	58
	
l1147:	
;BoardConfig.h: 58: RE2=0;
	bcf	(74/8),(74)&7
	line	59
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_Board_init
	__end_of_Board_init:
;; =============== function _Board_init ends ============

	signat	_Board_init,88
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
