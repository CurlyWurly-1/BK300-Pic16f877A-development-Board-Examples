/********************************************************************************************
* 功    能：PS2接口键盘实验
* CPU型号 ：PIC16F877A 
* 晶振：    4MHz 
* 说明:     将电脑上用的PS2接口的键盘插到开发板上的J8  PS2键盘接口
            把该程序下载到单片机并插上LCD1602液晶（如果你没有购买
            该液晶可修改程序的显示部分使用串口送到电脑上显示）
            按PS2键盘上的按键时LCD1602显示你所按下的按键。
            
            做该实验时建议使用开发板配送的USB供电线为开发板供电。
* 作    者：MCU2000
* 日    期：2012年10月19日
本例程在<<BK300 PIC实验板>>上调试通过
*********************************************************************************************/
#include <pic.h>	      //包含PIC头文件 软件自带的头文件可以用< >
#include "BoardConfig.h"  //包含开发板硬件初始化头文件 自已写的头文件用" " 否测PICC编译会出错
#include"scancodes.h" 
__CONFIG(0x3f32);        

//************************************************** 
//*****************LCD 1602引脚定义**************** 
//************************************************** 

#define LCM_RS    RC3  
#define LCM_RW    RC4 
#define LCM_E     RC5 

#define LCM_Data  PORTD 


//************************************************** 
//******************PS2键盘引脚定义**************** 
//************************************************** 
#define Key_CLK   RB0  
#define Key_Data  RB1                              

//************************************************** 
//******************定义变量*********************** 
//************************************************** 
uchar IntNum = 0;     //中断次数计数 
uchar KeyV;           //键值 
uchar DisNum = 0;     //显示用指针 
uchar Key_UP = 0;     //Key_UP是键松开标识 
uchar Shift = 0;      //Shift是Shift键按下标识 
uchar B_F = 0;         //标识是否有字符被收到 

//用于清屏
const uchar Cls[] = {"                "}; 
//产品编号
const uchar model_name[] = {"  PS2 keyboard"}; 

//*********************************************** 
//函 数 名：Delay5Ms(); 
//入口参数：无 
//出口参数：无 
//函数作用：5毫秒延时函数 
//说    明： 
//*********************************************** 
void Delay5Ms(void) 
{         
     uint TempCyc = 5552;         
     while(TempCyc--){;} 
} 

//*********************************************** 
//函 数 名：Delay400Ms(); 
//入口参数：无 
//出口参数：无 
//函数作用：400毫秒延时函数 
//说    明： 
//*********************************************** 
void Delay400Ms(void) 
{         
     uchar TempCycA = 5;         
     uint TempCycB;         
     while(TempCycA--)         
     {                 
        TempCycB=7269;                 
        while(TempCycB--){;}     
     } 
} 


//*********************************************** 
//函 数 名：check_busy(); 
//入口参数：无 
//出口参数：无 
//函数作用：LCD读忙函数 
//说    明： 
//*********************************************** 
void check_busy(void) 
{         
     LCM_Data = 0xFF; 
     TRISD=0XFF;            //设置RD口为输入口         
     LCM_RS = 0;            //设置为指令 
     LCM_RW = 1;            //设置为读指令 
     while(1)                   
     { 
         LCM_E=1;           //使能LCD     
         if(RD7==0){break;} //RD7为零，说明所有操作已完成则是不忙状态     
         LCM_E=0;           //禁止LCD    
     } 
     LCM_E=0;               //禁止LCD       
     TRISD=0X00;            //设置RD口为输出口                            
} 


//*********************************************** 
//函 数 名：WriteDataLCM(uchar data); 
//入口参数：data 
//出口参数：无 
//函数作用：写LCD单个数据函数 
//说    明： 
//*********************************************** 
void WriteDataLCM(uchar data) 
{         
     check_busy();      //等待忙标志结束                  
     LCM_RS = 1;        //设置为数据  
     LCM_RW = 0;        //设置为写指令 
     LCM_E = 1;         //使能LCD   
     LCM_Data = data;   //写数据到RD端口       
     LCM_E = 0;         //禁止LCD            
} 


