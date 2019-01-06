
/*******************************************
* BoardConfig.h
/******************************************/

#include <pic.h>			// 

#define uchar unsigned char
#define uint unsigned int

/*******************************************
* Board_init
/********************************************/
void Board_init(void)
{
	TRISA=0x00;	   
	TRISB=0x00;
	TRISC=0x00;
	TRISD=0x00;
    TRISE=0X00;


   
// LED
   PORTD=0XFF;   //PORTD输出高电平
   RA3=0;        //74HC573
   RC5=1;
   asm ("NOP");
   asm ("NOP");  
   RC5=0;         //74HC573

//
   RC3=1;
   asm ("NOP");
   asm ("NOP"); 
   RC3=0;        //U2

//
    RC4=1;
    PORTD=0X00;
    asm ("NOP");
    asm ("NOP"); 
    RC4=0;        //U3          

//    
    PORTD=0XFF;
    RC2=1;        //RC2
    RE0=0;        //
    RE1=0;        //
    RE2=0;        //
}



