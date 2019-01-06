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
	FNCALL	_main,_read
	FNCALL	_main,_write
	FNCALL	_main,_lcdreset
	FNCALL	_main,_lcd_write_char
	FNCALL	_main,___awdiv
	FNCALL	_main,___awmod
	FNCALL	_lcd_write_char,_lcd_write_address
	FNCALL	_lcd_write_char,_lcd_write_data
	FNCALL	_write,_i2cstart
	FNCALL	_write,_i2cwrite
	FNCALL	_write,_i2cstop
	FNCALL	_read,_i2cstart
	FNCALL	_read,_i2cwrite
	FNCALL	_read,_i2cread
	FNCALL	_read,_i2cstop
	FNCALL	_lcdreset,_delay1
	FNCALL	_lcdreset,_lcd_write_com
	FNCALL	_lcdreset,_lcd_write_com_busy
	FNCALL	_lcd_write_address,_lcd_write_com_busy
	FNCALL	_i2cread,_bitin
	FNCALL	_i2cread,_bitout
	FNCALL	_i2cwrite,_bitout
	FNCALL	_i2cwrite,_bitin
	FNCALL	_i2cstop,_delay
	FNCALL	_i2cstart,_delay
	FNCALL	_lcd_write_data,_lcd_wait_busy
	FNCALL	_lcd_write_com_busy,_lcd_wait_busy
	FNCALL	_lcd_write_com_busy,_lcd_write_com
	FNROOT	_main
	global	_addressbuf
	global	_eepromdi
	global	_eepromdo
	global	_PORTD
psect	text390,local,class=CODE,delta=2
global __ptext390
__ptext390:
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
	global	_RD7
_RD7	set	71
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
	global	_TRISD7
_TRISD7	set	1095
	file	"Experiment15-I2C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssBANK0,class=BANK0,bit,space=1
global __pbitbssBANK0
__pbitbssBANK0:
_eepromdi:
       ds      1

_eepromdo:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_addressbuf:
       ds      1

; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssBANK0/8)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay1
?_delay1:	; 0 bytes @ 0x0
	global	?_lcd_wait_busy
?_lcd_wait_busy:	; 0 bytes @ 0x0
	global	??_lcd_wait_busy
??_lcd_wait_busy:	; 0 bytes @ 0x0
	global	?_lcd_write_com
?_lcd_write_com:	; 0 bytes @ 0x0
	global	??_lcd_write_com
??_lcd_write_com:	; 0 bytes @ 0x0
	global	?_lcd_write_com_busy
?_lcd_write_com_busy:	; 0 bytes @ 0x0
	global	?_lcd_write_data
?_lcd_write_data:	; 0 bytes @ 0x0
	global	??_lcd_write_data
??_lcd_write_data:	; 0 bytes @ 0x0
	global	?_lcdreset
?_lcdreset:	; 0 bytes @ 0x0
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
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	lcd_write_com@combuf
lcd_write_com@combuf:	; 1 bytes @ 0x0
	global	lcd_write_data@databuf
lcd_write_data@databuf:	; 1 bytes @ 0x0
	global	delay1@t
delay1@t:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_lcd_write_com_busy
??_lcd_write_com_busy:	; 0 bytes @ 0x1
	global	lcd_write_com_busy@combuf
lcd_write_com_busy@combuf:	; 1 bytes @ 0x1
	global	delay@k
delay@k:	; 1 bytes @ 0x1
	ds	1
	global	??_delay1
??_delay1:	; 0 bytes @ 0x2
	global	?_lcd_write_address
?_lcd_write_address:	; 0 bytes @ 0x2
	global	??_i2cstart
??_i2cstart:	; 0 bytes @ 0x2
	global	??_i2cstop
??_i2cstop:	; 0 bytes @ 0x2
	global	lcd_write_address@y
lcd_write_address@y:	; 1 bytes @ 0x2
	global	i2cwrite@sedata
i2cwrite@sedata:	; 1 bytes @ 0x2
	global	i2cread@m
i2cread@m:	; 1 bytes @ 0x2
	global	delay1@i
delay1@i:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_write_address
??_lcd_write_address:	; 0 bytes @ 0x3
	global	i2cwrite@k
i2cwrite@k:	; 1 bytes @ 0x3
	global	i2cread@redata
i2cread@redata:	; 1 bytes @ 0x3
	ds	1
	global	??_read
??_read:	; 0 bytes @ 0x4
	global	?_write
?_write:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	lcd_write_address@x
lcd_write_address@x:	; 1 bytes @ 0x4
	global	write@byte
write@byte:	; 1 bytes @ 0x4
	global	delay1@j
delay1@j:	; 2 bytes @ 0x4
	ds	1
	global	??_write
??_write:	; 0 bytes @ 0x5
	global	read@address
read@address:	; 1 bytes @ 0x5
	global	write@address1
write@address1:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_lcdreset
??_lcdreset:	; 0 bytes @ 0x6
	global	read@eebuf3
read@eebuf3:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x7
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x7
	ds	2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x9
	ds	2
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0xB
	ds	1
	global	??_lcd_write_char
??_lcd_write_char:	; 0 bytes @ 0xC
	ds	1
	global	lcd_write_char@x
lcd_write_char@x:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x0
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x1
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x2
	ds	2
	global	?_lcd_write_char
?_lcd_write_char:	; 0 bytes @ 0x4
	global	lcd_write_char@y
lcd_write_char@y:	; 1 bytes @ 0x4
	ds	1
	global	lcd_write_char@buf
lcd_write_char@buf:	; 1 bytes @ 0x5
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
	global	main@buf
