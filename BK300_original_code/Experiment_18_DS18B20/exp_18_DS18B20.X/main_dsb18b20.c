
/********************************************************************************************
* DS18B20 
*********************************************************************************************/
#include <xc.h>   
#include <stdio.h>
#include <stdlib.h>
#include "BoardConfig.h"  //

#pragma config FOSC = XT        // Oscillator Selection bits (XT oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT enabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

// Unless specified elsewhere, 4MHz system frequency is assumed
#ifndef _XTAL_FREQ
 #define _XTAL_FREQ 4000000
#endif

#define ulint unsigned long int

#define  LCD_DATA_PORT    PORTD        //
#define  LCD_DATA_POUT    TRISD=0x00   //
#define  LCD_DATA_PIN     TRISD=0xFF   //

#define  LCD_Control_IN   TRISC|=0XFF
#define  LCD_Control_OUT  TRISC&=0X00

#define  LCD_EN_1         RC5=1
#define  LCD_EN_0         RC5=0
//LCD
#define  LCD_RW_1         RC4=1
#define  LCD_RW_0         RC4=0
//LCD
#define  LCD_RS_1         RC3=1
#define  LCD_RS_0         RC3=0

#define DS18B20 RA1           
#define TRIS_B20 TRISA1


void  US_delay ( int t);
void  lcd_init(void);
void  LCD_en_write(void);
void  wait_LCD_Ready(void);
//
void  set_LCD_xy(uchar x, uchar y );
void  LCD_write_onechar(uchar COMM,uchar DAT);
void  LCD_write_string(uchar X,uchar Y,uchar *string);
//
void  DS18B20_INIT(void);
void  WRITE_DS18B20_CMD(char cmd);
float READ_DS18B20 (void);
void  itoa10(unsigned char *buf, int i);
//
int   strlen(const char * s);
//
char bank1 DAT_BUFF1[]= "Temperature:";

#define SKIPROM 0XCC
#define READSCRACHPAD 0XBE
#define TCONVERT 0X44
#define DS18b20_RESET 10  
#define DSRECOVER 1

float temperature;
char bank1 atemperature[10];    // used for store ascii code of digital temperature */

/********************************************************************************************
* main 
*********************************************************************************************/
void main()
{
     int len;
     
     Board_init();              //调用开发板硬件初始化函数
     ADCON1=0X07;               //设置RA口为普通数据IO口
     RA3=1;                     //关闭LED和数码管锁存芯片输出
     US_delay (100); 
     lcd_init();

     LCD_write_string(0,0, DAT_BUFF1);
     while (1) 
     { 
            DS18B20_INIT();
            WRITE_DS18B20_CMD(SKIPROM);
            WRITE_DS18B20_CMD(TCONVERT);

            TRIS_B20=0;
            DS18B20=0;
            TRIS_B20=1;
            
            while(1) 
            { //判断转换是否完成
            if (DS18B20)  break;  
            else  continue;    
            }
            DS18B20_INIT();
            WRITE_DS18B20_CMD(SKIPROM);
            WRITE_DS18B20_CMD(READSCRACHPAD);
            temperature=READ_DS18B20();             
            itoa10(atemperature, (int) (temperature * 10)); /* because the itoa10 only works with integer */
                                                            // so use temperature * 10 to enlarge the temperature 
            len=strlen(atemperature);
            atemperature[len]=atemperature[len-1];
            atemperature[len-1]='.';
            atemperature[len+1]=0;  
 
            LCD_write_string(0,1, atemperature);
            US_delay (50);               
       }
}

/********************************************************************************************
* lcd_init
*********************************************************************************************/
void lcd_init(void)
{
     US_delay (150); 
     LCD_DATA_POUT;     
     LCD_Control_OUT;
     LCD_write_onechar(0x38,0);
     US_delay (10); 
     LCD_write_onechar(0x38,0);
     US_delay (10); 
     LCD_write_onechar(0x38,0);
     US_delay (10); 
     LCD_write_onechar(0x38,0);
     LCD_write_onechar(0x08,0);    /*显示关闭*/
     LCD_write_onechar(0x01,0);    /*显示清屏*/
     LCD_write_onechar(0x06,0);    /*显示光标移动设置*/
     US_delay (10);  
     LCD_write_onechar(0x0C,0);    /*显示开及光标设置*/
}

/********************************************************************************************
* LCD_en_write
*********************************************************************************************/
void LCD_en_write(void)        
{
     LCD_EN_1;
     US_delay (150);  //E脉冲周期最小150ns
     LCD_EN_0;
}

/********************************************************************************************
* wait_LCD_Ready
*********************************************************************************************/
void wait_LCD_Ready(void)
{
     uchar temp1;
     LCD_DATA_PORT=0XFF;
     LCD_DATA_PIN;                  //D7设为输入，准备判断LCD忙标志 
                                    //1为忙  0为空闲
     LCD_RS_0;
     LCD_RW_1;                      //读
     LCD_EN_1;
     US_delay (2); 
     while((temp1=PORTD & 0X80));
     LCD_EN_0;
     LCD_RS_1;
     LCD_DATA_POUT;
}

