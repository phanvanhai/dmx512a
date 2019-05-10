   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _i:
  16  0000 00            	dc.b	0
  65                     ; 16 main(void)
  65                     ; 17 {
  67                     	switch	.text
  68  0000               _main:
  72                     ; 18 	clock_setup();
  74  0000 cd00a8        	call	_clock_setup
  76                     ; 19 	GPIO_setup();
  78  0003 cd0114        	call	_GPIO_setup
  80                     ; 20 	PWM_setup();
  82  0006 cd014e        	call	_PWM_setup
  84                     ; 22 	LCD_init();
  86  0009 cd0000        	call	_LCD_init
  88                     ; 23 	LCD_clear_home();
  90  000c cd0000        	call	_LCD_clear_home
  92                     ; 26 	DMX512_RX_init(SIZE, arrDMX);
  94  000f ae0002        	ldw	x,#_arrDMX
  95  0012 89            	pushw	x
  96  0013 ae000a        	ldw	x,#10
  97  0016 cd0000        	call	_DMX512_RX_init
  99  0019 85            	popw	x
 100                     ; 28 	LCD_goto(0,0);
 102  001a 5f            	clrw	x
 103  001b cd0000        	call	_LCD_goto
 105                     ; 29 	LCD_putstr("Data Received:  ");
 107  001e ae000b        	ldw	x,#L12
 108  0021 cd0000        	call	_LCD_putstr
 110                     ; 30 	LCD_goto(0,1);
 112  0024 ae0001        	ldw	x,#1
 113  0027 cd0000        	call	_LCD_goto
 115                     ; 31 	LCD_putstr("arrDMX[");
 117  002a ae0003        	ldw	x,#L32
 118  002d cd0000        	call	_LCD_putstr
 120                     ; 32 	LCD_goto(8,1);
 122  0030 ae0801        	ldw	x,#2049
 123  0033 cd0000        	call	_LCD_goto
 125                     ; 33 	LCD_putstr("]:");
 127  0036 ae0000        	ldw	x,#L52
 128  0039 cd0000        	call	_LCD_putstr
 130                     ; 36 	DMX512_RX_resetTimeout();
 132  003c cd0000        	call	_DMX512_RX_resetTimeout
 134  003f               L72:
 135                     ; 39 		if(DMX512_RX_getFlagNewPacket() == TRUE)
 137  003f cd0000        	call	_DMX512_RX_getFlagNewPacket
 139  0042 a101          	cp	a,#1
 140  0044 26f9          	jrne	L72
 141                     ; 41 			DMX512_RX_setFlagNewPacket(FALSE);
 143  0046 4f            	clr	a
 144  0047 cd0000        	call	_DMX512_RX_setFlagNewPacket
 146                     ; 42 			DMX512_RX_resetTimeout();
 148  004a cd0000        	call	_DMX512_RX_resetTimeout
 150                     ; 45 			LCD_goto(7,1);
 152  004d ae0701        	ldw	x,#1793
 153  0050 cd0000        	call	_LCD_goto
 155                     ; 46 			LCD_putchar(i+'0');
 157  0053 b600          	ld	a,_i
 158  0055 ab30          	add	a,#48
 159  0057 cd0000        	call	_LCD_putchar
 161                     ; 47 			LCD_print(10,1,(unsigned int)arrDMX[i++]);
 163  005a b600          	ld	a,_i
 164  005c 97            	ld	xl,a
 165  005d 3c00          	inc	_i
 166  005f 9f            	ld	a,xl
 167  0060 5f            	clrw	x
 168  0061 97            	ld	xl,a
 169  0062 e602          	ld	a,(_arrDMX,x)
 170  0064 5f            	clrw	x
 171  0065 97            	ld	xl,a
 172  0066 89            	pushw	x
 173  0067 ae0a01        	ldw	x,#2561
 174  006a cd0000        	call	_LCD_print
 176  006d 85            	popw	x
 177                     ; 48 			if( i >= 10) i =0;
 179  006e b600          	ld	a,_i
 180  0070 a10a          	cp	a,#10
 181  0072 2502          	jrult	L53
 184  0074 3f00          	clr	_i
 185  0076               L53:
 186                     ; 49 			delay_ms(700);
 188  0076 ae02bc        	ldw	x,#700
 189  0079 cd0000        	call	_delay_ms
 191                     ; 52 			duty_cycle = (uint16_t)((uint16_t)arrDMX[0]<<8 | arrDMX[1]);
 193  007c b602          	ld	a,_arrDMX
 194  007e 5f            	clrw	x
 195  007f 97            	ld	xl,a
 196  0080 b603          	ld	a,_arrDMX+1
 197  0082 02            	rlwa	x,a
 198  0083 bf00          	ldw	_duty_cycle,x
 199                     ; 53 			TIM2_SetCompare1(duty_cycle % 0x03ff);
 201  0085 be00          	ldw	x,_duty_cycle
 202  0087 90ae03ff      	ldw	y,#1023
 203  008b 65            	divw	x,y
 204  008c 51            	exgw	x,y
 205  008d cd0000        	call	_TIM2_SetCompare1
 207                     ; 55 			duty_cycle = (uint16_t)(300);
 209  0090 ae012c        	ldw	x,#300
 210  0093 bf00          	ldw	_duty_cycle,x
 211                     ; 56 			TIM2_SetCompare2(duty_cycle % 0x03ff);
 213  0095 ae012c        	ldw	x,#300
 214  0098 cd0000        	call	_TIM2_SetCompare2
 216                     ; 58 			duty_cycle = (uint16_t)(300);
 218  009b ae012c        	ldw	x,#300
 219  009e bf00          	ldw	_duty_cycle,x
 220                     ; 59 			TIM2_SetCompare3(duty_cycle % 0x03ff);
 222  00a0 ae012c        	ldw	x,#300
 223  00a3 cd0000        	call	_TIM2_SetCompare3
 225  00a6 2097          	jra	L72
 258                     ; 64 void clock_setup(void)
 258                     ; 65 {
 259                     	switch	.text
 260  00a8               _clock_setup:
 264                     ; 66 	CLK_DeInit();
 266  00a8 cd0000        	call	_CLK_DeInit
 268                     ; 68 	CLK_HSECmd(DISABLE);
 270  00ab 4f            	clr	a
 271  00ac cd0000        	call	_CLK_HSECmd
 273                     ; 69 	CLK_LSICmd(ENABLE);
 275  00af a601          	ld	a,#1
 276  00b1 cd0000        	call	_CLK_LSICmd
 279  00b4               L15:
 280                     ; 70 	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == FALSE);
 282  00b4 ae0110        	ldw	x,#272
 283  00b7 cd0000        	call	_CLK_GetFlagStatus
 285  00ba 4d            	tnz	a
 286  00bb 27f7          	jreq	L15
 287                     ; 71 	CLK_HSICmd(ENABLE);
 289  00bd a601          	ld	a,#1
 290  00bf cd0000        	call	_CLK_HSICmd
 293  00c2               L75:
 294                     ; 72 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 296  00c2 ae0102        	ldw	x,#258
 297  00c5 cd0000        	call	_CLK_GetFlagStatus
 299  00c8 4d            	tnz	a
 300  00c9 27f7          	jreq	L75
 301                     ; 74 	CLK_ClockSwitchCmd(ENABLE);
 303  00cb a601          	ld	a,#1
 304  00cd cd0000        	call	_CLK_ClockSwitchCmd
 306                     ; 75 	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV2); //fCPU = 8MHz
 308  00d0 a681          	ld	a,#129
 309  00d2 cd0000        	call	_CLK_HSIPrescalerConfig
 311                     ; 76 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 313  00d5 a680          	ld	a,#128
 314  00d7 cd0000        	call	_CLK_SYSCLKConfig
 316                     ; 78 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
 316                     ; 79 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 318  00da 4b01          	push	#1
 319  00dc 4b00          	push	#0
 320  00de ae01e1        	ldw	x,#481
 321  00e1 cd0000        	call	_CLK_ClockSwitchConfig
 323  00e4 85            	popw	x
 324                     ; 81 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 326  00e5 ae1300        	ldw	x,#4864
 327  00e8 cd0000        	call	_CLK_PeripheralClockConfig
 329                     ; 82 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 331  00eb ae1200        	ldw	x,#4608
 332  00ee cd0000        	call	_CLK_PeripheralClockConfig
 334                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 336  00f1 5f            	clrw	x
 337  00f2 cd0000        	call	_CLK_PeripheralClockConfig
 339                     ; 84 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 341  00f5 ae0100        	ldw	x,#256
 342  00f8 cd0000        	call	_CLK_PeripheralClockConfig
 344                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 346  00fb ae0700        	ldw	x,#1792
 347  00fe cd0000        	call	_CLK_PeripheralClockConfig
 349                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 351  0101 ae0501        	ldw	x,#1281
 352  0104 cd0000        	call	_CLK_PeripheralClockConfig
 354                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 356  0107 ae0401        	ldw	x,#1025
 357  010a cd0000        	call	_CLK_PeripheralClockConfig
 359                     ; 89 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 361  010d ae0301        	ldw	x,#769
 362  0110 cd0000        	call	_CLK_PeripheralClockConfig
 364                     ; 90 }
 367  0113 81            	ret
 392                     ; 92 void GPIO_setup(void)
 392                     ; 93 {
 393                     	switch	.text
 394  0114               _GPIO_setup:
 398                     ; 94 	GPIO_DeInit(GPIOD);
 400  0114 ae500f        	ldw	x,#20495
 401  0117 cd0000        	call	_GPIO_DeInit
 403                     ; 95 	GPIO_DeInit(GPIOC);
 405  011a ae500a        	ldw	x,#20490
 406  011d cd0000        	call	_GPIO_DeInit
 408                     ; 96 	GPIO_DeInit(GPIOB);
 410  0120 ae5005        	ldw	x,#20485
 411  0123 cd0000        	call	_GPIO_DeInit
 413                     ; 97 	GPIO_DeInit(GPIOA);
 415  0126 ae5000        	ldw	x,#20480
 416  0129 cd0000        	call	_GPIO_DeInit
 418                     ; 100 	GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 420  012c 4be0          	push	#224
 421  012e 4b08          	push	#8
 422  0130 ae5000        	ldw	x,#20480
 423  0133 cd0000        	call	_GPIO_Init
 425  0136 85            	popw	x
 426                     ; 101 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 428  0137 4be0          	push	#224
 429  0139 4b08          	push	#8
 430  013b ae500f        	ldw	x,#20495
 431  013e cd0000        	call	_GPIO_Init
 433  0141 85            	popw	x
 434                     ; 102 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 436  0142 4be0          	push	#224
 437  0144 4b10          	push	#16
 438  0146 ae500f        	ldw	x,#20495
 439  0149 cd0000        	call	_GPIO_Init
 441  014c 85            	popw	x
 442                     ; 103 }
 445  014d 81            	ret
 474                     ; 105 void PWM_setup(void)
 474                     ; 106 {
 475                     	switch	.text
 476  014e               _PWM_setup:
 480                     ; 107 	TIM2_DeInit();
 482  014e cd0000        	call	_TIM2_DeInit
 484                     ; 108 	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 0x03ff);
 486  0151 ae03ff        	ldw	x,#1023
 487  0154 89            	pushw	x
 488  0155 4f            	clr	a
 489  0156 cd0000        	call	_TIM2_TimeBaseInit
 491  0159 85            	popw	x
 492                     ; 109 	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_LOW);
 494  015a 4b22          	push	#34
 495  015c 5f            	clrw	x
 496  015d 89            	pushw	x
 497  015e ae6011        	ldw	x,#24593
 498  0161 cd0000        	call	_TIM2_OC1Init
 500  0164 5b03          	addw	sp,#3
 501                     ; 110 	TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_LOW);
 503  0166 4b22          	push	#34
 504  0168 5f            	clrw	x
 505  0169 89            	pushw	x
 506  016a ae6011        	ldw	x,#24593
 507  016d cd0000        	call	_TIM2_OC2Init
 509  0170 5b03          	addw	sp,#3
 510                     ; 111 	TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_LOW);
 512  0172 4b22          	push	#34
 513  0174 5f            	clrw	x
 514  0175 89            	pushw	x
 515  0176 ae6011        	ldw	x,#24593
 516  0179 cd0000        	call	_TIM2_OC3Init
 518  017c 5b03          	addw	sp,#3
 519                     ; 112 	TIM2_Cmd(ENABLE);
 521  017e a601          	ld	a,#1
 522  0180 cd0000        	call	_TIM2_Cmd
 524                     ; 114 }
 527  0183 81            	ret
 570                     	xdef	_main
 571                     	xdef	_PWM_setup
 572                     	xdef	_GPIO_setup
 573                     	xdef	_clock_setup
 574                     	switch	.ubsct
 575  0000               _duty_cycle:
 576  0000 0000          	ds.b	2
 577                     	xdef	_duty_cycle
 578  0002               _arrDMX:
 579  0002 000000000000  	ds.b	10
 580                     	xdef	_arrDMX
 581                     	xdef	_i
 582                     	xref	_DMX512_RX_setFlagNewPacket
 583                     	xref	_DMX512_RX_getFlagNewPacket
 584                     	xref	_DMX512_RX_resetTimeout
 585                     	xref	_DMX512_RX_init
 586                     	xref	_delay_ms
 587                     	xref	_LCD_print
 588                     	xref	_LCD_goto
 589                     	xref	_LCD_clear_home
 590                     	xref	_LCD_putchar
 591                     	xref	_LCD_putstr
 592                     	xref	_LCD_init
 593                     	xref	_TIM2_SetCompare3
 594                     	xref	_TIM2_SetCompare2
 595                     	xref	_TIM2_SetCompare1
 596                     	xref	_TIM2_Cmd
 597                     	xref	_TIM2_OC3Init
 598                     	xref	_TIM2_OC2Init
 599                     	xref	_TIM2_OC1Init
 600                     	xref	_TIM2_TimeBaseInit
 601                     	xref	_TIM2_DeInit
 602                     	xref	_GPIO_Init
 603                     	xref	_GPIO_DeInit
 604                     	xref	_CLK_GetFlagStatus
 605                     	xref	_CLK_SYSCLKConfig
 606                     	xref	_CLK_HSIPrescalerConfig
 607                     	xref	_CLK_ClockSwitchConfig
 608                     	xref	_CLK_PeripheralClockConfig
 609                     	xref	_CLK_ClockSwitchCmd
 610                     	xref	_CLK_LSICmd
 611                     	xref	_CLK_HSICmd
 612                     	xref	_CLK_HSECmd
 613                     	xref	_CLK_DeInit
 614                     .const:	section	.text
 615  0000               L52:
 616  0000 5d3a00        	dc.b	"]:",0
 617  0003               L32:
 618  0003 617272444d58  	dc.b	"arrDMX[",0
 619  000b               L12:
 620  000b 446174612052  	dc.b	"Data Received:  ",0
 640                     	end
