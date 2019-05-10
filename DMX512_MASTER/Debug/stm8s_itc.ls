   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  42                     ; 50 uint8_t ITC_GetCPUCC(void)
  42                     ; 51 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 53   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 54   _asm("pop a");
  57  0001 84            pop a
  59                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 80 void ITC_DeInit(void)
  85                     ; 81 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 90 }
 118  0023 81            	ret
 143                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 98 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 401                     .const:	section	.text
 402  0000               L22:
 403  0000 004c          	dc.w	L14
 404  0002 004c          	dc.w	L14
 405  0004 004c          	dc.w	L14
 406  0006 004c          	dc.w	L14
 407  0008 0055          	dc.w	L34
 408  000a 0055          	dc.w	L34
 409  000c 0055          	dc.w	L34
 410  000e 0055          	dc.w	L34
 411  0010 0089          	dc.w	L771
 412  0012 0089          	dc.w	L771
 413  0014 005e          	dc.w	L54
 414  0016 005e          	dc.w	L54
 415  0018 0067          	dc.w	L74
 416  001a 0067          	dc.w	L74
 417  001c 0067          	dc.w	L74
 418  001e 0067          	dc.w	L74
 419  0020 0070          	dc.w	L15
 420  0022 0070          	dc.w	L15
 421  0024 0070          	dc.w	L15
 422  0026 0070          	dc.w	L15
 423  0028 0089          	dc.w	L771
 424  002a 0089          	dc.w	L771
 425  002c 0079          	dc.w	L35
 426  002e 0079          	dc.w	L35
 427  0030 0082          	dc.w	L55
 428                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 428                     ; 108 {
 429                     	switch	.text
 430  0029               _ITC_GetSoftwarePriority:
 432  0029 88            	push	a
 433  002a 89            	pushw	x
 434       00000002      OFST:	set	2
 437                     ; 109   uint8_t Value = 0;
 439  002b 0f02          	clr	(OFST+0,sp)
 441                     ; 110   uint8_t Mask = 0;
 443                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 445                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 447  002d a403          	and	a,#3
 448  002f 48            	sll	a
 449  0030 5f            	clrw	x
 450  0031 97            	ld	xl,a
 451  0032 a603          	ld	a,#3
 452  0034 5d            	tnzw	x
 453  0035 2704          	jreq	L41
 454  0037               L61:
 455  0037 48            	sll	a
 456  0038 5a            	decw	x
 457  0039 26fc          	jrne	L61
 458  003b               L41:
 459  003b 6b01          	ld	(OFST-1,sp),a
 461                     ; 118   switch (IrqNum)
 463  003d 7b03          	ld	a,(OFST+1,sp)
 465                     ; 198   default:
 465                     ; 199     break;
 466  003f a119          	cp	a,#25
 467  0041 2407          	jruge	L02
 468  0043 5f            	clrw	x
 469  0044 97            	ld	xl,a
 470  0045 58            	sllw	x
 471  0046 de0000        	ldw	x,(L22,x)
 472  0049 fc            	jp	(x)
 473  004a               L02:
 474  004a 203d          	jra	L771
 475  004c               L14:
 476                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 476                     ; 121   case ITC_IRQ_AWU:
 476                     ; 122   case ITC_IRQ_CLK:
 476                     ; 123   case ITC_IRQ_PORTA:
 476                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 478  004c c67f70        	ld	a,32624
 479  004f 1401          	and	a,(OFST-1,sp)
 480  0051 6b02          	ld	(OFST+0,sp),a
 482                     ; 125     break;
 484  0053 2034          	jra	L771
 485  0055               L34:
 486                     ; 127   case ITC_IRQ_PORTB:
 486                     ; 128   case ITC_IRQ_PORTC:
 486                     ; 129   case ITC_IRQ_PORTD:
 486                     ; 130   case ITC_IRQ_PORTE:
 486                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 488  0055 c67f71        	ld	a,32625
 489  0058 1401          	and	a,(OFST-1,sp)
 490  005a 6b02          	ld	(OFST+0,sp),a
 492                     ; 132     break;
 494  005c 202b          	jra	L771
 495  005e               L54:
 496                     ; 141   case ITC_IRQ_SPI:
 496                     ; 142   case ITC_IRQ_TIM1_OVF:
 496                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 498  005e c67f72        	ld	a,32626
 499  0061 1401          	and	a,(OFST-1,sp)
 500  0063 6b02          	ld	(OFST+0,sp),a
 502                     ; 144     break;
 504  0065 2022          	jra	L771
 505  0067               L74:
 506                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 506                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 506                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 506                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 506                     ; 150 #else
 506                     ; 151   case ITC_IRQ_TIM2_OVF:
 506                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 506                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 506                     ; 154   case ITC_IRQ_TIM3_OVF:
 506                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 508  0067 c67f73        	ld	a,32627
 509  006a 1401          	and	a,(OFST-1,sp)
 510  006c 6b02          	ld	(OFST+0,sp),a
 512                     ; 156     break;
 514  006e 2019          	jra	L771
 515  0070               L15:
 516                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 516                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 516                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 516                     ; 161   case ITC_IRQ_UART1_TX:
 516                     ; 162   case ITC_IRQ_UART1_RX:
 516                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 516                     ; 164 #if defined(STM8AF622x)
 516                     ; 165   case ITC_IRQ_UART4_TX:
 516                     ; 166   case ITC_IRQ_UART4_RX:
 516                     ; 167 #endif /*STM8AF622x */
 516                     ; 168   case ITC_IRQ_I2C:
 516                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 518  0070 c67f74        	ld	a,32628
 519  0073 1401          	and	a,(OFST-1,sp)
 520  0075 6b02          	ld	(OFST+0,sp),a
 522                     ; 170     break;
 524  0077 2010          	jra	L771
 525  0079               L35:
 526                     ; 184   case ITC_IRQ_ADC1:
 526                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 526                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 526                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 526                     ; 188 #else
 526                     ; 189   case ITC_IRQ_TIM4_OVF:
 526                     ; 190 #endif /*STM8S903 or STM8AF622x */
 526                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 528  0079 c67f75        	ld	a,32629
 529  007c 1401          	and	a,(OFST-1,sp)
 530  007e 6b02          	ld	(OFST+0,sp),a
 532                     ; 192     break;
 534  0080 2007          	jra	L771
 535  0082               L55:
 536                     ; 194   case ITC_IRQ_EEPROM_EEC:
 536                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 538  0082 c67f76        	ld	a,32630
 539  0085 1401          	and	a,(OFST-1,sp)
 540  0087 6b02          	ld	(OFST+0,sp),a
 542                     ; 196     break;
 544  0089               L75:
 545                     ; 198   default:
 545                     ; 199     break;
 547  0089               L771:
 548                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 550  0089 7b03          	ld	a,(OFST+1,sp)
 551  008b a403          	and	a,#3
 552  008d 48            	sll	a
 553  008e 5f            	clrw	x
 554  008f 97            	ld	xl,a
 555  0090 7b02          	ld	a,(OFST+0,sp)
 556  0092 5d            	tnzw	x
 557  0093 2704          	jreq	L42
 558  0095               L62:
 559  0095 44            	srl	a
 560  0096 5a            	decw	x
 561  0097 26fc          	jrne	L62
 562  0099               L42:
 563  0099 6b02          	ld	(OFST+0,sp),a
 565                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 567  009b 7b02          	ld	a,(OFST+0,sp)
 570  009d 5b03          	addw	sp,#3
 571  009f 81            	ret
 631                     	switch	.const
 632  0032               L44:
 633  0032 00d5          	dc.w	L102
 634  0034 00d5          	dc.w	L102
 635  0036 00d5          	dc.w	L102
 636  0038 00d5          	dc.w	L102
 637  003a 00e7          	dc.w	L302
 638  003c 00e7          	dc.w	L302
 639  003e 00e7          	dc.w	L302
 640  0040 00e7          	dc.w	L302
 641  0042 0151          	dc.w	L152
 642  0044 0151          	dc.w	L152
 643  0046 00f9          	dc.w	L502
 644  0048 00f9          	dc.w	L502
 645  004a 010b          	dc.w	L702
 646  004c 010b          	dc.w	L702
 647  004e 010b          	dc.w	L702
 648  0050 010b          	dc.w	L702
 649  0052 011d          	dc.w	L112
 650  0054 011d          	dc.w	L112
 651  0056 011d          	dc.w	L112
 652  0058 011d          	dc.w	L112
 653  005a 0151          	dc.w	L152
 654  005c 0151          	dc.w	L152
 655  005e 012f          	dc.w	L312
 656  0060 012f          	dc.w	L312
 657  0062 0141          	dc.w	L512
 658                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 658                     ; 221 {
 659                     	switch	.text
 660  00a0               _ITC_SetSoftwarePriority:
 662  00a0 89            	pushw	x
 663  00a1 89            	pushw	x
 664       00000002      OFST:	set	2
 667                     ; 222   uint8_t Mask = 0;
 669                     ; 223   uint8_t NewPriority = 0;
 671                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 673                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 675                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 677                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 679  00a2 9e            	ld	a,xh
 680  00a3 a403          	and	a,#3
 681  00a5 48            	sll	a
 682  00a6 5f            	clrw	x
 683  00a7 97            	ld	xl,a
 684  00a8 a603          	ld	a,#3
 685  00aa 5d            	tnzw	x
 686  00ab 2704          	jreq	L23
 687  00ad               L43:
 688  00ad 48            	sll	a
 689  00ae 5a            	decw	x
 690  00af 26fc          	jrne	L43
 691  00b1               L23:
 692  00b1 43            	cpl	a
 693  00b2 6b01          	ld	(OFST-1,sp),a
 695                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 697  00b4 7b03          	ld	a,(OFST+1,sp)
 698  00b6 a403          	and	a,#3
 699  00b8 48            	sll	a
 700  00b9 5f            	clrw	x
 701  00ba 97            	ld	xl,a
 702  00bb 7b04          	ld	a,(OFST+2,sp)
 703  00bd 5d            	tnzw	x
 704  00be 2704          	jreq	L63
 705  00c0               L04:
 706  00c0 48            	sll	a
 707  00c1 5a            	decw	x
 708  00c2 26fc          	jrne	L04
 709  00c4               L63:
 710  00c4 6b02          	ld	(OFST+0,sp),a
 712                     ; 239   switch (IrqNum)
 714  00c6 7b03          	ld	a,(OFST+1,sp)
 716                     ; 329   default:
 716                     ; 330     break;
 717  00c8 a119          	cp	a,#25
 718  00ca 2407          	jruge	L24
 719  00cc 5f            	clrw	x
 720  00cd 97            	ld	xl,a
 721  00ce 58            	sllw	x
 722  00cf de0032        	ldw	x,(L44,x)
 723  00d2 fc            	jp	(x)
 724  00d3               L24:
 725  00d3 207c          	jra	L152
 726  00d5               L102:
 727                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 727                     ; 242   case ITC_IRQ_AWU:
 727                     ; 243   case ITC_IRQ_CLK:
 727                     ; 244   case ITC_IRQ_PORTA:
 727                     ; 245     ITC->ISPR1 &= Mask;
 729  00d5 c67f70        	ld	a,32624
 730  00d8 1401          	and	a,(OFST-1,sp)
 731  00da c77f70        	ld	32624,a
 732                     ; 246     ITC->ISPR1 |= NewPriority;
 734  00dd c67f70        	ld	a,32624
 735  00e0 1a02          	or	a,(OFST+0,sp)
 736  00e2 c77f70        	ld	32624,a
 737                     ; 247     break;
 739  00e5 206a          	jra	L152
 740  00e7               L302:
 741                     ; 249   case ITC_IRQ_PORTB:
 741                     ; 250   case ITC_IRQ_PORTC:
 741                     ; 251   case ITC_IRQ_PORTD:
 741                     ; 252   case ITC_IRQ_PORTE:
 741                     ; 253     ITC->ISPR2 &= Mask;
 743  00e7 c67f71        	ld	a,32625
 744  00ea 1401          	and	a,(OFST-1,sp)
 745  00ec c77f71        	ld	32625,a
 746                     ; 254     ITC->ISPR2 |= NewPriority;
 748  00ef c67f71        	ld	a,32625
 749  00f2 1a02          	or	a,(OFST+0,sp)
 750  00f4 c77f71        	ld	32625,a
 751                     ; 255     break;
 753  00f7 2058          	jra	L152
 754  00f9               L502:
 755                     ; 264   case ITC_IRQ_SPI:
 755                     ; 265   case ITC_IRQ_TIM1_OVF:
 755                     ; 266     ITC->ISPR3 &= Mask;
 757  00f9 c67f72        	ld	a,32626
 758  00fc 1401          	and	a,(OFST-1,sp)
 759  00fe c77f72        	ld	32626,a
 760                     ; 267     ITC->ISPR3 |= NewPriority;
 762  0101 c67f72        	ld	a,32626
 763  0104 1a02          	or	a,(OFST+0,sp)
 764  0106 c77f72        	ld	32626,a
 765                     ; 268     break;
 767  0109 2046          	jra	L152
 768  010b               L702:
 769                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 769                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 769                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 769                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 769                     ; 274 #else
 769                     ; 275   case ITC_IRQ_TIM2_OVF:
 769                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 769                     ; 277 #endif /*STM8S903 or STM8AF622x */
 769                     ; 278   case ITC_IRQ_TIM3_OVF:
 769                     ; 279     ITC->ISPR4 &= Mask;
 771  010b c67f73        	ld	a,32627
 772  010e 1401          	and	a,(OFST-1,sp)
 773  0110 c77f73        	ld	32627,a
 774                     ; 280     ITC->ISPR4 |= NewPriority;
 776  0113 c67f73        	ld	a,32627
 777  0116 1a02          	or	a,(OFST+0,sp)
 778  0118 c77f73        	ld	32627,a
 779                     ; 281     break;
 781  011b 2034          	jra	L152
 782  011d               L112:
 783                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 783                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 783                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 783                     ; 286   case ITC_IRQ_UART1_TX:
 783                     ; 287   case ITC_IRQ_UART1_RX:
 783                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 783                     ; 289 #if defined(STM8AF622x)
 783                     ; 290   case ITC_IRQ_UART4_TX:
 783                     ; 291   case ITC_IRQ_UART4_RX:
 783                     ; 292 #endif /*STM8AF622x */
 783                     ; 293   case ITC_IRQ_I2C:
 783                     ; 294     ITC->ISPR5 &= Mask;
 785  011d c67f74        	ld	a,32628
 786  0120 1401          	and	a,(OFST-1,sp)
 787  0122 c77f74        	ld	32628,a
 788                     ; 295     ITC->ISPR5 |= NewPriority;
 790  0125 c67f74        	ld	a,32628
 791  0128 1a02          	or	a,(OFST+0,sp)
 792  012a c77f74        	ld	32628,a
 793                     ; 296     break;
 795  012d 2022          	jra	L152
 796  012f               L312:
 797                     ; 312   case ITC_IRQ_ADC1:
 797                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 797                     ; 314     
 797                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 797                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 797                     ; 317 #else
 797                     ; 318   case ITC_IRQ_TIM4_OVF:
 797                     ; 319 #endif /* STM8S903 or STM8AF622x */
 797                     ; 320     ITC->ISPR6 &= Mask;
 799  012f c67f75        	ld	a,32629
 800  0132 1401          	and	a,(OFST-1,sp)
 801  0134 c77f75        	ld	32629,a
 802                     ; 321     ITC->ISPR6 |= NewPriority;
 804  0137 c67f75        	ld	a,32629
 805  013a 1a02          	or	a,(OFST+0,sp)
 806  013c c77f75        	ld	32629,a
 807                     ; 322     break;
 809  013f 2010          	jra	L152
 810  0141               L512:
 811                     ; 324   case ITC_IRQ_EEPROM_EEC:
 811                     ; 325     ITC->ISPR7 &= Mask;
 813  0141 c67f76        	ld	a,32630
 814  0144 1401          	and	a,(OFST-1,sp)
 815  0146 c77f76        	ld	32630,a
 816                     ; 326     ITC->ISPR7 |= NewPriority;
 818  0149 c67f76        	ld	a,32630
 819  014c 1a02          	or	a,(OFST+0,sp)
 820  014e c77f76        	ld	32630,a
 821                     ; 327     break;
 823  0151               L712:
 824                     ; 329   default:
 824                     ; 330     break;
 826  0151               L152:
 827                     ; 332 }
 830  0151 5b04          	addw	sp,#4
 831  0153 81            	ret
 844                     	xdef	_ITC_GetSoftwarePriority
 845                     	xdef	_ITC_SetSoftwarePriority
 846                     	xdef	_ITC_GetSoftIntStatus
 847                     	xdef	_ITC_DeInit
 848                     	xdef	_ITC_GetCPUCC
 867                     	end
