/********************************************************
实验十九:   DS1302时钟芯片实验
说明:       因为该型号开发板只有四位数码管，
                为了方便看到实验效果只显示分与秒
实验现象:   数码管上显示分与秒 
          
CPU型号:    PIC16F877A
时钟:       4MHZ

* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
 ********************************************************/

#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
__CONFIG(0x3F32);         //芯片配置字

//联接DS1302的端口定义
#define ds1302_rst  RC2                      //定义1302的RST接在PC4
#define ds1302_io   RC1                      //定义1302的IO接在PC3
#define ds1302_sclk RC0                      //定义1302的时钟接在PC2
#define set_ds1302_rst_ddr() TRISC2=0        //复位端置为输出 
#define set_ds1302_rst() ds1302_rst=1        //复位端置1
#define clr_ds1302_rst() ds1302_rst=0        //复位端清0
#define set_ds1302_io_ddr() TRISC1=0         //数据端置为输出
#define set_ds1302_io() ds1302_io=1          //数据端置1
#define clr_ds1302_io() ds1302_io=0          //数据端清0

#define clr_ds1302_io_ddr() TRISC1=1         //数据端置为输入
#define in_ds1302_io() PORTC&0X02            //数据端输入数据
#define set_ds1302_sclk_ddr() TRISC0=0       //时钟端置为输出
#define set_ds1302_sclk() ds1302_sclk=1      //时钟端置1
#define clr_ds1302_sclk() ds1302_sclk=0      //时钟端清0


#define ds1302_sec_add 0x80                  //秒数据地址
#define ds1302_min_add 0x82                  //分数据地址
#define ds1302_hr_add 0x84                   //时数据地址
#define ds1302_date_add 0x86                 //日数据地址
#define ds1302_month_add 0x88                //月数据地址
#define ds1302_day_add 0x8a                  //星期数据地址
#define ds1302_year_add 0x8c                 //年数据地址
#define ds1302_control_add 0x8e              //控制数据地址
#define ds1302_charger_add 0x90       
#define ds1302_clkburst_add 0xbe

uchar timer[8];    //时钟数据

//共阴数码管0-F显示代码
uchar Table[]={0xc0,0xf9,0xa4,0xb0,0x99,
               0x92,0x82,0xf8,0x80,0x90,0xff};      
//转换后的显示数据
uchar s[4];
//定义扫描计数器
uchar sel=0;
uchar temp_pa=0xFF;
/*************************************
*         DS1302操作函数组    *
*************************************/
//写入1302数据函数：
//入口：add为写入地址码，data为写入数据
//返回：无
void ds1302_write(uchar add,uchar data) 
{ 
     uchar i=0; 
     set_ds1302_io_ddr();     //配置IO为输出
     NOP();NOP();  
     clr_ds1302_rst();        //清复位，停止所有操作
     NOP();NOP();  
     clr_ds1302_sclk();       //清时钟，准备操作
     NOP();NOP();  
     set_ds1302_rst();        //置复位，开始操作
     NOP();NOP();  
     for(i=8;i>0;i--)         //此循环写入控制码
     { 
         if(add&0x01)
         set_ds1302_io();     //当前位为1，置数据位
         else
         clr_ds1302_io();     //当前位为0，清数据位
         NOP();NOP();  
         set_ds1302_sclk();   //产生时钟脉冲，写入数据
         NOP();NOP();  
         clr_ds1302_sclk(); 
         NOP();NOP();  
         add>>=1;             //移位，准备写入下1位
      } 
     for(i=8;i>0;i--)         //此循环写入数据码 
     { 
         if(data&0x01)
         set_ds1302_io(); 
         else
         clr_ds1302_io(); 
         NOP();NOP(); 
         set_ds1302_sclk(); 
         NOP();NOP();  
         clr_ds1302_sclk(); 
         NOP();NOP();  
         data>>=1; 
     } 
     clr_ds1302_rst(); 
     NOP();NOP();  
     clr_ds1302_io_ddr();      //清输出状态
     NOP();NOP();  
}
//从1302中读出数据：
//入口：add为读数据所在地址
//返回：读出的数据data
uchar ds1302_read(uchar add) 
{ 
      uchar data=0; 
      uchar i=0; 
      add+=1;                //读标志 
      set_ds1302_io_ddr();   //端口输出 
      NOP();NOP(); 
      clr_ds1302_rst();      //清复位 
      NOP();NOP(); 
      clr_ds1302_sclk();     //清时钟
      NOP();NOP();  
      set_ds1302_rst();      //置复位
      NOP();NOP(); 
      for(i=8;i>0;i--)       //此循环写入地址码
      { 
          if(add&0x01)
          {set_ds1302_io();} 
          else
          {clr_ds1302_io();}
  
          NOP();NOP(); 
          set_ds1302_sclk(); 
          NOP();NOP();  
          clr_ds1302_sclk(); 
          NOP();NOP(); 
          add>>=1; 
       } 
       clr_ds1302_io_ddr();    //端口输入
       NOP();NOP(); 
       for(i=8;i>0;i--)        //此循环读出1302的数据
       { 
          data>>=1; 
          if(in_ds1302_io())
          {data|=0x80;}
          NOP();NOP(); 
          set_ds1302_sclk(); 
          NOP();NOP(); 
          clr_ds1302_sclk(); 
          NOP();NOP(); 
       } 
       clr_ds1302_rst(); 
       NOP();NOP();
       return(data); 
} 
//检查1302状态
uchar check_ds1302(void) 
{ 
     ds1302_write(ds1302_control_add,0x80); 
     if(ds1302_read(ds1302_control_add)==0x80) 
     return 1; 
     return 0; 
} 
//向1302中写入时钟数据
void ds1302_write_time(void) 
{ 
     ds1302_write(ds1302_control_add,0x00);    //关闭写保护 
     ds1302_write(ds1302_sec_add,0x80);        //暂停 
     ds1302_write(ds1302_charger_add,0xa9);    //涓流充电 
     ds1302_write(ds1302_year_add,timer[1]);   //年 
     ds1302_write(ds1302_month_add,timer[2]);  //月 
     ds1302_write(ds1302_date_add,timer[3]);   //日 
     ds1302_write(ds1302_day_add,timer[7]);    //周 
     ds1302_write(ds1302_hr_add,timer[4]);     //时 
     ds1302_write(ds1302_min_add,timer[5]);    //分 
     ds1302_write(ds1302_sec_add,timer[6]);    //秒 
     ds1302_write(ds1302_control_add,0x80);    //打开写保护 
}
//从1302中读出当前时钟
void ds1302_read_time(void) 
{ 
     timer[1]=ds1302_read(ds1302_year_add);    //年 
     timer[2]=ds1302_read(ds1302_month_add);   //月 
     timer[3]=ds1302_read(ds1302_date_add);    //日 
     timer[7]=ds1302_read(ds1302_day_add);     //周 
     timer[4]=ds1302_read(ds1302_hr_add);      //时 
     timer[5]=ds1302_read(ds1302_min_add);     //分 
     timer[6]=ds1302_read(ds1302_sec_add);     //秒 
}


