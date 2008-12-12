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
 *  Revision : $Id: trajectory_manager.c,v 1.9 2008-05-14 13:27:12 zer0 Exp $
 *
 */

/* Trajectory Manager v2 - zer0 - for Eurobot 2008 */

#include <string.h>
#include <stdlib.h>
#include <math.h>

#include <aversive.h>
#include <aversive/error.h>
#include <scheduler.h>
#include <vect2.h>

#include <position_manager.h>
#include <robot_system.h>
#include <control_system_manager.h>
#include <quadramp.h>

#include <trajectory_manager.h>

#define M_2PI (2*M_PI)

#define DEG(x) ((x) * (180.0 / M_PI))
#define RAD(x) ((x) * (M_PI / 180.0))

static void trajectory_manager_event(void * param);

/************ INIT FUNCS */

/** structure initialization */
void trajectory_init(struct trajectory *traj)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	memset(traj, 0, sizeof(struct trajectory));
	traj->state = READY;
	traj->scheduler_task = -1;
	IRQ_UNLOCK(flags);
}

/** structure initialization */
void trajectory_set_cs(struct trajectory *traj, struct cs * cs_d, 
		       struct cs * cs_a)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	traj->csm_distance = cs_d;
	traj->csm_angle = cs_a;
	IRQ_UNLOCK(flags);
}

/** structure initialization */
void trajectory_set_robot_params(struct trajectory *traj, 
				 struct robot_system * rs, 
				 struct robot_position * pos) 
{
	uint8_t flags;
	IRQ_LOCK(flags);
	traj->robot = rs;
	traj->position = pos;
	IRQ_UNLOCK(flags);
}

/** set speed consign */
void trajectory_set_speed( struct trajectory *traj, int16_t d_speed, int16_t a_speed)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	traj->d_speed = d_speed;
	traj->a_speed = a_speed;
	IRQ_UNLOCK(flags);
}

/** set windows for trajectory */
void trajectory_set_windows(struct trajectory *traj, double d_win,
			    double a_win_deg, double a_start_deg)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	traj->d_win = d_win ;
	traj->a_win_rad = RAD(a_win_deg);
	traj->a_start_rad = RAD(a_start_deg);
	IRQ_UNLOCK(flags);
}

/************ STATIC [ AND USEFUL ] FUNCS */

/** set speed consign in quadramp filter */
static void set_quadramp_speed(struct trajectory *traj, int16_t d_speed, int16_t a_speed)
{
	struct quadramp_filter * q_d, * q_a;
	q_d = traj->csm_distance->consign_filter_params;
	q_a = traj->csm_angle->consign_filter_params;
	quadramp_set_1st_order_vars(q_d, ABS(d_speed), ABS(d_speed));
	quadramp_set_1st_order_vars(q_a, ABS(a_speed), ABS(a_speed));
}

/** get angle speed consign in quadramp filter */
static uint32_t get_quadramp_angle_speed(struct trajectory *traj)
{
	struct quadramp_filter *q_a;
	q_a = traj->csm_angle->consign_filter_params;
	return q_a->var_1st_ord_pos;
}

/** get distance speed consign in quadramp filter */
static uint32_t get_quadramp_distance_speed(struct trajectory *traj)
{
	struct quadramp_filter *q_d;
	q_d = traj->csm_distance->consign_filter_params;
	return q_d->var_1st_ord_pos;
}

/** remove event if any */
static void delete_event(struct trajectory *traj)
{
	set_quadramp_speed(traj, traj->d_speed, traj->a_speed);
	if ( traj->scheduler_task != -1) {
		DEBUG(E_TRAJECTORY, "Delete event");
		scheduler_del_event(traj->scheduler_task);
		traj->scheduler_task = -1;
	}
}

/** schedule the trajectory event */
static void schedule_event(struct trajectory *traj)
{
	if ( traj->scheduler_task != -1) {
		DEBUG(E_TRAJECTORY, "Schedule event, already scheduled");
	}
	else {
		traj->scheduler_task = 
			scheduler_add_periodical_event_priority(&trajectory_manager_event,
								(void*)traj,
								100000L/SCHEDULER_UNIT, 30);
	}
}

