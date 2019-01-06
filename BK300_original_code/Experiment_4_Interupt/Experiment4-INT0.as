opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

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
# 13 "F:\Experiment_4\INT0.C"
	psect config,class=CONFIG,delta=2 ;#
# 13 "F:\Experiment_4\INT0.C"
	dw 0x3F32 ;#
	FNCALL	_main,_Board_init
	FNROOT	_main
	FNCALL	intlevel1,_INT
	global	intlevel1
	FNROOT	intlevel1
	global	_INTCON
psect	text36,local,class=CODE,delta=2
global __ptext36
__ptext36:
_INTCON	set	11
	global	_PORTD
_PORTD	set	8
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RD0
_RD0	set	64
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
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
	file	"Experiment4-INT0.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_INT
?_INT:	; 0 bytes @ 0x0
	global	??_INT
??_INT:	; 0 bytes @ 0x0
	ds	2
	global	??_Board_init
??_Board_init:	; 0 bytes @ 0x2
	global	??_main
??_main:	; 0 bytes @ 0x2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      2       2
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _INT in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _INT in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _INT in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _INT in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _INT in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0       0
;;                         _Board_init
;; ---------------------------------------------------------------------------------
;; (1) _Board_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _INT                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Board_init
;;
;; _INT (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      2       2       1       14.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
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
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 18 in file "F:\Experiment_4\INT0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Board_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Experiment_4\INT0.C"
	line	18
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	20
	
l1790:	
;INT0.C: 19: unsigned char key;
;INT0.C: 20: Board_init();
	fcall	_Board_init
	line	21
	
l1792:	
;INT0.C: 21: TRISB=0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	23
	
l1794:	
;INT0.C: 23: RC5=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(61/8),(61)&7
	line	25
	
l1796:	
;INT0.C: 25: INTE=1;
	bsf	(92/8),(92)&7
	line	26
	
l1798:	
;INT0.C: 26: GIE=1;
	bsf	(95/8),(95)&7
	line	27
	
l1800:	
;INT0.C: 27: PEIE=1;
	bsf	(94/8),(94)&7
	line	29
	
l689:	
	goto	l689
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	30
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Board_init
psect	text37,local,class=CODE,delta=2
global __ptext37
__ptext37:

;; *************** function _Board_init *****************
;; Defined at:
;;		line 18 in file "F:\Experiment_4\BoardConfig.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text37
	file	"F:\Experiment_4\BoardConfig.h"
	line	18
	global	__size_of_Board_init
	__size_of_Board_init	equ	__end_of_Board_init-_Board_init
	
_Board_init:	
	opt	stack 6
; Regs used in _Board_init: [wreg+status,2]
	line	21
	
l1742:	
;BoardConfig.h: 21: TRISA=0x00;
	bsf	status, 5	;RP0=1, select bank1
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
	
l1744:	
;BoardConfig.h: 30: PORTD=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(8)	;volatile
	line	31
	
l1746:	
;BoardConfig.h: 31: RA3=0;
	bcf	(43/8),(43)&7
	line	32
	
l1748:	
;BoardConfig.h: 32: RC5=1;
	bsf	(61/8),(61)&7
	line	33
	
l1750:	
# 33 "F:\Experiment_4\BoardConfig.h"
NOP ;#
psect	text37
	line	34
	
l1752:	
# 34 "F:\Experiment_4\BoardConfig.h"
NOP ;#
psect	text37
	line	35
	
l1754:	
;BoardConfig.h: 35: RC5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	39
	
l1756:	
;BoardConfig.h: 39: RC3=1;
	bsf	(59/8),(59)&7
	line	40
	
l1758:	
# 40 "F:\Experiment_4\BoardConfig.h"
NOP ;#
psect	text37
	line	41
	
l1760:	
# 41 "F:\Experiment_4\BoardConfig.h"
NOP ;#
psect	text37
	line	42
	
l1762:	
;BoardConfig.h: 42: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	46
	
l1764:	
;BoardConfig.h: 46: RC4=1;
	bsf	(60/8),(60)&7
	line	47
	
l1766:	
;BoardConfig.h: 47: PORTD=0X00;
	clrf	(8)	;volatile
	line	48
	
l1768:	
# 48 "F:\Experiment_4\BoardConfig.h"
NOP ;#
psect	text37
	line	49
	
l1770:	
# 49 "F:\Experiment_4\BoardConfig.h"
NOP ;#
psect	text37
	line	50
	
l1772:	
;BoardConfig.h: 50: RC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	52
;BoardConfig.h: 52: PORTD=0XFF;
	movlw	(0FFh)
	movwf	(8)	;volatile
	line	54
	
l1774:	
;BoardConfig.h: 54: RC2=1;
	bsf	(58/8),(58)&7
	line	56
	
l1776:	
;BoardConfig.h: 56: RE0=0;
	bcf	(72/8),(72)&7
	line	57
	
l1778:	
;BoardConfig.h: 57: RE1=0;
	bcf	(73/8),(73)&7
	line	58
	
l1780:	
;BoardConfig.h: 58: RE2=0;
	bcf	(74/8),(74)&7
	line	59
	
l685:	
	return
	opt stack 0
GLOBAL	__end_of_Board_init
	__end_of_Board_init:
;; =============== function _Board_init ends ============

	signat	_Board_init,88
	global	_INT
psect	text38,local,class=CODE,delta=2
global __ptext38
__ptext38:

;; *************** function _INT *****************
;; Defined at:
;;		line 35 in file "F:\Experiment_4\INT0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text38
	file	"F:\Experiment_4\INT0.C"
	line	35
	global	__size_of_INT
	__size_of_INT	equ	__end_of_INT-_INT
	
_INT:	
	opt	stack 6
; Regs used in _INT: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_INT+0)
	movf	pclath,w
	movwf	(??_INT+1)
	ljmp	_INT
psect	text38
	line	36
	
i1l1782:	
;INT0.C: 36: if(INTE && INTCON)
	btfss	(92/8),(92)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l695
u1_20:
	
i1l1784:	
	movf	(11),w	;volatile
	skipz
	goto	u2_20
	goto	i1l695
u2_20:
	line	38
	
i1l1786:	
;INT0.C: 37: {
;INT0.C: 38: INTF=0;
	bcf	(89/8),(89)&7
	line	39
	
i1l1788:	
;INT0.C: 39: RD0=!RD0;
	movlw	1<<((64)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((64)/8),f
	line	41
	
i1l695:	
	movf	(??_INT+1),w
	movwf	pclath
	swapf	(??_INT+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_INT
	__end_of_INT:
;; =============== function _INT ends ============

	signat	_INT,88
psect	text39,local,class=CODE,delta=2
global __ptext39
__ptext39:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
