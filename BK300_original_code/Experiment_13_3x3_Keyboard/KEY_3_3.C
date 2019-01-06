
/********************************************************************************************
* 实验十三: 3*3矩阵式键盘实验
* CPU型号： PIC16F877A 
* 晶振：    4MHz 
* 说明:     分别按键K1-K16时数码管分别显示键码0-F
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字

//共阳
uchar LED_CODE[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,
                  0x80,0x90,0X88,0X83,0XC6,0XA1,0X86,0X8E,0XFF};
void delay(uchar x_ms);
key_scan(void);
uchar key_num;

void main(void)
{
     uchar key_val=0;

     Board_init();              //调用开发板硬件初始化函数

//*****使能第一位数码管位选*****************************************************
     RC4=1;
     PORTD=0X80;            //
     RC4=0;                 //
//****************************************************************************** 

     RC3=1;                 

     while(1)
    {
     TRISB=0X0F;            //
     PORTB=0X0F;            //键盘行线上拉     
     key_num=PORTB & 0X0F;
     if(key_num !=0x0F)
      {
         delay(1);
         if((key_num=PORTB & 0X0F)!=0X0F)
         {
         key_val=key_scan();
         key_val=key_val | key_num;
         }
         switch(key_val)
         {
            case   0xEE:    key_val=0x01; break;      
            case   0xED:    key_val=0x02; break;      
            case   0xEB:    key_val=0x03; break;      
            case   0xE7:    key_val=0x04; break;      
          
            case   0xDE:    key_val=0x05; break;
            case   0xDD:    key_val=0x06; break;
            case   0xDB:    key_val=0x07; break;
            case   0xD7:    key_val=0x08; break;    
           
            case   0xBE:    key_val=0x09; break;      
            case   0xBD:    key_val=0x0A; break;      
            case   0xBB:    key_val=0x0B; break;      
            case   0xB7:    key_val=0x0C; break;      
          
            case   0x7E:    key_val=0x0D; break;
            case   0x7D:    key_val=0x0E; break;
            case   0x7B:    key_val=0x0F; break;
            case   0x77:    key_val=0x00; break;    
         }//switch
      }   //if(key_num !=0x07)
      delay(2);
      PORTD=LED_CODE[key_val]; //显示键码
      delay(2); 
     }    //while(1)
} 


//键盘列扫描子程序
key_scan()
{
   uchar key_temp=0,read_io=0xEF;          
   uchar i;
   for(i=0;i<4;i++) 
   {
        TRISB=0X00;
        PORTB=read_io |0x0F;
        TRISB=0X0F;       //行线设为输入 
        if((key_temp=PORTB & 0X0F)!=0X0F)
        return(read_io & 0xF0);
        read_io<<=1;
   }
}

//延时子程序(使用不同晶振时相应修改)
void delay(uchar x_ms)
{
   uint ns;
   for(  ;x_ms>0;x_ms--)
   for(ns=0;ns<1000;ns++);
}
