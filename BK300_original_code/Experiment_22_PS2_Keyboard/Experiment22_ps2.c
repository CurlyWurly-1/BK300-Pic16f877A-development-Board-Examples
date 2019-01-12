/********************************************************************************************
* ��    �ܣ�PS2�ӿڼ���ʵ��
* CPU�ͺ� ��PIC16F877A 
* ����    4MHz 
* ˵��:     ���������õ�PS2�ӿڵļ��̲嵽�������ϵ�J8  PS2���̽ӿ�
            �Ѹó������ص���Ƭ��������LCD1602Һ���������û�й���
            ��Һ�����޸ĳ������ʾ����ʹ�ô����͵���������ʾ��
            ��PS2�����ϵİ���ʱLCD1602��ʾ�������µİ�����
            
            ����ʵ��ʱ����ʹ�ÿ��������͵�USB������Ϊ�����幩�硣
* ��    �ߣ�MCU2000
* ��    �ڣ�2012��10��19��
��������<<BK300 PICʵ���>>�ϵ���ͨ��
*********************************************************************************************/
#include <pic.h>	      //����PICͷ�ļ� ����Դ���ͷ�ļ�������< >
#include "BoardConfig.h"  //����������Ӳ����ʼ��ͷ�ļ� ����д��ͷ�ļ���" " ���PICC��������
#include"scancodes.h" 
__CONFIG(0x3f32);        

//************************************************** 
//*****************LCD 1602���Ŷ���**************** 
//************************************************** 

#define LCM_RS    RC3  
#define LCM_RW    RC4 
#define LCM_E     RC5 

#define LCM_Data  PORTD 


//************************************************** 
//******************PS2�������Ŷ���**************** 
//************************************************** 
#define Key_CLK   RB0  
#define Key_Data  RB1                              

//************************************************** 
//******************�������*********************** 
//************************************************** 
uchar IntNum = 0;     //�жϴ������� 
uchar KeyV;           //��ֵ 
uchar DisNum = 0;     //��ʾ��ָ�� 
uchar Key_UP = 0;     //Key_UP�Ǽ��ɿ���ʶ 
uchar Shift = 0;      //Shift��Shift�����±�ʶ 
uchar B_F = 0;         //��ʶ�Ƿ����ַ����յ� 

//��������
const uchar Cls[] = {"                "}; 
//��Ʒ���
const uchar model_name[] = {"  PS2 keyboard"}; 

//*********************************************** 
//�� �� ����Delay5Ms(); 
//��ڲ������� 
//���ڲ������� 
//�������ã�5������ʱ���� 
//˵    ���� 
//*********************************************** 
void Delay5Ms(void) 
{         
     uint TempCyc = 5552;         
     while(TempCyc--){;} 
} 

//*********************************************** 
//�� �� ����Delay400Ms(); 
//��ڲ������� 
//���ڲ������� 
//�������ã�400������ʱ���� 
//˵    ���� 
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
//�� �� ����check_busy(); 
//��ڲ������� 
//���ڲ������� 
//�������ã�LCD��æ���� 
//˵    ���� 
//*********************************************** 
void check_busy(void) 
{         
     LCM_Data = 0xFF; 
     TRISD=0XFF;            //����RD��Ϊ�����         
     LCM_RS = 0;            //����Ϊָ�� 
     LCM_RW = 1;            //����Ϊ��ָ�� 
     while(1)                   
     { 
         LCM_E=1;           //ʹ��LCD     
         if(RD7==0){break;} //RD7Ϊ�㣬˵�����в�����������ǲ�æ״̬     
         LCM_E=0;           //��ֹLCD    
     } 
     LCM_E=0;               //��ֹLCD       
     TRISD=0X00;            //����RD��Ϊ�����                            
} 


//*********************************************** 
//�� �� ����WriteDataLCM(uchar data); 
//��ڲ�����data 
//���ڲ������� 
//�������ã�дLCD�������ݺ��� 
//˵    ���� 
//*********************************************** 
void WriteDataLCM(uchar data) 
{         
     check_busy();      //�ȴ�æ��־����                  
     LCM_RS = 1;        //����Ϊ����  
     LCM_RW = 0;        //����Ϊдָ�� 
     LCM_E = 1;         //ʹ��LCD   
     LCM_Data = data;   //д���ݵ�RD�˿�       
     LCM_E = 0;         //��ֹLCD            
} 


