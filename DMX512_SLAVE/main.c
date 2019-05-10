#include "stm8s.h"
#include "lcd.h"
#include "stm8s_delay.h"
#include "dmx512_Slave.h"

#define SIZE				10
char i=0;
uint8_t 		arrDMX[10];
uint16_t duty_cycle;

//------------  Setup------------
void clock_setup(void);
void GPIO_setup(void);
void PWM_setup(void);

main(void)
{
	clock_setup();
	GPIO_setup();
	PWM_setup();
	
	LCD_init();
	LCD_clear_home();
	
	
	DMX512_RX_init(SIZE, arrDMX);
	
	LCD_goto(0,0);
	LCD_putstr("Data Received:  ");
	LCD_goto(0,1);
	LCD_putstr("arrDMX[");
	LCD_goto(8,1);
	LCD_putstr("]:");
	
	//	thiet lap thoi gian timeout
	DMX512_RX_resetTimeout();
	while (1)
	{
		if(DMX512_RX_getFlagNewPacket() == TRUE)
		{
			DMX512_RX_setFlagNewPacket(FALSE);
			DMX512_RX_resetTimeout();
			
			// hien thi tung phan tu trong mang nhan dc
			LCD_goto(7,1);
			LCD_putchar(i+'0');
			LCD_print(10,1,(unsigned int)arrDMX[i++]);
			if( i >= 10) i =0;
			delay_ms(700);
			
			// xuat xung PWM
			duty_cycle = (uint16_t)((uint16_t)arrDMX[0]<<8 | arrDMX[1]);
			TIM2_SetCompare1(duty_cycle % 0x03ff);
			
			duty_cycle = (uint16_t)(300);
			TIM2_SetCompare2(duty_cycle % 0x03ff);
			
			duty_cycle = (uint16_t)(300);
			TIM2_SetCompare3(duty_cycle % 0x03ff);
		}
	}	
}

void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == FALSE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV2); //fCPU = 8MHz
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
}

void GPIO_setup(void)
{
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOA);
	
	// cau hinh dau ra PWM_Timer2 channel 1,2,3
	GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
}

void PWM_setup(void)
{
	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 0x03ff);
	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_LOW);
	TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_LOW);
	TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_LOW);
	TIM2_Cmd(ENABLE);
	
}