/** do a modulo 2.pi -> [-Pi,+Pi], knowing that 'a' is in [-3Pi,+3Pi] */  
static double simple_modulo_2pi(double a)
{
	if(a < -M_PI) {
		a += M_2PI;
	}
	else if(a > M_PI) {
		a -= M_2PI;
	}
	return a;
}

/** do a modulo 2.pi -> [-Pi,+Pi] */  
static double modulo_2pi(double a)
{
        double res = a - (((int32_t) (a/M_2PI)) * M_2PI);
	return simple_modulo_2pi(res);
}

/** near the target (dist) ? */
static uint8_t is_robot_in_dist_window(struct trajectory *traj, double d_win)
{
	double d = ABS(traj->target.pol.distance-rs_get_distance(traj->robot));
	d = d / traj->position->phys.distance_imp_per_cm;
	return (d < d_win);
}

/** near the target (dist in x,y) ? */
static uint8_t is_robot_in_xy_window(struct trajectory *traj, double d_win)
{
	double x1 = traj->target.cart.x;
	double y1 = traj->target.cart.y;
	double x2 = position_get_x_double(traj->position);
	double y2 = position_get_y_double(traj->position);
	return ( sqrt ((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1)) < d_win );
}

/** near the target (angle) ? */
static inline uint8_t 
__is_robot_in_angle_window(struct trajectory *traj, double target_angle, double a_win_rad)
{
	return ( ABS(target_angle*2) < a_win_rad );
}

/** near the angle target in radian ? Only valid if
 *  traj->target.pol.angle is set (i.e. an angle command, not an xy
 *  command) */
static uint8_t is_robot_in_angle_window(struct trajectory *traj, double a_win_rad)
{
	return __is_robot_in_angle_window(traj, traj->target.pol.angle -
					  position_get_a_rad_double(traj->position),
					  a_win_rad);
}


/************ SIMPLE TRAJS, NO EVENT */

#define UPDATE_D 1
#define UPDATE_A 2
#define RESET_D  4
#define RESET_A  8

/** 
 * update angle and/or distance
 * this function is not called directly by the user
 *   traj  : pointer to the trajectory structure
 *   d_cm  : distance in cm
 *   a_rad : angle in radian
 *   flags : what to update (UPDATE_A, UPDATE_D)
 */
void __trajectory_goto_d_a_rel(struct trajectory *traj, double d_cm, double a_rad, uint8_t flags)
{
	int32_t a_consign, d_consign;
	/* XXX only used for debug */
	double posx = position_get_x_double(traj->position); 
	double posy = position_get_y_double(traj->position);
	double posa = position_get_a_rad_double(traj->position);

	DEBUG(E_TRAJECTORY, "Goto DA/RS rel to d=%f a_rad=%f", d_cm, a_rad);
	DEBUG(E_TRAJECTORY, "current pos = x=%f, y=%f, a_rad=%f", posx, posy, posa);
	delete_event(traj);
	if (flags & UPDATE_A) {
		if (flags & RESET_A) {
			a_consign = 0;
		}
		else {
			a_consign = (int32_t)(a_rad * (traj->position->phys.distance_imp_per_cm) *
					      (traj->position->phys.track_cm) / 2); 
			traj->target.pol.angle = a_consign;
		}
		cs_set_consign(traj->csm_angle, a_consign + rs_get_angle(traj->robot));
	}
	if (flags & UPDATE_D) {
		if (flags & RESET_D) {
			d_consign = 0;
		}
		else {
			d_consign = (int32_t)((d_cm) * (traj->position->phys.distance_imp_per_cm));
			traj->target.pol.distance = d_consign;
		}
		cs_set_consign(traj->csm_distance, d_consign + rs_get_distance(traj->robot));
	}
}

/** go straight forward (d is in cm) */
void trajectory_d_rel(struct trajectory *traj, double d_cm)
{
	traj->state = RUNNING_D;
	__trajectory_goto_d_a_rel(traj, d_cm, 0, UPDATE_D | UPDATE_A | RESET_A);
}

/** update distance consign without changing angle consign */
void trajectory_only_d_rel(struct trajectory *traj, double d_cm)
{
	traj->state = RUNNING_D;
	__trajectory_goto_d_a_rel(traj, d_cm, 0, UPDATE_D);
}

