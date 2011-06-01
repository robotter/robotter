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

#include "logging.h"
#include "cli.h"

#include "settings.h"

#include "pwm.h"
#include "robot_cs.h"
#include "hrobot_manager.h"
#include "hrobot_manager_config.h"

void hrobot_init( hrobot_system_t* hrs )
{
  pwm_init();

  return;
}

void hrobot_break( hrobot_system_t* hrs, uint8_t state)
{
  if(state)
    cbi(SETTING_MOTOR_BREAK_PORT,SETTING_MOTOR_BREAK_PIN);
  else    
    sbi(SETTING_MOTOR_BREAK_PORT,SETTING_MOTOR_BREAK_PIN);
}

void hrobot_set_motors( hrobot_system_t* hrs,
                        int32_t vx, int32_t vy,
                        int32_t omega)
{
  uint8_t k,i;
  float dp[3];
  float v[3];

  v[0] = vx/(float)RCS_MM_TO_CSUNIT;
  v[1] = vy/(float)RCS_MM_TO_CSUNIT;
  v[2] = omega/(float)RCS_RAD_TO_CSUNIT;

  for(k=0;k<3;k++)
    dp[k] = 0.0;

  // compute consign in motors coordinates
  for(i=0;i<3;i++)
    for(k=0;k<3;k++)
      dp[k] += hrobot_motors_matrix[i+k*3]*v[i];

  //
  pwm_set_A((int32_t)dp[0]);
  pwm_set_B((int32_t)dp[1]);
  pwm_set_C((int32_t)dp[2]);
  return;
}
