/*  
 *  Copyright RobOtter (2010) 
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
 */

/** \file meca.h
  * \author JD
  */

#ifndef _ACTUATORS_H_
#define _ACTUATORS_H_

#include <aversive.h>

#include <ax12.h>
#include "ax12_user.h"


#define ACTUATORS_ERROR 0x40

typedef struct
{
  uint16_t ax12Speed;
  uint16_t ax12Torque;

}actuators_t;

typedef enum
{
  CT_LEFT,
  CT_RIGHT
}clampPos_t;

// -- --

void actuators_init(actuators_t*);

/** @brief Load up default configuration in all actuators */
void actuators_loadDefaults(actuators_t* m);


// -- clamps --

void actuators_clamp_close(actuators_t*, clampPos_t);
void actuators_clamp_open(actuators_t*, clampPos_t);

uint8_t actuators_clamp_isClosed(actuators_t*, clampPos_t);
uint8_t actuators_clamp_isOpened(actuators_t*, clampPos_t);

/** @brief Set clamp elevation */
void actuators_clamp_setElevation(actuators_t*, clampPos_t, int16_t);


// -- ax12 --

void actuators_ax12_init(actuators_t*);

/** @brief Load up default AX12 configuration (EEPROM)*/
void actuators_ax12_loadDefaultEEPROMConfig(actuators_t*, uint8_t);

/** @brief Check AX12 presence/validity by reading is model number
  * @param id AX12 ID 
  * @return 1- if AX12 OK, 0- otherwise
  */
uint8_t actuators_ax12_check(actuators_t*, uint8_t id);

/** @brief Set AX12 angle 
  */
uint8_t actuators_ax12_setPosition(actuators_t*, 
                                    uint8_t id, 
                                    uint16_t pos);

#endif/*_ACTUATORS_H_*/
