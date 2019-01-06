/********************************************************************************************
* 功    能：AT24C02 I2C EEPROM读写实验
* CPU型号 ：PIC16F877A 
* 晶振：    4MHz 
* 说明:     先写入数据0XAA和0X55写入AT24C02然后再读出来送LED显示
            实验效果：8个LED间隔显示
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字


#define sda   RA5
#define scl   RA4


bit eepromdi;
bit eepromdo;
unsigned char addressbuf;

/***************************************************************** 
延时函数 
函数原型： void delay_250ms(); 
FUNCTION: 延明250ms 
*****************************************************************/ 
void delay_250ms() 
{ 
unsigned int d=24999; 
while (--d); 
} 

//---------------------------------------
//名称: 延时函数	

//日期：20110601
//----------------------------------------- 
void delay(void)
{
	unsigned char k;
	for(k=0;k<180;k++);
}
//---------------------------------------
//名称: 启动I2C总线函数	

//日期：20110601
//----------------------------------------- 
void i2cstart(void)
{  	
  	scl=1;
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	sda=1;
  	delay();
  	sda=0;
  	delay();
  	scl=0;
  	delay();
}
//---------------------------------------
//名称: 终止I2C总线函数	

//日期：20110601
//----------------------------------------- 
void i2cstop(void)
{
  	sda=0;
  	sda=0;  
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");	
  	scl=1;
  	delay();
  	sda=1;
  	delay();
  	scl=0;
  	delay();
}
//---------------------------------------
//名称: 从I2C总线读入一位数据函数	

//日期：20110601
//-----------------------------------------
void bitin(void)
{
  	eepromdi=1;  	
  	TRISA5=1;
  	scl=1;
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	eepromdi=sda;
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	scl=0;
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	TRISA5=0;
}
//---------------------------------------
//名称: 向I2C总线写入一位数据函数	
//日期：20110601
//-----------------------------------------
void bitout(void)
{
  	sda=eepromdo;
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	scl=1;
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	scl=0;
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
  	asm("NOP");
}
//---------------------------------------
//名称: 向I2C总线写入一字节函数	
//日期：20110601
//-----------------------------------------
void i2cwrite(unsigned char sedata)
{
  	unsigned char k;
  	for(k=0;k<8;k++)
  	{
    	if(sedata&0x80)
    	{
      		eepromdo=1;
    	}
    	else
    	{
      		eepromdo=0;
    	}
    	sedata=sedata<<1;
    	bitout();
  	}
  	bitin();
}
//---------------------------------------
//名称: 从I2C总线读出一字节函数	
//日期：20110601
//-----------------------------------------
unsigned char i2cread(void)
{
  	unsigned char redata;
  	unsigned char m;
  	for(m=0;m<8;m++)
  	{
    	redata=redata<<1;
    	bitin();
    	if(eepromdi==1)
    	{
      		redata|=0x01;
    	}
    	else
    	{
      		redata&=0xfe;
    	}
    	asm("NOP");
  	}
  	eepromdo=1;
  	bitout();
  	return redata;
}
//---------------------------------------
//名称: 从AT24C02指定地址上读出1字节数据函数	
//日期：20110601
//-----------------------------------------
unsigned char read(unsigned char address)
{
	unsigned char eebuf3;
  	i2cstart();
  	i2cwrite(0xa0);
  	i2cwrite(address);
  	i2cstart();
  	i2cwrite(0xa1);
  	eebuf3=i2cread();
  	i2cstop();
  	return eebuf3;
}
//---------------------------------------
//名称: 向AT24C02指定地址上写入1字节数据函数	
//日期：20110601
//-----------------------------------------
void write(unsigned char address1,unsigned char byte)
{
  	i2cstart();
  	i2cwrite(0xa0);
  	i2cwrite(address1);
  	i2cwrite(byte);
  	i2cstop();
}
//---------------------------------------
//名称: 主函数		 
//日期：20110601
//----------------------------------------- 
void main(void)
{
	unsigned char buf;
    
    ADCON1=0X07;               //设置RA口为普通数字口
    
    Board_init();              //调用开发板硬件初始化函数
    RC5=1;
    TRISA&=0B11001111;   	   //RA4,5 为 24C02相应的IO口设为输出 

    write(0x18,0X55);          //将0X55写入24C02的0X18
    write(0x19,0XAA);          //将0XAA写入24C02的0X19

    while(1)
    {	    	
	    buf=read(0x18);        	//从AT24C02中地址0X18读取数据
  	    PORTD=buf;              //LED显示读取到的数据
        delay_250ms();
        delay_250ms();

        buf=read(0x19);        	//从AT24C02中地址0X19读取数据 
        PORTD=buf;              //LED显示读取到的数据
        delay_250ms();
        delay_250ms();
   	 }
}









