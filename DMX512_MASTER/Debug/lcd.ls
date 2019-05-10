   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 4 void LCD_GPIO_init(void)
  44                     ; 5 {
  46                     	switch	.text
  47  0000               _LCD_GPIO_init:
  51                     ; 6 	GPIO_Init(GPIOD, LCD_RS, GPIO_MODE_OUT_PP_HIGH_FAST);
  53  0000 4bf0          	push	#240
  54  0002 4b04          	push	#4
  55  0004 ae500f        	ldw	x,#20495
  56  0007 cd0000        	call	_GPIO_Init
  58  000a 85            	popw	x
  59                     ; 7 	GPIO_Init(LCD_PORT, LCD_EN, GPIO_MODE_OUT_PP_HIGH_FAST);
  61  000b 4bf0          	push	#240
  62  000d 4b08          	push	#8
  63  000f ae500a        	ldw	x,#20490
  64  0012 cd0000        	call	_GPIO_Init
  66  0015 85            	popw	x
  67                     ; 8 	GPIO_Init(LCD_PORT, LCD_DB4, GPIO_MODE_OUT_PP_HIGH_FAST);
  69  0016 4bf0          	push	#240
  70  0018 4b10          	push	#16
  71  001a ae500a        	ldw	x,#20490
  72  001d cd0000        	call	_GPIO_Init
  74  0020 85            	popw	x
  75                     ; 9 	GPIO_Init(LCD_PORT, LCD_DB5, GPIO_MODE_OUT_PP_HIGH_FAST);
  77  0021 4bf0          	push	#240
  78  0023 4b20          	push	#32
  79  0025 ae500a        	ldw	x,#20490
  80  0028 cd0000        	call	_GPIO_Init
  82  002b 85            	popw	x
  83                     ; 10 	GPIO_Init(LCD_PORT, LCD_DB6, GPIO_MODE_OUT_PP_HIGH_FAST);
  85  002c 4bf0          	push	#240
  86  002e 4b40          	push	#64
  87  0030 ae500a        	ldw	x,#20490
  88  0033 cd0000        	call	_GPIO_Init
  90  0036 85            	popw	x
  91                     ; 11 	GPIO_Init(LCD_PORT, LCD_DB7, GPIO_MODE_OUT_PP_HIGH_FAST);
  93  0037 4bf0          	push	#240
  94  0039 4b80          	push	#128
  95  003b ae500a        	ldw	x,#20490
  96  003e cd0000        	call	_GPIO_Init
  98  0041 85            	popw	x
  99                     ; 12 	delay_ms(50);    
 101  0042 ae0032        	ldw	x,#50
 102  0045 cd0000        	call	_delay_ms
 104                     ; 13 }
 107  0048 81            	ret
 136                     ; 16 void LCD_init(void)
 136                     ; 17 {                                     
 137                     	switch	.text
 138  0049               _LCD_init:
 142                     ; 18 	LCD_GPIO_init();    
 144  0049 adb5          	call	_LCD_GPIO_init
 146                     ; 19     toggle_EN_pin();
 148  004b cd01e5        	call	_toggle_EN_pin
 150                     ; 21     GPIO_WriteLow(GPIOD, LCD_RS);            
 152  004e 4b04          	push	#4
 153  0050 ae500f        	ldw	x,#20495
 154  0053 cd0000        	call	_GPIO_WriteLow
 156  0056 84            	pop	a
 157                     ; 22     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 159  0057 4b80          	push	#128
 160  0059 ae500a        	ldw	x,#20490
 161  005c cd0000        	call	_GPIO_WriteLow
 163  005f 84            	pop	a
 164                     ; 23     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 166  0060 4b40          	push	#64
 167  0062 ae500a        	ldw	x,#20490
 168  0065 cd0000        	call	_GPIO_WriteLow
 170  0068 84            	pop	a
 171                     ; 24     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 173  0069 4b20          	push	#32
 174  006b ae500a        	ldw	x,#20490
 175  006e cd0000        	call	_GPIO_WriteHigh
 177  0071 84            	pop	a
 178                     ; 25     GPIO_WriteHigh(LCD_PORT, LCD_DB4);                      
 180  0072 4b10          	push	#16
 181  0074 ae500a        	ldw	x,#20490
 182  0077 cd0000        	call	_GPIO_WriteHigh
 184  007a 84            	pop	a
 185                     ; 26 		toggle_EN_pin();
 187  007b cd01e5        	call	_toggle_EN_pin
 189                     ; 28 		delay_ms(5);
 191  007e ae0005        	ldw	x,#5
 192  0081 cd0000        	call	_delay_ms
 194                     ; 29     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 196  0084 4b80          	push	#128
 197  0086 ae500a        	ldw	x,#20490
 198  0089 cd0000        	call	_GPIO_WriteLow
 200  008c 84            	pop	a
 201                     ; 30     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 203  008d 4b40          	push	#64
 204  008f ae500a        	ldw	x,#20490
 205  0092 cd0000        	call	_GPIO_WriteLow
 207  0095 84            	pop	a
 208                     ; 31     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 210  0096 4b20          	push	#32
 211  0098 ae500a        	ldw	x,#20490
 212  009b cd0000        	call	_GPIO_WriteHigh
 214  009e 84            	pop	a
 215                     ; 32     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 217  009f 4b10          	push	#16
 218  00a1 ae500a        	ldw	x,#20490
 219  00a4 cd0000        	call	_GPIO_WriteHigh
 221  00a7 84            	pop	a
 222                     ; 33     toggle_EN_pin();
 224  00a8 cd01e5        	call	_toggle_EN_pin
 226                     ; 35 		delay_ms(5);
 228  00ab ae0005        	ldw	x,#5
 229  00ae cd0000        	call	_delay_ms
 231                     ; 36     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 233  00b1 4b80          	push	#128
 234  00b3 ae500a        	ldw	x,#20490
 235  00b6 cd0000        	call	_GPIO_WriteLow
 237  00b9 84            	pop	a
 238                     ; 37     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 240  00ba 4b40          	push	#64
 241  00bc ae500a        	ldw	x,#20490
 242  00bf cd0000        	call	_GPIO_WriteLow
 244  00c2 84            	pop	a
 245                     ; 38     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 247  00c3 4b20          	push	#32
 248  00c5 ae500a        	ldw	x,#20490
 249  00c8 cd0000        	call	_GPIO_WriteHigh
 251  00cb 84            	pop	a
 252                     ; 39     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 254  00cc 4b10          	push	#16
 255  00ce ae500a        	ldw	x,#20490
 256  00d1 cd0000        	call	_GPIO_WriteHigh
 258  00d4 84            	pop	a
 259                     ; 40     toggle_EN_pin();                  
 261  00d5 cd01e5        	call	_toggle_EN_pin
 263                     ; 42 		delay_ms(5);
 265  00d8 ae0005        	ldw	x,#5
 266  00db cd0000        	call	_delay_ms
 268                     ; 43     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 270  00de 4b80          	push	#128
 271  00e0 ae500a        	ldw	x,#20490
 272  00e3 cd0000        	call	_GPIO_WriteLow
 274  00e6 84            	pop	a
 275                     ; 44     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 277  00e7 4b40          	push	#64
 278  00e9 ae500a        	ldw	x,#20490
 279  00ec cd0000        	call	_GPIO_WriteLow
 281  00ef 84            	pop	a
 282                     ; 45     GPIO_WriteHigh(LCD_PORT, LCD_DB5);        
 284  00f0 4b20          	push	#32
 285  00f2 ae500a        	ldw	x,#20490
 286  00f5 cd0000        	call	_GPIO_WriteHigh
 288  00f8 84            	pop	a
 289                     ; 46     GPIO_WriteLow(LCD_PORT, LCD_DB4);  
 291  00f9 4b10          	push	#16
 292  00fb ae500a        	ldw	x,#20490
 293  00fe cd0000        	call	_GPIO_WriteLow
 295  0101 84            	pop	a
 296                     ; 47     toggle_EN_pin();
 298  0102 cd01e5        	call	_toggle_EN_pin
 300                     ; 50     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
 302  0105 ae2800        	ldw	x,#10240
 303  0108 ad10          	call	_LCD_send
 305                     ; 51     LCD_send((display_on | cursor_off | blink_off), CMD); 
 307  010a ae0c00        	ldw	x,#3072
 308  010d ad0b          	call	_LCD_send
 310                     ; 52     LCD_send(clear_display, CMD);         
 312  010f ae0100        	ldw	x,#256
 313  0112 ad06          	call	_LCD_send
 315                     ; 53     LCD_send((cursor_direction_inc | display_no_shift), CMD);
 317  0114 ae0600        	ldw	x,#1536
 318  0117 ad01          	call	_LCD_send
 320                     ; 54 }   
 323  0119 81            	ret
 365                     ; 57 void LCD_send(unsigned char value, unsigned char mode)
 365                     ; 58 {                               
 366                     	switch	.text
 367  011a               _LCD_send:
 369  011a 89            	pushw	x
 370       00000000      OFST:	set	0
 373                     ; 59     switch(mode)
 375  011b 9f            	ld	a,xl
 377                     ; 69 			break;
 378  011c 4d            	tnz	a
 379  011d 270e          	jreq	L33
 380  011f 4a            	dec	a
 381  0120 2614          	jrne	L55
 382                     ; 63 			GPIO_WriteHigh(GPIOD, LCD_RS);   
 384  0122 4b04          	push	#4
 385  0124 ae500f        	ldw	x,#20495
 386  0127 cd0000        	call	_GPIO_WriteHigh
 388  012a 84            	pop	a
 389                     ; 64 			break;
 391  012b 2009          	jra	L55
 392  012d               L33:
 393                     ; 68 			GPIO_WriteLow(GPIOD, LCD_RS);   
 395  012d 4b04          	push	#4
 396  012f ae500f        	ldw	x,#20495
 397  0132 cd0000        	call	_GPIO_WriteLow
 399  0135 84            	pop	a
 400                     ; 69 			break;
 402  0136               L55:
 403                     ; 73     LCD_4bit_send(value);
 405  0136 7b01          	ld	a,(OFST+1,sp)
 406  0138 ad02          	call	_LCD_4bit_send
 408                     ; 74 }  
 411  013a 85            	popw	x
 412  013b 81            	ret
 446                     ; 77 void LCD_4bit_send(unsigned char lcd_data)       
 446                     ; 78 {
 447                     	switch	.text
 448  013c               _LCD_4bit_send:
 450  013c 88            	push	a
 451       00000000      OFST:	set	0
 454                     ; 79 	toggle_io(lcd_data, 7, LCD_DB7);
 456  013d 4b80          	push	#128
 457  013f ae0007        	ldw	x,#7
 458  0142 95            	ld	xh,a
 459  0143 cd01fe        	call	_toggle_io
 461  0146 84            	pop	a
 462                     ; 80 	toggle_io(lcd_data, 6, LCD_DB6);
 464  0147 4b40          	push	#64
 465  0149 7b02          	ld	a,(OFST+2,sp)
 466  014b ae0006        	ldw	x,#6
 467  014e 95            	ld	xh,a
 468  014f cd01fe        	call	_toggle_io
 470  0152 84            	pop	a
 471                     ; 81 	toggle_io(lcd_data, 5, LCD_DB5);
 473  0153 4b20          	push	#32
 474  0155 7b02          	ld	a,(OFST+2,sp)
 475  0157 ae0005        	ldw	x,#5
 476  015a 95            	ld	xh,a
 477  015b cd01fe        	call	_toggle_io
 479  015e 84            	pop	a
 480                     ; 82 	toggle_io(lcd_data, 4, LCD_DB4);
 482  015f 4b10          	push	#16
 483  0161 7b02          	ld	a,(OFST+2,sp)
 484  0163 ae0004        	ldw	x,#4
 485  0166 95            	ld	xh,a
 486  0167 cd01fe        	call	_toggle_io
 488  016a 84            	pop	a
 489                     ; 83 	toggle_EN_pin();
 491  016b ad78          	call	_toggle_EN_pin
 493                     ; 84 	toggle_io(lcd_data, 3, LCD_DB7);
 495  016d 4b80          	push	#128
 496  016f 7b02          	ld	a,(OFST+2,sp)
 497  0171 ae0003        	ldw	x,#3
 498  0174 95            	ld	xh,a
 499  0175 cd01fe        	call	_toggle_io
 501  0178 84            	pop	a
 502                     ; 85 	toggle_io(lcd_data, 2, LCD_DB6);
 504  0179 4b40          	push	#64
 505  017b 7b02          	ld	a,(OFST+2,sp)
 506  017d ae0002        	ldw	x,#2
 507  0180 95            	ld	xh,a
 508  0181 ad7b          	call	_toggle_io
 510  0183 84            	pop	a
 511                     ; 86 	toggle_io(lcd_data, 1, LCD_DB5);
 513  0184 4b20          	push	#32
 514  0186 7b02          	ld	a,(OFST+2,sp)
 515  0188 ae0001        	ldw	x,#1
 516  018b 95            	ld	xh,a
 517  018c ad70          	call	_toggle_io
 519  018e 84            	pop	a
 520                     ; 87 	toggle_io(lcd_data, 0, LCD_DB4);
 522  018f 4b10          	push	#16
 523  0191 7b02          	ld	a,(OFST+2,sp)
 524  0193 5f            	clrw	x
 525  0194 95            	ld	xh,a
 526  0195 ad67          	call	_toggle_io
 528  0197 84            	pop	a
 529                     ; 88 	toggle_EN_pin();
 531  0198 ad4b          	call	_toggle_EN_pin
 533                     ; 89 }  
 536  019a 84            	pop	a
 537  019b 81            	ret
 573                     ; 92 void LCD_putstr(char *lcd_string)
 573                     ; 93 {
 574                     	switch	.text
 575  019c               _LCD_putstr:
 577  019c 89            	pushw	x
 578       00000000      OFST:	set	0
 581  019d               L111:
 582                     ; 96         LCD_send(*lcd_string++, DAT);
 584  019d 1e01          	ldw	x,(OFST+1,sp)
 585  019f 1c0001        	addw	x,#1
 586  01a2 1f01          	ldw	(OFST+1,sp),x
 587  01a4 1d0001        	subw	x,#1
 588  01a7 f6            	ld	a,(x)
 589  01a8 ae0001        	ldw	x,#1
 590  01ab 95            	ld	xh,a
 591  01ac cd011a        	call	_LCD_send
 593                     ; 97     }while(*lcd_string != '\0');
 595  01af 1e01          	ldw	x,(OFST+1,sp)
 596  01b1 7d            	tnz	(x)
 597  01b2 26e9          	jrne	L111
 598                     ; 98 }
 601  01b4 85            	popw	x
 602  01b5 81            	ret
 635                     ; 101 void LCD_putchar(char char_data)
 635                     ; 102 {
 636                     	switch	.text
 637  01b6               _LCD_putchar:
 641                     ; 103     LCD_send(char_data, DAT);
 643  01b6 ae0001        	ldw	x,#1
 644  01b9 95            	ld	xh,a
 645  01ba cd011a        	call	_LCD_send
 647                     ; 104 }
 650  01bd 81            	ret
 674                     ; 107 void LCD_clear_home(void)
 674                     ; 108 {
 675                     	switch	.text
 676  01be               _LCD_clear_home:
 680                     ; 109     LCD_send(clear_display, CMD);
 682  01be ae0100        	ldw	x,#256
 683  01c1 cd011a        	call	_LCD_send
 685                     ; 110     LCD_send(goto_home, CMD);
 687  01c4 ae0200        	ldw	x,#512
 688  01c7 cd011a        	call	_LCD_send
 690                     ; 111 }
 693  01ca 81            	ret
 733                     ; 114 void LCD_goto(unsigned char  x_pos, unsigned char  y_pos)
 733                     ; 115 {                                                   
 734                     	switch	.text
 735  01cb               _LCD_goto:
 737  01cb 89            	pushw	x
 738       00000000      OFST:	set	0
 741                     ; 116 	if(y_pos == 0)    
 743  01cc 9f            	ld	a,xl
 744  01cd 4d            	tnz	a
 745  01ce 260a          	jrne	L161
 746                     ; 118         LCD_send((0x80 | x_pos), CMD);
 748  01d0 9e            	ld	a,xh
 749  01d1 aa80          	or	a,#128
 750  01d3 5f            	clrw	x
 751  01d4 95            	ld	xh,a
 752  01d5 cd011a        	call	_LCD_send
 755  01d8 2009          	jra	L361
 756  01da               L161:
 757                     ; 122         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 759  01da 7b01          	ld	a,(OFST+1,sp)
 760  01dc aac0          	or	a,#192
 761  01de 5f            	clrw	x
 762  01df 95            	ld	xh,a
 763  01e0 cd011a        	call	_LCD_send
 765  01e3               L361:
 766                     ; 124 }
 769  01e3 85            	popw	x
 770  01e4 81            	ret
 796                     ; 127 void toggle_EN_pin(void)
 796                     ; 128 {
 797                     	switch	.text
 798  01e5               _toggle_EN_pin:
 802                     ; 129 	GPIO_WriteHigh(LCD_PORT, LCD_EN);    
 804  01e5 4b08          	push	#8
 805  01e7 ae500a        	ldw	x,#20490
 806  01ea cd0000        	call	_GPIO_WriteHigh
 808  01ed 84            	pop	a
 809                     ; 130     delay_ms(2);
 811  01ee ae0002        	ldw	x,#2
 812  01f1 cd0000        	call	_delay_ms
 814                     ; 131     GPIO_WriteLow(LCD_PORT,LCD_EN);   
 816  01f4 4b08          	push	#8
 817  01f6 ae500a        	ldw	x,#20490
 818  01f9 cd0000        	call	_GPIO_WriteLow
 820  01fc 84            	pop	a
 821                     ; 132 }
 824  01fd 81            	ret
 902                     ; 135 void toggle_io(unsigned char lcd_data, unsigned char bit_pos, unsigned char pin_num)
 902                     ; 136 {
 903                     	switch	.text
 904  01fe               _toggle_io:
 906  01fe 89            	pushw	x
 907  01ff 88            	push	a
 908       00000001      OFST:	set	1
 911                     ; 137 	bool temp = FALSE;
 913                     ; 139     temp = (0x01 & (lcd_data >> bit_pos));
 915  0200 9f            	ld	a,xl
 916  0201 5f            	clrw	x
 917  0202 97            	ld	xl,a
 918  0203 7b02          	ld	a,(OFST+1,sp)
 919  0205 5d            	tnzw	x
 920  0206 2704          	jreq	L03
 921  0208               L23:
 922  0208 44            	srl	a
 923  0209 5a            	decw	x
 924  020a 26fc          	jrne	L23
 925  020c               L03:
 926  020c a401          	and	a,#1
 927  020e 6b01          	ld	(OFST+0,sp),a
 929                     ; 141 	switch(temp)
 931  0210 7b01          	ld	a,(OFST+0,sp)
 932  0212 a101          	cp	a,#1
 933  0214 260c          	jrne	L771
 936  0216               L571:
 937                     ; 145 			GPIO_WriteHigh(LCD_PORT, pin_num);   
 939  0216 7b06          	ld	a,(OFST+5,sp)
 940  0218 88            	push	a
 941  0219 ae500a        	ldw	x,#20490
 942  021c cd0000        	call	_GPIO_WriteHigh
 944  021f 84            	pop	a
 945                     ; 146 			break;
 947  0220 200a          	jra	L732
 948  0222               L771:
 949                     ; 150 			GPIO_WriteLow(LCD_PORT, pin_num);   
 951  0222 7b06          	ld	a,(OFST+5,sp)
 952  0224 88            	push	a
 953  0225 ae500a        	ldw	x,#20490
 954  0228 cd0000        	call	_GPIO_WriteLow
 956  022b 84            	pop	a
 957                     ; 151 			break;
 958  022c               L732:
 959                     ; 154 }
 962  022c 5b03          	addw	sp,#3
 963  022e 81            	ret
