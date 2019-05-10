#include "stm8s.h"
#include "lcd.h"
#include "stm8s_delay.h"
#include "dmx512_Master.h"

volatile uint8_t packet[512];


//------------  Setup------------
void clock_setup(void);
void GPIO_setup(void);
void ADC1_setup(void);
void UART1_setup(void);
void TIM4_setup(void);


void main(void)
{
	uint16_t A4=0x0000;
	char i=0;
	unsigned int i0=0;
	
	clock_setup();
	GPIO_setup();
	ADC1_setup();
	UART1_setup();
	TIM4_setup();
	
	LCD_init();
	LCD_clear_home();
	
	LCD_goto(0, 0);
	LCD_putstr("_DMX512-3i-K60_");
	LCD_goto(0,1);
	LCD_putstr("packet[   ]:");
	
	// khoi tao mang packet: 0->255,0->255
	for(i0=0;i0<512;i0++)
			packet[i0] = (i0%256);
			
	DMX512_TX_start();
	
	while (1)
	{
		// chuyen doi ADC
		ADC1_StartConversion();
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
		A4 = ADC1_GetConversionValue();
		ADC1_ClearFlag(ADC1_FLAG_EOC);
				
		packet[6] = (uint8_t)(A4>>8);
		packet[7] = (uint8_t)(A4 & 0x00ff);
		
		// hien thi gia tri vua chuyen doi
		LCD_print(7,1,6+i);
		LCD_print(12,1,packet[6+i]);
		if ((++i) >= 2) i = 0;
		delay_ms(700);
	}
	
}

void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV2); // fCPU = 8MHz
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
}

void GPIO_setup(void)
{
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	
	// cau hinh UART
	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	
	// cau hinh ADC input 4
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
}

void ADC1_setup(void)
{
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D18, ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE);
	ADC1_Cmd(ENABLE);
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

void TIM4_setup(void)
{
	TIM4_DeInit();
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	enableInterrupts();
	TIM4_Cmd(DISABLE);
}
