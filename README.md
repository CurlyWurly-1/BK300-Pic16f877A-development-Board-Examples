# BK300-Pic16f877A-development-Board-Examples
<img src="BK300.jpg" alt="BK300 Dev board"/>

This repository is for collecting the programs as supplied with the BK300 Pic Development board as seen in the picture above
When time permits, I hope to load versions of these programs so that they can be easily used with the latest version of the MPLAB X and the XC8 compiler. The original programs are in folder "BK300_original_code" and are as follows
 - Experiment_01_LED  
 - Experiment_02_4x4_Keyboard  
 - Experiment_03_LED 	 
 - Experiment_04_Interupt 	 
 - Experiment_05_timer1 	 	 
 - Experiment_06_timer2 	 
 - Experiment_07_RS232 	 
 - Experiment_08_EEPROM  
 - Experiment_09_Watchdog
 - Experiment_10_ADC 
 - Experiment_11_Speaker  
 - Experiment_12_PWM  
 - Experiment_13_3x3_Keyboard  
 - Experiment_14_LCD_16x2 	 
 - Experiment_15_AT24C02 	 
 - Experiment_16_stepper 	 
 - Experiment_17_IR_Display   
 - Experiment_18_DS18B20  
 - Experiment_19_DS1302  
 - Experiment_20_LCD_128x64  
 - Experiment_21_RS485 	 
 - Experiment_22_PS2_Keyboard
 - Experiment_23_IR_Relay  
 - Experiment_24_AT24C02  

# Layout of Components
<img src="BK300_Layout.jpg" alt="BK300 Layout"/>


# Schematic Diagram
<img src="BK300_Circuit_Diagram.jpg" alt="BK300 Schematics"/>

# Important points
- The following 6 items are not normally supplied with the development board. You will need to obtain the following so you can use the associated software
  - "Pickit 3" programmer not supplied - You need to purchase this separately. If you don't have this programmer, you cannot load anything into the pic 
  - "DS18B20 temperature sensor" (or any 1-wire sensor) not supplied  - You need to purchase this separately and insert the wires into the U10 connector 
  - "Stepper motor" not supplied 
  - "PS2 Keyboard" not supplied
  - "LCD 16x2" not supplied
  - "LCD 128x64" not supplied
 - There are 2 ways to supply regulated 5V to this dev board. (N.B. There is no power supply regulator onboard - a regulated 5v supply must be used)
   - via a USB (printer cable type) connector -  N.B. If you look at the schematic, the data pins of USB connection are not connected. 
   - Via power plug 
 - The 7 segment displays and LEDs are connected through 74HC573 latches. This enables the 7 segment displays and LEDS can be be strobed or isolated if you want to re-use all 8 data pins for PORTD for something else (at the expense of tying up pin RA3 for "output enabling" and pins RC3, RC4 and RC5 for "latching" each of the the 3 x 74HC573 chips)   
 - Jumper J16 is used for when you use a LCD_128x64 only. The position of the jumper determines if a HIGH or LOW is to be defaulted to the PSB pin of the LCD_128x64 - it is set to HIGH as this sems ot be the default for most programs 
