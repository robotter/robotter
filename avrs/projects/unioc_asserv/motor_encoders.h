
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

/** \file motor_encoders.h
  * \author JD
  */

#ifndef MOTOR_ENCODERS_H
#define MOTOR_ENCODERS_H

#include <aversive.h>

typedef struct
{
  int32_t vectors[3];
}motor_encoders_t;

void motor_encoders_get_value(motor_encoders_t*);

#endif/*COMPASS_H*/