/** turn by 'a' degrees */
void trajectory_a_rel(struct trajectory *traj, double a_deg_rel)
{
	traj->state = RUNNING_A;
	__trajectory_goto_d_a_rel(traj, 0, RAD(a_deg_rel), UPDATE_A | UPDATE_D | RESET_D);
}

/** turn by 'a' degrees */
void trajectory_a_abs(struct trajectory *traj, double a_deg_abs)
{
	double posa = position_get_a_rad_double(traj->position);
	double a;

	traj->state = RUNNING_A;
	a = RAD(a_deg_abs) - posa;
	a = modulo_2pi(a);
	__trajectory_goto_d_a_rel(traj, 0, a, UPDATE_A | UPDATE_D | RESET_D);
}

/** turn the robot until the point x,y is in front of us */ 
void trajectory_turnto_xy(struct trajectory *traj, double x_abs_cm, double y_abs_cm)
{
	double posx = position_get_x_double(traj->position); 
	double posy = position_get_y_double(traj->position);
	double posa = position_get_a_rad_double(traj->position);

	traj->state = RUNNING_A;
	DEBUG(E_TRAJECTORY, "Goto Turn To xy %f %f", x_abs_cm, y_abs_cm);
	__trajectory_goto_d_a_rel(traj, 0,
			simple_modulo_2pi(atan2(y_abs_cm - posy, x_abs_cm - posx) - posa),
				  UPDATE_A | UPDATE_D | RESET_D);
}

/** turn the robot until the point x,y is behind us */ 
void trajectory_turnto_xy_behind(struct trajectory *traj, double x_abs_cm, double y_abs_cm)
{
	double posx = position_get_x_double(traj->position); 
	double posy = position_get_y_double(traj->position);
	double posa = position_get_a_rad_double(traj->position);

	traj->state = RUNNING_A;
	DEBUG(E_TRAJECTORY, "Goto Turn To xy %f %f", x_abs_cm, y_abs_cm);
	__trajectory_goto_d_a_rel(traj, 0, 
			modulo_2pi(atan2(y_abs_cm - posy, x_abs_cm - posx) - posa + M_PI),
				  UPDATE_A | UPDATE_D | RESET_D);
}

/** update angle consign without changing distance consign */
void trajectory_only_a_rel(struct trajectory *traj, double a_deg)
{
	traj->state = RUNNING_A;
	__trajectory_goto_d_a_rel(traj, 0, RAD(a_deg), UPDATE_A);
}

/** turn by 'a' degrees */
void trajectory_d_a_rel(struct trajectory *traj, double d_cm, double a_deg)
{
	traj->state = RUNNING_AD;
	__trajectory_goto_d_a_rel(traj, d_cm, RAD(a_deg), UPDATE_A | UPDATE_D);
}

/** set relative angle and distance consign to 0 */
void trajectory_stop(struct trajectory *traj)
{
	traj->state = READY;
	__trajectory_goto_d_a_rel(traj, 0, 0, UPDATE_A | UPDATE_D | RESET_D | RESET_A);
}

/** set relative angle and distance consign to 0, and break any
 * deceleration ramp in quadramp filter */
void trajectory_hardstop(struct trajectory *traj)
{
	struct quadramp_filter *q_d, *q_a;

	traj->state = READY;
	q_d = traj->csm_distance->consign_filter_params;
	q_a = traj->csm_angle->consign_filter_params;
	__trajectory_goto_d_a_rel(traj, 0, 0, UPDATE_A | UPDATE_D | RESET_D | RESET_A);

	q_d->previous_var = 0;
	q_d->previous_out = rs_get_distance(traj->robot);
	q_a->previous_var = 0;
	q_a->previous_out = rs_get_angle(traj->robot);
}


/************ GOTO XY, USE EVENTS */

/** goto a x,y point, using a trajectory event */
void trajectory_goto_xy_abs(struct trajectory *traj, double x, double y)
{
	DEBUG(E_TRAJECTORY, "Goto XY");
	delete_event(traj);
	traj->target.cart.x = x;
	traj->target.cart.y = y;
	traj->state = RUNNING_XY_START;
	trajectory_manager_event(traj);
	schedule_event(traj);
}

