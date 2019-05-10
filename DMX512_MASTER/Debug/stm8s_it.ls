   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  50                     ; 41 void TIM4_IQRHandler(void)
  50                     ; 42 {
  51                     	switch	.text
  52  0000               f_TIM4_IQRHandler:
  54  0000 8a            	push	cc
  55  0001 84            	pop	a
  56  0002 a4bf          	and	a,#191
  57  0004 88            	push	a
  58  0005 86            	pop	cc
  59  0006 3b0002        	push	c_x+2
  60  0009 be00          	ldw	x,c_x
  61  000b 89            	pushw	x
  62  000c 3b0002        	push	c_y+2
  63  000f be00          	ldw	x,c_y
  64  0011 89            	pushw	x
  67                     ; 43 	TIM4_Cmd(DISABLE);
  69  0012 4f            	clr	a
  70  0013 cd0000        	call	_TIM4_Cmd
  72                     ; 45 	switch(DMX512_TX_nextState)
  74  0016 c60000        	ld	a,_DMX512_TX_nextState
  76                     ; 64 			break;
  77  0019 4d            	tnz	a
  78  001a 2708          	jreq	L3
  79  001c 4a            	dec	a
  80  001d 270e          	jreq	L5
  81  001f 4a            	dec	a
  82  0020 271c          	jreq	L7
  83  0022 202a          	jra	L13
  84  0024               L3:
  85                     ; 47 		case TxBreak:
  85                     ; 48 			DMX512_TX_nextState = TxStart;
  87  0024 35010000      	mov	_DMX512_TX_nextState,#1
  88                     ; 49 			DMX512_TX_sendBreak();
  90  0028 cd0000        	call	_DMX512_TX_sendBreak
  92                     ; 50 			break;
  94  002b 2021          	jra	L13
  95  002d               L5:
  96                     ; 52 		case TxStart:
  96                     ; 53 			DMX512_TX_nextState = TxData;
  98  002d 35020000      	mov	_DMX512_TX_nextState,#2
  99                     ; 54 			DMX512_TX_enableTx();
 101  0031 cd0000        	call	_DMX512_TX_enableTx
 103                     ; 55 			DMX512_TX_countAddr = 0;
 105  0034 725f0000      	clr	_DMX512_TX_countAddr
 106                     ; 56 			DMX512_TX_sendData(STARTCODE);
 108  0038 4f            	clr	a
 109  0039 cd0000        	call	_DMX512_TX_sendData
 111                     ; 57 			break;
 113  003c 2010          	jra	L13
 114  003e               L7:
 115                     ; 59 		case TxData:
 115                     ; 60 			if( ++DMX512_TX_countAddr >= MAXCHANNEL)
 117  003e 725c0000      	inc	_DMX512_TX_countAddr
 119                     ; 63 			DMX512_TX_sendData(packet[DMX512_TX_countAddr-1]);
 122  0042 c60000        	ld	a,_DMX512_TX_countAddr
 123  0045 5f            	clrw	x
 124  0046 97            	ld	xl,a
 125  0047 5a            	decw	x
 126  0048 d60000        	ld	a,(_packet,x)
 127  004b cd0000        	call	_DMX512_TX_sendData
 129                     ; 64 			break;
 131  004e               L13:
 132                     ; 66 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 134  004e a601          	ld	a,#1
 135  0050 cd0000        	call	_TIM4_ClearFlag
 137                     ; 67 }
 140  0053 85            	popw	x
 141  0054 bf00          	ldw	c_y,x
 142  0056 320002        	pop	c_y+2
 143  0059 85            	popw	x
 144  005a bf00          	ldw	c_x,x
 145  005c 320002        	pop	c_x+2
 146  005f 80            	iret
 169                     ; 90 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 169                     ; 91 {
 170                     	switch	.text
 171  0060               f_NonHandledInterrupt:
 175                     ; 95 }
 178  0060 80            	iret
 200                     ; 103 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 200                     ; 104 {
 201                     	switch	.text
 202  0061               f_TRAP_IRQHandler:
 206                     ; 108 }
 209  0061 80            	iret
 231                     ; 115 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 231                     ; 116 
 231                     ; 117 {
 232                     	switch	.text
 233  0062               f_TLI_IRQHandler:
 237                     ; 121 }
 240  0062 80            	iret
 262                     ; 128 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 262                     ; 129 {
 263                     	switch	.text
 264  0063               f_AWU_IRQHandler:
 268                     ; 133 }
 271  0063 80            	iret
 293                     ; 140 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 293                     ; 141 {
 294                     	switch	.text
 295  0064               f_CLK_IRQHandler:
 299                     ; 145 }
 302  0064 80            	iret
 325                     ; 152 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 325                     ; 153 {
 326                     	switch	.text
 327  0065               f_EXTI_PORTA_IRQHandler:
 331                     ; 157 }
 334  0065 80            	iret
 357                     ; 164 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 357                     ; 165 {
 358                     	switch	.text
 359  0066               f_EXTI_PORTB_IRQHandler:
 363                     ; 169 }
 366  0066 80            	iret
 389                     ; 176 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 389                     ; 177 {
 390                     	switch	.text
 391  0067               f_EXTI_PORTC_IRQHandler:
 395                     ; 181 }
 398  0067 80            	iret
 421                     ; 188 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 421                     ; 189 {
 422                     	switch	.text
 423  0068               f_EXTI_PORTD_IRQHandler:
 427                     ; 193 }
 430  0068 80            	iret
 453                     ; 200 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 453                     ; 201 {
 454                     	switch	.text
 455  0069               f_EXTI_PORTE_IRQHandler:
 459                     ; 205 }
 462  0069 80            	iret
 484                     ; 252 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 484                     ; 253 {
 485                     	switch	.text
 486  006a               f_SPI_IRQHandler:
 490                     ; 257 }
 493  006a 80            	iret
 516                     ; 264 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 516                     ; 265 {
 517                     	switch	.text
 518  006b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 522                     ; 269 }
 525  006b 80            	iret
 548                     ; 276 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 548                     ; 277 {
 549                     	switch	.text
 550  006c               f_TIM1_CAP_COM_IRQHandler:
 554                     ; 281 }
 557  006c 80            	iret
 580                     ; 314  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 580                     ; 315  {
 581                     	switch	.text
 582  006d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 586                     ; 319  }
 589  006d 80            	iret
 612                     ; 326  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 612                     ; 327  {
 613                     	switch	.text
 614  006e               f_TIM2_CAP_COM_IRQHandler:
 618                     ; 331  }
 621  006e 80            	iret
 644                     ; 368  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 644                     ; 369  {
 645                     	switch	.text
 646  006f               f_UART1_TX_IRQHandler:
 650                     ; 373  }
 653  006f 80            	iret
 676                     ; 380  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 676                     ; 381  {
 677                     	switch	.text
 678  0070               f_UART1_RX_IRQHandler:
 682                     ; 385  }
 685  0070 80            	iret
 707                     ; 419 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 707                     ; 420 {
 708                     	switch	.text
 709  0071               f_I2C_IRQHandler:
 713                     ; 424 }
 716  0071 80            	iret
 738                     ; 498  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 738                     ; 499  {
 739                     	switch	.text
 740  0072               f_ADC1_IRQHandler:
 744                     ; 503  }
 747  0072 80            	iret
 770                     ; 524  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 770                     ; 525  {
 771                     	switch	.text
 772  0073               f_TIM4_UPD_OVF_IRQHandler:
 776                     ; 529  }
 779  0073 80            	iret
 802                     ; 537 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 802                     ; 538 {
 803                     	switch	.text
 804  0074               f_EEPROM_EEC_IRQHandler:
 808                     ; 542 }
 811  0074 80            	iret
 823                     	xref	_packet
 824                     	xref	_DMX512_TX_countAddr
 825                     	xref	_DMX512_TX_nextState
 826                     	xref	_DMX512_TX_sendData
 827                     	xref	_DMX512_TX_sendBreak
 828                     	xref	_DMX512_TX_enableTx
 829                     	xdef	f_EEPROM_EEC_IRQHandler
 830                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 831                     	xdef	f_ADC1_IRQHandler
 832                     	xdef	f_I2C_IRQHandler
 833                     	xdef	f_UART1_RX_IRQHandler
 834                     	xdef	f_UART1_TX_IRQHandler
 835                     	xdef	f_TIM2_CAP_COM_IRQHandler
 836                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 837                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 838                     	xdef	f_TIM1_CAP_COM_IRQHandler
 839                     	xdef	f_SPI_IRQHandler
 840                     	xdef	f_EXTI_PORTE_IRQHandler
 841                     	xdef	f_EXTI_PORTD_IRQHandler
 842                     	xdef	f_EXTI_PORTC_IRQHandler
 843                     	xdef	f_EXTI_PORTB_IRQHandler
 844                     	xdef	f_EXTI_PORTA_IRQHandler
 845                     	xdef	f_CLK_IRQHandler
 846                     	xdef	f_AWU_IRQHandler
 847                     	xdef	f_TLI_IRQHandler
 848                     	xdef	f_TRAP_IRQHandler
 849                     	xdef	f_NonHandledInterrupt
 850                     	xref	_TIM4_ClearFlag
 851                     	xref	_TIM4_Cmd
 852                     	xdef	f_TIM4_IQRHandler
 853                     	xref.b	c_x
 854                     	xref.b	c_y
 873                     	end
