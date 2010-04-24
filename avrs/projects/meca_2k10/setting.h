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

// -- I2C --

#define SETTING_I2C_ADDRESS (0x51)

// -- schedulers --

#define SETTING_SCHED_SAFEKEY_PERIOD   (100)
#define SETTING_SCHED_SAFEKEY_PRIORITY (50)

// -- LEDs --

#define SETTING_LEDS_DDR (DDRA)
#define SETTING_LEDS_PORT (PORTA)

#define SETTING_LEDS_MASK (0xF0)

#define SETTING_LEDS_N (4)

// -- AX12s --

#define SETTING_AX12_ID_LEFT_CLAMP_A  (0x01)
#define SETTING_AX12_ID_LEFT_CLAMP_B  (0x02)
#define SETTING_AX12_ID_RIGHT_CLAMP_A (0x03)
#define SETTING_AX12_ID_RIGHT_CLAMP_B (0x04)
#define SETTING_AX12_ID_TOWER         (0x05)

#define SETTING_AX12_MODEL_NUMBER (0x000C)

#define SETTING_AX12_DEFAULT_SPEED (0x3FF)
#define SETTING_AX12_DEFAULT_TORQUE (0x3FF)

// AX12 position window
#define SETTING_AX12_WINDOW (0x10)

// LEFT CLAMP A closed position
#define SETTING_AX12_POS_LCA_CLOSED (0x000)
// RIGHT CLAMP A closed position
#define SETTING_AX12_POS_RCA_CLOSED (0x000)

// LEFT CLAMP A opened position
#define SETTING_AX12_POS_LCA_OPENED (0x000)
// RIGHT CLAMP A opened position
#define SETTING_AX12_POS_RCA_OPENED (0x000)

// LEFT CLAMP B horizontal position
#define SETTING_AX12_POS_LCB_HORIZ (0x000)
// RIGHT CLAMP B horizontal position
#define SETTING_AX12_POS_RCB_HORIZ (0x000)

#endif/*SETTINGS_H*/
