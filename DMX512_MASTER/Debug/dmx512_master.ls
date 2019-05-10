   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 9 void DMX512_TX_start(void)
  45                     ; 10 {
  47                     	switch	.text
  48  0000               _DMX512_TX_start:
  52                     ; 11 	DMX512_TX_nextState = TxBreak;
  54  0000 725f0002      	clr	_DMX512_TX_nextState
  55                     ; 12 	DMX512_TX_countAddr = 0;
  57  0004 5f            	clrw	x
  58  0005 cf0000        	ldw	_DMX512_TX_countAddr,x
  59                     ; 13 	DMX512_TX_setTiming(20);				// gui tin hieu MBB 20us, kich hoat che do ngat timer 4
  61  0008 a614          	ld	a,#20
  62  000a ad01          	call	_DMX512_TX_setTiming
  64                     ; 14 }
  67  000c 81            	ret
 103                     ; 20 void DMX512_TX_setTiming(uint8_t timing)
 103                     ; 21 {
 104                     	switch	.text
 105  000d               _DMX512_TX_setTiming:
 107  000d 88            	push	a
 108       00000000      OFST:	set	0
 111                     ; 22 	TIM4_Cmd(DISABLE);
 113  000e 4f            	clr	a
 114  000f cd0000        	call	_TIM4_Cmd
 116                     ; 23 	TIM4_SetCounter(TIM4_CNTR_RESET_VALUE);
 118  0012 4f            	clr	a
 119  0013 cd0000        	call	_TIM4_SetCounter
 121                     ; 24 	TIM4_TimeBaseInit(TIM4_PRESCALER_8, timing); 
 123  0016 7b01          	ld	a,(OFST+1,sp)
 124  0018 ae0300        	ldw	x,#768
 125  001b 97            	ld	xl,a
 126  001c cd0000        	call	_TIM4_TimeBaseInit
 128                     ; 25 	TIM4_Cmd(ENABLE);
 130  001f a601          	ld	a,#1
 131  0021 cd0000        	call	_TIM4_Cmd
 133                     ; 26 }
 136  0024 84            	pop	a
 137  0025 81            	ret
 163                     ; 31 void DMX512_TX_sendBreak(void)
 163                     ; 32 {
 164                     	switch	.text
 165  0026               _DMX512_TX_sendBreak:
 169                     ; 33 	UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);	/* Clear the Transmitter Enable bit -> pin TX co chuc nang I/O thong thuong */
 171  0026 72175235      	bres	21045,#3
 172                     ; 34 	GPIO_WriteLow(GPIOD, GPIO_PIN_5);		// keo chan Tx xuong 0;
 174  002a 4b20          	push	#32
 175  002c ae500f        	ldw	x,#20495
 176  002f cd0000        	call	_GPIO_WriteLow
 178  0032 84            	pop	a
 179                     ; 35 	DMX512_TX_setTiming(176);						// thoi gian Break 176us
 181  0033 a6b0          	ld	a,#176
 182  0035 add6          	call	_DMX512_TX_setTiming
 184                     ; 36 }
 187  0037 81            	ret
 210                     ; 41 void DMX512_TX_enableTx(void)
 210                     ; 42 {
 211                     	switch	.text
 212  0038               _DMX512_TX_enableTx:
 216                     ; 44     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;
 218  0038 72165235      	bset	21045,#3
 219                     ; 46 }
 222  003c 81            	ret
 257                     ; 51 void DMX512_TX_sendData(uint8_t data)
 257                     ; 52 {
 258                     	switch	.text
 259  003d               _DMX512_TX_sendData:
 261  003d 88            	push	a
 262       00000000      OFST:	set	0
 265  003e               L37:
 266                     ; 53 	while(UART1_GetFlagStatus(UART1_FLAG_TXE) != TRUE);	// doi den khi truyen xong data truoc
 268  003e ae0080        	ldw	x,#128
 269  0041 cd0000        	call	_UART1_GetFlagStatus
 271  0044 a101          	cp	a,#1
 272  0046 26f6          	jrne	L37
 273                     ; 54 	UART1_SendData8(data);
 275  0048 7b01          	ld	a,(OFST+1,sp)
 276  004a cd0000        	call	_UART1_SendData8
 278                     ; 55 	DMX512_TX_setTiming(70); // 70us > 1 frame=12*4us
 280  004d a646          	ld	a,#70
 281  004f adbc          	call	_DMX512_TX_setTiming
 283                     ; 56 }
 286  0051 84            	pop	a
 287  0052 81            	ret
 348                     	switch	.bss
 349  0000               _DMX512_TX_countAddr:
 350  0000 0000          	ds.b	2
 351                     	xdef	_DMX512_TX_countAddr
 352  0002               _DMX512_TX_nextState:
 353  0002 00            	ds.b	1
 354                     	xdef	_DMX512_TX_nextState
 355                     	xdef	_DMX512_TX_sendData
 356                     	xdef	_DMX512_TX_sendBreak
 357                     	xdef	_DMX512_TX_enableTx
 358                     	xdef	_DMX512_TX_setTiming
 359                     	xdef	_DMX512_TX_start
 360                     	xref	_UART1_GetFlagStatus
 361                     	xref	_UART1_SendData8
 362                     	xref	_TIM4_SetCounter
 363                     	xref	_TIM4_Cmd
 364                     	xref	_TIM4_TimeBaseInit
 365                     	xref	_GPIO_WriteLow
 385                     	end
