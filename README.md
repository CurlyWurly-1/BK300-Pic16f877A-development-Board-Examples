# BK300-Pic16f877A-development-Board-Examples
<img src="BK300.jpg" alt="BK300 Dev board"/>

This repository is for collecting the programs as supplied with the BK300 Pic Development board as seen in the picture above
When time permits, I hope to load versions of these programs so that they can be easily used with the latest version of the MPLAB X and the XC8 compiler


# Layout of Components
<img src="BK300_Layout.jpg" alt="BK300 Layout"/>


# Schematic Diagram
<img src="BK300_Circuit_Diagram.jpg" alt="BK300 Schematics"/>

# Important points
- The following 3 items are not normally supplied with the development board
  - "Pickit 3" programmer not supplied - You need to purchase this separately. If you don't have this programmer, you cannot load anything into the pic (Note in the schematic that nothing is connected to the data pins of USB connection. This Dev board only uses the USB connector to get regulated 5V power. 
  - "DS18B20 temperature sensor" (or any 1-wire sensor) is not supplied  - You need to purchase this separately and insert the wires into the U10 connector - Thankfully, this isn't a show stopper for any other experiments that don't use the DS18B20
  - "Stepper motor" is not supplied - You need to purchase this separately
- The 7 segment displays are connected to 74HC573 latches. This is a good thing because the use of latches means you don't have to repeatedly strobe the 7 segment displays
