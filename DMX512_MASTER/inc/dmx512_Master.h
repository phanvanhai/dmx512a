#ifndef __DMX512_MASTER_H__
#define __DMX512_MASTER_H__

#include "stm8s.h"

//------------------------------
#define STARTCODE 0x00
#define MAXCHANNEL 512

typedef enum 
{
	TxBreak, TxStart, TxData
} DMX512_TxState;

//------------ DMX512 - Function------------
void DMX512_TX_start(void);
void DMX512_TX_setTiming(uint8_t timing);
void DMX512_TX_enableTx(void);
void DMX512_TX_sendBreak(void);
void DMX512_TX_sendData(uint8_t data);

#endif