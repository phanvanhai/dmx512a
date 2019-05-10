   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  82                     ; 17 void main(void)
  82                     ; 18 {
  84                     	switch	.text
  85  0000               _main:
  87  0000 5203          	subw	sp,#3
  88       00000003      OFST:	set	3
  91                     ; 19 	uint16_t A4=0x0000;
  93                     ; 20 	char i=0;
  95  0002 0f01          	clr	(OFST-2,sp)
  97                     ; 21 	unsigned int i0=0;
  99                     ; 23 	clock_setup();
 101  0004 cd009f        	call	_clock_setup
 103                     ; 24 	GPIO_setup();
 105  0007 cd0101        	call	_GPIO_setup
 107                     ; 25 	ADC1_setup();
 109  000a cd0135        	call	_ADC1_setup
 111                     ; 26 	UART1_setup();
 113  000d cd0152        	call	_UART1_setup
 115                     ; 27 	TIM4_setup();
 117  0010 cd017c        	call	_TIM4_setup
 119                     ; 29 	LCD_init();
 121  0013 cd0000        	call	_LCD_init
 123                     ; 30 	LCD_clear_home();
 125  0016 cd0000        	call	_LCD_clear_home
 127                     ; 32 	LCD_goto(0, 0);
 129  0019 5f            	clrw	x
 130  001a cd0000        	call	_LCD_goto
 132                     ; 33 	LCD_putstr("_DMX512-3i-K60_");
 134  001d ae000d        	ldw	x,#L13
 135  0020 cd0000        	call	_LCD_putstr
 137                     ; 34 	LCD_goto(0,1);
 139  0023 ae0001        	ldw	x,#1
 140  0026 cd0000        	call	_LCD_goto
 142                     ; 35 	LCD_putstr("packet[   ]:");
 144  0029 ae0000        	ldw	x,#L33
 145  002c cd0000        	call	_LCD_putstr
 147                     ; 38 	for(i0=0;i0<512;i0++)
 149  002f 5f            	clrw	x
 150  0030 1f02          	ldw	(OFST-1,sp),x
 152  0032               L53:
 153                     ; 39 			packet[i0] = (i0%256);
 155  0032 7b03          	ld	a,(OFST+0,sp)
 156  0034 a4ff          	and	a,#255
 157  0036 1e02          	ldw	x,(OFST-1,sp)
 158  0038 d70000        	ld	(_packet,x),a
 159                     ; 38 	for(i0=0;i0<512;i0++)
 161  003b 1e02          	ldw	x,(OFST-1,sp)
 162  003d 1c0001        	addw	x,#1
 163  0040 1f02          	ldw	(OFST-1,sp),x
 167  0042 1e02          	ldw	x,(OFST-1,sp)
 168  0044 a30200        	cpw	x,#512
 169  0047 25e9          	jrult	L53
 170                     ; 41 	DMX512_TX_start();
 172  0049 cd0000        	call	_DMX512_TX_start
 174  004c               L34:
 175                     ; 46 		ADC1_StartConversion();
 177  004c cd0000        	call	_ADC1_StartConversion
 180  004f               L15:
 181                     ; 47 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
 183  004f a680          	ld	a,#128
 184  0051 cd0000        	call	_ADC1_GetFlagStatus
 186  0054 4d            	tnz	a
 187  0055 27f8          	jreq	L15
 188                     ; 48 		A4 = ADC1_GetConversionValue();
 190  0057 cd0000        	call	_ADC1_GetConversionValue
 192  005a 1f02          	ldw	(OFST-1,sp),x
 194                     ; 49 		ADC1_ClearFlag(ADC1_FLAG_EOC);
 196  005c a680          	ld	a,#128
 197  005e cd0000        	call	_ADC1_ClearFlag
 199                     ; 51 		packet[6] = (uint8_t)(A4>>8);
 201  0061 7b02          	ld	a,(OFST-1,sp)
 202  0063 c70006        	ld	_packet+6,a
 203                     ; 52 		packet[7] = (uint8_t)(A4 & 0x00ff);
 205  0066 7b03          	ld	a,(OFST+0,sp)
 206  0068 a4ff          	and	a,#255
 207  006a c70007        	ld	_packet+7,a
 208                     ; 55 		LCD_print(7,1,6+i);
 210  006d 7b01          	ld	a,(OFST-2,sp)
 211  006f 5f            	clrw	x
 212  0070 97            	ld	xl,a
 213  0071 1c0006        	addw	x,#6
 214  0074 89            	pushw	x
 215  0075 ae0701        	ldw	x,#1793
 216  0078 cd0000        	call	_LCD_print
 218  007b 85            	popw	x
 219                     ; 56 		LCD_print(12,1,packet[6+i]);
 221  007c 7b01          	ld	a,(OFST-2,sp)
 222  007e 5f            	clrw	x
 223  007f 97            	ld	xl,a
 224  0080 d60006        	ld	a,(_packet+6,x)
 225  0083 5f            	clrw	x
 226  0084 97            	ld	xl,a
 227  0085 89            	pushw	x
 228  0086 ae0c01        	ldw	x,#3073
 229  0089 cd0000        	call	_LCD_print
 231  008c 85            	popw	x
 232                     ; 57 		if ((++i) >= 2) i = 0;
 234  008d 0c01          	inc	(OFST-2,sp)
 236  008f 7b01          	ld	a,(OFST-2,sp)
 237  0091 a102          	cp	a,#2
 238  0093 2502          	jrult	L55
 241  0095 0f01          	clr	(OFST-2,sp)
 243  0097               L55:
 244                     ; 58 		delay_ms(700);
 246  0097 ae02bc        	ldw	x,#700
 247  009a cd0000        	call	_delay_ms
 250  009d 20ad          	jra	L34
 283                     ; 63 void clock_setup(void)
 283                     ; 64 {
 284                     	switch	.text
 285  009f               _clock_setup:
 289                     ; 65 	CLK_DeInit();
 291  009f cd0000        	call	_CLK_DeInit
 293                     ; 67 	CLK_HSECmd(DISABLE);
 295  00a2 4f            	clr	a
 296  00a3 cd0000        	call	_CLK_HSECmd
 298                     ; 68 	CLK_LSICmd(DISABLE);
 300  00a6 4f            	clr	a
 301  00a7 cd0000        	call	_CLK_LSICmd
 303                     ; 69 	CLK_HSICmd(ENABLE);
 305  00aa a601          	ld	a,#1
 306  00ac cd0000        	call	_CLK_HSICmd
 309  00af               L17:
 310                     ; 70 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 312  00af ae0102        	ldw	x,#258
 313  00b2 cd0000        	call	_CLK_GetFlagStatus
 315  00b5 4d            	tnz	a
 316  00b6 27f7          	jreq	L17
 317                     ; 72 	CLK_ClockSwitchCmd(ENABLE);
 319  00b8 a601          	ld	a,#1
 320  00ba cd0000        	call	_CLK_ClockSwitchCmd
 322                     ; 73 	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV2); // fCPU = 8MHz
 324  00bd a681          	ld	a,#129
 325  00bf cd0000        	call	_CLK_HSIPrescalerConfig
 327                     ; 74 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 329  00c2 a680          	ld	a,#128
 330  00c4 cd0000        	call	_CLK_SYSCLKConfig
 332                     ; 76 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
 332                     ; 77 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 334  00c7 4b01          	push	#1
 335  00c9 4b00          	push	#0
 336  00cb ae01e1        	ldw	x,#481
 337  00ce cd0000        	call	_CLK_ClockSwitchConfig
 339  00d1 85            	popw	x
 340                     ; 79 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 342  00d2 ae1200        	ldw	x,#4608
 343  00d5 cd0000        	call	_CLK_PeripheralClockConfig
 345                     ; 80 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 347  00d8 5f            	clrw	x
 348  00d9 cd0000        	call	_CLK_PeripheralClockConfig
 350                     ; 81 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 352  00dc ae0100        	ldw	x,#256
 353  00df cd0000        	call	_CLK_PeripheralClockConfig
 355                     ; 82 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 357  00e2 ae0700        	ldw	x,#1792
 358  00e5 cd0000        	call	_CLK_PeripheralClockConfig
 360                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 362  00e8 ae0500        	ldw	x,#1280
 363  00eb cd0000        	call	_CLK_PeripheralClockConfig
 365                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
 367  00ee ae1301        	ldw	x,#4865
 368  00f1 cd0000        	call	_CLK_PeripheralClockConfig
 370                     ; 86 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 372  00f4 ae0401        	ldw	x,#1025
 373  00f7 cd0000        	call	_CLK_PeripheralClockConfig
 375                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 377  00fa ae0301        	ldw	x,#769
 378  00fd cd0000        	call	_CLK_PeripheralClockConfig
 380                     ; 88 }
 383  0100 81            	ret
 408                     ; 90 void GPIO_setup(void)
 408                     ; 91 {
 409                     	switch	.text
 410  0101               _GPIO_setup:
 414                     ; 92 	GPIO_DeInit(GPIOD);
 416  0101 ae500f        	ldw	x,#20495
 417  0104 cd0000        	call	_GPIO_DeInit
 419                     ; 93 	GPIO_DeInit(GPIOB);
 421  0107 ae5005        	ldw	x,#20485
 422  010a cd0000        	call	_GPIO_DeInit
 424                     ; 94 	GPIO_DeInit(GPIOC);
 426  010d ae500a        	ldw	x,#20490
 427  0110 cd0000        	call	_GPIO_DeInit
 429                     ; 97 	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
 431  0113 4bf0          	push	#240
 432  0115 4b20          	push	#32
 433  0117 ae500f        	ldw	x,#20495
 434  011a cd0000        	call	_GPIO_Init
 436  011d 85            	popw	x
 437                     ; 98 	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
 439  011e 4b40          	push	#64
 440  0120 4b40          	push	#64
 441  0122 ae500f        	ldw	x,#20495
 442  0125 cd0000        	call	_GPIO_Init
 444  0128 85            	popw	x
 445                     ; 101 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
 447  0129 4b00          	push	#0
 448  012b 4b08          	push	#8
 449  012d ae500f        	ldw	x,#20495
 450  0130 cd0000        	call	_GPIO_Init
 452  0133 85            	popw	x
 453                     ; 102 }
 456  0134 81            	ret
 482                     ; 104 void ADC1_setup(void)
 482                     ; 105 {
 483                     	switch	.text
 484  0135               _ADC1_setup:
 488                     ; 106 	ADC1_DeInit();
 490  0135 cd0000        	call	_ADC1_DeInit
 492                     ; 107 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D18, ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE);
 494  0138 4b00          	push	#0
 495  013a 4b04          	push	#4
 496  013c 4b08          	push	#8
 497  013e 4b00          	push	#0
 498  0140 4b10          	push	#16
 499  0142 4b70          	push	#112
 500  0144 ae0104        	ldw	x,#260
 501  0147 cd0000        	call	_ADC1_Init
 503  014a 5b06          	addw	sp,#6
 504                     ; 108 	ADC1_Cmd(ENABLE);
 506  014c a601          	ld	a,#1
 507  014e cd0000        	call	_ADC1_Cmd
 509                     ; 109 }
 512  0151 81            	ret
 540                     ; 111 void UART1_setup(void)
 540                     ; 112 {
 541                     	switch	.text
 542  0152               _UART1_setup:
 546                     ; 113 	UART1_DeInit();
 548  0152 cd0000        	call	_UART1_DeInit
 550                     ; 114 	UART1_Init(250000, UART1_WORDLENGTH_8D, UART1_STOPBITS_2,
 550                     ; 115 						UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE,
 550                     ; 116 						UART1_MODE_TXRX_ENABLE);
 552  0155 4b0c          	push	#12
 553  0157 4b80          	push	#128
 554  0159 4b00          	push	#0
 555  015b 4b20          	push	#32
 556  015d 4b00          	push	#0
 557  015f aed090        	ldw	x,#53392
 558  0162 89            	pushw	x
 559  0163 ae0003        	ldw	x,#3
 560  0166 89            	pushw	x
 561  0167 cd0000        	call	_UART1_Init
 563  016a 5b09          	addw	sp,#9
 564                     ; 118 	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
 566  016c 4b01          	push	#1
 567  016e ae0255        	ldw	x,#597
 568  0171 cd0000        	call	_UART1_ITConfig
 570  0174 84            	pop	a
 571                     ; 119 	enableInterrupts();
 574  0175 9a            rim
 576                     ; 121 	UART1_Cmd(ENABLE);
 579  0176 a601          	ld	a,#1
 580  0178 cd0000        	call	_UART1_Cmd
 582                     ; 122 }
 585  017b 81            	ret
 612                     ; 124 void TIM4_setup(void)
 612                     ; 125 {
 613                     	switch	.text
 614  017c               _TIM4_setup:
 618                     ; 126 	TIM4_DeInit();
 620  017c cd0000        	call	_TIM4_DeInit
 622                     ; 127 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 624  017f ae0101        	ldw	x,#257
 625  0182 cd0000        	call	_TIM4_ITConfig
 627                     ; 128 	enableInterrupts();
 630  0185 9a            rim
 632                     ; 129 	TIM4_Cmd(DISABLE);
 635  0186 4f            	clr	a
 636  0187 cd0000        	call	_TIM4_Cmd
 638                     ; 130 }
 641  018a 81            	ret
 666                     	xdef	_main
 667                     	xdef	_TIM4_setup
 668                     	xdef	_UART1_setup
 669                     	xdef	_ADC1_setup
 670                     	xdef	_GPIO_setup
 671                     	xdef	_clock_setup
 672                     	switch	.bss
 673  0000               _packet:
 674  0000 000000000000  	ds.b	512
 675                     	xdef	_packet
 676                     	xref	_DMX512_TX_start
 677                     	xref	_delay_ms
 678                     	xref	_LCD_print
 679                     	xref	_LCD_goto
 680                     	xref	_LCD_clear_home
 681                     	xref	_LCD_putstr
 682                     	xref	_LCD_init
 683                     	xref	_UART1_ITConfig
 684                     	xref	_UART1_Cmd
 685                     	xref	_UART1_Init
 686                     	xref	_UART1_DeInit
 687                     	xref	_TIM4_ITConfig
 688                     	xref	_TIM4_Cmd
 689                     	xref	_TIM4_DeInit
 690                     	xref	_GPIO_Init
 691                     	xref	_GPIO_DeInit
 692                     	xref	_CLK_GetFlagStatus
 693                     	xref	_CLK_SYSCLKConfig
 694                     	xref	_CLK_HSIPrescalerConfig
 695                     	xref	_CLK_ClockSwitchConfig
 696                     	xref	_CLK_PeripheralClockConfig
 697                     	xref	_CLK_ClockSwitchCmd
 698                     	xref	_CLK_LSICmd
 699                     	xref	_CLK_HSICmd
 700                     	xref	_CLK_HSECmd
 701                     	xref	_CLK_DeInit
 702                     	xref	_ADC1_ClearFlag
 703                     	xref	_ADC1_GetFlagStatus
 704                     	xref	_ADC1_GetConversionValue
 705                     	xref	_ADC1_StartConversion
 706                     	xref	_ADC1_Cmd
 707                     	xref	_ADC1_Init
 708                     	xref	_ADC1_DeInit
 709                     .const:	section	.text
 710  0000               L33:
 711  0000 7061636b6574  	dc.b	"packet[   ]:",0
 712  000d               L13:
 713  000d 5f444d583531  	dc.b	"_DMX512-3i-K60_",0
 733                     	end
