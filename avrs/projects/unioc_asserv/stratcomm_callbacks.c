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
/** @file stratcomm_callbacks.c
  */

#include "stratcomm_callbacks.h"

#include "motor_cs.h"
#include "htrajectory.h"
#include "hposition_manager.h"
#include <adns6010.h>

extern htrajectory_t trajectory;
extern hrobot_position_t position;
extern adns6010_encoders_t adns6010;


void stratcomm_callback_none(void)
{

}

void stratcomm_callback_fortytwo(uint8_t *r_r)
{

}

void stratcomm_callback_goto_a_xya(int16_t x, int16_t y, int16_t a)
{

}

void stratcomm_callback_goto_r_xya(int16_t x, int16_t y, int16_t a)
{

}

void stratcomm_callback_trajectory_set_checkpoint(uint8_t id, int16_t x, int16_t y)
{

}

void stratcomm_callback_trajectory_run(uint8_t n)
{

}

void stratcomm_callback_trajectory_status(uint8_t *r_status)
{

}

void stratcomm_callback_trajectory_autoset(uint8_t s)
{

}

void stratcomm_callback_set_a_speed(uint16_t v, uint16_t a)
{

}

void stratcomm_callback_set_xy_cruise_speed(uint16_t v, uint16_t a)
{

}

void stratcomm_callback_set_xy_steering_speed(uint16_t v, uint16_t a)
{

}

void stratcomm_callback_set_xy_stop_speed(uint16_t v, uint16_t a)
{

}

void stratcomm_callback_set_steering_win(uint16_t r)
{

}

void stratcomm_callback_set_stop_win(uint16_t r, uint16_t l)
{

}

void stratcomm_callback_get_xya(int16_t *r_x, int16_t *r_y, int16_t *r_a)
{

}

void stratcomm_callback_set_xya(int16_t x, int16_t y, int16_t a)
{

}

void stratcomm_callback_brake(uint8_t brake)
{

}

void stratcomm_callback_get_adnsfault(uint8_t *r_fault)
{

}

void stratcomm_callback_get_adnssquals(uint8_t *r_sq1, uint8_t *r_sq2, uint8_t *r_sq3)
{

}

void stratcomm_callback_get_time(uint16_t *r_sec, uint16_t *r_usec)
{

}

void stratcomm_callback_test(uint16_t in, int16_t *r_out)
{

}
