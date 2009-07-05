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

/** \file motor_cs_config.h
  * \author JD
  *
  * Motors configuraton
  *
  */

#ifndef MOTOR_CS_CONFIG_H
#define MOTOR_CS_CONFIG_H

// break
#define MOTOR_CS_BREAK_DDR DDRB
#define MOTOR_CS_BREAK_PORT PORTB
#define MOTOR_CS_BREAK_PIN 2

// pwms
#define MOTOR_CS_PWM1_DDR DDRE
#define MOTOR_CS_PWM1_PORT PORTE
#define MOTOR_CS_PWM1_PIN 4

#define MOTOR_CS_PWM2_DDR DDRB
#define MOTOR_CS_PWM2_PORT PORTB
#define MOTOR_CS_PWM2_PIN 4

#define MOTOR_CS_PWM3_DDR DDRG
#define MOTOR_CS_PWM3_PORT PORTG
#define MOTOR_CS_PWM3_PIN 3

// encoders
#define MOTOR_CS_ENCODER1_ADDR (0x1400)
#define MOTOR_CS_ENCODER2_ADDR (0x1500)
#define MOTOR_CS_ENCODER3_ADDR (0x1600)

#endif/*MOTOR_CS_CONFIG_H*/
