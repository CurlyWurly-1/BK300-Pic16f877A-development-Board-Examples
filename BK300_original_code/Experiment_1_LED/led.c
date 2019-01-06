/********************************************************************************************
* 功    能：LED驱动实验程序
* CPU型号 ：PIC16F877A 
* 晶振：    4MHz 
* 说明:     
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	          //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"      //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);             //芯片配置字


void delay(uchar a,uchar i);  //延时子函数声明

void main (void)
{
   uchar timer;
   uchar temp=0xff;
         
   Board_init();              //调用开发板硬件初始化函数
   RC5=1;                     //设置U5不锁存，输出随输入端变化LED受PORTD口控制使PORTD可以控制LED
 
   while(1)
   {
        temp=0xFF;
        for(timer=0;timer<9;timer++)
        {
            PORTD=temp;      //temp的值送LED显示
            delay(20,200);   //调用延时
            temp>>=1;        //左移一位
        }     
   }
}

////////////延时子函数/////////////////
void delay(uchar a,uchar i)
{	
    uchar s;
    while(--a)
    while(--i)
    {
    s=10;   
    while(s--);
    }
}
