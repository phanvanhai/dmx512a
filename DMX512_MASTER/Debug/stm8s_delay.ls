   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  59                     ; 4 void delay_us(unsigned int  value)
  59                     ; 5 {
  61                     	switch	.text
  62  0000               _delay_us:
  64  0000 89            	pushw	x
  65       00000002      OFST:	set	2
  68                     ; 6 	register unsigned int loops =  (dly_const * value) ;
  70  0001 cd0000        	call	c_uitof
  72  0004 ae0000        	ldw	x,#L33
  73  0007 cd0000        	call	c_fmul
  75  000a cd0000        	call	c_ftoi
  77  000d 1f01          	ldw	(OFST-1,sp),x
  80  000f 2008          	jra	L34
  81  0011               L73:
  82                     ; 10 		_asm ("nop");
  85  0011 9d            nop
  87                     ; 11 		loops--;
  89  0012 1e01          	ldw	x,(OFST-1,sp)
  90  0014 1d0001        	subw	x,#1
  91  0017 1f01          	ldw	(OFST-1,sp),x
  93  0019               L34:
  94                     ; 8 	while(loops)
  96  0019 1e01          	ldw	x,(OFST-1,sp)
  97  001b 26f4          	jrne	L73
  98                     ; 13 }
 102  001d 85            	popw	x
 103  001e 81            	ret
 136                     ; 16 void delay_ms(unsigned int  value)
 136                     ; 17 {
 137                     	switch	.text
 138  001f               _delay_ms:
 140  001f 89            	pushw	x
 141       00000000      OFST:	set	0
 144  0020 200c          	jra	L56
 145  0022               L36:
 146                     ; 20 		delay_us(1000);
 148  0022 ae03e8        	ldw	x,#1000
 149  0025 add9          	call	_delay_us
 151                     ; 21 		value--;
 153  0027 1e01          	ldw	x,(OFST+1,sp)
 154  0029 1d0001        	subw	x,#1
 155  002c 1f01          	ldw	(OFST+1,sp),x
 156  002e               L56:
 157                     ; 18 	while(value)
 159  002e 1e01          	ldw	x,(OFST+1,sp)
 160  0030 26f0          	jrne	L36
 161                     ; 23 }
 165  0032 85            	popw	x
 166  0033 81            	ret
 179                     	xdef	_delay_ms
 180                     	xdef	_delay_us
 181                     .const:	section	.text
 182  0000               L33:
 183  0000 3f888888      	dc.w	16264,-30584
 184                     	xref.b	c_x
 204                     	xref	c_ftoi
 205                     	xref	c_fmul
 206                     	xref	c_uitof
 207                     	end