1018                     ; 155 void LCD_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
1018                     ; 156 {
1019                     	switch	.text
1020  022f               _LCD_print:
1022  022f 89            	pushw	x
1023  0230 88            	push	a
1024       00000001      OFST:	set	1
1027                     ; 157 	char chr = 0x00;
1029                     ; 159 	chr = (value%1000)/100 + '0';
1031  0231 1e06          	ldw	x,(OFST+5,sp)
1032  0233 90ae03e8      	ldw	y,#1000
1033  0237 65            	divw	x,y
1034  0238 51            	exgw	x,y
1035  0239 a664          	ld	a,#100
1036  023b 62            	div	x,a
1037  023c 1c0030        	addw	x,#48
1038  023f 01            	rrwa	x,a
1039  0240 6b01          	ld	(OFST+0,sp),a
1040  0242 02            	rlwa	x,a
1042                     ; 160 	LCD_goto(x_pos,y_pos);
1044  0243 7b03          	ld	a,(OFST+2,sp)
1045  0245 97            	ld	xl,a
1046  0246 7b02          	ld	a,(OFST+1,sp)
1047  0248 95            	ld	xh,a
1048  0249 ad80          	call	_LCD_goto
1050                     ; 161 	LCD_putchar(chr);
1052  024b 7b01          	ld	a,(OFST+0,sp)
1053  024d cd01b6        	call	_LCD_putchar
1055                     ; 163 	chr = (value%100)/10 + '0';
1057  0250 1e06          	ldw	x,(OFST+5,sp)
1058  0252 a664          	ld	a,#100
1059  0254 62            	div	x,a
1060  0255 5f            	clrw	x
1061  0256 97            	ld	xl,a
1062  0257 a60a          	ld	a,#10
1063  0259 62            	div	x,a
1064  025a 1c0030        	addw	x,#48
1065  025d 01            	rrwa	x,a
1066  025e 6b01          	ld	(OFST+0,sp),a
1067  0260 02            	rlwa	x,a
1069                     ; 164 	LCD_goto(x_pos+1,y_pos);
1071  0261 7b03          	ld	a,(OFST+2,sp)
1072  0263 97            	ld	xl,a
1073  0264 7b02          	ld	a,(OFST+1,sp)
1074  0266 4c            	inc	a
1075  0267 95            	ld	xh,a
1076  0268 cd01cb        	call	_LCD_goto
1078                     ; 165 	LCD_putchar(chr);
1080  026b 7b01          	ld	a,(OFST+0,sp)
1081  026d cd01b6        	call	_LCD_putchar
1083                     ; 167 	chr = (value%10) + '0';
1085  0270 1e06          	ldw	x,(OFST+5,sp)
1086  0272 a60a          	ld	a,#10
1087  0274 62            	div	x,a
1088  0275 5f            	clrw	x
1089  0276 97            	ld	xl,a
1090  0277 1c0030        	addw	x,#48
1091  027a 01            	rrwa	x,a
1092  027b 6b01          	ld	(OFST+0,sp),a
1093  027d 02            	rlwa	x,a
1095                     ; 168 	LCD_goto(x_pos+2,y_pos);
1097  027e 7b03          	ld	a,(OFST+2,sp)
1098  0280 97            	ld	xl,a
1099  0281 7b02          	ld	a,(OFST+1,sp)
1100  0283 ab02          	add	a,#2
1101  0285 95            	ld	xh,a
1102  0286 cd01cb        	call	_LCD_goto
1104                     ; 169 	LCD_putchar(chr);
1106  0289 7b01          	ld	a,(OFST+0,sp)
1107  028b cd01b6        	call	_LCD_putchar
1109                     ; 170 }
1112  028e 5b03          	addw	sp,#3
1113  0290 81            	ret
1126                     	xref	_delay_ms
1127                     	xdef	_LCD_print
1128                     	xdef	_toggle_io
1129                     	xdef	_toggle_EN_pin
1130                     	xdef	_LCD_goto
1131                     	xdef	_LCD_clear_home
1132                     	xdef	_LCD_putchar
1133                     	xdef	_LCD_putstr
1134                     	xdef	_LCD_4bit_send
1135                     	xdef	_LCD_send
1136                     	xdef	_LCD_init
1137                     	xdef	_LCD_GPIO_init
1138                     	xref	_GPIO_WriteLow
1139                     	xref	_GPIO_WriteHigh
1140                     	xref	_GPIO_Init
1159                     	end
