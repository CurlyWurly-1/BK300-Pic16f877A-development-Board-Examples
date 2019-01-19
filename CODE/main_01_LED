/********************************************************************************************
* PIC16F877A 
* LED
*********************************************************************************************/
#include <xc.h>   
#include <stdio.h>
#include <stdlib.h>
#include "BoardConfig.h" 

#pragma config FOSC  = XT       // Oscillator Selection bits (XT oscillator)
#pragma config WDTE  = OFF      // Watchdog Timer Enable bit (WDT enabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP   = OFF      // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD   = OFF      // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT   = OFF      // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP    = OFF      // Flash Program Memory Code Protection bit (Code protection off)

// Unless specified elsewhere, 4MHz system frequency is assumed
#ifndef _XTAL_FREQ
 #define _XTAL_FREQ 4000000
#endif


/********************************************************************************************
* main 
*********************************************************************************************/
void main (void)
{
   uchar timer;
   uchar temp = 0xff;
         
   Board_init();           
   RC5 = 1;   
 
   while(1)
   {
        temp = 0xFF;
        for(timer=0; timer<9; timer++)
        {
            PORTD = temp;     
            __delay_ms(200);   
            temp >>= 1;        
        }     
   }
}