main@buf:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     10      12
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_write_char
;;   _lcd_write_char->___awdiv
;;   _write->_i2cwrite
;;   _read->_i2cwrite
;;   _read->_i2cread
;;   _lcdreset->_delay1
;;   _lcd_write_address->_lcd_write_com_busy
;;   _i2cstop->_delay
;;   _i2cstart->_delay
;;   _lcd_write_com_busy->_lcd_write_com
;;   ___awdiv->___awmod
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_lcd_write_char
;;   _lcd_write_char->___awdiv
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0    1592
;;                                              6 BANK0      4     4      0
;;                               _read
;;                              _write
;;                           _lcdreset
;;                     _lcd_write_char
;;                            ___awdiv
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (1) _lcd_write_char                                       4     2      2     200
;;                                             12 COMMON     2     2      0
;;                                              4 BANK0      2     0      2
;;                  _lcd_write_address
;;                     _lcd_write_data
;;                            ___awdiv (ARG)
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _write                                                2     1      1     227
;;                                              4 COMMON     2     1      1
;;                           _i2cstart
;;                           _i2cwrite
;;                            _i2cstop
;; ---------------------------------------------------------------------------------
;; (1) _read                                                 3     3      0     321
;;                                              4 COMMON     3     3      0
;;                           _i2cstart
;;                           _i2cwrite
;;                            _i2cread
;;                            _i2cstop
;; ---------------------------------------------------------------------------------
;; (1) _lcdreset                                             0     0      0     158
;;                             _delay1
;;                      _lcd_write_com
;;                 _lcd_write_com_busy
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write_address                                    3     2      1     112
;;                                              2 COMMON     3     2      1
;;                 _lcd_write_com_busy
;; ---------------------------------------------------------------------------------
;; (2) _i2cread                                              4     4      0      93
;;                                              0 COMMON     4     4      0
;;                              _bitin
;;                             _bitout
;; ---------------------------------------------------------------------------------
;; (2) _i2cwrite                                             4     4      0      91
;;                                              0 COMMON     4     4      0
;;                             _bitout
;;                              _bitin
;; ---------------------------------------------------------------------------------
;; (2) _i2cstop                                              0     0      0      46
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _i2cstart                                             0     0      0      46
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write_data                                       1     1      0      22
;;                                              0 COMMON     1     1      0
;;                      _lcd_wait_busy
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_com_busy                                   1     1      0      44
;;                                              1 COMMON     1     1      0
;;                      _lcd_wait_busy
;;                      _lcd_write_com
;; ---------------------------------------------------------------------------------
;; (1) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              9     5      4     300
;;                                              7 COMMON     5     1      4
;;                                              0 BANK0      4     4      0
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _bitout                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _bitin                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                2     2      0      46
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _lcd_write_com                                        1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _lcd_wait_busy                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delay1                                               6     4      2      92
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;   _write
;;     _i2cstart
;;       _delay
;;     _i2cwrite
;;       _bitout
;;       _bitin
;;     _i2cstop
;;       _delay
;;   _lcdreset
;;     _delay1
;;     _lcd_write_com
;;     _lcd_write_com_busy
;;       _lcd_wait_busy
;;       _lcd_write_com
;;   _lcd_write_char
;;     _lcd_write_address
;;       _lcd_write_com_busy
;;         _lcd_wait_busy
;;         _lcd_write_com
;;     _lcd_write_data
;;       _lcd_wait_busy
;;     ___awdiv (ARG)
;;       ___awmod (ARG)
;;     ___awmod (ARG)
;;   ___awdiv
;;     ___awmod (ARG)
;;   ___awmod
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      1A       3        0.0%
;;BITBANK0            50      0       1       4        1.3%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A       C       5       15.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      1E      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 321 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             1    9[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_read
;;		_write
;;		_lcdreset
;;		_lcd_write_char
;;		___awdiv
;;		___awmod
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Experiment_15\AT24C02.C"
	line	321
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	324
	
l2417:	
;AT24C02.C: 322: unsigned char buf;
;AT24C02.C: 324: ADCON1=0X07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	326
;AT24C02.C: 326: TRISC=0B11000111;
	movlw	(0C7h)
	movwf	(135)^080h	;volatile
	line	327
;AT24C02.C: 327: TRISA=0B11001111;
	movlw	(0CFh)
	movwf	(133)^080h	;volatile
	line	328
	
l2419:	
;AT24C02.C: 328: TRISD=0B00000000;
	clrf	(136)^080h	;volatile
	line	329
	
l2421:	
;AT24C02.C: 329: buf=read(0x18);
	movlw	(018h)
	fcall	_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@buf)
	line	330
	
l2423:	
;AT24C02.C: 330: buf++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@buf),f
	line	331
	
l2425:	
;AT24C02.C: 331: write(0x18,buf);
	movf	(main@buf),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_write)
	movlw	(018h)
	fcall	_write
	line	333
	
l2427:	
;AT24C02.C: 333: lcdreset();
	fcall	_lcdreset
	line	334
	
l2429:	
;AT24C02.C: 334: lcd_write_char(0,0,'-');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(02Dh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0)
	fcall	_lcd_write_char
	line	335
	
