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

/** \file stratcomm_orders.h
  * \author JD
  */

#ifndef _STRATCOMM_ORDERS_H_
#define _STRATCOMM_ORDERS_H_

typedef enum 
{
  SO_NONE = 0,
  SO_GOTO_A_XYA,
  SO_GOTO_R_XYA,

  SO_TRAJECTORY_SET_CHECKPOINT,
  SO_TRAJECTORY_RUN,
  SO_TRAJECTORY_STATUS,

  SO_SET_A_SPEED,
  SO_SET_XY_CRUISE_SPEED,
  SO_SET_XY_STEERING_SPEED,
  SO_SET_XY_STOP_SPEED,
  SO_SET_STEERING_WIN,
  SO_SET_STOP_WIN,

  SO_GET_XYA,
  SO_SET_XYA

}stratcommOrder_t;

#endif/*_STRATCOMM_ORDERS_H_*/
