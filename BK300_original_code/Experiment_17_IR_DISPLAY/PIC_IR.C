/********************************************************************************************
* 实验十七: 红外线接收数码管显示实验
* CPU型号： PIC16F877A 
* 晶振：    4MHz(换其它频率晶振时需对程序进行修改) 
* 说明:     按遥控器上的任意按键时四位数码管分别显示键码和其按键反码
            
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字

//定义红外接收接口
#define HX1838_IR    RA2

//按键码存储
uchar IR_NUM[4]={0,0,0,0,};
    
//共阳极数码显示码0-F.
uchar LED_number[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xf8,
                    0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E};

//数码管显示位选
uchar LED_BIT_SEL[]={0x10,0x20,0x40,0x80};
uchar Led_Index;         //数码管位计数     

//CPU初始化
void mcu_init(void)
{
 
     Board_init();      //调用开发板硬件初始化函数
   
     ADCON1=0X07;       //设置A口为普通数字口
     TRISA2=1;           //红外接收IO设为输入
     RA2=1;

     //定时器0初始化
     OPTION=0x03;      //TMR0----32分频(使扫描时间长一些)
     INTCON=0XA0;      //开总中断及TMR0计数溢出断
     TMR0=0xc3;        //定时器初值   

     //定时器1初始化
     T1CON=0X00;            
}

//TMR0中断用于数码管动态扫描
void interrupt TMR0INT(void)
{
     T0IF=0;                           //清TO中断标志
     TMR0=0x05;                        //重装T0计数初值
 

//****************数码管位码****************************************************
     RC4=1;                            //U3锁存端设为高电平输出端电平随输入端而变化
     PORTD=LED_BIT_SEL[Led_Index];    //送数码管位码
     RC4=0;                            //U3锁存端设为低电平输出端不变
//******************************************************************************     

//****************数码管段码****************************************************
     RC3=1;
     PORTD=LED_number[IR_NUM[Led_Index]];
     RC3=0;
//******************************************************************************

     if(++Led_Index>3)Led_Index=0;     //4位数码管扫描完
}

//计算低电平保持时间
uint Ir_Get_Low(void)
{
      TMR1L=0;
      TMR1H=0; 
      T1CON=0X01;                      //启动T1
      //等待高电平到来 
      while(!HX1838_IR  && (TMR1H&0x80)==0);                
      T1CON=0X00;         										  
      return TMR1H*256+TMR1L; 	   //返回T1计数值,以便判断
}

//计算高电平保持时间
uint Ir_Get_High(void)															    
{
      TMR1L=0;
      TMR1H=0; 
      T1CON=0X01;                   //启动T1
      //等待高电平到来 
      while(HX1838_IR  && (TMR1H&0x80)==0);                
      T1CON=0X00;         										  
      return TMR1H*256+TMR1L; 	   //返回T1计数值,以便判断
}

void main(void)
{
     uint temp,i,j;
     mcu_init();
     
     do{
restart:
        while(HX1838_IR);                   //等待红外信号
        temp=Ir_Get_Low();  
        if(temp<8500 || temp>9500) continue;//引导脉冲低电平9000
        temp=Ir_Get_High();
        if(temp<4000 || temp>5000) continue;//引导脉冲高电平4500
        for(i=0;i<4;i++) //4个字节
        for(j=0;j<8;j++) //每个字节8位
        {
             temp=Ir_Get_Low(); 						  
             if(temp<200 || temp>800)  goto restart;
             temp=Ir_Get_High();
             if(temp<200 || temp>2000) goto restart;
             IR_NUM[i]>>=1;
             if(temp>1120) IR_NUM[i]|=0x80;
         }
         IR_NUM[0]=IR_NUM[2]&0xf;
         IR_NUM[1]=(IR_NUM[2]/16)&0xf;
         IR_NUM[2]=IR_NUM[3]&0xf;
         IR_NUM[3]=(IR_NUM[3]/16)&0xf;    //显示结果
       }while(1);
}

