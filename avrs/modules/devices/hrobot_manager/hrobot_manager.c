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
#include <pwm.h>

#include <hrobot_manager.h>
#include "hrobot_manager_config.h"

void hrobot_init()
{
  // Initialize motors pwms
  pwm_init();

  return;
}

void hrobot_setMotors( int16_t speed, double course)
{
  int16_t pwm0,pwm1,pwm2;

  // project speed vector on each motor 
  pwm0 = speed * cos( course - HROBOT_MOTOR0_COURSE );
  pwm1 = speed * cos( course - HROBOT_MOTOR1_COURSE );
  pwm2 = speed * cos( course - HROBOT_MOTOR2_COURSE );

  // saturate PWM values
  S_MAX(pwm0, HROBOT_PWMMAXVALUE); 
  S_MAX(pwm1, HROBOT_PWMMAXVALUE);
  S_MAX(pwm2, HROBOT_PWMMAXVALUE);

  // set motors pwms
  HROBOT_SETPWM(HROBOT_MOTOR0_PWM,pwm0);
  HROBOT_SETPWM(HROBOT_MOTOR1_PWM,pwm1);
  HROBOT_SETPWM(HROBOT_MOTOR2_PWM,pwm2);

  return;
}
