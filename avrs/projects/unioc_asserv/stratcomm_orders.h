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

#ifndef STRATCOMM_ORDERS_H
#define STRATCOMM_ORDERS_H

#define SO_NONE                       0x00
#define SO_FORTYTWO                   0x01

#define SO_GOTO_A_XYA                 0x10
#define SO_GOTO_R_XYA                 0x11

#define SO_TRAJECTORY_SET_CHECKPOINT  0x20
#define SO_TRAJECTORY_RUN             0x21
#define SO_TRAJECTORY_STATUS          0x22
#define SO_TRAJECTORY_AUTOSET         0x23

#define SO_SET_A_SPEED                0x30
#define SO_SET_XY_CRUISE_SPEED        0x31
#define SO_SET_XY_STEERING_SPEED      0x32
#define SO_SET_XY_STOP_SPEED          0x33
#define SO_SET_STEERING_WIN           0x34
#define SO_SET_STOP_WIN               0x35

#define SO_GET_XYA                    0x40
#define SO_SET_XYA                    0x41

#define SO_BRAKE                      0x50
#define SO_GET_ADNSFAULT              0x51
#define SO_GET_ADNSSQUALS             0x52
#define SO_GET_TIME                   0x53

typedef uint8_t stratcommOrder_t;

#endif/*STRATCOMM_ORDERS_H*/
