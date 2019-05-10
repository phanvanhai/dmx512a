   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  68                     ; 13 void DMX512_RX_init(uint16_t size, uint8_t* arr_data)
  68                     ; 14 {
  70                     	switch	.text
  71  0000               _DMX512_RX_init:
  73  0000 89            	pushw	x
  74       00000000      OFST:	set	0
  77                     ; 16 	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
  79  0001 4bf0          	push	#240
  80  0003 4b20          	push	#32
  81  0005 ae500f        	ldw	x,#20495
  82  0008 cd0000        	call	_GPIO_Init
  84  000b 85            	popw	x
  85                     ; 17 	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
  87  000c 4b40          	push	#64
  88  000e 4b40          	push	#64
  89  0010 ae500f        	ldw	x,#20495
  90  0013 cd0000        	call	_GPIO_Init
  92  0016 85            	popw	x
  93                     ; 20 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
  95  0017 4b40          	push	#64
  96  0019 4b20          	push	#32
  97  001b ae5005        	ldw	x,#20485
  98  001e cd0000        	call	_GPIO_Init
 100  0021 85            	popw	x
 101                     ; 21 	GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_IN_PU_NO_IT);
 103  0022 4b40          	push	#64
 104  0024 4b02          	push	#2
 105  0026 ae500f        	ldw	x,#20495
 106  0029 cd0000        	call	_GPIO_Init
 108  002c 85            	popw	x
 109                     ; 22 	GPIO_Init(GPIOA, GPIO_PIN_1|GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
 111  002d 4b40          	push	#64
 112  002f 4b06          	push	#6
 113  0031 ae5000        	ldw	x,#20480
 114  0034 cd0000        	call	_GPIO_Init
 116  0037 85            	popw	x
 117                     ; 25 	UART1_setup();
 119  0038 ad17          	call	_UART1_setup
 121                     ; 27 	DMX512_RX.nextState			= RxBreak;
 123  003a 3f02          	clr	_DMX512_RX
 124                     ; 28 	DMX512_RX.size					= size;
 126  003c 1e01          	ldw	x,(OFST+1,sp)
 127  003e bf07          	ldw	_DMX512_RX+5,x
 128                     ; 29 	DMX512_RX.arrData				= arr_data;
 130  0040 1e05          	ldw	x,(OFST+5,sp)
 131  0042 bf09          	ldw	_DMX512_RX+7,x
 132                     ; 30 	DMX512_RX.countAddr     = 0;
 134  0044 5f            	clrw	x
 135  0045 bf03          	ldw	_DMX512_RX+1,x
 136                     ; 31 	DMX512_RX.flagNewPacket = FALSE;
 138  0047 3f0b          	clr	_DMX512_RX+9
 139                     ; 32 	DMX512_RX.startChannel  = DMX512_RX_getAddressing();
 141  0049 ad5a          	call	_DMX512_RX_getAddressing
 143  004b bf05          	ldw	_DMX512_RX+3,x
 144                     ; 35 	IWDG_setup();
 146  004d ad2c          	call	_IWDG_setup
 148                     ; 36 }
 151  004f 85            	popw	x
 152  0050 81            	ret
 180                     ; 38 void UART1_setup(void)
 180                     ; 39 {
 181                     	switch	.text
 182  0051               _UART1_setup:
 186                     ; 40 	UART1_DeInit();
 188  0051 cd0000        	call	_UART1_DeInit
 190                     ; 41 	UART1_Init(250000, UART1_WORDLENGTH_8D, UART1_STOPBITS_2,
 190                     ; 42 						UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE,
 190                     ; 43 						UART1_MODE_TXRX_ENABLE);
 192  0054 4b0c          	push	#12
 193  0056 4b80          	push	#128
 194  0058 4b00          	push	#0
 195  005a 4b20          	push	#32
 196  005c 4b00          	push	#0
 197  005e aed090        	ldw	x,#53392
 198  0061 89            	pushw	x
 199  0062 ae0003        	ldw	x,#3
 200  0065 89            	pushw	x
 201  0066 cd0000        	call	_UART1_Init
 203  0069 5b09          	addw	sp,#9
 204                     ; 45 	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
 206  006b 4b01          	push	#1
 207  006d ae0255        	ldw	x,#597
 208  0070 cd0000        	call	_UART1_ITConfig
 210  0073 84            	pop	a
 211                     ; 46 	enableInterrupts();
 214  0074 9a            rim
 216                     ; 48 	UART1_Cmd(ENABLE);
 219  0075 a601          	ld	a,#1
 220  0077 cd0000        	call	_UART1_Cmd
 222                     ; 49 }
 225  007a 81            	ret
 252                     ; 54 void IWDG_setup(void)
 252                     ; 55 {
 253                     	switch	.text
 254  007b               _IWDG_setup:
 258                     ; 56 	IWDG_Enable();
 260  007b cd0000        	call	_IWDG_Enable
 262                     ; 57 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 264  007e a655          	ld	a,#85
 265  0080 cd0000        	call	_IWDG_WriteAccessCmd
 267                     ; 58 	IWDG_SetPrescaler(IWDG_Prescaler_256);
 269  0083 a606          	ld	a,#6
 270  0085 cd0000        	call	_IWDG_SetPrescaler
 272                     ; 59 	IWDG_SetReload( (uint8_t)(TIMEOUT/4 - 1) );
 274  0088 a6f9          	ld	a,#249
 275  008a cd0000        	call	_IWDG_SetReload
 277                     ; 60 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 279  008d 4f            	clr	a
 280  008e cd0000        	call	_IWDG_WriteAccessCmd
 282                     ; 61 }
 285  0091 81            	ret
 311                     ; 66 void DMX512_RX_resetTimeout(void)
 311                     ; 67 {
 312                     	switch	.text
 313  0092               _DMX512_RX_resetTimeout:
 317                     ; 68 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 319  0092 a655          	ld	a,#85
 320  0094 cd0000        	call	_IWDG_WriteAccessCmd
 322                     ; 69 	IWDG_ReloadCounter();
 324  0097 cd0000        	call	_IWDG_ReloadCounter
 326                     ; 70 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 328  009a 4f            	clr	a
 329  009b cd0000        	call	_IWDG_WriteAccessCmd
 331                     ; 71 }
 334  009e 81            	ret
 380                     ; 76 bool DMX512_RX_getFlagNewPacket(void)
 380                     ; 77 {
 381                     	switch	.text
 382  009f               _DMX512_RX_getFlagNewPacket:
 386                     ; 78 	return DMX512_RX.flagNewPacket;
 388  009f b60b          	ld	a,_DMX512_RX+9
 391  00a1 81            	ret
 428                     ; 84 void DMX512_RX_setFlagNewPacket(bool state)
 428                     ; 85 {
 429                     	switch	.text
 430  00a2               _DMX512_RX_setFlagNewPacket:
 434                     ; 86 	DMX512_RX.flagNewPacket = state;
 436  00a2 b70b          	ld	_DMX512_RX+9,a
 437                     ; 87 }
 440  00a4 81            	ret
 498                     ; 92 uint16_t DMX512_RX_getAddressing(void)
 498                     ; 93 {
 499                     	switch	.text
 500  00a5               _DMX512_RX_getAddressing:
 502  00a5 5205          	subw	sp,#5
 503       00000005      OFST:	set	5
 506                     ; 94 	unsigned char dvi=1, chuc=0, tram=0, nut;
 508  00a7 a601          	ld	a,#1
 509  00a9 6b03          	ld	(OFST-2,sp),a
 513  00ab 0f04          	clr	(OFST-1,sp)
 517  00ad 0f05          	clr	(OFST+0,sp)
 519                     ; 95 	LCD_goto(0,0);
 521  00af 5f            	clrw	x
 522  00b0 cd0000        	call	_LCD_goto
 524                     ; 96 	LCD_putstr("Setup Address:");
 526  00b3 ae0004        	ldw	x,#L741
 527  00b6 cd0000        	call	_LCD_putstr
 529                     ; 97 	LCD_goto(0,1);
 531  00b9 ae0001        	ldw	x,#1
 532  00bc cd0000        	call	_LCD_goto
 534                     ; 98 	LCD_putstr("001");
 536  00bf ae0000        	ldw	x,#L151
 537  00c2 cd0000        	call	_LCD_putstr
 539  00c5               L351:
 540                     ; 102 		if(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_1))
 542  00c5 4b02          	push	#2
 543  00c7 ae5000        	ldw	x,#20480
 544  00ca cd0000        	call	_GPIO_ReadInputPin
 546  00cd 5b01          	addw	sp,#1
 547  00cf 4d            	tnz	a
 548  00d0 2634          	jrne	L751
 550  00d2               L361:
 551                     ; 104 			while(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_1));	// doi den khi nha nut bam
 553  00d2 4b02          	push	#2
 554  00d4 ae5000        	ldw	x,#20480
 555  00d7 cd0000        	call	_GPIO_ReadInputPin
 557  00da 5b01          	addw	sp,#1
 558  00dc 4d            	tnz	a
 559  00dd 27f3          	jreq	L361
 560                     ; 105 			dvi = (dvi>=9)? 0 : (dvi+1);
 562  00df 7b03          	ld	a,(OFST-2,sp)
 563  00e1 a109          	cp	a,#9
 564  00e3 2503          	jrult	L22
 565  00e5 4f            	clr	a
 566  00e6 2003          	jra	L42
 567  00e8               L22:
 568  00e8 7b03          	ld	a,(OFST-2,sp)
 569  00ea 4c            	inc	a
 570  00eb               L42:
 571  00eb 6b03          	ld	(OFST-2,sp),a
 573                     ; 106 			LCD_goto(2,1);
 575  00ed ae0201        	ldw	x,#513
 576  00f0 cd0000        	call	_LCD_goto
 578                     ; 107 			LCD_putchar(dvi + '0');
 580  00f3 7b03          	ld	a,(OFST-2,sp)
 581  00f5 ab30          	add	a,#48
 582  00f7 cd0000        	call	_LCD_putchar
 584                     ; 108 			LCD_goto(2,1);
 586  00fa ae0201        	ldw	x,#513
 587  00fd cd0000        	call	_LCD_goto
 589                     ; 109 			delay_ms(50);
 591  0100 ae0032        	ldw	x,#50
 592  0103 cd0000        	call	_delay_ms
 594  0106               L751:
 595                     ; 112 		if(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_2))
 597  0106 4b04          	push	#4
 598  0108 ae5000        	ldw	x,#20480
 599  010b cd0000        	call	_GPIO_ReadInputPin
 601  010e 5b01          	addw	sp,#1
 602  0110 4d            	tnz	a
 603  0111 2634          	jrne	L761
 605  0113               L371:
 606                     ; 114 			while(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_2));
 608  0113 4b04          	push	#4
 609  0115 ae5000        	ldw	x,#20480
 610  0118 cd0000        	call	_GPIO_ReadInputPin
 612  011b 5b01          	addw	sp,#1
 613  011d 4d            	tnz	a
 614  011e 27f3          	jreq	L371
 615                     ; 115 			chuc = (chuc>=9)? 0 : (chuc+1);
 617  0120 7b04          	ld	a,(OFST-1,sp)
 618  0122 a109          	cp	a,#9
 619  0124 2503          	jrult	L62
 620  0126 4f            	clr	a
 621  0127 2003          	jra	L03
 622  0129               L62:
 623  0129 7b04          	ld	a,(OFST-1,sp)
 624  012b 4c            	inc	a
 625  012c               L03:
 626  012c 6b04          	ld	(OFST-1,sp),a
 628                     ; 116 			LCD_goto(1,1);
 630  012e ae0101        	ldw	x,#257
 631  0131 cd0000        	call	_LCD_goto
 633                     ; 117 			LCD_putchar(chuc + '0');
 635  0134 7b04          	ld	a,(OFST-1,sp)
 636  0136 ab30          	add	a,#48
 637  0138 cd0000        	call	_LCD_putchar
 639                     ; 118 			LCD_goto(1,1);
 641  013b ae0101        	ldw	x,#257
 642  013e cd0000        	call	_LCD_goto
 644                     ; 119 			delay_ms(50);
 646  0141 ae0032        	ldw	x,#50
 647  0144 cd0000        	call	_delay_ms
 649  0147               L761:
 650                     ; 122 		if(!GPIO_ReadInputPin(GPIOD,GPIO_PIN_1))
 652  0147 4b02          	push	#2
 653  0149 ae500f        	ldw	x,#20495
 654  014c cd0000        	call	_GPIO_ReadInputPin
 656  014f 5b01          	addw	sp,#1
 657  0151 4d            	tnz	a
 658  0152 2634          	jrne	L771
 660  0154               L302:
 661                     ; 124 			while(!GPIO_ReadInputPin(GPIOD,GPIO_PIN_1));
 663  0154 4b02          	push	#2
 664  0156 ae500f        	ldw	x,#20495
 665  0159 cd0000        	call	_GPIO_ReadInputPin
 667  015c 5b01          	addw	sp,#1
 668  015e 4d            	tnz	a
 669  015f 27f3          	jreq	L302
 670                     ; 125 			tram = (tram>=9)? 0 : (tram+1);
 672  0161 7b05          	ld	a,(OFST+0,sp)
 673  0163 a109          	cp	a,#9
 674  0165 2503          	jrult	L23
 675  0167 4f            	clr	a
 676  0168 2003          	jra	L43
 677  016a               L23:
 678  016a 7b05          	ld	a,(OFST+0,sp)
 679  016c 4c            	inc	a
 680  016d               L43:
 681  016d 6b05          	ld	(OFST+0,sp),a
 683                     ; 126 			LCD_goto(0,1);
 685  016f ae0001        	ldw	x,#1
 686  0172 cd0000        	call	_LCD_goto
 688                     ; 127 			LCD_putchar(tram + '0');
 690  0175 7b05          	ld	a,(OFST+0,sp)
 691  0177 ab30          	add	a,#48
 692  0179 cd0000        	call	_LCD_putchar
 694                     ; 128 			LCD_goto(0,1);
 696  017c ae0001        	ldw	x,#1
 697  017f cd0000        	call	_LCD_goto
 699                     ; 129 			delay_ms(50);
 701  0182 ae0032        	ldw	x,#50
 702  0185 cd0000        	call	_delay_ms
 704  0188               L771:
 705                     ; 132 		if(!GPIO_ReadInputPin(GPIOB,GPIO_PIN_5))
 707  0188 4b20          	push	#32
 708  018a ae5005        	ldw	x,#20485
 709  018d cd0000        	call	_GPIO_ReadInputPin
 711  0190 5b01          	addw	sp,#1
 712  0192 4d            	tnz	a
 713  0193 2703          	jreq	L04
 714  0195 cc00c5        	jp	L351
 715  0198               L04:
 716                     ; 133 			return (uint16_t)(dvi + chuc*10 + tram*100);
 718  0198 7b05          	ld	a,(OFST+0,sp)
 719  019a 97            	ld	xl,a
 720  019b a664          	ld	a,#100
 721  019d 42            	mul	x,a
 722  019e 1f01          	ldw	(OFST-4,sp),x
 724  01a0 7b04          	ld	a,(OFST-1,sp)
 725  01a2 97            	ld	xl,a
 726  01a3 a60a          	ld	a,#10
 727  01a5 42            	mul	x,a
 728  01a6 01            	rrwa	x,a
 729  01a7 1b03          	add	a,(OFST-2,sp)
 730  01a9 2401          	jrnc	L63
 731  01ab 5c            	incw	x
 732  01ac               L63:
 733  01ac 02            	rlwa	x,a
 734  01ad 72fb01        	addw	x,(OFST-4,sp)
 737  01b0 5b05          	addw	sp,#5
 738  01b2 81            	ret
 858                     	switch	.ubsct
 859  0000               _dataPtr:
 860  0000 0000          	ds.b	2
 861                     	xdef	_dataPtr
 862  0002               _DMX512_RX:
 863  0002 000000000000  	ds.b	10
 864                     	xdef	_DMX512_RX
 865                     	xref	_delay_ms
 866                     	xref	_LCD_goto
 867                     	xref	_LCD_putchar
 868                     	xref	_LCD_putstr
 869                     	xdef	_DMX512_RX_getAddressing
 870                     	xdef	_DMX512_RX_setFlagNewPacket
 871                     	xdef	_DMX512_RX_getFlagNewPacket
 872                     	xdef	_DMX512_RX_resetTimeout
 873                     	xdef	_IWDG_setup
 874                     	xdef	_UART1_setup
 875                     	xdef	_DMX512_RX_init
 876                     	xref	_UART1_ITConfig
 877                     	xref	_UART1_Cmd
 878                     	xref	_UART1_Init
 879                     	xref	_UART1_DeInit
 880                     	xref	_IWDG_Enable
 881                     	xref	_IWDG_ReloadCounter
 882                     	xref	_IWDG_SetReload
 883                     	xref	_IWDG_SetPrescaler
 884                     	xref	_IWDG_WriteAccessCmd
 885                     	xref	_GPIO_ReadInputPin
 886                     	xref	_GPIO_Init
 887                     .const:	section	.text
 888  0000               L151:
 889  0000 30303100      	dc.b	"001",0
 890  0004               L741:
 891  0004 536574757020  	dc.b	"Setup Address:",0
 911                     	end
