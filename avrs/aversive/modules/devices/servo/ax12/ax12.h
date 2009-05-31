/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2008)
 *  JD Brossillon <jean.damien.brossillon@gmail.com>  (main job)
 *  Olivier Matz <zer0@droids-corp.org>               (clean-up, fixes)
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  Revision : $Id: ax12.h,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/** 
 * @file ax12.h
 *
 * @brief This module provides functions for using a Robotis Dynamixel
 *  AX-12 numeric actuator
 *
 * @todo
 * - Manage the "Status Return Level"
 *
 * AX12 servos uses a half duplex uart. This means that there is only
 * one line that is used for both transmitting and receiving. Refer to
 * the AX12 documentation for more informations.
 * 
 * This module doesn't need ATmega's uart, user have to provide
 * 3 functions to control the half duplex uart:
 *  - send char.
 *  - write char.
 *  - switch direction
 *
 * These functions may use (or not) the AVR uart. Have a look to the
 * test program in test/ directory for an example.
 */

#ifndef _AX12_H_
#define _AX12_H_

#include <aversive.h>
#include <stdlib.h> 

#include "ax12_address.h"
#include "ax12_config.h"

/*__________________________________________*/

/* Half duplex uart switch */
#define AX12_STATE_READ  0
#define AX12_STATE_WRITE 1

/* Error bits */
#define AX12_ERROR_BIT_VOLTAGE      0
#define AX12_ERROR_BIT_ANGLE_LIMIT  1
#define AX12_ERROR_BIT_OVERHEAT     2
#define AX12_ERROR_BIT_RANGE        3
#define AX12_ERROR_BIT_CHECKSUM     4
#define AX12_ERROR_BIT_OVERLOAD     5
#define AX12_ERROR_BIT_INSTRUCTION  6

/* Other error types when bit 7 id 1 */
#define AX12_ERROR_TYPE_NO_ANSWER       0xff 
#define AX12_ERROR_TYPE_TIMEOUT         0xfe 
#define AX12_ERROR_TYPE_INVALID_PACKET  0xfd 
#define AX12_ERROR_TYPE_XMIT_FAILED     0xfc
#define AX12_ERROR_TYPE_BAD_CKSUM       0xfb

/* Address (see ax12_address.h) */
#define AX12_BROADCAST_ID 0xFE

/* AX-12 instruction set */
#define AX12_PING       0x01
#define AX12_READ       0x02
#define AX12_WRITE      0x03
#define AX12_REG_WRITE  0x04
#define AX12_ACTION     0x05
#define AX12_RESET      0x06
#define AX12_SYNC_WRITE 0x83

/*__________________________________________*/

typedef struct AX12
{
	/* function to send a byte to the serial line. Return 0 on
	 * success. */
	int8_t (*hardware_send)(uint8_t);

	/* synchronously receive a byte from ax12. Return -1 on
	 * timeout, or the received byte. */
	int16_t (*hardware_recv)(void);

	/* switch the line state (read or write) */
	void (*hardware_switch)(uint8_t);
} AX12;

typedef struct AX12_Packet
{
	uint8_t id;
	uint8_t instruction;

	/* Size of AX12_Packet.params */
	uint8_t nparams;
	uint8_t params[AX12_MAX_PARAMS];

	/* Used in status packet */
	uint8_t error;

} AX12_Packet;

/*___________ Interface ____________*/

void AX12_init(AX12 *);

/*___________ Hardware layer _____________*/

/** @brief Set the function called when writing a character. */
void AX12_set_hardware_send(AX12 *, int8_t(*)(uint8_t));

/** @brief Set the function called when reading a character. */
void AX12_set_hardware_recv(AX12 *, int16_t(*)(void));

/** @brief Set the function called when switching line direction */
void AX12_set_hardware_switch(AX12 *, void(*)(uint8_t));

/*___________ Low level layer ____________*/

/** @brief Compute AX12 packet checksum */
uint8_t AX12_checksum(AX12_Packet *packet);

/** @brief Send a formated AX12 instruction packet. Return 0 on
 *  on success. */
uint8_t AX12_send(AX12 *, AX12_Packet *packet);

/* @brief Receive a formated AX12 status packet. Return 0 on
 *  on success. */
uint8_t AX12_recv(AX12 *, AX12_Packet *packet);

/*___________ Medium level layer _________*/

/*
 * ////////////////// WARNING /////////////////////////
 *   The following functions assume that AX12 always 
 *    answer with a status packet
 *  (Status Return Level = 0x02 in AX12 EEPROM area)
 * ////////////////// WARNING /////////////////////////
 */

/** @brief Write byte in AX-12 memory 
 * @return Error code from AX-12 (0 means okay) */
uint8_t AX12_write_byte(AX12 *, uint8_t id, AX12_ADDRESS address,
			uint8_t data);

/** @brief Write integer (2 bytes) in AX-12 memory 
 * @return Error code from AX-12 (0 means okay)
 *
 * address   : data low
 * address+1 : data high
 */
uint8_t AX12_write_int(AX12 *, uint8_t id, AX12_ADDRESS address,
		       uint16_t data);

/** @brief Read byte from AX-12 memory 
 * @return Error code from AX-12 (0 means okay) */
uint8_t AX12_read_byte(AX12 *, uint8_t id, AX12_ADDRESS address,
		       uint8_t *val);

/** @brief Write integer (2 bytes) from AX-12 memory
 * @return Error code from AX-12 (0 means okay) */
uint8_t AX12_read_int(AX12 *, uint8_t id, AX12_ADDRESS address,
		      uint16_t *val);

/*___________ High level layer _________*/

/** @brief Set AX12 position */
uint8_t AX12_set_position(AX12 *,uint8_t id, uint16_t position);

/** @brief Set AX12 position and moving speed */
uint8_t AX12_set_position2(AX12 *, uint8_t id, uint16_t position,
			   uint16_t speed);

/** @brief Set AX12 position, moving speed and torque */
uint8_t AX12_set_position3(AX12 *, uint8_t id, uint16_t position,
			   uint16_t speed, uint16_t torque);

/** @brief Read AX12 position */
uint8_t AX12_get_position(AX12 *s, uint8_t id, uint16_t *pos);

/** @brief Read AX12 speed */
uint8_t AX12_get_speed(AX12 *s, uint8_t id, uint16_t *speed);

/** @brief Read AX12 load */
uint8_t AX12_get_load(AX12 *s, uint8_t id, uint16_t *load);


/** @brief Ping an AX12 and return error register */
uint8_t AX12_ping(AX12 *, uint8_t id);

/** @brief Reset AX12 back to factory settings */
uint8_t AX12_reset(AX12 *, uint8_t id);

#endif/*_AX12_H */
