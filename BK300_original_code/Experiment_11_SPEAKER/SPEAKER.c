
/********************************************************************************************
* 实验十一: 模拟报警音
* CPU型号： PIC16F877A 
* 晶振：    4MHz 
* 说明:     锋鸣器模拟警笛声
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字


#define SPEAK RE0

void    delayUS(uchar	i);
void    delayMS(uchar a);
void    baojing(void);


////////////主函数////////////////////////////////
void main(void)
{		

     Board_init();      //调用开发板硬件初始化函数

     ADCON1=0X07;       //设置RE口为普通数字输入输出端口	

     while(1)
     baojing(); 	
}

////////////报警子函数/////////////////////////
void baojing(void)
{   
     uint	m=400;
     while(--m){SPEAK=!SPEAK;delayUS(99);}m=200;
     while(--m){SPEAK=!SPEAK;delayUS(199);}
}

////////////10ms去抖动延时子函数//////////////////
void delayUS(uchar i)//US级延时子函数
{		
     while(--i);
}

void delayMS(uchar a)//MS级延时子函数
{		
     do
     {delayUS(199);}while(--a);
}

