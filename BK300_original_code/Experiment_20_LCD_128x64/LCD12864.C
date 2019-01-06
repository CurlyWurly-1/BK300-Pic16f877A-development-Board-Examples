
/********************************************************************************************
名    称：LCD12864_ST7920并行测试程序
试验功能：测试基于ST7920控制芯片的LCD12864的显示
          并行方式连接(该程序只支持ST7920控制芯片的LCD12864)

注意事项： 做该实验时请使用开发板配送的USB线为开发板供电或外接5V直流电源

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

/*****LCD接口定义*****/
#define  LCD_DATA_PORT    PORTD        //定义LCD的D0-D7所在端口
#define  LCD_DATA_POUT    TRISD=0x00   //定义LCD数据端

#define  LCD_Control_OUT  TRISC&=0XC7

#define LCD_RS_1  RC3=1
#define LCD_RS_0  RC3=0

#define LCD_RW_1  RC4=1
#define LCD_RW_0  RC4=0

#define LCD_EN_1  RC5=1
#define LCD_EN_0  RC5=0

/*****LCD功能初始化指令*****/
#define CLEAR_SCREEN 0x01     //清屏指令：清屏且AC值为00H
#define AC_INIT      0x02     //将AC设置为00H。且游标移到原点位置
#define CURSE_ADD    0x06     //设定游标移到方向及图像整体移动方向（默认游标右移，图像整体不动）
#define FUN_MODE     0x30     //工作模式：8位基本指令集
#define DISPLAY_ON   0x0c     //显示开,显示游标，且游标位置反白
#define DISPLAY_OFF  0x08     //显示关
#define CURSE_DIR    0x14     //游标向右移动:AC=AC+1
#define SET_CG_AC    0x40     //设置AC，范围为：00H~3FH
#define SET_DD_AC    0x80



/*****汉字地址表*****/
uchar  addr_tab[]={                     //便于根据汉字坐标求出地址
0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,//第一行汉字位置
0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,//第二行汉字位置
0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,//第三行汉字位置
0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f,//第四行汉字位置
};

/*****n（ms）延时子程序*****/
void delayms(uint t)     //约延时n（ms）
{
     uint i;
     while(t--)
     {
     for(i=0;i<125;i++);
     }        
}

/*****等待LCD空闲*****/
void WaitBusy(void)      
{
     uchar i=5;
     while(i--);
}

/*****写指令代码*****/
void Lcd_WriteCmd(uchar cmdcode)
{
     LCD_RS_0;
     LCD_RW_0;
     LCD_EN_1;
     WaitBusy();
     LCD_DATA_PORT = cmdcode;
     LCD_EN_0;
}

/*****写数据*****/
void Lcd_WriteData(uchar dispdata)
{
     LCD_RS_1;
     LCD_RW_0;
     LCD_EN_1;
     WaitBusy();
     LCD_DATA_PORT = dispdata;
     LCD_EN_0;
}

/*****初始化LCD*****/
void Lcd_Init(void)
{ 
     delayms(50);
     Lcd_WriteCmd(0x30);                  //选择基本指令集
     delayms(1);
     Lcd_WriteCmd(0x30);                  //选择8bit数据流
     delayms(1);
     Lcd_WriteCmd(0x0c);                  //开显示(无游标、不反白)
     delayms(1);
     Lcd_WriteCmd(0x01);                  //清除显示，并且设定地址指针为00H
     delayms(20);
}

/*****显示汉字*****/
void hanzi_Disp(uchar x,uchar y,uchar  *s)
{          //x、y为汉字坐标
     Lcd_WriteCmd(addr_tab[8*x+y]);       //写地址
     while(*s>0)
     { 
     Lcd_WriteData(*s);                   //写数据
     s++;
     delayms(100);
     }
}

void main(void)
{

     uchar company[]="  珠海博科电子";
     uchar Product[]="  BK300 开发板";
     uchar Contact[]="  超强性价比";

     Board_init();              //调用开发板硬件初始化函数
  
     RA3=1;                     //关闭LED和数码管的锁存芯片的输出              
     delayms(100);
     while(1)
     {
        Lcd_Init();
        delayms(1000);
        hanzi_Disp(0,0,company);
        hanzi_Disp(1,0,Product);        
        hanzi_Disp(2,0,Contact);
        delayms(2000);
     }
}