/** go forward to a x,y point, using a trajectory event */
void trajectory_goto_forward_xy_abs(struct trajectory *traj, double x, double y)
{
	DEBUG(E_TRAJECTORY, "Goto XY_F");
	delete_event(traj);
	traj->target.cart.x = x;
	traj->target.cart.y = y;
	traj->state = RUNNING_XY_F_START;
	trajectory_manager_event(traj);
	schedule_event(traj);
}

/** go forward to a d,a point, using a trajectory event */
void trajectory_goto_d_a_rel(struct trajectory *traj, double d, double a)
{
	vect2_pol p;
	double x = position_get_x_double(traj->position); 
	double y = position_get_y_double(traj->position);
	
	DEBUG(E_TRAJECTORY, "Goto DA rel");

	delete_event(traj);
	p.r = d;
	p.theta = RAD(a) + position_get_a_rad_double(traj->position);
	vect2_pol2cart(&p, &traj->target.cart);
	traj->target.cart.x += x;
	traj->target.cart.y += y;
	
	traj->state = RUNNING_XY_START;
	trajectory_manager_event(traj);
	schedule_event(traj);
}

/** go forward to a x,y relative point, using a trajectory event */
void trajectory_goto_xy_rel(struct trajectory *traj, double x_rel_cm, double y_rel_cm)
{
	vect2_cart c;
	vect2_pol p;
	double x = position_get_x_double(traj->position); 
	double y = position_get_y_double(traj->position);

	DEBUG(E_TRAJECTORY, "Goto XY rel");

	delete_event(traj);
	c.x = x_rel_cm;
	c.y = y_rel_cm;

	vect2_cart2pol(&c, &p);
	p.theta += position_get_a_rad_double(traj->position);;
	vect2_pol2cart(&p, &traj->target.cart);

	traj->target.cart.x += x;
	traj->target.cart.y += y;
	
	traj->state = RUNNING_XY_START;
	trajectory_manager_event(traj);
	schedule_event(traj);
}

/************ FUNCS FOR GETTING TRAJ STATE */

/** return true if the position consign is equal to the filtered
 * position consign (after quadramp filter), for angle and
 * distance. */
uint8_t trajectory_finished(struct trajectory *traj)
{
	return cs_get_consign(traj->csm_angle) == cs_get_filtered_consign(traj->csm_angle) &&
		cs_get_consign(traj->csm_distance) == cs_get_filtered_consign(traj->csm_distance) ;
}

/** return true if traj is nearly finished */
uint8_t trajectory_in_window(struct trajectory *traj, double d_win, double a_win_rad)
{
	switch(traj->state) {

	case RUNNING_XY_ANGLE_OK: 
	case RUNNING_XY_F_ANGLE_OK: 
		/* if robot coordinates are near the x,y target */
		return is_robot_in_xy_window(traj, d_win);

	case RUNNING_A: 
		return is_robot_in_angle_window(traj, a_win_rad);

	case RUNNING_D:
		return is_robot_in_dist_window(traj, d_win);

	case RUNNING_AD:
		return is_robot_in_dist_window(traj, d_win) && 
			is_robot_in_angle_window(traj, a_win_rad);

	case RUNNING_XY_START: 
	case RUNNING_XY_F_START:
	case RUNNING_XY_ANGLE: 
	case RUNNING_XY_F_ANGLE:
	default:
		return 0;
	}
}

/*********** *TRAJECTORY EVENT FUNC */

