/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2005)
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
 *
 *  Revision : $Id: trajectory_manager.h,v 1.8 2008-04-13 16:55:31 zer0 Exp $
 *
 */

#ifndef TRAJECTORY_MANAGER
#define TRAJECTORY_MANAGER

#include <aversive.h>
#include <vect2.h>
#include <robot_system.h>

enum trajectory_state {
	READY,

	/* simple trajectories */
	RUNNING_A,
	RUNNING_D,
	RUNNING_AD,

	/* trajectories using events */
	RUNNING_XY_START,
	RUNNING_XY_ANGLE,
	RUNNING_XY_ANGLE_OK,
	RUNNING_XY_F_START,
	RUNNING_XY_F_ANGLE,
	RUNNING_XY_F_ANGLE_OK,
};


struct trajectory {
	enum trajectory_state state; /*<< describe the type of target, and if we reached the target */

	union {
		vect2_cart cart;     /**<< target, if it is a x,y vector */
		struct rs_polar pol; /**<< target, if it is a d,a vector */
	} target;

	double d_win; 	   /**<< distance window (for END_NEAR) */
	double a_win_rad;  /**<< angle window (for END_NEAR) */
	double a_start_rad;/**<< in xy consigns, start to move in distance
			    *    when a_target < a_start */
  
	uint16_t d_speed;  /**<< distance speed consign */
	uint16_t a_speed;  /**<< angle speed consign */

	struct robot_position * position; /**<< associated robot_position */
	struct robot_system * robot;      /**<< associated robot_system */
	struct cs * csm_angle;    /**<< associated control system (angle) */
	struct cs * csm_distance; /**<< associated control system (distance) */
  
	int8_t scheduler_task;    /**<< id of current task (-1 if no running task) */
};

/** structure initialization */
void trajectory_init(struct trajectory * traj);

/** structure initialization */
void trajectory_set_cs(struct trajectory * traj, struct cs * cs_d, 
		       struct cs * cs_a);

/** structure initialization */
void trajectory_set_robot_params(struct trajectory * traj, 
				 struct robot_system * rs, 
				 struct robot_position * pos) ;

/** set speed consign */
void trajectory_set_speed(struct trajectory * traj, int16_t d_speed, int16_t a_speed);

/** 
 * set windows for trajectory. 
 * params: distance window, angle window: we the robot enters this
 * position window, we deletes the event and the last consign is 
 * used.
 * a_start_deg used in xy consigns (start to move in distance when 
 * a_target < a_start)
 */
void trajectory_set_windows(struct trajectory * traj, double d_win, 
			    double a_win_deg, double a_start_deg);

/** return true if the position consign is equal to the filtered
 * position consign (after quadramp filter), for angle and
 * distance. */
uint8_t trajectory_finished(struct trajectory* traj);

/** return true if traj is nearly finished depending on specified
 *  parameters */
uint8_t trajectory_in_window(struct trajectory* traj, double d_win, double a_win_rad);

/* simple commands */

/** set relative angle and distance consign to 0 */
void trajectory_stop(struct trajectory * traj);

/** set relative angle and distance consign to 0, and break any
 * deceleration ramp in quadramp filter */
void trajectory_hardstop(struct trajectory * traj);

/** go straight forward (d is in cm) */
void trajectory_d_rel(struct trajectory * traj, double d_cm);

/** update distance consign without changing angle consign */
void trajectory_only_d_rel(struct trajectory * traj, double d_cm);

/** turn by 'a' degrees */
void trajectory_a_rel(struct trajectory * traj, double a_deg);

/** go to angle 'a' in degrees */
void trajectory_a_abs(struct trajectory * traj, double a_deg);

/** turn the robot until the point x,y is in front of us */ 
void trajectory_turnto_xy(struct trajectory* traj, double x_abs_cm, double y_abs_cm);

/** turn the robot until the point x,y is behind us */ 
void trajectory_turnto_xy_behind(struct trajectory* traj, double x_abs_cm, double y_abs_cm);

/** update angle consign without changing distance consign */
void trajectory_only_a_rel(struct trajectory * traj, double a_deg);

/** turn by 'a' degrees and go by 'd' cm */
void trajectory_d_a_rel(struct trajectory * traj, double d_cm, double a_deg);

/* commands using events */

/** goto a x,y point, using a trajectory event */
void trajectory_goto_xy_abs(struct trajectory * traj, double x_abs_cm, double y_abs_cm);

/** go forward to a x,y point, using a trajectory event */
void trajectory_goto_forward_xy_abs(struct trajectory * traj, double x_abs_cm, double y_abs_cm);

/** go forward to a d,a point, using a trajectory event */
void trajectory_goto_d_a_rel(struct trajectory* traj, double d, double a);

/** go forward to a x,y relative point, using a trajectory event */
void trajectory_goto_xy_rel(struct trajectory* traj, double x_rel_cm, double y_rel_cm);

#endif //TRAJECTORY_MANAGER
