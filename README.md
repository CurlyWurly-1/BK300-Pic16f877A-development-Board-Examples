# BK300-Pic16f877A-development-Board-Examples
<img src="BK300.jpg" alt="BK300 Dev board"/>

This repository is for collecting the programs as supplied with the BK300 Pic Development board as seen in the picture above
When time permits, I hope to load versions of these programs so that they can be easily used with the latest version of the MPLAB X and the XC8 compiler. The original programs are in folder "BK300_original_code" and are as follows
 - Experiment_1_LED  
 - Experiment_2_4x4_Keyboard  
 - Experiment_3_LED 	 
 - Experiment_4_Interupt 	 
 - Experiment_5_timer1 	 	 
 - Experiment_6_timer2 	 
 - Experiment_7_RS232 	 
 - Experiment_8_EEPROM  
 - Experiment_9_Watchdog
 - Experiment_10_ADC 
 - Experiment_11_SPEAKER  
 - Experiment_12_PWM  
 - Experiment_13_3x3_Keyboard  
 - Experiment_14_LCD_16x2 	 
 - Experiment_15_AT24C02 	 
 - Experiment_16_stepper 	 
 - Experiment_17_IR_DISPLAY   
 - Experiment_18_DS18B20  
 - Experiment_19_DS1302  
 - Experiment_20_LCD_128x64  
 - Experiment_21_RS485 	 
 - Experiment_22  
 - Experiment_23_IR_RELAY  
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
 - There are 2 ways to supply regulated 5V to this dev board. (N.B. There is no unregulated power supply input connector - you must supply regulated 5V power))
   - via a USB (printer cable type) connector -  N.B. If you look at the schematic, the data pins of USB connection are not connected. 
   - Via power plug 
 - There is an alternative method to supply power. (The other optio si to sue the 
 - The 7 segment displays and LEDs are connected to 74HC573 latches. This is a good thing because the use of latches means you don't have to repeatedly strobe data to the 7 segment disaplays and rely on your eyes having "persistance of vision". It also means that you can re-use all 8 data pins for PORTD (at the expense of tying up pin RA3 for "output enabling" and pins RC3,RC4 and RC5 for "latching" each of the the 3 x 74HC573 chips)   
