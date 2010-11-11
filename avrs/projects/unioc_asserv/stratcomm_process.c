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
/** @file stratcomm_process.c
  * @note Generated on Thu Nov 11 10:56:07 2010
  */

#include <aversive/error.h>
#include "stratcomm.h"
#include "stratcomm_messages.h"
#include "stratcomm_payloads.h"
#include "stratcomm_callbacks.h"

void stratcomm_process(stratcomm_t *sc,
                     uint8_t mid,
                     uint8_t *payload)
{
  uint16_t r_u16, l_u16, a_u16, r_sec_u16, r_usec_u16, v_u16, in_u16;
  int16_t r_x_i16, a_i16, x_i16, r_a_i16, r_y_i16, y_i16, r_out_i16;
  uint8_t n_u8, brake_u8, id_u8, s_u8, r_status_u8, r_sq3_u8, r_sq1_u8, r_r_u8, r_sq2_u8, r_fault_u8;

  switch(mid)
  {
    // NONE : Do nothing, just for tests
    case CM_PROP_NONE:
      DEBUG(0,"new order NONE() recvd");
      stratcomm_callback_none();
      break;

    // FORTYTWO : Always send back 0x42
    case CM_PROP_FORTYTWO:
      DEBUG(0,"new order FORTYTWO() recvd");
      stratcomm_callback_fortytwo(&r_r_u8);
      stratcomm_pushReturnPayload(sc, PACK_UINT8(r_r_u8), sizeof(uint8_t));
      break;

    // GOTO_A_XYA : Order robot move to (x,y,a) in table coordinates
    case CM_PROP_GOTO_A_XYA:
      x_i16 = UNPACK_INT16(sc, payload);
      y_i16 = UNPACK_INT16(sc, payload);
      a_i16 = UNPACK_INT16(sc, payload);
      DEBUG(0,"new order GOTO_A_XYA(%d,%d,%d) recvd",x_i16, y_i16, a_i16);
      stratcomm_callback_goto_a_xya(x_i16, y_i16, a_i16);
      break;

    // GOTO_R_XYA : Order robot move to (x,y,a) in table coordinates from robot current position
    case CM_PROP_GOTO_R_XYA:
      x_i16 = UNPACK_INT16(sc, payload);
      y_i16 = UNPACK_INT16(sc, payload);
      a_i16 = UNPACK_INT16(sc, payload);
      DEBUG(0,"new order GOTO_R_XYA(%d,%d,%d) recvd",x_i16, y_i16, a_i16);
      stratcomm_callback_goto_r_xya(x_i16, y_i16, a_i16);
      break;

    // TRAJECTORY_SET_CHECKPOINT : Modify robot trajectory checkpoint #id
    case CM_PROP_TRAJECTORY_SET_CHECKPOINT:
      id_u8 = UNPACK_UINT8(sc, payload);
      x_i16 = UNPACK_INT16(sc, payload);
      y_i16 = UNPACK_INT16(sc, payload);
      DEBUG(0,"new order TRAJECTORY_SET_CHECKPOINT(0x%2.2X,%d,%d) recvd",id_u8, x_i16, y_i16);
      stratcomm_callback_trajectory_set_checkpoint(id_u8, x_i16, y_i16);
      break;

    // TRAJECTORY_RUN : Run trajectory from checkpoint 0 to checkpoint n
    case CM_PROP_TRAJECTORY_RUN:
      n_u8 = UNPACK_UINT8(sc, payload);
      DEBUG(0,"new order TRAJECTORY_RUN(0x%2.2X) recvd",n_u8);
      stratcomm_callback_trajectory_run(n_u8);
      break;

    // TRAJECTORY_STATUS : Trajectory manager status : byte defined as (bit 0 : XY move done; bit 1 : A move done)
    case CM_PROP_TRAJECTORY_STATUS:
      DEBUG(0,"new order TRAJECTORY_STATUS() recvd");
      stratcomm_callback_trajectory_status(&r_status_u8);
      stratcomm_pushReturnPayload(sc, PACK_UINT8(r_status_u8), sizeof(uint8_t));
      break;

    // TRAJECTORY_AUTOSET : Perform an autoset calibration on side s
    case CM_PROP_TRAJECTORY_AUTOSET:
      s_u8 = UNPACK_UINT8(sc, payload);
      DEBUG(0,"new order TRAJECTORY_AUTOSET(0x%2.2X) recvd",s_u8);
      stratcomm_callback_trajectory_autoset(s_u8);
      break;

    // SET_A_SPEED : Set robot maximum angular speed v and angular acceleration a
    case CM_PROP_SET_A_SPEED:
      v_u16 = UNPACK_UINT16(sc, payload);
      a_u16 = UNPACK_UINT16(sc, payload);
      DEBUG(0,"new order SET_A_SPEED(%u,%u) recvd",v_u16, a_u16);
      stratcomm_callback_set_a_speed(v_u16, a_u16);
      break;

    // SET_XY_CRUISE_SPEED : Set robot maximum inter-checkpoints speed v and acceleration a
    case CM_PROP_SET_XY_CRUISE_SPEED:
      v_u16 = UNPACK_UINT16(sc, payload);
      a_u16 = UNPACK_UINT16(sc, payload);
      DEBUG(0,"new order SET_XY_CRUISE_SPEED(%u,%u) recvd",v_u16, a_u16);
      stratcomm_callback_set_xy_cruise_speed(v_u16, a_u16);
      break;

    // SET_XY_STEERING_SPEED : Set robot maximum on-checkpoint speed v and acceleration a
    case CM_PROP_SET_XY_STEERING_SPEED:
      v_u16 = UNPACK_UINT16(sc, payload);
      a_u16 = UNPACK_UINT16(sc, payload);
      DEBUG(0,"new order SET_XY_STEERING_SPEED(%u,%u) recvd",v_u16, a_u16);
      stratcomm_callback_set_xy_steering_speed(v_u16, a_u16);
      break;

    // SET_XY_STOP_SPEED : Set robot stop speed v and acceleration a
    case CM_PROP_SET_XY_STOP_SPEED:
      v_u16 = UNPACK_UINT16(sc, payload);
      a_u16 = UNPACK_UINT16(sc, payload);
      DEBUG(0,"new order SET_XY_STOP_SPEED(%u,%u) recvd",v_u16, a_u16);
      stratcomm_callback_set_xy_stop_speed(v_u16, a_u16);
      break;

    // SET_STEERING_WIN : Set window radius for intermediate checkpoints
    case CM_PROP_SET_STEERING_WIN:
      r_u16 = UNPACK_UINT16(sc, payload);
      DEBUG(0,"new order SET_STEERING_WIN(%u) recvd",r_u16);
      stratcomm_callback_set_steering_win(r_u16);
      break;

    // SET_STOP_WIN : Set window radius r and angular half-angle l for final checkpoint
    case CM_PROP_SET_STOP_WIN:
      r_u16 = UNPACK_UINT16(sc, payload);
      l_u16 = UNPACK_UINT16(sc, payload);
      DEBUG(0,"new order SET_STOP_WIN(%u,%u) recvd",r_u16, l_u16);
      stratcomm_callback_set_stop_win(r_u16, l_u16);
      break;

    // GET_XYA : Return robot current position (x,y,a) in table coordinates
    case CM_PROP_GET_XYA:
      DEBUG(0,"new order GET_XYA() recvd");
      stratcomm_callback_get_xya(&r_x_i16, &r_y_i16, &r_a_i16);
      stratcomm_pushReturnPayload(sc, PACK_INT16(r_x_i16), sizeof(int16_t));
      stratcomm_pushReturnPayload(sc, PACK_INT16(r_y_i16), sizeof(int16_t));
      stratcomm_pushReturnPayload(sc, PACK_INT16(r_a_i16), sizeof(int16_t));
      break;

    // SET_XYA : Set robot current position (x,y,a) in table coordinates
    case CM_PROP_SET_XYA:
      x_i16 = UNPACK_INT16(sc, payload);
      y_i16 = UNPACK_INT16(sc, payload);
      a_i16 = UNPACK_INT16(sc, payload);
      DEBUG(0,"new order SET_XYA(%d,%d,%d) recvd",x_i16, y_i16, a_i16);
      stratcomm_callback_set_xya(x_i16, y_i16, a_i16);
      break;

    // BRAKE : Set motors brakes : 0 - motors enabled, 1 - motors disabled
    case CM_PROP_BRAKE:
      brake_u8 = UNPACK_UINT8(sc, payload);
      DEBUG(0,"new order BRAKE(0x%2.2X) recvd",brake_u8);
      stratcomm_callback_brake(brake_u8);
      break;

    // GET_ADNSFAULT : Get FAULT register from FPGA
    case CM_PROP_GET_ADNSFAULT:
      DEBUG(0,"new order GET_ADNSFAULT() recvd");
      stratcomm_callback_get_adnsfault(&r_fault_u8);
      stratcomm_pushReturnPayload(sc, PACK_UINT8(r_fault_u8), sizeof(uint8_t));
      break;

    // GET_ADNSSQUALS : Return each ADNS SQUAL (Surface QUALity)
    case CM_PROP_GET_ADNSSQUALS:
      DEBUG(0,"new order GET_ADNSSQUALS() recvd");
      stratcomm_callback_get_adnssquals(&r_sq1_u8, &r_sq2_u8, &r_sq3_u8);
      stratcomm_pushReturnPayload(sc, PACK_UINT8(r_sq1_u8), sizeof(uint8_t));
      stratcomm_pushReturnPayload(sc, PACK_UINT8(r_sq2_u8), sizeof(uint8_t));
      stratcomm_pushReturnPayload(sc, PACK_UINT8(r_sq3_u8), sizeof(uint8_t));
      break;

    // GET_TIME : Return time sec seconds and usec microseconds since card is running
    case CM_PROP_GET_TIME:
      DEBUG(0,"new order GET_TIME() recvd");
      stratcomm_callback_get_time(&r_sec_u16, &r_usec_u16);
      stratcomm_pushReturnPayload(sc, PACK_UINT16(r_sec_u16), sizeof(uint16_t));
      stratcomm_pushReturnPayload(sc, PACK_UINT16(r_usec_u16), sizeof(uint16_t));
      break;

    // TEST : Complex test command
    case CM_PROP_TEST:
      in_u16 = UNPACK_UINT16(sc, payload);
      DEBUG(0,"new order TEST(%u) recvd",in_u16);
      stratcomm_callback_test(in_u16, &r_out_i16);
      stratcomm_pushReturnPayload(sc, PACK_INT16(r_out_i16), sizeof(int16_t));
      break;

    default:
      WARNING(STRATCOMM_ERROR,"Unrecognized message 0x%2.2X",mid);
      break;
  }//switch(mid)
  return;
}
