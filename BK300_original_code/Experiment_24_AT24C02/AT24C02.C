/********************************************************************************************
* 功    能：AT24C02 I2C EEPROM读写实验
* CPU型号 ：PIC16F877A 
* 晶振：    4MHz 
* 说明:     AT24C02读写实验，将开机次数保存在AT24C02内，使用LCD1602显示开机次数
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字


#define RSPIN  RC3 //Data or Instrument Select
#define RWPIN  RC4 //Write or Read
#define EPIN   RC5 //6800 mode Enable single
#define sda    RA5
#define scl    RA4


bit eepromdi;
bit eepromdo;
unsigned char addressbuf;

//---------------------------------------
//名称: 延时函数		 
//日期：20110601
//-----------------------------------------
void delay1(unsigned int t)
{
	unsigned int i,j;
	for(i=0;i<t;i++)
	{
		for(j=0;j<10;j++);
	}
}

//---------------------------------------
//名称: 1602忙检测函数		 
//日期：20110601
//----------------------------------------- 
void lcd_wait_busy(void)
{  
	TRISD7=1;	   			//为读状态做准备
   	RSPIN=0;			   //选择指令寄存器
   	RWPIN=1;			   //选择读
   	EPIN=1;				   //使能线电平变化
   	while(RD7==1);         //读忙状态，不忙时退出
   	EPIN=0;				   //恢复使能线电平
   	TRISD7=0;
}
//---------------------------------------
//名称: 1602写命令函数		 
//日期：20110601
//-----------------------------------------
void lcd_write_com(unsigned char combuf)
{  
	RSPIN=0;          	//选择指令寄存器
   	RWPIN=0;           	//选择写
   	PORTD=combuf;         	//把命令字送入RD 	
   	EPIN=1;	            //使能线电平变化，命令送入1602的8位数据口
   	asm("NOP");
   	EPIN=0;	            //恢复使能线电平
}
//---------------------------------------
//名称: 1602写命令函数（带忙检测）		 

//日期：20110601
//-----------------------------------------
void lcd_write_com_busy(unsigned char combuf)
{  
	lcd_wait_busy();				//调用忙检测函数
   	lcd_write_com(combuf); 	//调用写命令函数
}
//---------------------------------------
//名称: 1602写数据函数（带忙检测）		 

//日期：20110601
//-----------------------------------------
void lcd_write_data(unsigned char databuf)
{  
	lcd_wait_busy();	//调用忙检测函数
   	RSPIN=1;          	//选择数据寄存器
   	RWPIN=0;           	//选择写
   	PORTD=databuf;      	//把数据字送入P2
   	EPIN=1;	            //使能线电平变化，命令送入1602的8位数据口
   	asm("NOP");
   	EPIN=0;	            //恢复使能线电平
}
//---------------------------------------
//名称: 1602显示地址写函数		 

//日期：20110601
//-----------------------------------------
void lcd_write_address(unsigned char x,unsigned char y)
{  
	x&=0x0f;			//列地址限制在0-15
   	y&=0x01;			//行地址限制在0-1
   	if(y==0x00)
      	lcd_write_com_busy(x|0x80);	   //第一行的列地址写入
   	else
      	lcd_write_com_busy((x+0x40)|0x80);	   //第二行的列地址写入
}
//---------------------------------------
//名称: 1602初始化函数		 

//日期：20110601
//-----------------------------------------
void lcdreset(void)
{  
	delay1(150); 
	lcd_write_com(0x38);
   	delay1(50); 
	lcd_write_com(0x38);
   	delay1(50); 
	lcd_write_com(0x38);
   	lcd_write_com_busy(0x38);       //8位数据，双列，5*7字形
   	lcd_write_com_busy(0x08);		//显示功能关，无光标
   	lcd_write_com_busy(0x01);		//清屏指令
   	lcd_write_com_busy(0x06);		//写入新的数据后，光标右移，显示屏不移动
   	lcd_write_com_busy(0x0c);		//显示功能开，无光标，
}  	
//---------------------------------------
//名称: 指定地址写入函数		 

//日期：20110601
//-----------------------------------------	
void lcd_write_char(unsigned char x,unsigned char y,unsigned char buf)
{  		
	lcd_write_address(x,y); //写入地址			
   	lcd_write_data(buf);		//写入显示数据    
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
    
    ADCON1=0X07;               //设置A口为普通数字口

	TRISC=0B11000111;   	//RB3-5设置为输出
	TRISA=0B11001111;   	//RA4,5设置为输出 
	TRISD=0B00000000;   	//RD设置为输出
	buf=read(0x18);        	//从AT24C02中地址0X18读取数据
  	buf++;                 	//读出数据+1
  	write(0x18,buf);       	//将+1后的数据保存到0X18中
	   
	lcdreset();	 								//复位1602	    	 
  	lcd_write_char(0,0,'-');   //-
	lcd_write_char(1,0,'-');   //-
	lcd_write_char(2,0,'A');   //A
	lcd_write_char(3,0,'T');   //T
	lcd_write_char(4,0,'2');   //2
	lcd_write_char(5,0,'4');   //4   
	lcd_write_char(6,0,'C');   //C  	
	lcd_write_char(7,0,'0');   //0
	lcd_write_char(8,0,'2');   //2

	lcd_write_char(10,0,'T');  //T
	lcd_write_char(11,0,'E');  //E
	lcd_write_char(12,0,'S');  //S
	lcd_write_char(13,0,'T');  //T
	lcd_write_char(14,0,'-');   //-
	lcd_write_char(15,0,'-');   //-

	lcd_write_char(0,1,'B');   //B
	lcd_write_char(1,1,'o');   //o
	lcd_write_char(2,1,'o');   //o
	lcd_write_char(3,1,'t');   //t
   
	lcd_write_char(5,1,'t');   //t  	
	lcd_write_char(6,1,'i');   //i
	lcd_write_char(7,1,'m');   //m
	lcd_write_char(8,1,'e');   //e
	lcd_write_char(9,1,'s');   //s
	lcd_write_char(10,1,':');   //:
  
	lcd_write_char(12,1,buf/100+0x30);	    //显示百位
	lcd_write_char(13,1,(buf%100)/10+0x30); //显示十位
	lcd_write_char(14,1,buf%10+0x30);	    //显示个位
  	while(1)
  	{    	  		  	    	
  	}
}









