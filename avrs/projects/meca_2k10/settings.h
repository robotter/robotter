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

/** \file settings.h
  * \author JD
  *
  * Main configuration file 
  *
  */

#ifndef SETTINGS_H
#define SETTINGS_H

// --

//#define SETTING_OVERRIDE_CPUUSAGE

// -- I2C --

#define SETTING_I2C_ADDRESS (0x21)

// -- playground
#define SETTING_PLAYGROUND_PAWN_R (100)

// -- schedulers --

#define SETTING_SCHED_SYS_PERIOD (100)
#define SETTING_SCHED_SYS_PRIORITY (100)

#define SETTING_SCHED_SAFEKEY_PERIOD   (100)
#define SETTING_SCHED_SAFEKEY_PRIORITY (50)

// -- LEDs --

#define SETTING_LEDS_DDR (DDRA)
#define SETTING_LEDS_PORT (PORTA)

#define SETTING_LEDS_MASK (0xF0)

#define SETTING_LEDS_N (4)

// -- AX12s --

#define SETTING_AX12_ID_LEFT_ARM  (0x03)
#define SETTING_AX12_ID_RIGHT_ARM (0x01)

#define SETTING_AX12_ID_LEFT_SCANNER (0x04)
#define SETTING_AX12_ID_RIGHT_SCANNER (0x02)

#define SETTING_AX12_MODEL_NUMBER (0x000C)

#define SETTING_AX12_DEFAULT_SPEED (0x3FF)
#define SETTING_AX12_DEFAULT_TORQUE (0x3FF)
#define SETTING_AX12_DEFAULT_PUNCH (0x020) // high value = danger


// -- AX12/arms --

// AX12 position window
#define SETTING_AX12_WINDOW (16)
// AX12 clamping torque
#define SETTING_AX12_CLAMPING_TORQUE (0x200)

// AX12 speed for arms movement
#define SETTING_AX12_ARM_SPEED (100)

// LEFT ARM low position
#define SETTING_AX12_POS_LARM_LOWERED (0x250)
// RIGHT ARM low position
#define SETTING_AX12_POS_RARM_LOWERED (0x250)

// LEFT ARM mid position
#define SETTING_AX12_POS_LARM_MID (0x220)
// RIGHT ARM mid position
#define SETTING_AX12_POS_RARM_MID (0x240)

// LEFT ARM high position
#define SETTING_AX12_POS_LARM_RAISED (0x110)
// RIGHT ARM high position
#define SETTING_AX12_POS_RARM_RAISED (0x100)


// -- scanner

#define SETTING_SCANNER_START 308
#define SETTING_SCANNER_STOP 455
#define SETTING_SCANNER_STEP 40

#define SETTING_SCANNER_Z_THRESHOLD 20.0
#define SETTING_SCANNER_MIN_STEP 10

#define SETTING_SCANNER_LEFT_DXR 80
#define SETTING_SCANNER_LEFT_DXL -45
#define SETTING_SCANNER_RIGHT_DXR 80
#define SETTING_SCANNER_RIGHT_DXL -45

#define SETTING_SCANNER_R0 70
#define SETTING_SCANNER_HEIGHT 205

// -- ground detectors

#define SETTING_GD_RIGHT_THRESHOLD 30
#define SETTING_GD_LEFT_THRESHOLD 30

#endif/*SETTINGS_H*/