/********************************************************************************************
* LCD_write_onechar 
*********************************************************************************************/
void LCD_write_onechar(uchar COMM,uchar DAT)
{ 
     wait_LCD_Ready();         //等待LCD空闲
     LCD_RW_0;                 //写
	 
     //写数据
     if(COMM==0)
     {
     LCD_RS_1;  //RS高电平向LCD写数据
     LCD_DATA_PORT=DAT;
     } 
     //写命令
     else
     {
     LCD_RS_0;
     LCD_DATA_PORT=COMM;
     }
     LCD_en_write(); 
     US_delay (2); 
     LCD_RW_1;
     LCD_RS_1;
}

/********************************************************************************************
* LCD_write_string
*********************************************************************************************/
void LCD_write_string(uchar X,uchar Y,uchar *string)
{
     set_LCD_xy( X, Y );                //设置LCD显示坐标
     while (*string) 
     {
      LCD_write_onechar(0,*string );
	  string ++;                       //指向下一显示字符地址
     }
}

/********************************************************************************************
* set_LCD_xy
*********************************************************************************************/
void set_LCD_xy(uchar x, uchar y )
{
     uchar DIS_address;
     if (y == 0) 
     DIS_address = 0x80 + x;            //第一行X列
     else 
     DIS_address = 0xc0 + x;
     LCD_write_onechar( DIS_address, 0 );  //第二行X列
}


/********************************************************************************************
* strlen
*********************************************************************************************/
int strlen(const char * s)
{
     const char *cp;
     cp = s;
     while(*cp++)
     continue;
     return cp-s-1;
}

/********************************************************************************************
* DS18B20_INIT
*********************************************************************************************/
void DS18B20_INIT(void)
{
     TRIS_B20=0;
     DS18B20=0;
     US_delay(20);   
     TRIS_B20=1;   
     US_delay(10);    
}

/********************************************************************************************
* WRITE_DS18B20_CMD
*********************************************************************************************/
void WRITE_DS18B20_CMD(char cmd)
{
     char tmp;
     char i;
     TRIS_B20=0;
     for(tmp=8;tmp>0;tmp--) 
     {
           TRIS_B20=0;
           DS18B20= 0;
           asm ("NOP");
           asm ("NOP");
           asm ("NOP");
           asm ("NOP");
           asm ("NOP");
           if (cmd & 0x01) 
           {
           TRIS_B20=1;          /* release the bus */
           US_delay(1);          /* wait for more than 60 us */ 
           for (i=5;i>0;i--);
           }
           else 
           {
           DS18B20=0 ;
           US_delay(1);
           for (i=5;i>0;i--);     
           TRIS_B20=1;
           }
           cmd=cmd/2;
     }
}

/********************************************************************************************
* READ_DS18B20
*********************************************************************************************/
float READ_DS18B20 (void)
{
     char tmp=0x01;
     float t;
     union
     {
     char c[2];
     int x;
     }temp;
     temp.x=0;

     while (tmp)
     {     // read first 8 bits
            TRIS_B20=0;
            DS18B20=0;
            asm("NOP");
            TRIS_B20=1;      

            if (DS18B20)     
            temp.c[0] |= tmp;
            tmp=tmp<<1;
            US_delay(2);
     }
     tmp=1;
     while (tmp)
     {     // read first 8 bits
            TRIS_B20=0;
            DS18B20=0;
            asm("NOP");

            TRIS_B20=1;       // release the bus   
            asm("NOP");
            if (DS18B20)      // "1" presented
            temp.c[1] |= tmp;
            tmp=tmp<<1;
            US_delay(2);
     }
     t=((float) temp.x)/16.0 ;
     return t;
}

/********************************************************************************************
* itoa10
*********************************************************************************************/
/* Convert integer 'i', radix 10 to a string */
void itoa10(unsigned char *buf, int i)
{
     unsigned int rem;
     unsigned char *s,length=0;

     s = buf;
     if (i == 0) 
     *s++ = '0'; 
     else 
     { 
          if (i < 0) 
          {
          *buf++ = '-';
          s = buf;
          i = -i;
          }
          while (i) 
          {
          ++length;
          rem = i % 10;
          *s++ = rem + '0';
          i /= 10;
          }
          for(rem=0; ((unsigned char)rem)<length/2; rem++) 
          {
          *(buf+length) = *(buf+((unsigned char)rem));
          *(buf+((unsigned char)rem)) = *(buf+(length-((unsigned char)rem)-1));
          *(buf+(length-((unsigned char)rem)-1)) = *(buf+length);
          }
     }
     *s=0;
}

/********************************************************************************************
* US_delay
*********************************************************************************************/
void US_delay( int i) 
{
     unsigned char j;
     while(i--)
     {
        j=3;
        while(j--);
     }
}