
/********************************************************************************************
* 实验十四: LCD1602显示实验
* CPU型号： PIC16F877A 
* 晶振：    4MHz 
* 说明:     
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字

#define ulint unsigned long int

#define  LCD_DATA_PORT    PORTD        //定义LCD的D0-D7所在端口
#define  LCD_DATA_POUT    TRISD=0x00   //定义LCD数据端口为输出
#define  LCD_DATA_PIN     TRISD=0xFF   //定义LCD数据端口为输入(在读LCD状态时用到)

#define  LCD_Control_IN   TRISC|=0XFF
#define  LCD_Control_OUT  TRISC&=0X00

#define  LCD_EN_1         RC5=1
#define  LCD_EN_0         RC5=0
//LCD读写控制引脚
#define  LCD_RW_1         RC4=1
#define  LCD_RW_0         RC4=0
//LCD指令或数据选择引脚
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
函数名称:main
功能描述:主函数
输　入: 无
输　出: 无
日期：2009-4-8
*****************************************************/
void main(void)
{
     uchar START_DISPLAY1[]={"   PIC BK300  "};
     uchar START_DISPLAY2[]={"   LCD162 TEST"};     

     Board_init();              //调用开发板硬件初始化函数
     RA3=1;                     //关闭LED和数码管的输出

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
函数名称:lcd_init
功能描述:LCD初始化
输　入: 无
输　出: 无
日期：2009-4-8
说明:注意初始化过程并加上适当延时
     后面LCD的显示方式可按实际需要修改
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
     LCD_write_onechar(0x08,0);    /*显示关闭*/
     LCD_write_onechar(0x01,0);    /*显示清屏*/
     LCD_write_onechar(0x06,0);    /*显示光标移动设置*/
     nms_delay(1);;  
     LCD_write_onechar(0x0C,0);    /*显示开及光标设置*/
}

/****************************************************
函数名称:LCD_en_write
功能描述:EN端产生一个脉冲，写LCD
输　入: 无
输　出: 无
日期：2009-4-8
*****************************************************/
void LCD_en_write(void)        
{
     LCD_EN_1;
     nus_delay(150);  //E脉冲周期最小150ns
     LCD_EN_0;
}

/****************************************************
函数名称:wait_LCD_Ready
功能描述:判断LCD忙标志
输　入: 无
输　出: 无
日期：2009-4-8
*****************************************************/
void wait_LCD_Ready(void)
{
     uchar temp1;
     LCD_DATA_PORT=0XFF;
     LCD_DATA_PIN;                  //D7设为输入，准备判断LCD忙标志 
                                   //1为忙  0为空闲
     LCD_RS_0;
     LCD_RW_1;                      //读
     LCD_EN_1;
     nus_delay(2);
     while((temp1=PORTD & 0X80));
     LCD_EN_0;
     LCD_RS_1;
     LCD_DATA_POUT;
}

/****************************************************
函数名称:LCD_write_onechar
功能描述:写一个字节到LCD
输　入: COMM(指令)   DAT（显示数据) 
输　出: 无
日期：2009-4-8
*****************************************************/
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
     nus_delay(2);
     LCD_RW_1;
     LCD_RS_1;
}

/****************************************************
函数名称:LCD_write_string
功能描述:LCD字符串显示函数
输　入: x/y（X与Y坐标)   *string（字符串首地址)
输　出: 无
日期：2009-4-8
*****************************************************/
void LCD_write_string(uchar X,uchar Y,uchar *string)
{
     set_LCD_xy( X, Y );                //设置LCD显示坐标
     while (*string) 
     {
      LCD_write_onechar(0,*string );
	  string ++;                       //指向下一显示字符地址
     }
}

/****************************************************
函数名称:set_LCD_xy
功能描述:设置显示坐标
输　入: x/y（X与Y坐标)
输　出: 无
日期：2009-4-8
说明:  LMB1602第一行首地址为0x80
              第二行为0xC0
日期：2009-4-7
*****************************************************/
void set_LCD_xy(uchar x, uchar y )
{
     uchar DIS_address;
     if (y == 0) 
     DIS_address = 0x80 + x;               //第一行X列
     else 
     DIS_address = 0xc0 + x;
     LCD_write_onechar( DIS_address, 0 );  //第二行X列
}

/****************************************************
函数名称:nus_delay
功能描述:微秒级延时子程序
输　入: 无
输　出: 无
日期：2009-4-8
说明:   
晶振为11.0592M时  
日期：2009-4-7          
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
函数名称:nms_delay
功能描述:毫秒级延时子程序
输　入: 无
输　出: 无
日期：2009-4-8
说明:   
晶振为4M时            
*****************************************************/
void nms_delay(uint nms)
{
     while(nms--)
     nus_delay(1000);
}