//*********************************************** 
//�� �� ����WriteCommandLCM(uchar command); 
//��ڲ�����WDLCM��BuysC 
//���ڲ������� 
//�������ã�дLCDָ��� 
//˵    ���� 
//*********************************************** 
void WriteCommandLCM(uchar command) 
{         
     check_busy();        //�ȴ�æ��־����             
     LCM_RS = 0;          //����Ϊָ�� 
     LCM_RW = 0;          //����Ϊдָ�� 
     LCM_E = 1;           //ʹ��LCD 
     LCM_Data = command;  //дָ�RD�˿�   
     LCM_E = 0;           //��ֹLCD   
} 


//*********************************************** 
//�� �� ����LCMInit(); 
//��ڲ������� 
//���ڲ������� 
//�������ã�LCD��ʼ������ 
//˵    ���� 
//*********************************************** 
void LCMInit(void) 
{         
     LCM_Data = 0;                        
     WriteCommandLCM(0x38);    //��ʾģʽ����,��ʼҪ��ÿ�μ��æ�ź�         
     WriteCommandLCM(0x08);    //�ر���ʾ         
     WriteCommandLCM(0x01);    //��ʾ����         
     WriteCommandLCM(0x06);    //��ʾ����ƶ�����         
     WriteCommandLCM(0x0F);    //��ʾ����������� 
} 


//*********************************************** 
//�� �� ����DisplayOneChar(uchar X, uchar Y, uchar DData); 
//��ڲ�����X, Y, DData 
//���ڲ������� 
//�������ã���ָ��λ����ʾһ���ַ����� 
//˵    ���� 
//*********************************************** 
void DisplayOneChar(uchar X, uchar Y, uchar DData) 
{         
     Y &= 0x1;         
     X &= 0xF;                //����X���ܴ���15��Y���ܴ���1         
     if (Y) X |= 0xC0;        //��Ҫ��ʾ�ڶ���ʱ��ַ��+0xC0;         
     X |= 0x80;               //���ָ����         
     WriteCommandLCM(X);      //��������         
     WriteDataLCM(DData);     //������ 
} 


//*********************************************** 
//�� �� ����DisplayListChar(uchar X, uchar Y, const uchar *DData); 
//��ڲ�����X, Y, *DData 
//���ڲ������� 
//�������ã���ָ��λ����ʾһ���ַ����� 
//˵    ���� 
//*********************************************** 
void DisplayListChar(uchar X, uchar Y, const uchar *DData) 
{         
     uchar ListLength;                 
     ListLength = 0;         
     Y &= 0x1;         
     X &= 0xF;                                        //����X���ܴ���15��Y���ܴ� ��1         
     while (DData[ListLength]>0x19)                   //�������ִ�β���˳�         
     {                 
           if (X <= 0xF)                                //X����ӦС��0xF                 
           {                         
           DisplayOneChar(X, Y, DData[ListLength]); //��ʾ�����ַ�                        
           ListLength++;                         
           X++;                 
           }         
     } 
} 