//*********************************************** 
//函 数 名：WriteCommandLCM(uchar command); 
//入口参数：WDLCM，BuysC 
//出口参数：无 
//函数作用：写LCD指令函数 
//说    明： 
//*********************************************** 
void WriteCommandLCM(uchar command) 
{         
     check_busy();        //等待忙标志结束             
     LCM_RS = 0;          //设置为指令 
     LCM_RW = 0;          //设置为写指令 
     LCM_E = 1;           //使能LCD 
     LCM_Data = command;  //写指令到RD端口   
     LCM_E = 0;           //禁止LCD   
} 


//*********************************************** 
//函 数 名：LCMInit(); 
//入口参数：无 
//出口参数：无 
//函数作用：LCD初始化函数 
//说    明： 
//*********************************************** 
void LCMInit(void) 
{         
     LCM_Data = 0;                        
     WriteCommandLCM(0x38);    //显示模式设置,开始要求每次检测忙信号         
     WriteCommandLCM(0x08);    //关闭显示         
     WriteCommandLCM(0x01);    //显示清屏         
     WriteCommandLCM(0x06);    //显示光标移动设置         
     WriteCommandLCM(0x0F);    //显示开及光标设置 
} 


//*********************************************** 
//函 数 名：DisplayOneChar(uchar X, uchar Y, uchar DData); 
//入口参数：X, Y, DData 
//出口参数：无 
//函数作用：按指定位置显示一个字符函数 
//说    明： 
//*********************************************** 
void DisplayOneChar(uchar X, uchar Y, uchar DData) 
{         
     Y &= 0x1;         
     X &= 0xF;                //限制X不能大于15，Y不能大于1         
     if (Y) X |= 0xC0;        //当要显示第二行时地址码+0xC0;         
     X |= 0x80;               //算出指令码         
     WriteCommandLCM(X);      //发命令字         
     WriteDataLCM(DData);     //发数据 
} 


//*********************************************** 
//函 数 名：DisplayListChar(uchar X, uchar Y, const uchar *DData); 
//入口参数：X, Y, *DData 
//出口参数：无 
//函数作用：按指定位置显示一串字符函数 
//说    明： 
//*********************************************** 
void DisplayListChar(uchar X, uchar Y, const uchar *DData) 
{         
     uchar ListLength;                 
     ListLength = 0;         
     Y &= 0x1;         
     X &= 0xF;                                        //限制X不能大于15，Y不能大 于1         
     while (DData[ListLength]>0x19)                   //若到达字串尾则退出         
     {                 
           if (X <= 0xF)                                //X坐标应小于0xF                 
           {                         
           DisplayOneChar(X, Y, DData[ListLength]); //显示单个字符                        
           ListLength++;                         
           X++;                 
           }         
     } 
} 

