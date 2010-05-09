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

/** \file motor_encoders.c
  * \author JD
  */

#include <aversive.h>
#include "motor_cs_config.h"
#include "motor_encoders.h"

void motor_encoders_get_value(motor_encoders_t* me)
{
  me->vectors[0] = _SFR_MEM32(MOTOR_CS_ENCODER1_ADDR);
  me->vectors[1] = _SFR_MEM32(MOTOR_CS_ENCODER2_ADDR);
  me->vectors[2] = _SFR_MEM32(MOTOR_CS_ENCODER3_ADDR);
}
