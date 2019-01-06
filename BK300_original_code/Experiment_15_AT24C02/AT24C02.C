/********************************************************************************************
* ��    �ܣ�AT24C02 I2C EEPROM��дʵ��
* CPU�ͺ� ��PIC16F877A 
* ����    4MHz 
* ˵��:     ��д������0XAA��0X55д��AT24C02Ȼ���ٶ�������LED��ʾ
            ʵ��Ч����8��LED�����ʾ
* ��    �ߣ�MCU2000
* ��    �ڣ�2012��10��19��
��������<<BK300 PICʵ���>>�ϵ���ͨ��
*********************************************************************************************/
#include <pic.h>	      //����PICͷ�ļ� �����Դ���ͷ�ļ�������< >
#include "BoardConfig.h"  //����������Ӳ����ʼ��ͷ�ļ� ����д��ͷ�ļ���" " ���PICC��������
__CONFIG(0x3F32);         //оƬ������


#define sda   RA5
#define scl   RA4


bit eepromdi;
bit eepromdo;
unsigned char addressbuf;

/***************************************************************** 
��ʱ���� 
����ԭ�ͣ� void delay_250ms(); 
FUNCTION: ����250ms 
*****************************************************************/ 
void delay_250ms() 
{ 
unsigned int d=24999; 
while (--d); 
} 

//---------------------------------------
//����: ��ʱ����	

//���ڣ�20110601
//----------------------------------------- 
void delay(void)
{
	unsigned char k;
	for(k=0;k<180;k++);
}
//---------------------------------------
//����: ����I2C���ߺ���	

//���ڣ�20110601
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
//����: ��ֹI2C���ߺ���	

//���ڣ�20110601
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
//����: ��I2C���߶���һλ���ݺ���	

//���ڣ�20110601
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
//����: ��I2C����д��һλ���ݺ���	
//���ڣ�20110601
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
//����: ��I2C����д��һ�ֽں���	
//���ڣ�20110601
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
//����: ��I2C���߶���һ�ֽں���	
//���ڣ�20110601
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
//����: ��AT24C02ָ����ַ�϶���1�ֽ����ݺ���	
//���ڣ�20110601
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
//����: ��AT24C02ָ����ַ��д��1�ֽ����ݺ���	
//���ڣ�20110601
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
//����: ������		 
//���ڣ�20110601
//----------------------------------------- 
void main(void)
{
	unsigned char buf;
    
    ADCON1=0X07;               //����RA��Ϊ��ͨ���ֿ�
    
    Board_init();              //���ÿ�����Ӳ����ʼ������
    RC5=1;
    TRISA&=0B11001111;   	   //RA4,5 Ϊ 24C02��Ӧ��IO����Ϊ��� 

    write(0x18,0X55);          //��0X55д��24C02��0X18
    write(0x19,0XAA);          //��0XAAд��24C02��0X19

    while(1)
    {	    	
	    buf=read(0x18);        	//��AT24C02�е�ַ0X18��ȡ����
  	    PORTD=buf;              //LED��ʾ��ȡ��������
        delay_250ms();
        delay_250ms();

        buf=read(0x19);        	//��AT24C02�е�ַ0X19��ȡ���� 
        PORTD=buf;              //LED��ʾ��ȡ��������
        delay_250ms();
        delay_250ms();
   	 }
}








