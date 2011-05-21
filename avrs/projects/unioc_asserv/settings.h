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

// -- SECURITY --

//#define SETTING_OVERRIDE_ADNSBOOT
#define SETTING_OVERRIDE_CPUUSAGE
#define SETTING_COMPILE_CALIBRATION

// -- match --

#define SETTING_MATCH_DURATION_SECS (89)

// -- I2C --

#define SETTING_I2C_ADDRESS (0x20)

// -- ADNS --

#define SETTING_ADNS_RESOLUTION (ADNS6010_RES_2000)
#define SETTING_ADNS_SHUTTER    (ADNS6010_SHUTTER_OFF)
#define SETTING_ADNS_POWER      (0x11)

// -- FPGA --

#define SETTING_FPGA_FREQUENCY_KHZ (50000)
#define SETTING_FPGA_BOOTTIME (1000)

// -- PWM --
#define SETTING_PWM_FREQUENCY_KHZ (10)

// -- schedulers --

#define SETTING_SCHED_CS_PERIOD   (25)
#define SETTING_SCHED_CS_PRIORITY (100)

#define SETTING_SCHED_SAFEKEY_PERIOD   (100)
#define SETTING_SCHED_SAFEKEY_PRIORITY (50)

// -- motors --

#define SETTING_MOTORS_MAXPWM (2000)

#define SETTING_MOTOR_A_DIR (1)
#define SETTING_MOTOR_B_DIR (-1)
#define SETTING_MOTOR_C_DIR (1)

// break
#define SETTING_MOTOR_BREAK_DDR DDRB
#define SETTING_MOTOR_BREAK_PORT PORTB
#define SETTING_MOTOR_BREAK_PIN 2


// -- pid (x,y,a) --

#define SETTING_PID_X_GAIN_P (1200)
#define SETTING_PID_X_GAIN_I (10)
#define SETTING_PID_X_GAIN_D (0)

#define SETTING_PID_X_MAX_IN  (50000)
#define SETTING_PID_X_MAX_I   (100000)
#define SETTING_PID_X_MAX_OUT (0)

#define SETTING_PID_X_SHIFT (1)

// --

#define SETTING_PID_Y_GAIN_P (1200)
#define SETTING_PID_Y_GAIN_I (10)
#define SETTING_PID_Y_GAIN_D (0)

#define SETTING_PID_Y_MAX_IN  (50000)
#define SETTING_PID_Y_MAX_I   (100000)
#define SETTING_PID_Y_MAX_OUT (0)

#define SETTING_PID_Y_SHIFT (1)

// --

#define SETTING_PID_A_GAIN_P (1000)
#define SETTING_PID_A_GAIN_I (10)
#define SETTING_PID_A_GAIN_D (0)

#define SETTING_PID_A_MAX_IN  (50000)
#define SETTING_PID_A_MAX_I   (10)
#define SETTING_PID_A_MAX_OUT (0)

#define SETTING_PID_A_SHIFT (1)

// -- quadramp angle --

#define SETTING_QRAMP_A_SPEED (70)
#define SETTING_QRAMP_A_ACC   (10)

// -- trajectory manager --

#define SETTING_TRAJECTORY_A_SPEED (70.0)
#define SETTING_TRAJECTORY_A_ACC   (10.0)

#define SETTING_TRAJECTORY_XYCRUISE_SPEED (4.0)
#define SETTING_TRAJECTORY_XYCRUISE_ACC   (0.01)

#define SETTING_TRAJECTORY_XYSTEERING_SPEED (0.5)
#define SETTING_TRAJECTORY_XYSTEERING_ACC   (0.01)

#define SETTING_TRAJECTORY_XYSTOP_SPEED (0.0)
#define SETTING_TRAJECTORY_XYSTOP_ACC   (0.01)

#define SETTING_TRAJECTORY_STEERING_XYWIN (50.0)

#define SETTING_TRAJECTORY_STOP_XYWIN (5.0)
#define SETTING_TRAJECTORY_STOP_AWIN  (0.02)

// -- position manager --

#define SETTING_POSITION_INIT_X (0.0)
#define SETTING_POSITION_INIT_Y (0.0)
// -- bleu --
#define SETTING_POSITION_INIT_A (0.0)
// -- jaune --
//#define SETTING_POSITION_INIT_A (0.0)

#define SETTING_POSITION_ADNS_SQUAL_LOW (55)

// -- paddock/pwm test --

#define SETTING_PADDOCK_PWMTEST_INC (50)

// -- stratcomm --

#define SETTING_STRATCOMM_RAD_TO_SCUNIT (1000)
#define SETTING_STRATCOMM_MM_TO_SCUNIT  (1)

// -- avoidance --

#define SETTING_AVOIDANCE_GP2ARRAY_SIZE (3)
#define SETTING_AVOIDANCE_GP2ARRAY_60   (MUX_ADC0)
#define SETTING_AVOIDANCE_GP2ARRAY_180  (MUX_ADC2)
#define SETTING_AVOIDANCE_GP2ARRAY_300  (MUX_ADC3)

#define SETTING_AVOIDANCE_GP2ARRAY_THRESHOLD (210)
#define SETTING_AVOIDANCE_GP2ARRAY_COUNT     (10)

// -- autoset --

#define SETTING_AUTOSET_SPEED (10.0)
#define SETTING_AUTOSET_ZEROSPEED (0.1)
#define SETTING_AUTOSET_ZEROCOUNT (200)

// -- cord --

#define SETTING_CORD_DDR  (DDRF)
#define SETTING_CORD_PORT (PORTF)
#define SETTING_CORD_PIN  (PINF)
#define SETTING_CORD_N    (1)
#define SETTING_CORD_THRESHOLD (20)

// -- color detection --
#define SETTING_COLOR_DETECTOR_0 (1900)
#define SETTING_COLOR_DETECTOR_120 (1900)
#define SETTING_COLOR_DETECTOR_240 (1900)

#endif/*SETTINGS_H*/
