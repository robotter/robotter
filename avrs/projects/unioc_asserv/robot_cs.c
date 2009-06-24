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

/** \file robot_cs.c
  * \author JD
  *
  * Manage control systems for robot
  *
  */

#include "robot_cs.h"

#include <aversive/error.h>
#include <math.h>
#include <control_system_manager.h>
#include <pid.h>
#include "pid_config.h"
#include <quadramp.h>

// control system managers
struct cs csm_x;
struct cs csm_y;
struct cs csm_angle;

// quadramp
struct quadramp_filter qramp_x;
struct quadramp_filter qramp_y;
struct quadramp_filter qramp_angle;

// pids
struct pid_filter pid_x;
struct pid_filter pid_y;
struct pid_filter pid_angle;

void robot_cs_init(robot_cs_t* rcs)
{
  // zeroing structures
  rcs->hrs = NULL;
  rcs->hpm = NULL;

  // set CS on
  rcs->active = 1;

	// setup PIDs
	pid_init(&pid_x);
	pid_init(&pid_y);
	pid_init(&pid_angle);

	pid_set_gains(&pid_x, 120, 1, 0) ;
  pid_set_maximums(&pid_x, 50000, 10, 0);
  pid_set_out_shift(&pid_x, 10);
 
  pid_set_gains(&pid_y, 120, 1, 0) ;
  pid_set_maximums(&pid_y, 50000, 10, 0);
  pid_set_out_shift(&pid_y, 10);
 
  pid_set_gains(&pid_angle, 1000, 10, 0) ;
  pid_set_maximums(&pid_angle, 4000, 200, 0);
  pid_set_out_shift(&pid_angle, 10);

  // setup quadramps
  quadramp_init(&qramp_x);
  quadramp_init(&qramp_y);
  quadramp_init(&qramp_angle);

  quadramp_set_1st_order_vars(&qramp_x, 5000, 5000);
  quadramp_set_2nd_order_vars(&qramp_x, 30, 30);

  quadramp_set_1st_order_vars(&qramp_y, 5000, 5000);
  quadramp_set_2nd_order_vars(&qramp_y, 30, 30);

  quadramp_set_1st_order_vars(&qramp_angle, 70, 70);
  quadramp_set_2nd_order_vars(&qramp_angle, 10, 10);

	// setup CSMs
	cs_init(&csm_x);
	cs_init(&csm_y);
	cs_init(&csm_angle);

	cs_set_consign_filter(&csm_x, &quadramp_do_filter, &qramp_x);
	cs_set_consign_filter(&csm_y, &quadramp_do_filter, &qramp_y);
  cs_set_consign_filter(&csm_angle, &quadramp_do_filter, &qramp_angle);

	cs_set_correct_filter(&csm_x,     &pid_do_filter, &pid_x);
	cs_set_correct_filter(&csm_y,     &pid_do_filter, &pid_y);
	cs_set_correct_filter(&csm_angle, &pid_do_filter, &pid_angle);

	cs_set_feedback_filter(&csm_x,     NULL, NULL);
	cs_set_feedback_filter(&csm_y,     NULL, NULL);
	cs_set_feedback_filter(&csm_angle, NULL, NULL);

	cs_set_process_out(&csm_x, &get_robot_x, rcs);
	cs_set_process_out(&csm_y, &get_robot_y, rcs);
	cs_set_process_out(&csm_angle, &get_robot_a, rcs);

	cs_set_process_in(&csm_x, NULL, NULL);
	cs_set_process_in(&csm_y, NULL, NULL);
	cs_set_process_in(&csm_angle, NULL, NULL);
}

void robot_cs_set_hposition_manager(robot_cs_t* rcs,
                                     hrobot_position_t* hpm)
{
  rcs->hpm = hpm;
}


void robot_cs_set_hrobot_manager(robot_cs_t* rcs,
                                  hrobot_system_t* hrs)
{
  rcs->hrs = hrs;
}

void robot_cs_update(void* dummy)
{
  double vx_t,vy_t,omegaz_t;
  double vx_r,vy_r;
  double alpha;
  double _ca,_sa;
  hrobot_vector_t hvec;
	robot_cs_t *rcs = dummy;
 
  if(!rcs->active)
  {
    hrobot_set_motors(rcs->hrs, 0, 0, 0);
    return;
  }

  // compute control system first level (x,y,a)
  cs_manage(&csm_x);
  cs_manage(&csm_y);
  cs_manage(&csm_angle);

  // transform output vector from table coords to robot coords
  vx_t     = cs_get_out(&csm_x);
  vy_t     = cs_get_out(&csm_y);
  omegaz_t = cs_get_out(&csm_angle);

  hposition_get(rcs->hpm, &hvec);

  alpha = -hvec.alpha;
 
  _ca = cos(alpha);
  _sa = sin(alpha);

  vx_r = vx_t*_ca - vy_t*_sa;
  vy_r = vx_t*_sa + vy_t*_ca;

  // set second level consigns
  hrobot_set_motors(rcs->hrs, vx_r, vy_r, omegaz_t);
                              
}

void robot_cs_set_consigns( robot_cs_t *rcs,
														int32_t x,
														int32_t y,
                            int32_t angle )
{
  uint8_t flags;

  IRQ_LOCK(flags);
  cs_set_consign(&csm_x,x);
  cs_set_consign(&csm_y,y);
  cs_set_consign(&csm_angle,angle);
  IRQ_UNLOCK(flags);
}

int32_t get_robot_x(void* dummy)
{
  int32_t out;

  hrobot_vector_t hvec;
  robot_cs_t* rcs = dummy;

  hposition_get(rcs->hpm, &hvec);
 
  out = hvec.x * RCS_MM_TO_CSUNIT;

  return out;
}

int32_t get_robot_y(void* dummy)
{
  hrobot_vector_t hvec;
  robot_cs_t* rcs = dummy;

  hposition_get(rcs->hpm, &hvec);
  
  return (hvec.y * RCS_MM_TO_CSUNIT);
}

int32_t get_robot_a(void* dummy)
{
  hrobot_vector_t hvec;
  robot_cs_t* rcs = dummy;

  hposition_get(rcs->hpm, &hvec);

  return (hvec.alpha * RCS_RAD_TO_CSUNIT);
}
