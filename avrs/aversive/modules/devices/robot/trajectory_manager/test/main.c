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
 *  Revision : $Id: main.c,v 1.3 2008-01-08 20:05:03 zer0 Exp $
 *
 */

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <aversive.h>
#include <aversive/pgmspace.h>
#include <aversive/error.h>
#include <aversive/wait.h>

#include <scheduler.h>
#include <quadramp.h>
#include <control_system_manager.h>
#include <position_manager.h>
#include <trajectory_manager.h>


 
/* XXX it is 90 don't forget it :) */
#define MATCH_TIME 90

/* decrease track to decrease angle */
#define MOT_TRACK_CM 23.906
#define EXT_TRACK_CM 8.995 // 8.5
#define VIRTUAL_TRACK_CM MOT_TRACK_CM 

#define DIST_IMP_CM 6160.0

#define LEFT_ENCODER_MOT  ((void *)0)
#define RIGHT_ENCODER_MOT ((void *)1)
#define LEFT_ENCODER_EXT   ((void *)2)
#define RIGHT_ENCODER_EXT  ((void *)3)


#define LEFT_PWM             ((void *)PWM3C)
#define RIGHT_PWM            ((void *)PWM1A)
#define ROLL_PWM            ((void *)PWM2)

#define DO_CS     1  /* control system */
#define DO_RS     2  /* robot system (angle/distance) */
#define DO_POS    4  /* process position */
#define DO_BD     8  /* process blocking detection */
#define DO_TIMER  16 /* check time and stop after 90 secs */

/** ERROR NUMS */
#define E_USER_NOTHING    193

#define BALL_IS_READY      1
#define BALL_IS_WHITE      2
#define BALL_COUNT     (4+8)
#define BALL_SUCKED       16
#define BALL_BUSY         32

#define BALL_COUNT_BIT     2

#define BALL_LAYDOWN 1
#define BALL_EJECT   2
#define BALL_RESUCK  3
#define BALL_OFF     4
#define BALL_ON      5
#define BALL_LAYDOWN_FORCE 6
#define BALL_EJECT_FORCE   7

struct robot {
	s08 cs_events;

	struct robot_system rs;
	struct robot_position pos;

	struct cs cs_a;
	struct quadramp_filter qr_a;

	struct cs cs_d;
	struct quadramp_filter qr_d;

	struct trajectory traj;
} robot;

/* WARNING : this test is only a compilation test */
/* it does not check that the module is working */
int main(void)
{
	/* ROBOT_SYSTEM */
	rs_init(&robot.rs);
	rs_set_ratio(&robot.rs, MOT_TRACK_CM / EXT_TRACK_CM);
	rs_set_flags(&robot.rs, 0); /* rs use mot */

	/* POSITION MANAGER */
	position_init(&robot.pos);
	position_set_physical_params(&robot.pos, VIRTUAL_TRACK_CM, DIST_IMP_CM);
	position_set_related_robot_system(&robot.pos, &robot.rs);
	position_use_ext(&robot.pos);

	/* CS DISTANCE */
	quadramp_init(&robot.qr_d);
	quadramp_set_1st_order_vars(&robot.qr_d, 1000, 1000); /* set speed */
	quadramp_set_2nd_order_vars(&robot.qr_d, 10, 10); /* set accel */
  
	cs_init(&robot.cs_d);
	cs_set_consign_filter(&robot.cs_d, quadramp_do_filter, &robot.qr_d);
	cs_set_consign(&robot.cs_d, 0);
  
	/* CS ANGLE */
	quadramp_init(&robot.qr_a);
	quadramp_set_1st_order_vars(&robot.qr_a, 500, 500); /* set speed */
	quadramp_set_2nd_order_vars(&robot.qr_a, 5, 5); /* set accel */
  
	cs_init(&robot.cs_a);
	cs_set_consign_filter(&robot.cs_a, quadramp_do_filter, &robot.qr_a);
	cs_set_consign(&robot.cs_a, 0);

	/* TRAJECTORY MANAGER */
	trajectory_init(&robot.traj);
	trajectory_set_cs(&robot.traj, &robot.cs_d, &robot.cs_a);
	trajectory_set_robot_params(&robot.traj, &robot.rs, &robot.pos);
	trajectory_set_windows(&robot.traj, 12.0, 15.0, 50.0);

#ifdef HOST_VERSION
	while(1) {
		scheduler_interrupt();
	}
#endif

	return 0;
}


