#include "dmx512_Slave.h"
#include "lcd.h"
#include "stm8s_delay.h"

dmx512_rx DMX512_RX;
uint8_t* dataPtr;

/*
					khoi tao DMX512
input: 	size: kich thuoc cua mang nhan du lieu
				arr_data: tro toi mang du lieu
*/
void DMX512_RX_init(uint16_t size, uint8_t* arr_data)
{
	// cau hinh chan truyen-nhan UART
	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	
	// cau hinh cac chan nut bam
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOA, GPIO_PIN_1|GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
	
	// cau hinh mode UART
	UART1_setup();
	// thiet lap cac thuoc tinh cuar DMX512_RX
	DMX512_RX.nextState			= RxBreak;
	DMX512_RX.size					= size;
	DMX512_RX.arrData				= arr_data;
	DMX512_RX.countAddr     = 0;
	DMX512_RX.flagNewPacket = FALSE;
	DMX512_RX.startChannel  = DMX512_RX_getAddressing();
	
	// cau hinh watchdog tao timeout, bat dau tinh thoi gian nhan 1 packet
	IWDG_setup();
}

void UART1_setup(void)
{
	UART1_DeInit();
	UART1_Init(250000, UART1_WORDLENGTH_8D, UART1_STOPBITS_2,
						UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE,
						UART1_MODE_TXRX_ENABLE);
	
	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
	enableInterrupts();
	
	UART1_Cmd(ENABLE);
}

/*
		thiet lap watchdong tao thoi gian timeout la: TIMEOUT ms
*/
void IWDG_setup(void)
{
	IWDG_Enable();
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	IWDG_SetPrescaler(IWDG_Prescaler_256);
	IWDG_SetReload( (uint8_t)(TIMEOUT/4 - 1) );
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
}

/*
	reset lai time out
*/
void DMX512_RX_resetTimeout(void)
{
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	IWDG_ReloadCounter();
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
}

/*
		tra ve TRUE neu nhan xong 1 packet, FALSE neu chua nhan xong
*/
bool DMX512_RX_getFlagNewPacket(void)
{
	return DMX512_RX.flagNewPacket;
}

/*
		dat gia tri co bao da nhan xong packet chua
*/
void DMX512_RX_setFlagNewPacket(bool state)
{
	DMX512_RX.flagNewPacket = state;
}

/*
		lay base address tu nut bam, ham nay duoc goi 1 lan khi khoi tao
*/
uint16_t DMX512_RX_getAddressing(void)
{
	unsigned char dvi=1, chuc=0, tram=0, nut;
	LCD_goto(0,0);
	LCD_putstr("Setup Address:");
	LCD_goto(0,1);
	LCD_putstr("001");
	while(1)
	{
		// neu nut hang don_vi duoc bam
		if(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_1))
		{
			while(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_1));	// doi den khi nha nut bam
			dvi = (dvi>=9)? 0 : (dvi+1);
			LCD_goto(2,1);
			LCD_putchar(dvi + '0');
			LCD_goto(2,1);
			delay_ms(50);
		}
		// neu nut hang chuc duoc bam
		if(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_2))
		{
			while(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_2));
			chuc = (chuc>=9)? 0 : (chuc+1);
			LCD_goto(1,1);
			LCD_putchar(chuc + '0');
			LCD_goto(1,1);
			delay_ms(50);
		}
		// neu nut hang tram duoc bam
		if(!GPIO_ReadInputPin(GPIOD,GPIO_PIN_1))
		{
			while(!GPIO_ReadInputPin(GPIOD,GPIO_PIN_1));
			tram = (tram>=9)? 0 : (tram+1);
			LCD_goto(0,1);
			LCD_putchar(tram + '0');
			LCD_goto(0,1);
			delay_ms(50);
		}
		// neu nut OK duoc bam
		if(!GPIO_ReadInputPin(GPIOB,GPIO_PIN_5))
			return (uint16_t)(dvi + chuc*10 + tram*100);
	}
}