l2431:	
;AT24C02.C: 335: lcd_write_char(1,0,'-');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(02Dh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(01h)
	fcall	_lcd_write_char
	line	336
	
l2433:	
;AT24C02.C: 336: lcd_write_char(2,0,'A');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(041h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(02h)
	fcall	_lcd_write_char
	line	337
	
l2435:	
;AT24C02.C: 337: lcd_write_char(3,0,'T');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(054h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(03h)
	fcall	_lcd_write_char
	line	338
	
l2437:	
;AT24C02.C: 338: lcd_write_char(4,0,'2');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(032h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(04h)
	fcall	_lcd_write_char
	line	339
	
l2439:	
;AT24C02.C: 339: lcd_write_char(5,0,'4');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(034h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(05h)
	fcall	_lcd_write_char
	line	340
	
l2441:	
;AT24C02.C: 340: lcd_write_char(6,0,'C');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(043h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(06h)
	fcall	_lcd_write_char
	line	341
	
l2443:	
;AT24C02.C: 341: lcd_write_char(7,0,'0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(030h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(07h)
	fcall	_lcd_write_char
	line	342
	
l2445:	
;AT24C02.C: 342: lcd_write_char(8,0,'2');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(032h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(08h)
	fcall	_lcd_write_char
	line	344
	
l2447:	
;AT24C02.C: 344: lcd_write_char(10,0,'T');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(054h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Ah)
	fcall	_lcd_write_char
	line	345
	
l2449:	
;AT24C02.C: 345: lcd_write_char(11,0,'E');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(045h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Bh)
	fcall	_lcd_write_char
	line	346
	
l2451:	
;AT24C02.C: 346: lcd_write_char(12,0,'S');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(053h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Ch)
	fcall	_lcd_write_char
	line	347
	
l2453:	
;AT24C02.C: 347: lcd_write_char(13,0,'T');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(054h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Dh)
	fcall	_lcd_write_char
	line	348
	
l2455:	
;AT24C02.C: 348: lcd_write_char(14,0,'-');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(02Dh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Eh)
	fcall	_lcd_write_char
	line	349
	
l2457:	
;AT24C02.C: 349: lcd_write_char(15,0,'-');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	movlw	(02Dh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Fh)
	fcall	_lcd_write_char
	line	351
	
l2459:	
;AT24C02.C: 351: lcd_write_char(0,1,'B');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(042h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0)
	fcall	_lcd_write_char
	line	352
	
l2461:	
;AT24C02.C: 352: lcd_write_char(1,1,'o');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(06Fh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(01h)
	fcall	_lcd_write_char
	line	353
	
l2463:	
;AT24C02.C: 353: lcd_write_char(2,1,'o');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(06Fh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(02h)
	fcall	_lcd_write_char
	line	354
	
l2465:	
;AT24C02.C: 354: lcd_write_char(3,1,'t');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(074h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(03h)
	fcall	_lcd_write_char
	line	356
	
l2467:	
;AT24C02.C: 356: lcd_write_char(5,1,'t');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(074h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(05h)
	fcall	_lcd_write_char
	line	357
	
l2469:	
;AT24C02.C: 357: lcd_write_char(6,1,'i');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(069h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(06h)
	fcall	_lcd_write_char
	line	358
	
l2471:	
;AT24C02.C: 358: lcd_write_char(7,1,'m');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(06Dh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(07h)
	fcall	_lcd_write_char
	line	359
	
l2473:	
;AT24C02.C: 359: lcd_write_char(8,1,'e');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(065h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(08h)
	fcall	_lcd_write_char
	line	360
	
l2475:	
;AT24C02.C: 360: lcd_write_char(9,1,'s');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(073h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(09h)
	fcall	_lcd_write_char
	line	361
	
l2477:	
;AT24C02.C: 361: lcd_write_char(10,1,':');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	(03Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Ah)
	fcall	_lcd_write_char
	line	363
	
l2479:	
;AT24C02.C: 363: lcd_write_char(12,1,buf/100+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	low(064h)
	movwf	(?___awdiv)
	movlw	high(064h)
	movwf	((?___awdiv))+1
	movf	(main@buf),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Ch)
	fcall	_lcd_write_char
	line	364
	
l2481:	
;AT24C02.C: 364: lcd_write_char(13,1,(buf%100)/10+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(main@buf),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	movf	(1+(?___awmod)),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(0+(?___awmod)),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Dh)
	fcall	_lcd_write_char
	line	365
	
l2483:	
;AT24C02.C: 365: lcd_write_char(14,1,buf%10+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_write_char)
	bsf	status,0
	rlf	(?_lcd_write_char),f
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(main@buf),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	0+(?_lcd_write_char)+01h
	movlw	(0Eh)
	fcall	_lcd_write_char
	goto	l766
	line	366
;AT24C02.C: 366: while(1)
	
l765:	
	line	368
;AT24C02.C: 367: {
	
l766:	
	line	366
	goto	l766
	
l767:	
	line	369
	
l768:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_write_char
psect	text391,local,class=CODE,delta=2
global __ptext391
__ptext391:

;; *************** function _lcd_write_char *****************
;; Defined at:
;;		line 131 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;;  y               1    4[BANK0 ] unsigned char 
;;  buf             1    5[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       2       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write_address
;;		_lcd_write_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text391
	file	"F:\Experiment_15\AT24C02.C"
	line	131
	global	__size_of_lcd_write_char
	__size_of_lcd_write_char	equ	__end_of_lcd_write_char-_lcd_write_char
	
_lcd_write_char:	
	opt	stack 4
; Regs used in _lcd_write_char: [wreg+status,2+status,0+pclath+cstack]
;lcd_write_char@x stored from wreg
	movwf	(lcd_write_char@x)
	line	132
	
l2415:	
;AT24C02.C: 132: lcd_write_address(x,y);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_char@y),w
	movwf	(??_lcd_write_char+0)+0
	movf	(??_lcd_write_char+0)+0,w
	movwf	(?_lcd_write_address)
	movf	(lcd_write_char@x),w
	fcall	_lcd_write_address
	line	133
;AT24C02.C: 133: lcd_write_data(buf);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_char@buf),w
	fcall	_lcd_write_data
	line	134
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_char
	__end_of_lcd_write_char:
;; =============== function _lcd_write_char ends ============

	signat	_lcd_write_char,12408
	global	_write
psect	text392,local,class=CODE,delta=2
global __ptext392
__ptext392:

;; *************** function _write *****************
;; Defined at:
;;		line 309 in file "F:\Experiment_15\AT24C02.C"
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
psect	text392
	file	"F:\Experiment_15\AT24C02.C"
	line	309
	global	__size_of_write
	__size_of_write	equ	__end_of_write-_write
	
_write:	
	opt	stack 5
; Regs used in _write: [wreg+status,2+status,0+pclath+cstack]
;write@address1 stored from wreg
	movwf	(write@address1)
	line	310
	
l2413:	
;AT24C02.C: 310: i2cstart();
	fcall	_i2cstart
	line	311
;AT24C02.C: 311: i2cwrite(0xa0);
	movlw	(0A0h)
	fcall	_i2cwrite
	line	312
;AT24C02.C: 312: i2cwrite(address1);
	movf	(write@address1),w
	fcall	_i2cwrite
	line	313
;AT24C02.C: 313: i2cwrite(byte);
	movf	(write@byte),w
	fcall	_i2cwrite
	line	314
;AT24C02.C: 314: i2cstop();
	fcall	_i2cstop
	line	315
	
l762:	
	return
	opt stack 0
GLOBAL	__end_of_write
	__end_of_write:
;; =============== function _write ends ============

	signat	_write,8312
	global	_read
psect	text393,local,class=CODE,delta=2
global __ptext393
__ptext393:

;; *************** function _read *****************
;; Defined at:
;;		line 293 in file "F:\Experiment_15\AT24C02.C"
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
psect	text393
	file	"F:\Experiment_15\AT24C02.C"
	line	293
	global	__size_of_read
	__size_of_read	equ	__end_of_read-_read
	
_read:	
	opt	stack 5
; Regs used in _read: [wreg+status,2+status,0+pclath+cstack]
;read@address stored from wreg
	line	295
	movwf	(read@address)
	
l2407:	
;AT24C02.C: 294: unsigned char eebuf3;
;AT24C02.C: 295: i2cstart();
	fcall	_i2cstart
	line	296
;AT24C02.C: 296: i2cwrite(0xa0);
	movlw	(0A0h)
	fcall	_i2cwrite
	line	297
;AT24C02.C: 297: i2cwrite(address);
	movf	(read@address),w
	fcall	_i2cwrite
	line	298
;AT24C02.C: 298: i2cstart();
	fcall	_i2cstart
	line	299
;AT24C02.C: 299: i2cwrite(0xa1);
	movlw	(0A1h)
	fcall	_i2cwrite
	line	300
;AT24C02.C: 300: eebuf3=i2cread();
	fcall	_i2cread
	movwf	(??_read+0)+0
	movf	(??_read+0)+0,w
	movwf	(read@eebuf3)
	line	301
;AT24C02.C: 301: i2cstop();
	fcall	_i2cstop
	line	302
	
l2409:	
;AT24C02.C: 302: return eebuf3;
	movf	(read@eebuf3),w
	goto	l759
	
l2411:	
	line	303
	
l759:	
	return
	opt stack 0
GLOBAL	__end_of_read
	__end_of_read:
;; =============== function _read ends ============

	signat	_read,4217
	global	_lcdreset
psect	text394,local,class=CODE,delta=2
global __ptext394
__ptext394:

;; *************** function _lcdreset *****************
;; Defined at:
;;		line 112 in file "F:\Experiment_15\AT24C02.C"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay1
;;		_lcd_write_com
;;		_lcd_write_com_busy
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text394
	file	"F:\Experiment_15\AT24C02.C"
	line	112
	global	__size_of_lcdreset
	__size_of_lcdreset	equ	__end_of_lcdreset-_lcdreset
	
_lcdreset:	
	opt	stack 5
; Regs used in _lcdreset: [wreg+status,2+status,0+pclath+cstack]
	line	113
	
l2405:	
;AT24C02.C: 113: delay1(150);
	movlw	low(096h)
	movwf	(?_delay1)
	movlw	high(096h)
	movwf	((?_delay1))+1
	fcall	_delay1
	line	114
;AT24C02.C: 114: lcd_write_com(0x38);
	movlw	(038h)
	fcall	_lcd_write_com
	line	115
;AT24C02.C: 115: delay1(50);
	movlw	low(032h)
	movwf	(?_delay1)
	movlw	high(032h)
	movwf	((?_delay1))+1
	fcall	_delay1
	line	116
;AT24C02.C: 116: lcd_write_com(0x38);
	movlw	(038h)
	fcall	_lcd_write_com
	line	117
;AT24C02.C: 117: delay1(50);
	movlw	low(032h)
	movwf	(?_delay1)
	movlw	high(032h)
	movwf	((?_delay1))+1
	fcall	_delay1
	line	118
;AT24C02.C: 118: lcd_write_com(0x38);
	movlw	(038h)
	fcall	_lcd_write_com
	line	119
;AT24C02.C: 119: lcd_write_com_busy(0x38);
	movlw	(038h)
	fcall	_lcd_write_com_busy
	line	120
;AT24C02.C: 120: lcd_write_com_busy(0x08);
	movlw	(08h)
	fcall	_lcd_write_com_busy
	line	121
;AT24C02.C: 121: lcd_write_com_busy(0x01);
	movlw	(01h)
	fcall	_lcd_write_com_busy
	line	122
;AT24C02.C: 122: lcd_write_com_busy(0x06);
	movlw	(06h)
	fcall	_lcd_write_com_busy
	line	123
;AT24C02.C: 123: lcd_write_com_busy(0x0c);
	movlw	(0Ch)
	fcall	_lcd_write_com_busy
	line	124
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_lcdreset
	__end_of_lcdreset:
;; =============== function _lcdreset ends ============

	signat	_lcdreset,88
	global	_lcd_write_address
psect	text395,local,class=CODE,delta=2
global __ptext395
__ptext395:

;; *************** function _lcd_write_address *****************
;; Defined at:
;;		line 98 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;;  y               1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    4[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_write_com_busy
;; This function is called by:
;;		_lcd_write_char
;; This function uses a non-reentrant model
;;
psect	text395
	file	"F:\Experiment_15\AT24C02.C"
	line	98
	global	__size_of_lcd_write_address
	__size_of_lcd_write_address	equ	__end_of_lcd_write_address-_lcd_write_address
	
_lcd_write_address:	
	opt	stack 4
; Regs used in _lcd_write_address: [wreg+status,2+status,0+pclath+cstack]
;lcd_write_address@x stored from wreg
	movwf	(lcd_write_address@x)
	line	99
	
l2397:	
;AT24C02.C: 99: x&=0x0f;
	movlw	(0Fh)
	movwf	(??_lcd_write_address+0)+0
	movf	(??_lcd_write_address+0)+0,w
	andwf	(lcd_write_address@x),f
	line	100
	
l2399:	
;AT24C02.C: 100: y&=0x01;
	movlw	(01h)
	movwf	(??_lcd_write_address+0)+0
	movf	(??_lcd_write_address+0)+0,w
	andwf	(lcd_write_address@y),f
	line	101
;AT24C02.C: 101: if(y==0x00)
	movf	(lcd_write_address@y),f
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l2403
u2640:
	line	102
	
l2401:	
;AT24C02.C: 102: lcd_write_com_busy(x|0x80);
	movf	(lcd_write_address@x),w
	iorlw	080h
	fcall	_lcd_write_com_busy
	goto	l719
	line	103
	
l717:	
	line	104
	
l2403:	
;AT24C02.C: 103: else
;AT24C02.C: 104: lcd_write_com_busy((x+0x40)|0x80);
	movf	(lcd_write_address@x),w
	addlw	040h
	iorlw	080h
	fcall	_lcd_write_com_busy
	goto	l719
	
l718:	
	line	105
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_address
	__end_of_lcd_write_address:
;; =============== function _lcd_write_address ends ============

	signat	_lcd_write_address,8312
	global	_i2cread
psect	text396,local,class=CODE,delta=2
global __ptext396
__ptext396:

;; *************** function _i2cread *****************
;; Defined at:
;;		line 267 in file "F:\Experiment_15\AT24C02.C"
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
psect	text396
	file	"F:\Experiment_15\AT24C02.C"
	line	267
	global	__size_of_i2cread
	__size_of_i2cread	equ	__end_of_i2cread-_i2cread
	
_i2cread:	
	opt	stack 5
; Regs used in _i2cread: [wreg+status,2+status,0+pclath+cstack]
	line	270
	
l2371:	
;AT24C02.C: 268: unsigned char redata;
;AT24C02.C: 269: unsigned char m;
;AT24C02.C: 270: for(m=0;m<8;m++)
	clrf	(i2cread@m)
	
l2373:	
	movlw	(08h)
	subwf	(i2cread@m),w
	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l2377
u2610:
	goto	l753
	
l2375:	
	goto	l753
	line	271
	
l752:	
	line	272
	
l2377:	
;AT24C02.C: 271: {
;AT24C02.C: 272: redata=redata<<1;
	movf	(i2cread@redata),w
	movwf	(??_i2cread+0)+0
	addwf	(??_i2cread+0)+0,w
	movwf	(??_i2cread+1)+0
	movf	(??_i2cread+1)+0,w
	movwf	(i2cread@redata)
	line	273
	
l2379:	
;AT24C02.C: 273: bitin();
	fcall	_bitin
	line	274
	
l2381:	
;AT24C02.C: 274: if(eepromdi==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_eepromdi/8),(_eepromdi)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l2385
u2620:
	line	276
	
l2383:	
;AT24C02.C: 275: {
;AT24C02.C: 276: redata|=0x01;
	bsf	(i2cread@redata)+(0/8),(0)&7
	line	277
;AT24C02.C: 277: }
	goto	l2387
	line	278
	
l754:	
	line	280
	
l2385:	
;AT24C02.C: 278: else
;AT24C02.C: 279: {
;AT24C02.C: 280: redata&=0xfe;
	movlw	(0FEh)
	movwf	(??_i2cread+0)+0
	movf	(??_i2cread+0)+0,w
	andwf	(i2cread@redata),f
	goto	l2387
	line	281
	
l755:	
	line	282
	
l2387:	
# 282 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text396
	line	270
	movlw	(01h)
	movwf	(??_i2cread+0)+0
	movf	(??_i2cread+0)+0,w
	addwf	(i2cread@m),f
	
l2389:	
	movlw	(08h)
	subwf	(i2cread@m),w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l2377
u2630:
	
l753:	
	line	284
;AT24C02.C: 283: }
;AT24C02.C: 284: eepromdo=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_eepromdo/8),(_eepromdo)&7
	line	285
	
l2391:	
;AT24C02.C: 285: bitout();
	fcall	_bitout
	line	286
	
l2393:	
;AT24C02.C: 286: return redata;
	movf	(i2cread@redata),w
	goto	l756
	
l2395:	
	line	287
	
l756:	
	return
	opt stack 0
GLOBAL	__end_of_i2cread
	__end_of_i2cread:
;; =============== function _i2cread ends ============

	signat	_i2cread,89
	global	_i2cwrite
psect	text397,local,class=CODE,delta=2
global __ptext397
__ptext397:

;; *************** function _i2cwrite *****************
;; Defined at:
;;		line 245 in file "F:\Experiment_15\AT24C02.C"
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
psect	text397
	file	"F:\Experiment_15\AT24C02.C"
	line	245
	global	__size_of_i2cwrite
	__size_of_i2cwrite	equ	__end_of_i2cwrite-_i2cwrite
	
_i2cwrite:	
	opt	stack 5
; Regs used in _i2cwrite: [wreg+status,2+status,0+pclath+cstack]
;i2cwrite@sedata stored from wreg
	line	247
	movwf	(i2cwrite@sedata)
	
l2353:	
;AT24C02.C: 246: unsigned char k;
;AT24C02.C: 247: for(k=0;k<8;k++)
	clrf	(i2cwrite@k)
	
l2355:	
	movlw	(08h)
	subwf	(i2cwrite@k),w
	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l745
u2580:
	goto	l2369
	
l2357:	
	goto	l2369
	line	248
	
l745:	
	line	249
;AT24C02.C: 248: {
;AT24C02.C: 249: if(sedata&0x80)
	btfss	(i2cwrite@sedata),(7)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l747
u2590:
	line	251
	
l2359:	
;AT24C02.C: 250: {
;AT24C02.C: 251: eepromdo=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_eepromdo/8),(_eepromdo)&7
	line	252
;AT24C02.C: 252: }
	goto	l2361
	line	253
	
l747:	
	line	255
;AT24C02.C: 253: else
;AT24C02.C: 254: {
;AT24C02.C: 255: eepromdo=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_eepromdo/8),(_eepromdo)&7
	goto	l2361
	line	256
	
l748:	
	line	257
	
l2361:	
;AT24C02.C: 256: }
;AT24C02.C: 257: sedata=sedata<<1;
	movf	(i2cwrite@sedata),w
	movwf	(??_i2cwrite+0)+0
	addwf	(??_i2cwrite+0)+0,w
	movwf	(??_i2cwrite+1)+0
	movf	(??_i2cwrite+1)+0,w
	movwf	(i2cwrite@sedata)
	line	258
	
l2363:	
;AT24C02.C: 258: bitout();
	fcall	_bitout
	line	247
	
l2365:	
	movlw	(01h)
	movwf	(??_i2cwrite+0)+0
	movf	(??_i2cwrite+0)+0,w
	addwf	(i2cwrite@k),f
	
l2367:	
	movlw	(08h)
	subwf	(i2cwrite@k),w
	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l745
u2600:
	goto	l2369
	
l746:	
	line	260
	
l2369:	
;AT24C02.C: 259: }
;AT24C02.C: 260: bitin();
	fcall	_bitin
	line	261
	
l749:	
	return
	opt stack 0
GLOBAL	__end_of_i2cwrite
	__end_of_i2cwrite:
;; =============== function _i2cwrite ends ============

	signat	_i2cwrite,4216
	global	_i2cstop
psect	text398,local,class=CODE,delta=2
global __ptext398
__ptext398:

;; *************** function _i2cstop *****************
;; Defined at:
;;		line 171 in file "F:\Experiment_15\AT24C02.C"
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
psect	text398
	file	"F:\Experiment_15\AT24C02.C"
	line	171
	global	__size_of_i2cstop
	__size_of_i2cstop	equ	__end_of_i2cstop-_i2cstop
	
_i2cstop:	
	opt	stack 5
; Regs used in _i2cstop: [wreg+status,2+status,0+pclath+cstack]
	line	172
	
l2345:	
;AT24C02.C: 172: RA5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	line	173
;AT24C02.C: 173: RA5=0;
	bcf	(45/8),(45)&7
	line	174
# 174 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	175
# 175 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	176
# 176 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	177
# 177 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	178
# 178 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text398
	line	179
;AT24C02.C: 179: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	180
	
l2347:	
;AT24C02.C: 180: delay();
	fcall	_delay
	line	181
	
l2349:	
;AT24C02.C: 181: RA5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	line	182
;AT24C02.C: 182: delay();
	fcall	_delay
	line	183
	
l2351:	
;AT24C02.C: 183: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	184
;AT24C02.C: 184: delay();
	fcall	_delay
	line	185
	
l736:	
	return
	opt stack 0
GLOBAL	__end_of_i2cstop
	__end_of_i2cstop:
;; =============== function _i2cstop ends ============

	signat	_i2cstop,88
	global	_i2cstart
psect	text399,local,class=CODE,delta=2
global __ptext399
__ptext399:

;; *************** function _i2cstart *****************
;; Defined at:
;;		line 151 in file "F:\Experiment_15\AT24C02.C"
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
psect	text399
	file	"F:\Experiment_15\AT24C02.C"
	line	151
	global	__size_of_i2cstart
	__size_of_i2cstart	equ	__end_of_i2cstart-_i2cstart
	
_i2cstart:	
	opt	stack 5
; Regs used in _i2cstart: [wreg+status,2+status,0+pclath+cstack]
	line	152
	
l2337:	
;AT24C02.C: 152: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	153
# 153 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	154
# 154 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	155
# 155 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	156
# 156 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	157
# 157 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text399
	line	158
;AT24C02.C: 158: RA5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	line	159
	
l2339:	
;AT24C02.C: 159: delay();
	fcall	_delay
	line	160
	
l2341:	
;AT24C02.C: 160: RA5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	line	161
;AT24C02.C: 161: delay();
	fcall	_delay
	line	162
	
l2343:	
;AT24C02.C: 162: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	163
;AT24C02.C: 163: delay();
	fcall	_delay
	line	164
	
l733:	
	return
	opt stack 0
GLOBAL	__end_of_i2cstart
	__end_of_i2cstart:
;; =============== function _i2cstart ends ============

	signat	_i2cstart,88
	global	_lcd_write_data
psect	text400,local,class=CODE,delta=2
global __ptext400
__ptext400:

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 83 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  databuf         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  databuf         1    0[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_wait_busy
;; This function is called by:
;;		_lcd_write_char
;; This function uses a non-reentrant model
;;
psect	text400
	file	"F:\Experiment_15\AT24C02.C"
	line	83
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
	opt	stack 5
; Regs used in _lcd_write_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_write_data@databuf stored from wreg
	movwf	(lcd_write_data@databuf)
	line	84
	
l2323:	
;AT24C02.C: 84: lcd_wait_busy();
	fcall	_lcd_wait_busy
	line	85
	
l2325:	
;AT24C02.C: 85: RC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	86
	
l2327:	
;AT24C02.C: 86: RC4=0;
	bcf	(60/8),(60)&7
	line	87
	
l2329:	
;AT24C02.C: 87: PORTD=databuf;
	movf	(lcd_write_data@databuf),w
	movwf	(8)	;volatile
	line	88
	
l2331:	
;AT24C02.C: 88: RC5=1;
	bsf	(61/8),(61)&7
	line	89
	
l2333:	
# 89 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text400
	line	90
	
l2335:	
;AT24C02.C: 90: RC5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	91
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_data
	__end_of_lcd_write_data:
;; =============== function _lcd_write_data ends ============

	signat	_lcd_write_data,4216
	global	_lcd_write_com_busy
psect	text401,local,class=CODE,delta=2
global __ptext401
__ptext401:

;; *************** function _lcd_write_com_busy *****************
;; Defined at:
;;		line 73 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  combuf          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  combuf          1    1[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_wait_busy
;;		_lcd_write_com
;; This function is called by:
;;		_lcd_write_address
;;		_lcdreset
;; This function uses a non-reentrant model
;;
psect	text401
	file	"F:\Experiment_15\AT24C02.C"
	line	73
	global	__size_of_lcd_write_com_busy
	__size_of_lcd_write_com_busy	equ	__end_of_lcd_write_com_busy-_lcd_write_com_busy
	
_lcd_write_com_busy:	
	opt	stack 4
; Regs used in _lcd_write_com_busy: [wreg+status,2+status,0+pclath+cstack]
;lcd_write_com_busy@combuf stored from wreg
	movwf	(lcd_write_com_busy@combuf)
	line	74
	
l2319:	
;AT24C02.C: 74: lcd_wait_busy();
	fcall	_lcd_wait_busy
	line	75
	
l2321:	
;AT24C02.C: 75: lcd_write_com(combuf);
	movf	(lcd_write_com_busy@combuf),w
	fcall	_lcd_write_com
	line	76
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_com_busy
	__end_of_lcd_write_com_busy:
;; =============== function _lcd_write_com_busy ends ============

	signat	_lcd_write_com_busy,4216
	global	___awmod
psect	text402,local,class=CODE,delta=2
global __ptext402
__ptext402:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.81\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text402
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.81\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 7
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2285:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2491
	goto	u2490
u2491:
	goto	l2289
u2490:
	line	10
	
l2287:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2289
	line	12
	
l985:	
	line	13
	
l2289:	
	btfss	(___awmod@divisor+1),7
	goto	u2501
	goto	u2500
u2501:
	goto	l2293
u2500:
	line	14
	
l2291:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2293
	
l986:	
	line	15
	
l2293:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2511
	goto	u2510
u2511:
	goto	l2311
u2510:
	line	16
	
l2295:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2301
	
l989:	
	line	18
	
l2297:	
	movlw	01h
	
u2525:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2525
	line	19
	
l2299:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2301
	line	20
	
l988:	
	line	17
	
l2301:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l2297
u2530:
	goto	l2303
	
l990:	
	goto	l2303
	line	21
	
l991:	
	line	22
	
l2303:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2545
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2545:
	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l2307
u2540:
	line	23
	
l2305:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2307
	
l992:	
	line	24
	
l2307:	
	movlw	01h
	
u2555:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2555
	line	25
	
l2309:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2561
	goto	u2560
u2561:
	goto	l2303
u2560:
	goto	l2311
	
l993:	
	goto	l2311
	line	26
	
l987:	
	line	27
	
l2311:	
	movf	(___awmod@sign),w
	skipz
	goto	u2570
	goto	l2315
u2570:
	line	28
	
l2313:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2315
	
l994:	
	line	29
	
l2315:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l995
	
l2317:	
	line	30
	
l995:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text403,local,class=CODE,delta=2
global __ptext403
__ptext403:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.81\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    7[COMMON] int 
;;  dividend        2    9[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    2[BANK0 ] int 
;;  sign            1    1[BANK0 ] unsigned char 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       4       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text403
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.81\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 7
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2245:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2391
	goto	u2390
u2391:
	goto	l2249
u2390:
	line	11
	
l2247:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2249
	line	13
	
l917:	
	line	14
	
l2249:	
	btfss	(___awdiv@dividend+1),7
	goto	u2401
	goto	u2400
u2401:
	goto	l2255
u2400:
	line	15
	
l2251:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2253:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2255
	line	17
	
l918:	
	line	18
	
l2255:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2257:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2411
	goto	u2410
u2411:
	goto	l2277
u2410:
	line	20
	
l2259:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2265
	
l921:	
	line	22
	
l2261:	
	movlw	01h
	
u2425:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2425
	line	23
	
l2263:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2265
	line	24
	
l920:	
	line	21
	
l2265:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l2261
u2430:
	goto	l2267
	
l922:	
	goto	l2267
	line	25
	
l923:	
	line	26
	
l2267:	
	movlw	01h
	
u2445:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2445
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2455
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2455:
	skipc
	goto	u2451
	goto	u2450
u2451:
	goto	l2273
u2450:
	line	28
	
l2269:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2271:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2273
	line	30
	
l924:	
	line	31
	
l2273:	
	movlw	01h
	
u2465:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2465
	line	32
	
l2275:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2471
	goto	u2470
u2471:
	goto	l2267
u2470:
	goto	l2277
	
l925:	
	goto	l2277
	line	33
	
l919:	
	line	34
	
l2277:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2480
	goto	l2281
u2480:
	line	35
	
l2279:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2281
	
l926:	
	line	36
	
l2281:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l927
	
l2283:	
	line	37
	
l927:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_bitout
psect	text404,local,class=CODE,delta=2
global __ptext404
__ptext404:

;; *************** function _bitout *****************
;; Defined at:
;;		line 220 in file "F:\Experiment_15\AT24C02.C"
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
psect	text404
	file	"F:\Experiment_15\AT24C02.C"
	line	220
	global	__size_of_bitout
	__size_of_bitout	equ	__end_of_bitout-_bitout
	
_bitout:	
	opt	stack 5
; Regs used in _bitout: []
	line	221
	
l2243:	
;AT24C02.C: 221: RA5=eepromdo;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(_eepromdo/8),(_eepromdo)&7
	goto	u2371
	goto	u2370
	
u2371:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	goto	u2384
u2370:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
u2384:
	line	222
# 222 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	223
# 223 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	224
# 224 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	225
# 225 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	226
# 226 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text404
	line	227
;AT24C02.C: 227: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	228
# 228 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	229
# 229 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	230
# 230 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	231
# 231 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	232
# 232 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text404
	line	233
;AT24C02.C: 233: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	234
# 234 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	235
# 235 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	236
# 236 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	237
# 237 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	238
# 238 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text404
	line	239
	
l742:	
	return
	opt stack 0
GLOBAL	__end_of_bitout
	__end_of_bitout:
;; =============== function _bitout ends ============

	signat	_bitout,88
	global	_bitin
psect	text405,local,class=CODE,delta=2
global __ptext405
__ptext405:

;; *************** function _bitin *****************
;; Defined at:
;;		line 192 in file "F:\Experiment_15\AT24C02.C"
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
psect	text405
	file	"F:\Experiment_15\AT24C02.C"
	line	192
	global	__size_of_bitin
	__size_of_bitin	equ	__end_of_bitin-_bitin
	
_bitin:	
	opt	stack 5
; Regs used in _bitin: []
	line	193
	
l2241:	
;AT24C02.C: 193: eepromdi=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_eepromdi/8),(_eepromdi)&7
	line	194
;AT24C02.C: 194: TRISA5=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1069/8)^080h,(1069)&7
	line	195
;AT24C02.C: 195: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	line	196
# 196 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	197
# 197 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	198
# 198 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	199
# 199 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	200
# 200 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text405
	line	201
;AT24C02.C: 201: eepromdi=RA5;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_eepromdi/8),(_eepromdi)&7
	btfss	(45/8),(45)&7
	goto	u2365
	bsf	(_eepromdi/8),(_eepromdi)&7
u2365:

	line	202
# 202 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	203
# 203 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	204
# 204 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	205
# 205 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	206
# 206 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text405
	line	207
;AT24C02.C: 207: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
	line	208
# 208 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	209
# 209 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	210
# 210 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	211
# 211 "F:\Experiment_15\AT24C02.C"
NOP ;#
	line	212
# 212 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text405
	line	213
;AT24C02.C: 213: TRISA5=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1069/8)^080h,(1069)&7
	line	214
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_bitin
	__end_of_bitin:
;; =============== function _bitin ends ============

	signat	_bitin,88
	global	_delay
psect	text406,local,class=CODE,delta=2
global __ptext406
__ptext406:

;; *************** function _delay *****************
;; Defined at:
;;		line 141 in file "F:\Experiment_15\AT24C02.C"
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
psect	text406
	file	"F:\Experiment_15\AT24C02.C"
	line	141
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg+status,2+status,0]
	line	143
	
l2231:	
;AT24C02.C: 142: unsigned char k;
;AT24C02.C: 143: for(k=0;k<180;k++);
	clrf	(delay@k)
	
l2233:	
	movlw	(0B4h)
	subwf	(delay@k),w
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l2237
u2340:
	goto	l730
	
l2235:	
	goto	l730
	
l728:	
	
l2237:	
	movlw	(01h)
	movwf	(??_delay+0)+0
	movf	(??_delay+0)+0,w
	addwf	(delay@k),f
	
l2239:	
	movlw	(0B4h)
	subwf	(delay@k),w
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l2237
u2350:
	goto	l730
	
l729:	
	line	144
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
	global	_lcd_write_com
psect	text407,local,class=CODE,delta=2
global __ptext407
__ptext407:

;; *************** function _lcd_write_com *****************
;; Defined at:
;;		line 59 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  combuf          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  combuf          1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_write_com_busy
;;		_lcdreset
;; This function uses a non-reentrant model
;;
psect	text407
	file	"F:\Experiment_15\AT24C02.C"
	line	59
	global	__size_of_lcd_write_com
	__size_of_lcd_write_com	equ	__end_of_lcd_write_com-_lcd_write_com
	
_lcd_write_com:	
	opt	stack 4
; Regs used in _lcd_write_com: [wreg]
;lcd_write_com@combuf stored from wreg
	movwf	(lcd_write_com@combuf)
	line	60
	
l2221:	
;AT24C02.C: 60: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	61
;AT24C02.C: 61: RC4=0;
	bcf	(60/8),(60)&7
	line	62
	
l2223:	
;AT24C02.C: 62: PORTD=combuf;
	movf	(lcd_write_com@combuf),w
	movwf	(8)	;volatile
	line	63
	
l2225:	
;AT24C02.C: 63: RC5=1;
	bsf	(61/8),(61)&7
	line	64
	
l2227:	
# 64 "F:\Experiment_15\AT24C02.C"
NOP ;#
psect	text407
	line	65
	
l2229:	
;AT24C02.C: 65: RC5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	66
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_com
	__end_of_lcd_write_com:
;; =============== function _lcd_write_com ends ============

	signat	_lcd_write_com,4216
	global	_lcd_wait_busy
psect	text408,local,class=CODE,delta=2
global __ptext408
__ptext408:

;; *************** function _lcd_wait_busy *****************
;; Defined at:
;;		line 45 in file "F:\Experiment_15\AT24C02.C"
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
;;		_lcd_write_com_busy
;;		_lcd_write_data
;; This function uses a non-reentrant model
;;
psect	text408
	file	"F:\Experiment_15\AT24C02.C"
	line	45
	global	__size_of_lcd_wait_busy
	__size_of_lcd_wait_busy	equ	__end_of_lcd_wait_busy-_lcd_wait_busy
	
_lcd_wait_busy:	
	opt	stack 5
; Regs used in _lcd_wait_busy: []
	line	46
	
l2219:	
;AT24C02.C: 46: TRISD7=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1095/8)^080h,(1095)&7
	line	47
;AT24C02.C: 47: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	48
;AT24C02.C: 48: RC4=1;
	bsf	(60/8),(60)&7
	line	49
;AT24C02.C: 49: RC5=1;
	bsf	(61/8),(61)&7
	line	50
;AT24C02.C: 50: while(RD7==1);
	goto	l702
	
l703:	
	
l702:	
	btfsc	(71/8),(71)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l702
u2330:
	
l704:	
	line	51
;AT24C02.C: 51: RC5=0;
	bcf	(61/8),(61)&7
	line	52
;AT24C02.C: 52: TRISD7=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1095/8)^080h,(1095)&7
	line	53
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_wait_busy
	__end_of_lcd_wait_busy:
;; =============== function _lcd_wait_busy ends ============

	signat	_lcd_wait_busy,88
	global	_delay1
psect	text409,local,class=CODE,delta=2
global __ptext409
__ptext409:

;; *************** function _delay1 *****************
;; Defined at:
;;		line 32 in file "F:\Experiment_15\AT24C02.C"
;; Parameters:    Size  Location     Type
;;  t               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  j               2    4[COMMON] unsigned int 
;;  i               2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcdreset
;; This function uses a non-reentrant model
;;
psect	text409
	file	"F:\Experiment_15\AT24C02.C"
	line	32
	global	__size_of_delay1
	__size_of_delay1	equ	__end_of_delay1-_delay1
	
_delay1:	
	opt	stack 6
; Regs used in _delay1: [wreg+status,2]
	line	34
	
l2207:	
;AT24C02.C: 33: unsigned int i,j;
;AT24C02.C: 34: for(i=0;i<t;i++)
	clrf	(delay1@i)
	clrf	(delay1@i+1)
	goto	l694
	line	35
	
l695:	
	line	36
	
l2209:	
;AT24C02.C: 35: {
;AT24C02.C: 36: for(j=0;j<10;j++);
	clrf	(delay1@j)
	clrf	(delay1@j+1)
	
l2211:	
	movlw	high(0Ah)
	subwf	(delay1@j+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(delay1@j),w
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l2215
u2300:
	goto	l2217
	
l2213:	
	goto	l2217
	
l696:	
	
l2215:	
	movlw	low(01h)
	addwf	(delay1@j),f
	skipnc
	incf	(delay1@j+1),f
	movlw	high(01h)
	addwf	(delay1@j+1),f
	movlw	high(0Ah)
	subwf	(delay1@j+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(delay1@j),w
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l2215
u2310:
	goto	l2217
	
l697:	
	line	34
	
l2217:	
	movlw	low(01h)
	addwf	(delay1@i),f
	skipnc
	incf	(delay1@i+1),f
	movlw	high(01h)
	addwf	(delay1@i+1),f
	
l694:	
	movf	(delay1@t+1),w
	subwf	(delay1@i+1),w
	skipz
	goto	u2325
	movf	(delay1@t),w
	subwf	(delay1@i),w
u2325:
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l2209
u2320:
	goto	l699
	
l698:	
	line	38
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_delay1
	__end_of_delay1:
;; =============== function _delay1 ends ============

	signat	_delay1,4216
psect	text410,local,class=CODE,delta=2
global __ptext410
__ptext410:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