//*********************************************** 
//�� �� ����Decode(uchar ScanCode); 
//��ڲ�����ScanCode 
//���ڲ������� 
//�������ã����Ҽ��̴��뺯�� 
//˵    ������SHIFT+GΪ12H 34H F0H 34H F0H 12H�� 
//          Ҳ����˵shift��ͨ��+G��ͨ��+shift�� 
//          ����+G�Ķ��� 
//*********************************************** 
void Decode(uchar ScanCode) 
{         
     uchar TempCyc;                 
     if (!Key_UP)             //�������ɿ�ʱ         
     {                 
           switch (ScanCode)                 
           {                         
                 //���յ�0xF0��Key_UP��1��ʾ���뿪ʼ 
                 case 0xF0 : Key_UP = 1; break;                             
                                          
                 //�� SHIFT                                               
                 case 0x12 : Shift = 1;  break;                            
                                                                                                           
                 // �� SHIFT   
                 case 0x59 : Shift = 1;  break;                           
                                                                                                        
                 default:                         
                 if (DisNum > 15)                         
                 {                                 
                       DisplayListChar(0, 1, Cls);   //��LCD�ڶ���                            
                       DisNum = 0;                         
                 }                         
                 if(!Shift)                        //���SHIFTû����                        
                 {                                 
                       for (TempCyc = 0;(UnShifted[TempCyc][0]!=ScanCode) 
                            &&(TempCyc<59); TempCyc++); //�����ʾ 
                       if (UnShifted[TempCyc][0] == ScanCode) 
                       {  
                       DisplayOneChar(DisNum, 1, UnShifted[TempCyc][1]);                                
                       DisNum++; 
                       } 
                 }                         
                 else                              //����SHIFT                         
                 {                                 
                       for(TempCyc = 0; (Shifted[TempCyc][0]!=ScanCode)&& 
                          (TempCyc<59); TempCyc++);   //�����ʾ                          
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
          switch (ScanCode)   //�����ɿ�ʱ���������룬��G 34H F0H 34H ��ô�ڶ� ��34H���ᱻ����                 
          {                         
                 // �� SHIFT     
                 case 0x12 : Shift = 0; break;                         
                                                                                                          
                 // �� SHIFT
                 case 0x59 : Shift = 0; break;                                                                                         
          }         
     }         
     B_F = 0;                 //��ʶ�ַ��������� 
} 

//*********************************************** 
//�� �� ����Keyboard_out(); 
//��ڲ������� 
//���ڲ������� 
//�������ã��жϺ��� 
//˵    ���� 
//*********************************************** 
void interrupt Keyboard_out(void) 
{ 
     if(INTE&&INTF) 
     {         
          if((IntNum>0)&&(IntNum<9))         
          {                 
               KeyV=KeyV>>1;             //����������ǵ�>>�ߣ������һ���� ������һλ                 
               if(Key_Data) 
               KeyV=KeyV|0x80;       //������������Ϊ1ʱΪ1�����λ  
          }         
          IntNum++;         
          while (!Key_CLK){;}           //�ȴ�PS/2CLK����                 
          if (IntNum > 10)         
          {                 
               IntNum = 0;               //���ж�10�κ��ʾһ֡�������꣬�� ����׼����һ�ν���                 
               B_F = 1;                   //��ʶ���ַ���������                
               INTE = 0;                 //���жϵ���ʾ����ٿ��ж�        
          } 
          INTF=0; 
     } 
} 

//*********************************************** 
//�� �� ����main(); 
//��ڲ������� 
//���ڲ������� 
//�������ã�MAIN���� 
//˵    ���� 
//*********************************************** 
void main(void) 
{         
     uchar TempCyc;    
     ADCON1=0X07;   //����RA�ں�RE��Ϊ����I/O��    
     Board_init();  //���ÿ�����Ӳ����ʼ������
     RA3=1;         //�ر�LED�����������оƬ�����

     TRISB0=1;      //����PS2_CLKΪ����� 
     TRISB1=1;      //����PS2_DATAΪ����� 
    
                                   
     Delay400Ms();                           //�����ȴ�����LCM���빤��״̬         
     LCMInit();                              //LCM��ʼ��         
     Delay5Ms();                             //��ʱƬ��(�ɲ�Ҫ)                             
     DisplayListChar(0, 0, model_name);         
                   
     Delay400Ms();                           //��ʱ         
     DisplayListChar(0, 1, Cls);                 
     INTEDG= 0;                              //���ⲿ�жϵ͵�ƽ����  
     INTF=0;                                 //���жϱ�־        
     INTE = 1;                               //���ⲿ�ж� 
     GIE = 1;                                //��ȫ���ж�                 
     do         
     {                 
     if (B_F){Decode(KeyV);}                 
     else   {INTE = 1;}                      //���ⲿ�ж�       
     }while(1); 
} 



