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
/** @file stratcomm_callbacks.h
  * @note Generated on Fri Nov 12 21:06:43 2010
  */
#ifndef STRATCOMM_CALLBACKS_H
#define STRATCOMM_CALLBACKS_H

#include <aversive.h>

/** @brief Command callback function :  Do nothing, just for tests */
void stratcomm_callback_none(void);

/** @brief Command callback function :  Always send back 0x42 */
void stratcomm_callback_fortytwo(uint8_t *r_r);

/** @brief Command callback function :  Order robot move to (x,y,a) in table coordinates */
void stratcomm_callback_goto_a_xya(int16_t x, int16_t y, int16_t a);

/** @brief Command callback function :  Order robot move to (x,y,a) in table coordinates from robot current position */
void stratcomm_callback_goto_r_xya(int16_t x, int16_t y, int16_t a);

/** @brief Command callback function :  Modify robot trajectory checkpoint #id */
void stratcomm_callback_trajectory_set_checkpoint(uint8_t id, int16_t x, int16_t y);

/** @brief Command callback function :  Run trajectory from checkpoint 0 to checkpoint n */
void stratcomm_callback_trajectory_run(uint8_t n);

/** @brief Command callback function :  Trajectory manager status : byte defined as (bit 0 : XY move done; bit 1 : A move done) */
void stratcomm_callback_trajectory_status(uint8_t *r_status);

/** @brief Command callback function :  Perform an autoset calibration on side s */
void stratcomm_callback_trajectory_autoset(uint8_t s);

/** @brief Command callback function :  Set robot maximum angular speed v and angular acceleration a */
void stratcomm_callback_set_a_speed(uint16_t v, uint16_t a);

/** @brief Command callback function :  Set robot maximum inter-checkpoints speed v and acceleration a */
void stratcomm_callback_set_xy_cruise_speed(uint16_t v, uint16_t a);

/** @brief Command callback function :  Set robot maximum on-checkpoint speed v and acceleration a */
void stratcomm_callback_set_xy_steering_speed(uint16_t v, uint16_t a);

/** @brief Command callback function :  Set robot stop speed v and acceleration a */
void stratcomm_callback_set_xy_stop_speed(uint16_t v, uint16_t a);

/** @brief Command callback function :  Set window radius for intermediate checkpoints */
void stratcomm_callback_set_steering_win(uint16_t r);

/** @brief Command callback function :  Set window radius r and angular half-angle l for final checkpoint */
void stratcomm_callback_set_stop_win(uint16_t r, uint16_t l);

/** @brief Command callback function :  Return robot current position (x,y,a) in table coordinates */
void stratcomm_callback_get_xya(int16_t *r_x, int16_t *r_y, int16_t *r_a);

/** @brief Command callback function :  Set robot current position (x,y,a) in table coordinates */
void stratcomm_callback_set_xya(int16_t x, int16_t y, int16_t a);

/** @brief Command callback function :  Set motors brakes : 0 - motors enabled, 1 - motors disabled */
void stratcomm_callback_brake(uint8_t brake);

/** @brief Command callback function :  Get FAULT register from FPGA */
void stratcomm_callback_get_adnsfault(uint8_t *r_fault);

/** @brief Command callback function :  Return each ADNS SQUAL (Surface QUALity) */
void stratcomm_callback_get_adnssquals(uint8_t *r_sq1, uint8_t *r_sq2, uint8_t *r_sq3);

/** @brief Command callback function :  Return time sec seconds and usec microseconds since card is running */
void stratcomm_callback_get_time(uint16_t *r_sec, uint16_t *r_usec);

/** @brief Command callback function :  Complex test command */
void stratcomm_callback_test(uint16_t in, int16_t *r_out);

#endif/*STRATCOMM_CALLBACKS_H*/
