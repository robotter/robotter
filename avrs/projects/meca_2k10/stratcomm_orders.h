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

#define SO_CLAMP_OPEN                 0x10
#define SO_CLAMP_CLOSE                0x11

#define SO_CLAMP_IS_OPENED            0x15
#define SO_CLAMP_IS_CLOSED            0x16

#define SO_CLAMP_RAISE                0x20
#define SO_CLAMP_LOWER                0x21

#define SO_CLAMP_IS_RAISED            0x25
#define SO_CLAMP_IS_LOWERED           0x26

#define SO_GET_TIME                   0x53

typedef uint8_t stratcommOrder_t;

#endif/*STRATCOMM_ORDERS_H*/
