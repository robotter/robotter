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
/** @file stratcomm_send.h
  * @note Generated on Thu Nov 11 10:56:07 2010
  */
#ifndef STRATCOMM_SEND_H
#define STRATCOMM_SEND_H

#include <aversive.h>
#include "stratcomm.h"
/** */
uint8_t stratcomm_message_none(stratcomm_t *sc);
/** */
uint8_t stratcomm_message_fortytwo(stratcomm_t *sc, uint8_t *r_r);
/** */
uint8_t stratcomm_message_goto_a_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a);
/** */
uint8_t stratcomm_message_goto_r_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a);
/** */
uint8_t stratcomm_message_trajectory_set_checkpoint(stratcomm_t *sc, uint8_t id, int16_t x, int16_t y);
/** */
uint8_t stratcomm_message_trajectory_run(stratcomm_t *sc, uint8_t n);
/** */
uint8_t stratcomm_message_trajectory_status(stratcomm_t *sc, uint8_t *r_status);
/** */
uint8_t stratcomm_message_trajectory_autoset(stratcomm_t *sc, uint8_t s);
/** */
uint8_t stratcomm_message_set_a_speed(stratcomm_t *sc, uint16_t v, uint16_t a);
/** */
uint8_t stratcomm_message_set_xy_cruise_speed(stratcomm_t *sc, uint16_t v, uint16_t a);
/** */
uint8_t stratcomm_message_set_xy_steering_speed(stratcomm_t *sc, uint16_t v, uint16_t a);
/** */
uint8_t stratcomm_message_set_xy_stop_speed(stratcomm_t *sc, uint16_t v, uint16_t a);
/** */
uint8_t stratcomm_message_set_steering_win(stratcomm_t *sc, uint16_t r);
/** */
uint8_t stratcomm_message_set_stop_win(stratcomm_t *sc, uint16_t r, uint16_t l);
/** */
uint8_t stratcomm_message_get_xya(stratcomm_t *sc, int16_t *r_x, int16_t *r_y, int16_t *r_a);
/** */
uint8_t stratcomm_message_set_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a);
/** */
uint8_t stratcomm_message_brake(stratcomm_t *sc, uint8_t brake);
/** */
uint8_t stratcomm_message_get_adnsfault(stratcomm_t *sc, uint8_t *r_fault);
/** */
uint8_t stratcomm_message_get_adnssquals(stratcomm_t *sc, uint8_t *r_sq1, uint8_t *r_sq2, uint8_t *r_sq3);
/** */
uint8_t stratcomm_message_get_time(stratcomm_t *sc, uint16_t *r_sec, uint16_t *r_usec);
/** */
uint8_t stratcomm_message_test(stratcomm_t *sc, uint16_t in, int16_t *r_out);
#endif/*STRATCOMM_SEND_H*/
