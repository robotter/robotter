/*  
 *  Copyright RobOtter (2009) 
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

/** \file hrobot_manager.c
  * \author JD
  *
  * Abstract robot hardware
  *
  */

#include <stdio.h>

#include <aversive.h>
#include <stdlib.h>

#include "hrobot_manager.h"
#include "hrobot_manager_config.h"

void hrobot_init( hrobot_system_t* hrs )
{
  hrs->motors_accessor = NULL;
  hrs->motors_accessor_params = NULL;

  return;
}

void hrobot_set_motors_accessor( hrobot_system_t* hrs,
                                  void(*f)(void*,int32_t,int32_t,int32_t),
                                  void* params)
{
  hrs->motors_accessor = f;
  hrs->motors_accessor_params = params;
}

void hrobot_set_motors( hrobot_system_t* hrs,
                        int32_t vx, int32_t vy,
                        int32_t omega)
{
  int32_t v0,v1,v2;

  // project speed vector on each motor
  v0 = vx*HROBOT_MOTOR0_COS_COURSE + vy*HROBOT_MOTOR0_SIN_COURSE;
  v1 = vx*HROBOT_MOTOR1_COS_COURSE + vy*HROBOT_MOTOR1_SIN_COURSE;
  v2 = vx*HROBOT_MOTOR2_COS_COURSE + vy*HROBOT_MOTOR2_SIN_COURSE;

  // 
  v0 += omega;
  v1 += omega;
  v2 += omega;

  // set motors speeds
  if(hrs->motors_accessor)
    (hrs->motors_accessor)(hrs->motors_accessor_params, v0, v1, v2);

  return;
}