//延时函数1
void delay_us(uchar i)
{
     for(;i;i--);    
}
   
//延时函数2
void delay(uint i)  
{
     uchar j;
     for(;i;i--)
     for(j=220;j;j--);    
}
	

void timer0_init(void)
{
     OPTION=0x07;     //TMR0----256分频
     INTCON=0XA0;     //开总中断及TMR0计数溢出断
     TMR0=0xE8;       //定时器初值
}

/* 定时器0中断入口函数 */

void interrupt TMR0INT()
{
     T0IF=0;
     TMR0=0xE8;	

//****************关闭所有数码管***********************************************
     RC4=1;
     PORTD=0X00;
     RC4=0; 
//*****************************************************************************

//****************数码管段码****************************************************
     RC3=1;
     PORTD=s[sel];
     RC3=0;
//******************************************************************************


//****************数码管位码****************************************************
     RC4=1;                      //U3锁存端设为高电平输出端电平随输入端而变化

	 switch(sel)
	 {
		case 0x00: PORTD=0X10;break;     //第一位数码管显示
		           
	    case 0x01: PORTD=0X20;break;
		           
	    case 0x02: PORTD=0X40;break;
		           
		case 0x03: PORTD=0X80;break;           
	 }
     RC4=0;                      //U3锁存端设为低电平输出端不变
     if(++sel>3)sel=0;   
//******************************************************************************       
}
//显示数据转换函数
void Process(void)//(uint i)
{
     s[3]=Table[(timer[5]&0xF0)>>4];
     s[2]=Table[(timer[5]&0x0F)]&0x7F;  //初始化显示数据，并将时分之间加小数点
     s[1]=Table[(timer[6]&0xF0)>>4];
     s[0]=Table[(timer[6]&0x0F)];
}
   
//主函数
void main(void)
{
     uint n,m=0;
     
     ADCON1=0X07;       //设置A口为普通数字口

     Board_init();              //调用开发板硬件初始化函数

     timer[1]=0x09;   //年
     timer[2]=0x08;   //月
     timer[3]=0x20;   //日
     timer[4]=0x12;   //时
     timer[5]=0x12;   //分
     timer[6]=0x00;   //秒
     timer[7]=0x04;   //周
     ds1302_write_time();    //写入初始时钟
   
     timer0_init();          //设定定时器0

     while(1)
     {
     ds1302_read_time();     //读出当前时钟
     Process();              //显示数据转换
     delay(100);             //每100MS读一次
	 }
}

