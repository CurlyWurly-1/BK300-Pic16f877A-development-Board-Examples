
/********************************************************************************************
* ʵ��ʮ��: LCD1602��ʾʵ��
* CPU�ͺţ� PIC16F877A 
* ����    4MHz 
* ˵��:     
* ��    �ߣ�MCU2000
* ��    �ڣ�2012��10��19��
��������<<BK300 PICʵ���>>�ϵ���ͨ��
*********************************************************************************************/
#include <pic.h>	      //����PICͷ�ļ� ����Դ���ͷ�ļ�������< >
#include "BoardConfig.h"  //����������Ӳ����ʼ��ͷ�ļ� ����д��ͷ�ļ���" " ���PICC��������
__CONFIG(0x3F32);         //оƬ������

#define ulint unsigned long int

#define  LCD_DATA_PORT    PORTD        //����LCD��D0-D7���ڶ˿�
#define  LCD_DATA_POUT    TRISD=0x00   //����LCD���ݶ˿�Ϊ���
#define  LCD_DATA_PIN     TRISD=0xFF   //����LCD���ݶ˿�Ϊ����(�ڶ�LCD״̬ʱ�õ�)

#define  LCD_Control_IN   TRISC|=0XFF
#define  LCD_Control_OUT  TRISC&=0X00

#define  LCD_EN_1         RC5=1
#define  LCD_EN_0         RC5=0
//LCD��д��������
#define  LCD_RW_1         RC4=1
#define  LCD_RW_0         RC4=0
//LCDָ�������ѡ������
#define  LCD_RS_1         RC3=1
#define  LCD_RS_0         RC3=0

void nus_delay(uint nus);
void nms_delay(uint nms);

void lcd_init(void);
void LCD_en_write(void);
void wait_LCD_Ready(void);

void set_LCD_xy(uchar x, uchar y );
void LCD_write_onechar(uchar COMM,uchar DAT);
void LCD_write_string(uchar X,uchar Y,uchar *string);


                 
/****************************************************
��������:main
��������:������
�䡡��: ��
�䡡��: ��
���ڣ�2009-4-8
*****************************************************/
void main(void)
{
     uchar START_DISPLAY1[]={"   PIC BK300  "};
     uchar START_DISPLAY2[]={"   LCD162 TEST"};     

     Board_init();              //���ÿ�����Ӳ����ʼ������
     RA3=1;                     //�ر�LED������ܵ����

     lcd_init();
     nms_delay(2);

     while(1)
     {
     LCD_write_string(0,0,START_DISPLAY1);
     LCD_write_string(0,1,START_DISPLAY2);
     nms_delay(200);
     }
       	    		
}


/****************************************************
��������:lcd_init
��������:LCD��ʼ��
�䡡��: ��
�䡡��: ��
���ڣ�2009-4-8
˵��:ע���ʼ�����̲������ʵ���ʱ
     ����LCD����ʾ��ʽ�ɰ�ʵ����Ҫ�޸�
*****************************************************/
void lcd_init(void)
{
     nms_delay(15);
     LCD_DATA_POUT;     
     LCD_Control_OUT;
     LCD_write_onechar(0x38,0);
     nms_delay(1);
     LCD_write_onechar(0x38,0);
     nms_delay(1);
     LCD_write_onechar(0x38,0);
     nms_delay(1);
     LCD_write_onechar(0x38,0);
     LCD_write_onechar(0x08,0);    /*��ʾ�ر�*/
     LCD_write_onechar(0x01,0);    /*��ʾ����*/
     LCD_write_onechar(0x06,0);    /*��ʾ����ƶ�����*/
     nms_delay(1);;  
     LCD_write_onechar(0x0C,0);    /*��ʾ�����������*/
}

/****************************************************
��������:LCD_en_write
��������:EN�˲���һ�����壬дLCD
�䡡��: ��
�䡡��: ��
���ڣ�2009-4-8
*****************************************************/
void LCD_en_write(void)        
{
     LCD_EN_1;
     nus_delay(150);  //E����������С150ns
     LCD_EN_0;
}

/****************************************************
��������:wait_LCD_Ready
��������:�ж�LCDæ��־
�䡡��: ��
�䡡��: ��
���ڣ�2009-4-8
*****************************************************/
void wait_LCD_Ready(void)
{
     uchar temp1;
     LCD_DATA_PORT=0XFF;
     LCD_DATA_PIN;                  //D7��Ϊ���룬׼���ж�LCDæ��־ 
                                   //1Ϊæ  0Ϊ����
     LCD_RS_0;
     LCD_RW_1;                      //��
     LCD_EN_1;
     nus_delay(2);
     while((temp1=PORTD & 0X80));
     LCD_EN_0;
     LCD_RS_1;
     LCD_DATA_POUT;
}

/****************************************************
��������:LCD_write_onechar
��������:дһ���ֽڵ�LCD
�䡡��: COMM(ָ��)   DAT����ʾ����) 
�䡡��: ��
���ڣ�2009-4-8
*****************************************************/
void LCD_write_onechar(uchar COMM,uchar DAT)
{ 
     wait_LCD_Ready();         //�ȴ�LCD����
     LCD_RW_0;                 //д
	 
     //д����
     if(COMM==0)
     {
     LCD_RS_1;  //RS�ߵ�ƽ��LCDд����
     LCD_DATA_PORT=DAT;
     } 
     //д����
     else
     {
     LCD_RS_0;
     LCD_DATA_PORT=COMM;
     }
     LCD_en_write(); 
     nus_delay(2);
     LCD_RW_1;
     LCD_RS_1;
}

/****************************************************
��������:LCD_write_string
��������:LCD�ַ�����ʾ����
�䡡��: x/y��X��Y����)   *string���ַ����׵�ַ)
�䡡��: ��
���ڣ�2009-4-8
*****************************************************/
void LCD_write_string(uchar X,uchar Y,uchar *string)
{
     set_LCD_xy( X, Y );                //����LCD��ʾ����
     while (*string) 
     {
      LCD_write_onechar(0,*string );
	  string ++;                       //ָ����һ��ʾ�ַ���ַ
     }
}

/****************************************************
��������:set_LCD_xy
��������:������ʾ����
�䡡��: x/y��X��Y����)
�䡡��: ��
���ڣ�2009-4-8
˵��:  LMB1602��һ���׵�ַΪ0x80
              �ڶ���Ϊ0xC0
���ڣ�2009-4-7
*****************************************************/
void set_LCD_xy(uchar x, uchar y )
{
     uchar DIS_address;
     if (y == 0) 
     DIS_address = 0x80 + x;               //��һ��X��
     else 
     DIS_address = 0xc0 + x;
     LCD_write_onechar( DIS_address, 0 );  //�ڶ���X��
}

/****************************************************
��������:nus_delay
��������:΢�뼶��ʱ�ӳ���
�䡡��: ��
�䡡��: ��
���ڣ�2009-4-8
˵��:   
����Ϊ11.0592Mʱ  
���ڣ�2009-4-7          
*****************************************************/
void nus_delay(uint nus)
{
     int j=10;
     while(nus--)
     {
       while(j--);
	   j=10;
     }
}
/****************************************************
��������:nms_delay
��������:���뼶��ʱ�ӳ���
�䡡��: ��
�䡡��: ��
���ڣ�2009-4-8
˵��:   
����Ϊ4Mʱ            
*****************************************************/
void nms_delay(uint nms)
{
     while(nms--)
     nus_delay(1000);
}
