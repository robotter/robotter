/*  
 *  Copyright RobOtter (2009) 
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

/** \file motor_cs.h
  * \author JD
  *
  * Manage control systems for motors
  *
  */

#ifndef MOTOR_CS_H
#define MOTOR_CS_H

#include <control_system_manager.h>
#include <pid.h>
#include "pid_config.h"

/**@brief Initialize motor-level control systems
  */
void motor_cs_init(void);

/**@brief Update motor-level control systems
  *@param dummy not used
  *@param m1 motor 1 consign
  *@param m2 motor 2 consign
  *@param m3 motor 3 consign
  */
void motor_cs_update(void* dummy, int32_t m1, int32_t m2, int32_t m3);

/**@brief Return motor 1 speed */
int32_t get_encoder_motor1(void*);

/**@brief Return motor 2 speed */
int32_t get_encoder_motor2(void*);

/**@brief Return motor 3 speed */
int32_t get_encoder_motor3(void*);

/**@brief Set motor 1 PWM value */
void set_pwm_motor1(void*, int32_t);

/**@brief Set motor 2 PWM value */
void set_pwm_motor2(void*, int32_t);

/**@brief Set motor 3 PWM value */
void set_pwm_motor3(void*, int32_t);

#endif/*MOTOR_CS_H*/
