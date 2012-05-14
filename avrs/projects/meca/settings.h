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

//#define SETTING_UART_UI_ENABLED

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
#define SETTING_AX12_ARM_SPEED (70)

// Brush
#define SETTING_BRUSH_SPEED  1000 //TODO
#define SETTING_SCHED_BRUSH_PERIOD   (100)
#define SETTING_SCHED_BRUSH_PRIORITY (80)
#define SETTING_BRUSH_OPEN_TMIN  1000
#define SETTING_BRUSH_OPEN_TMAX  2000
#define SETTING_BRUSH_CLOSE_TMIN  0
#define SETTING_BRUSH_CLOSE_TMAX  10


#endif/*SETTINGS_H*/
