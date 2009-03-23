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

/** \file hrobot_manager_config.h
  * \author JD
  *
  * Abstract robot hardware
  *
  */

#ifndef _HROBOT_MANAGER_CONFIG_H_
#define _HROBOT_MANAGER_CONFIG_H_

#include <math.h>

// Motors course
// Warning : Those values defines the motors COURSES in radians,
// meaning the direction of the force applied
// on the table by the motor.

//       0 --
//      / \\
//  \\ /   \\
//    1-----2
//         /

#define HROBOT_MOTOR0_COURSE 0.0
#define HROBOT_MOTOR1_COURSE 2.094395 // ~ 2*M_PI/3
#define HROBOT_MOTOR2_COURSE 4.188790 // ~ 4*M_PI/3


// Robot motors pwm outputs
#define HROBOT_MOTOR0_PWM 1A
#define HROBOT_MOTOR1_PWM 1B
#define HROBOT_MOTOR2_PWM 1C

#endif/*_HROBOT_MANAGER_CONFIG_H_*/
