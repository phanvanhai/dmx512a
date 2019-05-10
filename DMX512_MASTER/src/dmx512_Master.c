#include "dmx512_Master.h"
#include "stm8s_uart1.h"
#include "stm8s_tim4.h"
#include "stm8s_delay.h"

DMX512_TxState  DMX512_TX_nextState;		// trang thai tiep theo khi truyen packet
uint16_t	      DMX512_TX_countAddr;		// chua dia chi tung data se duoc gui

void DMX512_TX_start(void)
{
	DMX512_TX_nextState = TxBreak;
	DMX512_TX_countAddr = 0;
	DMX512_TX_setTiming(20);				// gui tin hieu MBB 20us, kich hoat che do ngat timer 4
}

/*
thiet lap thoi gian us sinh ra ngat timer4:
fMaster = 8MHz => tim4_prescaler = 8 
*/
void DMX512_TX_setTiming(uint8_t timing)
{
	TIM4_Cmd(DISABLE);
	TIM4_SetCounter(TIM4_CNTR_RESET_VALUE);
	TIM4_TimeBaseInit(TIM4_PRESCALER_8, timing); 
	TIM4_Cmd(ENABLE);
}

/*
gui tin hieu Break trong 176us
*/
void DMX512_TX_sendBreak(void)
{
	UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);	/* Clear the Transmitter Enable bit -> pin TX co chuc nang I/O thong thuong */
	GPIO_WriteLow(GPIOD, GPIO_PIN_5);		// keo chan Tx xuong 0;
	DMX512_TX_setTiming(176);						// thoi gian Break 176us
}

/*
cho phep chan PortD.5(TX) co chuc nang truyen tin
*/
void DMX512_TX_enableTx(void)
{
	// Set the Transmitter Enable bit
    UART1->CR2 |= (uint8_t)UART1_CR2_TEN;
	// sau lenh tren se tu dong tao ra 1 frame o muc 1
}

/*
gui du lieu 
*/
void DMX512_TX_sendData(uint8_t data)
{
	while(UART1_GetFlagStatus(UART1_FLAG_TXE) != TRUE);	// doi den khi truyen xong data truoc
	UART1_SendData8(data);
	DMX512_TX_setTiming(70); // 70us > 1 frame=12*4us
}