//*********************************************** 
//函 数 名：Decode(uchar ScanCode); 
//入口参数：ScanCode 
//出口参数：无 
//函数作用：查找键盘代码函数 
//说    明：如SHIFT+G为12H 34H F0H 34H F0H 12H， 
//          也就是说shift的通码+G的通码+shift的 
//          断码+G的断码 
//*********************************************** 
void Decode(uchar ScanCode) 
{         
     uchar TempCyc;                 
     if (!Key_UP)             //当键盘松开时         
     {                 
           switch (ScanCode)                 
           {                         
                 //当收到0xF0，Key_UP置1表示断码开始 
                 case 0xF0 : Key_UP = 1; break;                             
                                          
                 //左 SHIFT                                               
                 case 0x12 : Shift = 1;  break;                            
                                                                                                           
                 // 右 SHIFT   
                 case 0x59 : Shift = 1;  break;                           
                                                                                                        
                 default:                         
                 if (DisNum > 15)                         
                 {                                 
                       DisplayListChar(0, 1, Cls);   //清LCD第二行                            
                       DisNum = 0;                         
                 }                         
                 if(!Shift)                        //如果SHIFT没按下                        
                 {                                 
                       for (TempCyc = 0;(UnShifted[TempCyc][0]!=ScanCode) 
                            &&(TempCyc<59); TempCyc++); //查表显示 
                       if (UnShifted[TempCyc][0] == ScanCode) 
                       {  
                       DisplayOneChar(DisNum, 1, UnShifted[TempCyc][1]);                                
                       DisNum++; 
                       } 
                 }                         
                 else                              //按下SHIFT                         
                 {                                 
                       for(TempCyc = 0; (Shifted[TempCyc][0]!=ScanCode)&& 
                          (TempCyc<59); TempCyc++);   //查表显示                          
                       if (Shifted[TempCyc][0] == ScanCode) 
                       { 
                       DisplayOneChar(DisNum, 1, Shifted[TempCyc][1]); 
                       DisNum++;  
                       } 
                 }                                                 
                 break;                 
           }         
     }         

     else         
     {                 
          Key_UP = 0;                 
          switch (ScanCode)   //当键松开时不处理判码，如G 34H F0H 34H 那么第二 个34H不会被处理                 
          {                         
                 // 左 SHIFT     
                 case 0x12 : Shift = 0; break;                         
                                                                                                          
                 // 右 SHIFT
                 case 0x59 : Shift = 0; break;                                                                                         
          }         
     }         
     B_F = 0;                 //标识字符处理完了 
} 

//*********************************************** 
//函 数 名：Keyboard_out(); 
//入口参数：无 
//出口参数：无 
//函数作用：中断函数 
//说    明： 
//*********************************************** 
void interrupt Keyboard_out(void) 
{ 
     if(INTE&&INTF) 
     {         
          if((IntNum>0)&&(IntNum<9))         
          {                 
               KeyV=KeyV>>1;             //因键盘数据是低>>高，结合上一句所 以右移一位                 
               if(Key_Data) 
               KeyV=KeyV|0x80;       //当键盘数据线为1时为1到最高位  
          }         
          IntNum++;         
          while (!Key_CLK){;}           //等待PS/2CLK拉高                 
          if (IntNum > 10)         
          {                 
               IntNum = 0;               //当中断10次后表示一帧数据收完，清 变量准备下一次接收                 
               B_F = 1;                   //标识有字符输入完了                
               INTE = 0;                 //关中断等显示完后再开中断        
          } 
          INTF=0; 
     } 
} 

//*********************************************** 
//函 数 名：main(); 
//入口参数：无 
//出口参数：无 
//函数作用：MAIN函数 
//说    明： 
//*********************************************** 
void main(void) 
{         
     uchar TempCyc;    
     ADCON1=0X07;   //设置RA口和RE口为数字I/O口    
     Board_init();  //调用开发板硬件初始化函数
     RA3=1;         //关闭LED和数码管锁存芯片的输出

     TRISB0=1;      //设置PS2_CLK为输入口 
     TRISB1=1;      //设置PS2_DATA为输入口 
    
                                   
     Delay400Ms();                           //启动等待，等LCM讲入工作状态         
     LCMInit();                              //LCM初始化         
     Delay5Ms();                             //延时片刻(可不要)                             
     DisplayListChar(0, 0, model_name);         
                   
     Delay400Ms();                           //延时         
     DisplayListChar(0, 1, Cls);                 
     INTEDG= 0;                              //设外部中断低电平触发  
     INTF=0;                                 //清中断标志        
     INTE = 1;                               //开外部中断 
     GIE = 1;                                //开全局中断                 
     do         
     {                 
     if (B_F){Decode(KeyV);}                 
     else   {INTE = 1;}                      //开外部中断       
     }while(1); 
} 



