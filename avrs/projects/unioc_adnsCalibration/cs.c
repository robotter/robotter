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
#include <math.h>

#include "hrobot_manager.h"
#include "cs.h"
#include "motor_cs.h"
#include "compass.h"

// Robot system
hrobot_system_t system;

// Compass
compass_t compass;

volatile int32_t cs_vx,cs_vy,cs_omega;

void cs_initialize(void)
{
  // Initialize compass
  NOTICE(0,"Initializing compass");
  compass_init(&compass, 0x1700);
  compass_set_heading_rad(&compass, 0.0);

  // Initialize robot manager
  NOTICE(0,"Initializing robot manager");
  hrobot_init(&system);
  hrobot_set_motors_accessor(&system, motor_cs_update, NULL);

  // Initialize control systems for motors
  NOTICE(0,"Initializing motors control systems");
  motor_cs_init();
}

void cs_update(void* dummy)
{
  static uint8_t led = 0;

  // some LED feedback on UNIOC-NG
  _SFR_MEM8(0x1800) = (led+=10)>50;

  // update compass filtering
  compass_update(&compass);

	// update control systems
  hrobot_set_motors(&system, cs_vx, cs_vy, cs_omega);
}
