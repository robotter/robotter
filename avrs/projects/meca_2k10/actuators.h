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

#define ACTUATORS_ERROR 0x70

typedef struct
{
  uint16_t ax12Speed;
  uint16_t ax12Torque;
  uint16_t ax12Punch; // high value = danger

}actuators_t;

typedef enum
{
  ARM_LEFT = 0,
  ARM_RIGHT
}armPos_t;

// -- --

void actuators_init(actuators_t*);

/** @brief Load up default configuration in all actuators */
void actuators_loadDefaults(actuators_t* m);


// -- arms --

void actuators_arm_raise(actuators_t*, armPos_t);
void actuators_arm_lower(actuators_t*, armPos_t);

uint8_t actuators_arm_is_raised(actuators_t*, armPos_t);
uint8_t actuators_arm_is_lowered(actuators_t*, armPos_t);

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
uint8_t actuators_ax12_setPosition(actuators_t*, uint8_t id, uint16_t pos);
uint8_t actuators_ax12_setPositionSpeed(actuators_t*, uint8_t id, uint16_t pos, uint16_t speed);

/** @brief Check AX12 angle
 *
 * @retval 1  AX12 is in position
 * @retval 2  overtorque
 * @retval 0  not in position, no overtorque
 */
uint8_t actuators_ax12_checkPosition(actuators_t*, uint8_t id, uint16_t pos);

#endif/*_ACTUATORS_H_*/
