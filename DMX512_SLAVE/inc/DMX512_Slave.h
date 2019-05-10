#ifndef __DMX512_SLAVE_H__
#define __DMX512_SLAVE_H__

#include "stm8s.h"

#define TIMEOUT	  1000			// thoi gian ms toi da khi nhan 1 packet
#define STARTCODE 0x00			// ma Start code

//	 dinh nghia cac nut bam chon base address
#define BUT_OK	GPIO_PIN_5
#define BUT_Dvi GPIO_PIN_1
#define BUT_Chuc GPIO_PIN_2
#define BUT_Tram GPIO_PIN_1

typedef enum
{
	RxBreak, RxStart, RxData
} DMX512_RxState;

typedef struct 
{
	DMX512_RxState nextState;		// trang thai nhan ke tiep
	uint16_t countAddr;					// dem dia chi du lieu nhan duoc
	uint16_t startChannel;			// dia chi bat dau nhan channel
	uint16_t size;							// so channel se nhan
	uint8_t* arrData;						// tro den mang chua du lieu nhan duoc
	bool flagNewPacket;					// co bao trang thai da nhan duoc new packet
} dmx512_rx;


void DMX512_RX_init(uint16_t size, uint8_t* arr_data);
void UART1_setup(void);
void IWDG_setup(void);
void DMX512_RX_resetTimeout(void);
bool DMX512_RX_getFlagNewPacket(void);
void DMX512_RX_setFlagNewPacket(bool state);
uint16_t DMX512_RX_getAddressing(void);

#endif