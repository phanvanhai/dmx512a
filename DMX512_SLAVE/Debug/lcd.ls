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
  59                     ; 8 	GPIO_Init(LCD_PORT, LCD_EN, GPIO_MODE_OUT_PP_HIGH_FAST);
  61  000b 4bf0          	push	#240
  62  000d 4b08          	push	#8
  63  000f ae500a        	ldw	x,#20490
  64  0012 cd0000        	call	_GPIO_Init
  66  0015 85            	popw	x
  67                     ; 9 	GPIO_Init(LCD_PORT, LCD_DB4, GPIO_MODE_OUT_PP_HIGH_FAST);
  69  0016 4bf0          	push	#240
  70  0018 4b10          	push	#16
  71  001a ae500a        	ldw	x,#20490
  72  001d cd0000        	call	_GPIO_Init
  74  0020 85            	popw	x
  75                     ; 10 	GPIO_Init(LCD_PORT, LCD_DB5, GPIO_MODE_OUT_PP_HIGH_FAST);
  77  0021 4bf0          	push	#240
  78  0023 4b20          	push	#32
  79  0025 ae500a        	ldw	x,#20490
  80  0028 cd0000        	call	_GPIO_Init
  82  002b 85            	popw	x
  83                     ; 11 	GPIO_Init(LCD_PORT, LCD_DB6, GPIO_MODE_OUT_PP_HIGH_FAST);
  85  002c 4bf0          	push	#240
  86  002e 4b40          	push	#64
  87  0030 ae500a        	ldw	x,#20490
  88  0033 cd0000        	call	_GPIO_Init
  90  0036 85            	popw	x
  91                     ; 12 	GPIO_Init(LCD_PORT, LCD_DB7, GPIO_MODE_OUT_PP_HIGH_FAST);
  93  0037 4bf0          	push	#240
  94  0039 4b80          	push	#128
  95  003b ae500a        	ldw	x,#20490
  96  003e cd0000        	call	_GPIO_Init
  98  0041 85            	popw	x
  99                     ; 13 	delay_ms(70);    
 101  0042 ae0046        	ldw	x,#70
 102  0045 cd0000        	call	_delay_ms
 104                     ; 14 }
 107  0048 81            	ret
 136                     ; 17 void LCD_init(void)
 136                     ; 18 {                                     
 137                     	switch	.text
 138  0049               _LCD_init:
 142                     ; 19 	LCD_GPIO_init();    
 144  0049 adb5          	call	_LCD_GPIO_init
 146                     ; 20     toggle_EN_pin();
 148  004b cd01e5        	call	_toggle_EN_pin
 150                     ; 22     GPIO_WriteLow(GPIOD, LCD_RS);            
 152  004e 4b04          	push	#4
 153  0050 ae500f        	ldw	x,#20495
 154  0053 cd0000        	call	_GPIO_WriteLow
 156  0056 84            	pop	a
 157                     ; 23     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 159  0057 4b80          	push	#128
 160  0059 ae500a        	ldw	x,#20490
 161  005c cd0000        	call	_GPIO_WriteLow
 163  005f 84            	pop	a
 164                     ; 24     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 166  0060 4b40          	push	#64
 167  0062 ae500a        	ldw	x,#20490
 168  0065 cd0000        	call	_GPIO_WriteLow
 170  0068 84            	pop	a
 171                     ; 25     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 173  0069 4b20          	push	#32
 174  006b ae500a        	ldw	x,#20490
 175  006e cd0000        	call	_GPIO_WriteHigh
 177  0071 84            	pop	a
 178                     ; 26     GPIO_WriteHigh(LCD_PORT, LCD_DB4);                      
 180  0072 4b10          	push	#16
 181  0074 ae500a        	ldw	x,#20490
 182  0077 cd0000        	call	_GPIO_WriteHigh
 184  007a 84            	pop	a
 185                     ; 27 		toggle_EN_pin();
 187  007b cd01e5        	call	_toggle_EN_pin
 189                     ; 29 		delay_ms(5);
 191  007e ae0005        	ldw	x,#5
 192  0081 cd0000        	call	_delay_ms
 194                     ; 30     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 196  0084 4b80          	push	#128
 197  0086 ae500a        	ldw	x,#20490
 198  0089 cd0000        	call	_GPIO_WriteLow
 200  008c 84            	pop	a
 201                     ; 31     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 203  008d 4b40          	push	#64
 204  008f ae500a        	ldw	x,#20490
 205  0092 cd0000        	call	_GPIO_WriteLow
 207  0095 84            	pop	a
 208                     ; 32     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 210  0096 4b20          	push	#32
 211  0098 ae500a        	ldw	x,#20490
 212  009b cd0000        	call	_GPIO_WriteHigh
 214  009e 84            	pop	a
 215                     ; 33     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 217  009f 4b10          	push	#16
 218  00a1 ae500a        	ldw	x,#20490
 219  00a4 cd0000        	call	_GPIO_WriteHigh
 221  00a7 84            	pop	a
 222                     ; 34     toggle_EN_pin();
 224  00a8 cd01e5        	call	_toggle_EN_pin
 226                     ; 36 		delay_ms(5);
 228  00ab ae0005        	ldw	x,#5
 229  00ae cd0000        	call	_delay_ms
 231                     ; 37     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 233  00b1 4b80          	push	#128
 234  00b3 ae500a        	ldw	x,#20490
 235  00b6 cd0000        	call	_GPIO_WriteLow
 237  00b9 84            	pop	a
 238                     ; 38     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 240  00ba 4b40          	push	#64
 241  00bc ae500a        	ldw	x,#20490
 242  00bf cd0000        	call	_GPIO_WriteLow
 244  00c2 84            	pop	a
 245                     ; 39     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 247  00c3 4b20          	push	#32
 248  00c5 ae500a        	ldw	x,#20490
 249  00c8 cd0000        	call	_GPIO_WriteHigh
 251  00cb 84            	pop	a
 252                     ; 40     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 254  00cc 4b10          	push	#16
 255  00ce ae500a        	ldw	x,#20490
 256  00d1 cd0000        	call	_GPIO_WriteHigh
 258  00d4 84            	pop	a
 259                     ; 41     toggle_EN_pin();                  
 261  00d5 cd01e5        	call	_toggle_EN_pin
 263                     ; 43 		delay_ms(5);
 265  00d8 ae0005        	ldw	x,#5
 266  00db cd0000        	call	_delay_ms
 268                     ; 44     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 270  00de 4b80          	push	#128
 271  00e0 ae500a        	ldw	x,#20490
 272  00e3 cd0000        	call	_GPIO_WriteLow
 274  00e6 84            	pop	a
 275                     ; 45     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 277  00e7 4b40          	push	#64
 278  00e9 ae500a        	ldw	x,#20490
 279  00ec cd0000        	call	_GPIO_WriteLow
 281  00ef 84            	pop	a
 282                     ; 46     GPIO_WriteHigh(LCD_PORT, LCD_DB5);        
 284  00f0 4b20          	push	#32
 285  00f2 ae500a        	ldw	x,#20490
 286  00f5 cd0000        	call	_GPIO_WriteHigh
 288  00f8 84            	pop	a
 289                     ; 47     GPIO_WriteLow(LCD_PORT, LCD_DB4);  
 291  00f9 4b10          	push	#16
 292  00fb ae500a        	ldw	x,#20490
 293  00fe cd0000        	call	_GPIO_WriteLow
 295  0101 84            	pop	a
 296                     ; 48     toggle_EN_pin();
 298  0102 cd01e5        	call	_toggle_EN_pin
 300                     ; 50     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
 302  0105 ae2800        	ldw	x,#10240
 303  0108 ad10          	call	_LCD_send
 305                     ; 51     LCD_send((display_on | cursor_off | blink_on), CMD); 
 307  010a ae0d00        	ldw	x,#3328
 308  010d ad0b          	call	_LCD_send
 310                     ; 52     LCD_send(clear_display, CMD);         
 312  010f ae0100        	ldw	x,#256
 313  0112 ad06          	call	_LCD_send
 315                     ; 53     LCD_send((cursor_direction_inc | display_no_shift), CMD);
 317  0114 ae0600        	ldw	x,#1536
 318  0117 ad01          	call	_LCD_send
 320                     ; 54 }   
 323  0119 81            	ret
 369                     ; 57 void LCD_send(unsigned char value, unsigned char mode)
 369                     ; 58 {                               
 370                     	switch	.text
 371  011a               _LCD_send:
 373  011a 89            	pushw	x
 374       00000000      OFST:	set	0
 377                     ; 59     switch(mode)
 379  011b 9f            	ld	a,xl
 381                     ; 69 			break;
 382  011c 4d            	tnz	a
 383  011d 270e          	jreq	L33
 384  011f 4a            	dec	a
 385  0120 2614          	jrne	L16
 386                     ; 63 			GPIO_WriteHigh(GPIOD, LCD_RS);   
 388  0122 4b04          	push	#4
 389  0124 ae500f        	ldw	x,#20495
 390  0127 cd0000        	call	_GPIO_WriteHigh
 392  012a 84            	pop	a
 393                     ; 64 			break;
 395  012b 2009          	jra	L16
 396  012d               L33:
 397                     ; 68 			GPIO_WriteLow(GPIOD, LCD_RS);   
 399  012d 4b04          	push	#4
 400  012f ae500f        	ldw	x,#20495
 401  0132 cd0000        	call	_GPIO_WriteLow
 403  0135 84            	pop	a
 404                     ; 69 			break;
 406  0136               L16:
 407                     ; 73     LCD_4bit_send(value);
 409  0136 7b01          	ld	a,(OFST+1,sp)
 410  0138 ad02          	call	_LCD_4bit_send
 412                     ; 74 }  
 415  013a 85            	popw	x
 416  013b 81            	ret
 452                     ; 77 void LCD_4bit_send(unsigned char lcd_data)       
 452                     ; 78 {
 453                     	switch	.text
 454  013c               _LCD_4bit_send:
 456  013c 88            	push	a
 457       00000000      OFST:	set	0
 460                     ; 79 	toggle_io(lcd_data, 7, LCD_DB7);
 462  013d 4b80          	push	#128
 463  013f ae0007        	ldw	x,#7
 464  0142 95            	ld	xh,a
 465  0143 cd01fe        	call	_toggle_io
 467  0146 84            	pop	a
 468                     ; 80 	toggle_io(lcd_data, 6, LCD_DB6);
 470  0147 4b40          	push	#64
 471  0149 7b02          	ld	a,(OFST+2,sp)
 472  014b ae0006        	ldw	x,#6
 473  014e 95            	ld	xh,a
 474  014f cd01fe        	call	_toggle_io
 476  0152 84            	pop	a
 477                     ; 81 	toggle_io(lcd_data, 5, LCD_DB5);
 479  0153 4b20          	push	#32
 480  0155 7b02          	ld	a,(OFST+2,sp)
 481  0157 ae0005        	ldw	x,#5
 482  015a 95            	ld	xh,a
 483  015b cd01fe        	call	_toggle_io
 485  015e 84            	pop	a
 486                     ; 82 	toggle_io(lcd_data, 4, LCD_DB4);
 488  015f 4b10          	push	#16
 489  0161 7b02          	ld	a,(OFST+2,sp)
 490  0163 ae0004        	ldw	x,#4
 491  0166 95            	ld	xh,a
 492  0167 cd01fe        	call	_toggle_io
 494  016a 84            	pop	a
 495                     ; 83     toggle_EN_pin();
 497  016b ad78          	call	_toggle_EN_pin
 499                     ; 84 	toggle_io(lcd_data, 3, LCD_DB7);
 501  016d 4b80          	push	#128
 502  016f 7b02          	ld	a,(OFST+2,sp)
 503  0171 ae0003        	ldw	x,#3
 504  0174 95            	ld	xh,a
 505  0175 cd01fe        	call	_toggle_io
 507  0178 84            	pop	a
 508                     ; 85 	toggle_io(lcd_data, 2, LCD_DB6);
 510  0179 4b40          	push	#64
 511  017b 7b02          	ld	a,(OFST+2,sp)
 512  017d ae0002        	ldw	x,#2
 513  0180 95            	ld	xh,a
 514  0181 ad7b          	call	_toggle_io
 516  0183 84            	pop	a
 517                     ; 86 	toggle_io(lcd_data, 1, LCD_DB5);
 519  0184 4b20          	push	#32
 520  0186 7b02          	ld	a,(OFST+2,sp)
 521  0188 ae0001        	ldw	x,#1
 522  018b 95            	ld	xh,a
 523  018c ad70          	call	_toggle_io
 525  018e 84            	pop	a
 526                     ; 87 	toggle_io(lcd_data, 0, LCD_DB4);
 528  018f 4b10          	push	#16
 529  0191 7b02          	ld	a,(OFST+2,sp)
 530  0193 5f            	clrw	x
 531  0194 95            	ld	xh,a
 532  0195 ad67          	call	_toggle_io
 534  0197 84            	pop	a
 535                     ; 88 	toggle_EN_pin();
 537  0198 ad4b          	call	_toggle_EN_pin
 539                     ; 89 }  
 542  019a 84            	pop	a
 543  019b 81            	ret
 579                     ; 92 void LCD_putstr(char *lcd_string)
 579                     ; 93 {
 580                     	switch	.text
 581  019c               _LCD_putstr:
 583  019c 89            	pushw	x
 584       00000000      OFST:	set	0
 587  019d               L711:
 588                     ; 96 			LCD_send(*lcd_string++, DAT);
 590  019d 1e01          	ldw	x,(OFST+1,sp)
 591  019f 1c0001        	addw	x,#1
 592  01a2 1f01          	ldw	(OFST+1,sp),x
 593  01a4 1d0001        	subw	x,#1
 594  01a7 f6            	ld	a,(x)
 595  01a8 ae0001        	ldw	x,#1
 596  01ab 95            	ld	xh,a
 597  01ac cd011a        	call	_LCD_send
 599                     ; 97     }while(*lcd_string != '\0');
 601  01af 1e01          	ldw	x,(OFST+1,sp)
 602  01b1 7d            	tnz	(x)
 603  01b2 26e9          	jrne	L711
 604                     ; 98 }
 607  01b4 85            	popw	x
 608  01b5 81            	ret
 643                     ; 101 void LCD_putchar(char char_data)
 643                     ; 102 {
 644                     	switch	.text
 645  01b6               _LCD_putchar:
 649                     ; 103     LCD_send(char_data, DAT);
 651  01b6 ae0001        	ldw	x,#1
 652  01b9 95            	ld	xh,a
 653  01ba cd011a        	call	_LCD_send
 655                     ; 104 }
 658  01bd 81            	ret
 682                     ; 107 void LCD_clear_home(void)
 682                     ; 108 {
 683                     	switch	.text
 684  01be               _LCD_clear_home:
 688                     ; 109     LCD_send(clear_display, CMD);
 690  01be ae0100        	ldw	x,#256
 691  01c1 cd011a        	call	_LCD_send
 693                     ; 110     LCD_send(goto_home, CMD);
 695  01c4 ae0200        	ldw	x,#512
 696  01c7 cd011a        	call	_LCD_send
 698                     ; 111 }
 701  01ca 81            	ret
 745                     ; 114 void LCD_goto(unsigned char  x_pos, unsigned char  y_pos)
 745                     ; 115 {                                                   
 746                     	switch	.text
 747  01cb               _LCD_goto:
 749  01cb 89            	pushw	x
 750       00000000      OFST:	set	0
 753                     ; 116 	if(y_pos == 0)    
 755  01cc 9f            	ld	a,xl
 756  01cd 4d            	tnz	a
 757  01ce 260a          	jrne	L571
 758                     ; 118         LCD_send((0x80 | x_pos), CMD);
 760  01d0 9e            	ld	a,xh
 761  01d1 aa80          	or	a,#128
 762  01d3 5f            	clrw	x
 763  01d4 95            	ld	xh,a
 764  01d5 cd011a        	call	_LCD_send
 767  01d8 2009          	jra	L771
 768  01da               L571:
 769                     ; 122         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 771  01da 7b01          	ld	a,(OFST+1,sp)
 772  01dc aac0          	or	a,#192
 773  01de 5f            	clrw	x
 774  01df 95            	ld	xh,a
 775  01e0 cd011a        	call	_LCD_send
 777  01e3               L771:
 778                     ; 124 }
 781  01e3 85            	popw	x
 782  01e4 81            	ret
 808                     ; 126 void toggle_EN_pin(void)
 808                     ; 127 {
 809                     	switch	.text
 810  01e5               _toggle_EN_pin:
 814                     ; 128 	GPIO_WriteHigh(LCD_PORT, LCD_EN);    
 816  01e5 4b08          	push	#8
 817  01e7 ae500a        	ldw	x,#20490
 818  01ea cd0000        	call	_GPIO_WriteHigh
 820  01ed 84            	pop	a
 821                     ; 129     delay_ms(2);
 823  01ee ae0002        	ldw	x,#2
 824  01f1 cd0000        	call	_delay_ms
 826                     ; 130     GPIO_WriteLow(LCD_PORT,LCD_EN); 
 828  01f4 4b08          	push	#8
 829  01f6 ae500a        	ldw	x,#20490
 830  01f9 cd0000        	call	_GPIO_WriteLow
 832  01fc 84            	pop	a
 833                     ; 131 }
 836  01fd 81            	ret
 920                     ; 133 void toggle_io(unsigned char lcd_data, unsigned char bit_pos, unsigned char pin_num)
 920                     ; 134 {
 921                     	switch	.text
 922  01fe               _toggle_io:
 924  01fe 89            	pushw	x
 925  01ff 88            	push	a
 926       00000001      OFST:	set	1
 929                     ; 135 	bool temp = FALSE;
 931                     ; 137     temp = (0x01 & (lcd_data >> bit_pos));
 933  0200 9f            	ld	a,xl
 934  0201 5f            	clrw	x
 935  0202 97            	ld	xl,a
 936  0203 7b02          	ld	a,(OFST+1,sp)
 937  0205 5d            	tnzw	x
 938  0206 2704          	jreq	L03
 939  0208               L23:
 940  0208 44            	srl	a
 941  0209 5a            	decw	x
 942  020a 26fc          	jrne	L23
 943  020c               L03:
 944  020c a401          	and	a,#1
 945  020e 6b01          	ld	(OFST+0,sp),a
 947                     ; 139 	switch(temp)
 949  0210 7b01          	ld	a,(OFST+0,sp)
 950  0212 a101          	cp	a,#1
 951  0214 260c          	jrne	L312
 954  0216               L112:
 955                     ; 143 			GPIO_WriteHigh(LCD_PORT, pin_num);   
 957  0216 7b06          	ld	a,(OFST+5,sp)
 958  0218 88            	push	a
 959  0219 ae500a        	ldw	x,#20490
 960  021c cd0000        	call	_GPIO_WriteHigh
 962  021f 84            	pop	a
 963                     ; 144 			break;
 965  0220 200a          	jra	L162
 966  0222               L312:
 967                     ; 148 			GPIO_WriteLow(LCD_PORT, pin_num);   
 969  0222 7b06          	ld	a,(OFST+5,sp)
 970  0224 88            	push	a
 971  0225 ae500a        	ldw	x,#20490
 972  0228 cd0000        	call	_GPIO_WriteLow
 974  022b 84            	pop	a
 975                     ; 149 			break;
 976  022c               L162:
 977                     ; 152 }
 980  022c 5b03          	addw	sp,#3
 981  022e 81            	ret
