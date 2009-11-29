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

/** \file cs.c
  * \author JD
  *
  * Manage control systems
  *
  */

#include <aversive/error.h>
#include <aversive/wait.h>
#include <math.h>

#include "cs.h"
#include "motor_cs.h"
#include "robot_cs.h"
#include "htrajectory.h"
#include "acfilter.h"
#include "compass.h"
#include "time.h"

// Robot position
hrobot_position_t position;

// Robot system
hrobot_system_t system;

// Robot control systems
robot_cs_t robot_cs;

// Trajectory management
htrajectory_t trajectory;

// Compass 
compass_t compass;

// ADNS/Compass filter
acfilter_t acfilter;

// robot_cs quadramps
extern struct quadramp_filter qramp_x;
extern struct quadramp_filter qramp_y;
extern struct quadramp_filter qramp_angle;

void cs_initialize(void)
{
  // Initialize compass
  NOTICE(0,"Initializing compass");
  compass_init(&compass, 0x1700);
  compass_set_heading_rad(&compass, 0.0);

   // Initializing ADNS/Compass filter
  NOTICE(0,"Initializing ADNS / Compass filter");
  acfilter_init(&acfilter, 0.01);
  
  
  // Initialize robot manager
  NOTICE(0,"Initializing robot manager");
  hrobot_init(&system);
  hrobot_set_motors_accessor(&system, motor_cs_update, NULL);

  // Initialize position manager
  NOTICE(0,"Initializing position manager");
  hposition_init( &position );
  hposition_set( &position, 0.0, 0.0, 0.0 );

  // Initialize control systems for motors
  NOTICE(0,"Initializing motors control systems");
  motor_cs_init();

  // Initialize control systems for robot
  NOTICE(0,"Initializing robot control systems");
  robot_cs_init(&robot_cs);
  robot_cs_set_hrobot_manager(&robot_cs,&system);
  robot_cs_set_hposition_manager(&robot_cs,&position);
  
  // Initialize trajectory management
  NOTICE(0,"Initializing trajectory management");
  htrajectory_init(&trajectory,&robot_cs,&position,
										&qramp_x, &qramp_y, &qramp_angle);
  htrajectory_set_precision(&trajectory,3.0,0.01*M_PI);
}

void cs_update(void* dummy)
{
  static uint8_t led = 0;

  // some LED feedback on UNIOC-NG
  // (quite strange code for a great flashing effect :p)
  _SFR_MEM8(0x1800) = (led+=10)>50;

  // update compass filtering
  compass_update(&compass);

	// update robot position 
	hposition_update(&position);

	// update control systems
	robot_cs_update(&robot_cs);
}
