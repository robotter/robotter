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

/** \file robot_cs.h
  * \author JD
  *
  * Manage control systems for robot
  *
  */

#ifndef ROBOT_CS_H
#define ROBOT_CS_H

#include <aversive.h>
#include "hposition_manager.h"
#include <hrobot_manager.h>

#define ROBOTCS_ERROR 0x40

#define RCS_MM_TO_CSUNIT 1000
#define RCS_RAD_TO_CSUNIT 10000

typedef struct
{
  hrobot_system_t* hrs;
  hrobot_position_t* hpm;

  uint8_t active;
  uint8_t reactivated;
}robot_cs_t;

/**@brief Initialize robot-level control systems
  */
void robot_cs_init(robot_cs_t*);

/**@brief Activate motor control to position control systems */
void robot_cs_activate(robot_cs_t*, uint8_t active);

/**@brief Set hposition_manager structure used to access robot position
  */
void robot_cs_set_hposition_manager(robot_cs_t*, hrobot_position_t*);

/**@brief Set hrobot_manager structure used to access robot propulsion
  */
void robot_cs_set_hrobot_manager(robot_cs_t*, hrobot_system_t*);

/**@brief Update all control systems (robot+motors)
  *@param rcs reference to robot_cs_t structure
  *@note (void*) used instead of (robot_cs_t*) for scheduler compliance
  */
void robot_cs_update(void* rcs);

/**@brief Set robot-level control system consigns
  *@param x robot x position in CSUNITs
  *@param y robot y position in CSUNITs
  *@param angle robot angle in CSUNITs
  */
void robot_cs_set_consigns( robot_cs_t* rcs,
														int32_t x,
														int32_t y,
														int32_t angle);

/**@brief Accessor used by CSM to access robot x position */
int32_t get_robot_x(void*);

/**@brief Accessor used by CSM to access robot y position */
int32_t get_robot_y(void*);

/**@brief Accessor used by CSM to access robot angle */
int32_t get_robot_a(void*);

#endif/*ROBOT_CS_H*/
