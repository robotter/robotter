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

// -- ADNS --

#define SETTING_ADNS_RESOLUTION (ADNS6010_RES_2000)
#define SETTING_ADNS_SHUTTER    (ADNS6010_SHUTTER_ON)
#define SETTING_ADNS_POWER      (0x11)

// -- FPGA --

#define SETTING_FPGA_BOOTTIME (1000)

// -- schedulers --

#define SETTING_SCHED_CS_PERIOD   (25)
#define SETTING_SCHED_CS_PRIORITY (100)

#define SETTING_SCHED_SAFEKEY_PERIOD   (100)
#define SETTING_SCHED_SAFEKEY_PRIORITY (50)

// -- pid motor -- 

#define SETTING_PID_MOTOR1_GAIN_P (500)
#define SETTING_PID_MOTOR1_GAIN_I (0)
#define SETTING_PID_MOTOR1_GAIN_D (10)

#define SETTING_PID_MOTOR1_MAX_IN  (0)
#define SETTING_PID_MOTOR1_MAX_I   (0)
#define SETTING_PID_MOTOR1_MAX_OUT (0)

#define SETTING_PID_MOTOR1_SHIFT (10)

//--

#define SETTING_PID_MOTOR2_GAIN_P (500)
#define SETTING_PID_MOTOR2_GAIN_I (0)
#define SETTING_PID_MOTOR2_GAIN_D (10)

#define SETTING_PID_MOTOR2_MAX_IN  (0)
#define SETTING_PID_MOTOR2_MAX_I   (0)
#define SETTING_PID_MOTOR2_MAX_OUT (0)

#define SETTING_PID_MOTOR2_SHIFT (10)

//--

#define SETTING_PID_MOTOR3_GAIN_P (500)
#define SETTING_PID_MOTOR3_GAIN_I (0)
#define SETTING_PID_MOTOR3_GAIN_D (10)

#define SETTING_PID_MOTOR3_MAX_IN  (0)
#define SETTING_PID_MOTOR3_MAX_I   (0)
#define SETTING_PID_MOTOR3_MAX_OUT (0)

#define SETTING_PID_MOTOR3_SHIFT (10)

// -- pid (x,y,a) --

#define SETTING_PID_X_GAIN_P (120)
#define SETTING_PID_X_GAIN_I (1)
#define SETTING_PID_X_GAIN_D (0)

#define SETTING_PID_X_MAX_IN  (50000)
#define SETTING_PID_X_MAX_I   (10)
#define SETTING_PID_X_MAX_OUT (0)

#define SETTING_PID_X_SHIFT (10)

// --

#define SETTING_PID_Y_GAIN_P (120)
#define SETTING_PID_Y_GAIN_I (1)
#define SETTING_PID_Y_GAIN_D (0)

#define SETTING_PID_Y_MAX_IN  (50000)
#define SETTING_PID_Y_MAX_I   (10)
#define SETTING_PID_Y_MAX_OUT (0)

#define SETTING_PID_Y_SHIFT (10)

// --

#define SETTING_PID_A_GAIN_P (1000)
#define SETTING_PID_A_GAIN_I (10)
#define SETTING_PID_A_GAIN_D (0)

#define SETTING_PID_A_MAX_IN  (50000)
#define SETTING_PID_A_MAX_I   (10)
#define SETTING_PID_A_MAX_OUT (0)

#define SETTING_PID_A_SHIFT (10)

// -- quadramp angle --

#define SETTING_QRAMP_A_SPEED (70)
#define SETTING_QRAMP_A_ACC   (10)

// -- trajectory manager --

#define SETTING_TRAJECTORY_A_SPEED (70.0)
#define SETTING_TRAJECTORY_A_ACC   (10.0)

#define SETTING_TRAJECTORY_XYCRUISE_SPEED (4.0)
#define SETTING_TRAJECTORY_XYCRUISE_ACC   (0.01)

#define SETTING_TRAJECTORY_XYSTEERING_SPEED (2.0)
#define SETTING_TRAJECTORY_XYSTEERING_ACC   (0.01)

#define SETTING_TRAJECTORY_XYSTOP_SPEED (0.0)
#define SETTING_TRAJECTORY_XYSTOP_ACC   (0.01)

#define SETTING_TRAJECTORY_STEERING_XYWIN (50.0)

#define SETTING_TRAJECTORY_STOP_XYWIN (5.0)
#define SETTING_TRAJECTORY_STOP_AWIN  (0.02)

#endif/*SETTINGS_H*/
