
/********************************************************************************************
* 实验十二: PWM波形输出实验
* CPU型号： PIC16F877A 
* 晶振：    4MHz 
* 说明:     1:PWM调节LED亮度
            使用按键K18和K19来调节LED10的亮度
            该实例程序也可以用于调节直流电机转速
            
            2:PWM控制直流电机转速
            先将该程序下载到单片机，然后将直流电机接到开发
            板的右下角的J5插座，按K18和K19可控制直接电机加减速。
                  
            注意：需下载完程序后再接直流电机，因为电机耗电量比较
                  大仿真器或编程器给开发板提供的的电源可能不够用，
                  做直流电机或步进电机实验时需另外用一根USB线给
                  开发板供电。
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字


#define u8	unsigned char
u8 a;

void CCP1INIT(void) ;
void delayUS(u8 i);
void delayMS(u8 a);
void anjian(void);

/*该程序用于使CCP1模块产生分辨率为10位的PWM波形，占空比为50%*/ 

/*CCP1模块的PWM工作方式初始化子程序*/

/*主程序*/ 
void main(void) 
{  
     Board_init();         //调用开发板硬件初始化函数
     CCP1INIT();	       /*CCP1模块的PWM工作方式初始化*/ 
     T2CON=0X04;	       /*打开TMR2，且使其前分频为0，*/
    		               /*同时开始输出PWM波形*/ 
     do 
     { 	
     anjian(); 
     }while(1);            /*系统开始输出PWM波形,如果*/
	                       /*系统是多任务的,则可以在此执行其它任务,*/
		                   /*而不会影响PWM波形的产生*/  
}		          
			
void CCP1INIT(void) 
{  
     PORTB=0xff;
     TRISB=0xff;
     RBPU=0;
     a=0XE0;
     CCPR1L=a;
     CCPR2L=a;
     CCP1CON=0X3C;	       /*设置CCP1模块为PWM工作方式，且其工作*/
	                       /*循环的低2位为11，高8位为01111111=7F*/
     CCP2CON=0X3C;	       /*设置CCP1模块为PWM工作方式，且其工作*/
	                       /*循环的低2位为11，高8位为01111111=7F*/     
     INTCON=0X00;	       /*禁止总中断和外围中断*/ 
     PR2=0XFF;  	       /*设置PWM的工作周期*/ 
     TRISC=0XF8;	       /*设置CCP1 CCP2 RC1 RC2引脚为输出方式*/ 
}

//通过K18  K19分别调大和调小(通过示波器观看PWM波形的变化)
//如果你没有示波器也可按K18和K19按键时观看LED10亮度的变化
void anjian(void)
{
     TRISB=0xff;
     if(RB1==0){delayMS(10);
     if(RB1==0){a+=50;CCPR1L=a;CCPR2L=a;}
     while(RB1==0);}		
     if(RB2==0){delayMS(10);
     if(RB2==0){a-=50;CCPR1L=a;CCPR2L=a;}
     while(RB2==0);}		
}

////////////10ms去抖动延时子函数//////////////////
void delayUS(u8 i)           //US级延时子函数
{    while(--i);}

void delayMS(u8 a)           //MS级延时子函数
{		
     do{delayUS(199);}while(--a);
}


