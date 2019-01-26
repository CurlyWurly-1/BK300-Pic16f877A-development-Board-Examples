/********************************************************************************************
* PIC16F877A 
* LCD 16x2 with 4 bits
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

/* Configure the data bus and Control bus as per the hardware connection 
   Dtatus bus is connected to PB4:PB7 and control bus PB0:PB2*/
#define LcdDataBus          PORTD
#define LcdControlBus       PORTC
#define LcdDataBusDirnReg   TRISD
#define LcdCtrlBusDirnReg   TRISC
#define LCD_RS     3
#define LCD_RW     4
#define LCD_EN     5


/********************************************************************************************
* void delay(int cnt)
*********************************************************************************************/
void delay(int cnt)
{
    int i;
    for(i=0; i<cnt; i++);
}

/********************************************************************************************
* void Lcd_CmdWrite(char cmd) - data is sent in two 4-bit nibbles 
*********************************************************************************************/
void Lcd_CmdWrite(char cmd)
{
    LcdDataBus = (cmd & 0xF0);     //Send higher nibble
    LcdControlBus &= ~(1<<LCD_RS); // Send LOW pulse on RS pin for selecting Command register
    LcdControlBus &= ~(1<<LCD_RW); // Send LOW pulse on RW pin for Write operation
    LcdControlBus |= (1<<LCD_EN);  // Generate a High-to-low pulse on EN pin
    __delay_us(50);
    LcdControlBus &= ~(1<<LCD_EN);
    __delay_us(50);
    LcdDataBus = ((cmd<<4) & 0xF0); //Send Lower nibble
    LcdControlBus &= ~(1<<LCD_RS);  // Send LOW pulse on RS pin for selecting Command register
    LcdControlBus &= ~(1<<LCD_RW);  // Send LOW pulse on RW pin for Write operation
    LcdControlBus |= (1<<LCD_EN);   // Generate a High-to-low pulse on EN pin
    __delay_us(50);
    LcdControlBus &= ~(1<<LCD_EN); 
    __delay_us(50);
}

/********************************************************************************************
* void Lcd_DataWrite(char dat) - data is sent in two 4-bit nibbles 
*********************************************************************************************/
void Lcd_DataWrite(char dat)
{
    LcdDataBus = (dat & 0xF0);      //Send higher nibble
    LcdControlBus |= (1<<LCD_RS);   // Send HIGH pulse on RS pin for selecting data register
    LcdControlBus &= ~(1<<LCD_RW);  // Send LOW pulse on RW pin for Write operation
    LcdControlBus |= (1<<LCD_EN);   // Generate a High-to-low pulse on EN pin
    __delay_us(50);
    LcdControlBus &= ~(1<<LCD_EN);

    __delay_us(50);

    LcdDataBus = ((dat<<4) & 0xF0);  //Send Lower nibble
    LcdControlBus |= (1<<LCD_RS);    // Send HIGH pulse on RS pin for selecting data register
    LcdControlBus &= ~(1<<LCD_RW);   // Send LOW pulse on RW pin for Write operation
    LcdControlBus |= (1<<LCD_EN);    // Generate a High-to-low pulse on EN pin
    __delay_us(50);
    LcdControlBus &= ~(1<<LCD_EN); 
    __delay_us(50);
}


/********************************************************************************************
* int main()
*********************************************************************************************/
int main()
{
    char i;
    char l2[]={"Good morning!"};
    char l3[]={"This is line 3"}; 
    char l4[]={"& this is line 4"};    
    __delay_ms(500);            // Allow LCD module to stabilise
    LcdDataBusDirnReg = 0x00;   // Configure all the LCD pins as output
    LcdCtrlBusDirnReg = 0x00;   // Configure all the LCD pins as output
    __delay_us(20);
    Lcd_CmdWrite(0x02);         // Initialize Lcd in 4-bit mode
    __delay_ms(2);
    Lcd_CmdWrite(0x28);         // enable 5x7 mode for chars 
    __delay_ms(2);
    Lcd_CmdWrite(0x0E);         // Display OFF, Cursor ON
    __delay_ms(2);
    Lcd_CmdWrite(0x01);         // Clear Display
    __delay_ms(2);
    Lcd_CmdWrite(0x80);         // Move the cursor to beginning of first line
    __delay_ms(2);  
    Lcd_DataWrite('H');
    Lcd_DataWrite('e');
    Lcd_DataWrite('l');
    Lcd_DataWrite('l');
    Lcd_DataWrite('o');
    Lcd_DataWrite(' ');
    Lcd_DataWrite('w');
    Lcd_DataWrite('o');
    Lcd_DataWrite('r');
    Lcd_DataWrite('l');
    Lcd_DataWrite('d');

// Line 2
    Lcd_CmdWrite(0xc0);        //Go to line 2 and display Good Morning
    for(i=0; l2[i]!=0; i++)
    {
        Lcd_DataWrite(l2[i]);
    }

// Line 3
    Lcd_CmdWrite(0x94);        //Go to line 3 and display Good Morning
    for(i=0; l3[i]!=0; i++)
    {
        Lcd_DataWrite(l3[i]);
    }

// Line 4
    Lcd_CmdWrite(0xD4);        //Go to line 4 and display Good Morning
    for(i=0; l4[i]!=0; i++)
    {
        Lcd_DataWrite(l4[i]);
    }    
    
    while(1);

}
