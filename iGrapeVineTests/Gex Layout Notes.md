.gex files



	04 00 47 56 42 45 00 00 00 00 00 00 08 40 00 00 00 00 00 
	00 00 00 00 00 01 00 02 00 06 00 4C 75 74 68 65 72 09 00 
	50 65 64 61 67 6F 67 75 65 05 00 4C 6F 6E 65 72 06 00 52
	61 76 6E 6F 73 06 00 41 6E 61 72 63 68 00 00 15 00 47 69
	64 65 6F 6E 20 28 43 68 61 64 20 57 68 69 74 6C 65 79 29
	0A 00 00 00 0D 00 0D 00 04 00 04 00 02 00 02 00 05 00 05
	00 03 00 03 00 08 00 48 75 6D 61 6E 69 74 79 03 00 03 00
	00 00 02 00 2B 30 0C 00 0C 00 0C 00 04 00 42 69 6C 6C 06
	00 41 63 74 69 76 65 00 00 3C 2B 1A 09 E1 49 E3 40 00 00
	00 00 4D 47 EC 3B 76 92 E3 40 00 00 00 40 00 00 44 42 20
	00 00 00 00 00 40 4A E3 40 00 00 00 00 02 00 00 00 2F 00 
	43 72 65 61 74 65 64 20 63 68 61 72 61 63 74 65 72 20 77 
	69 74 68 20 30 20 58 50 2E 20 20 52 65 6D 6F 76 65 64 20 
	68 75 6D 61 6E 69 74 79 2E 00 00 00 00 00 00 00 00 00 00 
	00 00 40 4A E3 40 00 00 80 40 04 00 00 00 1A 00 50 75 72 
	63 68 61 73 65 64 20 44 69 73 65 61 73 65 20 43 61 72 72 
	69 65 72 2E 00 00 00 00 00 00 80 40 00 00 00 00 40 4A E3 
	40 00 00 80 3F 04 00 00 00 48 00 50 75 72 63 68 61 73 65 
	64 20 41 6E 69 6D 61 6C 20 4B 65 6E 20 78 32 2E 20 52 65 
	6D 6F 76 65 64 20 47 6C 6F 77 69 6E 67 20 45 79 65 73 2C 
	20 4C 65 61 64 65 72 73 68 69 70 20 78 32 2C 20 52 65 73 
	6F 75 72 63 65 73 2E 00 00 00 00 00 00 A0 40 00 00 00 00 
	40 4A E3 40 00 00 80 40 03 00 00 00 26 00 50 75 72 63 68 
	61 73 65 64 20 4C 65 61 64 65 72 73 68 69 70 20 78 32 2C 
	20 52 65 73 6F 75 72 63 65 73 20 78 32 2E 00 00 00 00 00 
	00 80 3F 00 00 00 00 40 4A E3 40 00 00 80 3F 03 00 00 00 
	12 00 50 75 72 63 68 61 73 65 64 20 43 75 6E 6E 69 6E 67 
	2E 00 00 00 00 00 00 00 00 00 00 00 00 60 4A E3 40 00 00 
	F0 41 04 00 00 00 00 00 00 00 00 00 00 00 F0 41 00 00 00 
	00 60 4A E3 40 00 00 00 41 00 00 00 00 09 00 53 54 20 50 
	6F 69 6E 74 73 00 00 00 41 00 00 18 42 00 00 00 00 00 4B
	…
	
From the top:

    04 00 47 56 42 45

(String length 4: 'GVBE' == BinHeaderExchange)

	00 00 00 00 
	00 00 08 40 

([Double precision](http://en.wikipedia.org/wiki/Double-precision_floating-point_format#IEEE_754_double-precision_binary_floating-point_format:_binary64)
'Version' (8 byte) : 400 8 0000 0000 0000)  
Sign bit = 0  
Exponent = 0x400 = 1024  
Exponent Bias = 0x3ff = 1023  
Significand = 0x8 0000 0000 0000  
Value = (implied 1).1 * 2 ^ (1024 - 1023) == 1.1 << 1 == 3

<< Begin Section 1: Game Settings>>

	00 00 

(Integer: Calendar Identifier = 0)  

	00 00 

(Integer: APR Identifier = 0)  

	00 00 

(Integer: XP Awards Identifier = 0)  
	
	00 00

(Integer: Template Identifier = 0)  
	
<< Begin Section 2: Players >>

	'               Master          A list of lists of entities to save, in the 	following order:
	'                               1. List of Game settings
	'                                   - If element 1 is not nothing, save Calendar.
	'                                   - If element 2 is not nothing, save Action/Rumor settings.
	'                                   - If element 3 is not nothing, save XP Awards.
	'                                   - If element 4 is not nothing, save Templates.
	'                               2. List of Players
	'                               3. List of Characters
	'                               4. List of Queries
	'                               5. List of Items
	'                               6. List of Rotes
	'                               7. List of Locations
	'                               8. List of Actions
	'                               9. List of Plots
	'                               10. List of Rumors
	'               HideST          Whether or not to hide ST comments from the exchange file


	00 00	
	
(Integer: Players.count = 0)  
<< Begin Section 3: Characters >>
	
	01 00 

(Integer: Count of Characters = 1)
<< Begin Character Loop>>

    'The third list requires a little extra data before each
    'character entity: watch for and perform that when L=3


	02 00

(Integer: RaceCode of Character = 2 (Vampire))
<< Begin appropriate character class OutputToBinary >>
 
	06 00 4C 75 74 68 65 72

(String length 6: 'Luther')

    09 00 50 65 64 61 67 6F 67 75 65 
    
(String length 9: 'Pedagogue')
	
	05 00 4C 6F 6E 65 72 
	
(String length 5: 'Loner')
	
	06 00 52 61 76 6E 6F 73
	
(String length 6: 'Ravnos')
	
	06 00 41 6E 61 72 63 68
	
(String length 6: 'Anarch')
 
	00 00 
	
(Integer: 0)
	
	15 00 47 69 64 65 6F 6E 20 28 43 68 61 64 20 57 68 69 74 6C 65 79 29
	
(String length 0x15 = 21: 'Gideon (Chad Whitley)')