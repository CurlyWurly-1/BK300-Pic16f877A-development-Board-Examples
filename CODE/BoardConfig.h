/*******************************************
BoardConfig.h
********************************************/

#include <xc.h>			 
#define uchar unsigned char
#define uint unsigned int

/*******************************************
* Board_init
********************************************/
void Board_init(void)
{
// Set all port pins as "output"
    TRISA=0x00;	   
	TRISB=0x00;
	TRISC=0x00;
	TRISD=0x00;
    TRISE=0X00;

// set all 8 PORTD pins to 1 
    PORTD=0XFF;   

// Set "latch output enable" ON for all three 74HC573 latches
    RA3=0;        

// Latch 1
    RC5=1;        
    asm ("NOP");
    asm ("NOP");  
    RC5=0;        
// Latch 2
    RC3=1;        
    asm ("NOP");
    asm ("NOP"); 
    RC3=0;          
// Latch 3
// set all 8 PORTD pins to 0 
    PORTD=0X00;
    RC4=1;        
    asm ("NOP");
    asm ("NOP"); 
    RC4=0;                

// Latch 3
// set all 8 PORTD pins to 1 
    PORTD=0XFF;
// stepper
    RC2=1;        
// Beeper
    RE0=0;        
// Relay
    RE1=0;        
// MAX485
    RE2=0;        
}