/** event called for xy trajectories */
static void trajectory_manager_event(void * param)
{
	struct trajectory *traj = (struct trajectory *)param;
	double coef=1.0;
	double x = position_get_x_double(traj->position); 
	double y = position_get_y_double(traj->position);
	double a = position_get_a_rad_double(traj->position);
	int32_t d_consign=0, a_consign=0;
	
	/* These vectors contain target position of the robot in
	 * its own coordinates */
	vect2_cart v2cart_pos;
	vect2_pol v2pol_target;

	/* step 1 : process new commands to quadramps */

	switch (traj->state) {
	case RUNNING_XY_START:
	case RUNNING_XY_ANGLE:
	case RUNNING_XY_ANGLE_OK:
	case RUNNING_XY_F_START:
	case RUNNING_XY_F_ANGLE:
	case RUNNING_XY_F_ANGLE_OK:

		/* process the command vector from absolute target and
		 * current position */
		v2cart_pos.x = traj->target.cart.x - x;
		v2cart_pos.y = traj->target.cart.y - y;
		vect2_cart2pol(&v2cart_pos, &v2pol_target);
		v2pol_target.theta = simple_modulo_2pi(v2pol_target.theta - a);

		/* if we don't need to go forward */
		if( traj->state >= RUNNING_XY_START &&
		    traj->state <= RUNNING_XY_ANGLE_OK ) {
			/* If the target is behind the robot, we need to go
			 * backwards. 0.52 instead of 0.5 because we prefer to
			 * go forward */
			if( (v2pol_target.theta > 0.52*M_PI) ||
			    (v2pol_target.theta < -0.52*M_PI ) ) {
				v2pol_target.r = -v2pol_target.r;
				v2pol_target.theta = simple_modulo_2pi(v2pol_target.theta + M_PI);
			}
		}
		
		/* If the robot is correctly oriented to start moving in distance */
		/* here limit dist speed depending on v2pol_target.theta */
		if (ABS(v2pol_target.theta) > traj->a_start_rad) // || ABS(v2pol_target.r) < traj->d_win)
			set_quadramp_speed(traj, 0, traj->a_speed);
		else {
			coef = (traj->a_start_rad - ABS(v2pol_target.theta)) / traj->a_start_rad;
			set_quadramp_speed(traj, traj->d_speed * coef, traj->a_speed);
		}
		
		d_consign = (int32_t)(v2pol_target.r * (traj->position->phys.distance_imp_per_cm));
		d_consign += rs_get_distance(traj->robot);
		
		/* angle consign */
		/* XXX here we specify 2.2 instead of 2.0 to avoid oscillations */
		a_consign = (int32_t)(v2pol_target.theta *
				      (traj->position->phys.distance_imp_per_cm) *
				      (traj->position->phys.track_cm) / 2.2); 
		a_consign += rs_get_angle(traj->robot);
		
		break;

	default:
		/* hmmm quite odd, delete the event */
		DEBUG(E_TRAJECTORY, "GNI ???");
		delete_event(traj);
		traj->state = READY;
	}


	/* step 2 : update state, or delete event if we reached the
	 * destination */

	/* XXX if target is our pos !! */

	switch (traj->state) {
	case RUNNING_XY_START:
	case RUNNING_XY_F_START:
		/* START -> ANGLE */
		DEBUG(E_TRAJECTORY, "-> ANGLE");
		traj->state ++;
		break;

	case RUNNING_XY_ANGLE:
	case RUNNING_XY_F_ANGLE: {
		struct quadramp_filter *q_a;
		q_a = traj->csm_angle->consign_filter_params;
		/* if d_speed is not 0, we are in start_angle_win */
		if (get_quadramp_distance_speed(traj)) {
			if(is_robot_in_xy_window(traj, traj->d_win)) {
				delete_event(traj);
			}
			/* ANGLE -> ANGLE_OK */
			traj->state ++;
			DEBUG(E_TRAJECTORY, "-> ANGLE_OK");
		}
		break;
	}

	case RUNNING_XY_ANGLE_OK:
	case RUNNING_XY_F_ANGLE_OK:
		/* If we reached the destination */
		if(is_robot_in_xy_window(traj, traj->d_win)) {
			delete_event(traj);
		}
	break;

	default:
		break;
	}

	/* step 3 : send the processed commands to cs */

	DEBUG(E_TRAJECTORY, "EVENT XY cur=(%f,%f,%f) cart=(%f,%f) pol=(%f,%f)",
	      x, y, a, v2cart_pos.x, v2cart_pos.y, v2pol_target.r, v2pol_target.theta);
	
	DEBUG(E_TRAJECTORY,"d_cur=%" PRIi32 ", d_consign=%" PRIi32 ", d_speed=%" PRIi32 ", "
	      "a_cur=%" PRIi32 ", a_consign=%" PRIi32 ", a_speed=%" PRIi32,
	      rs_get_distance(traj->robot), d_consign, get_quadramp_distance_speed(traj),
	      rs_get_angle(traj->robot), a_consign, get_quadramp_angle_speed(traj));
		
	cs_set_consign(traj->csm_angle, a_consign);
	cs_set_consign(traj->csm_distance, d_consign);
}