1044                     ; 154 void LCD_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
1044                     ; 155 {
1045                     	switch	.text
1046  022f               _LCD_print:
1048  022f 89            	pushw	x
1049  0230 88            	push	a
1050       00000001      OFST:	set	1
1053                     ; 156 	char chr = 0x00;
1055                     ; 158 	chr = (value%1000)/100 + '0';
1057  0231 1e06          	ldw	x,(OFST+5,sp)
1058  0233 90ae03e8      	ldw	y,#1000
1059  0237 65            	divw	x,y
1060  0238 51            	exgw	x,y
1061  0239 a664          	ld	a,#100
1062  023b 62            	div	x,a
1063  023c 1c0030        	addw	x,#48
1064  023f 01            	rrwa	x,a
1065  0240 6b01          	ld	(OFST+0,sp),a
1066  0242 02            	rlwa	x,a
1068                     ; 159 	LCD_goto(x_pos,y_pos);
1070  0243 7b03          	ld	a,(OFST+2,sp)
1071  0245 97            	ld	xl,a
1072  0246 7b02          	ld	a,(OFST+1,sp)
1073  0248 95            	ld	xh,a
1074  0249 ad80          	call	_LCD_goto
1076                     ; 160 	LCD_putchar(chr);
1078  024b 7b01          	ld	a,(OFST+0,sp)
1079  024d cd01b6        	call	_LCD_putchar
1081                     ; 162 	chr = (value%100)/10 + '0';
1083  0250 1e06          	ldw	x,(OFST+5,sp)
1084  0252 a664          	ld	a,#100
1085  0254 62            	div	x,a
1086  0255 5f            	clrw	x
1087  0256 97            	ld	xl,a
1088  0257 a60a          	ld	a,#10
1089  0259 62            	div	x,a
1090  025a 1c0030        	addw	x,#48
1091  025d 01            	rrwa	x,a
1092  025e 6b01          	ld	(OFST+0,sp),a
1093  0260 02            	rlwa	x,a
1095                     ; 163 	LCD_goto(x_pos+1,y_pos);
1097  0261 7b03          	ld	a,(OFST+2,sp)
1098  0263 97            	ld	xl,a
1099  0264 7b02          	ld	a,(OFST+1,sp)
1100  0266 4c            	inc	a
1101  0267 95            	ld	xh,a
1102  0268 cd01cb        	call	_LCD_goto
1104                     ; 164 	LCD_putchar(chr);
1106  026b 7b01          	ld	a,(OFST+0,sp)
1107  026d cd01b6        	call	_LCD_putchar
1109                     ; 166 	chr = (value%10) + '0';
1111  0270 1e06          	ldw	x,(OFST+5,sp)
1112  0272 a60a          	ld	a,#10
1113  0274 62            	div	x,a
1114  0275 5f            	clrw	x
1115  0276 97            	ld	xl,a
1116  0277 1c0030        	addw	x,#48
1117  027a 01            	rrwa	x,a
1118  027b 6b01          	ld	(OFST+0,sp),a
1119  027d 02            	rlwa	x,a
1121                     ; 167 	LCD_goto(x_pos+2,y_pos);
1123  027e 7b03          	ld	a,(OFST+2,sp)
1124  0280 97            	ld	xl,a
1125  0281 7b02          	ld	a,(OFST+1,sp)
1126  0283 ab02          	add	a,#2
1127  0285 95            	ld	xh,a
1128  0286 cd01cb        	call	_LCD_goto
1130                     ; 168 	LCD_putchar(chr);
1132  0289 7b01          	ld	a,(OFST+0,sp)
1133  028b cd01b6        	call	_LCD_putchar
1135                     ; 169 }
1138  028e 5b03          	addw	sp,#3
1139  0290 81            	ret
1152                     	xref	_delay_ms
1153                     	xdef	_LCD_print
1154                     	xdef	_toggle_io
1155                     	xdef	_toggle_EN_pin
1156                     	xdef	_LCD_goto
1157                     	xdef	_LCD_clear_home
1158                     	xdef	_LCD_putchar
1159                     	xdef	_LCD_putstr
1160                     	xdef	_LCD_4bit_send
1161                     	xdef	_LCD_send
1162                     	xdef	_LCD_init
1163                     	xdef	_LCD_GPIO_init
1164                     	xref	_GPIO_WriteLow
1165                     	xref	_GPIO_WriteHigh
1166                     	xref	_GPIO_Init
1185                     	end
