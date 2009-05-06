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

/** \file motor_cs.c
  * \author JD
  *
  * Manage control systems for motors
  *
  */

#include "motor_cs.h"

#include <pwm.h>

// control system managers
struct cs csm_motor1;
struct cs csm_motor2;
struct cs csm_motor3;

// pids
struct pid_filter pid_motor1;
struct pid_filter pid_motor2;
struct pid_filter pid_motor3;

void motor_cs_init()
{
	// Setup PIDs
	pid_init(&pid_motor1);
	pid_init(&pid_motor2);
	pid_init(&pid_motor3);

  pid_set_gains(&pid_motor1, 200, 0, 0) ;
  pid_set_maximums(&pid_motor1, 0, 0, 0);
  pid_set_out_shift(&pid_motor1, 10);
 
  pid_set_gains(&pid_motor2, 200, 0, 0) ;
  pid_set_maximums(&pid_motor2, 0, 0, 0);
  pid_set_out_shift(&pid_motor2, 10);
 
  pid_set_gains(&pid_motor3, 200, 0, 0) ;
  pid_set_maximums(&pid_motor3, 0, 0, 0);
  pid_set_out_shift(&pid_motor3, 10);

	// Setup CSMs
	cs_init(&csm_motor1);
	cs_init(&csm_motor2);
	cs_init(&csm_motor3);

	cs_set_consign_filter(&csm_motor1, NULL, NULL);
	cs_set_consign_filter(&csm_motor2, NULL, NULL);
	cs_set_consign_filter(&csm_motor3, NULL, NULL);

	cs_set_correct_filter(&csm_motor1, NULL, NULL);
	cs_set_correct_filter(&csm_motor2, NULL, NULL);
	cs_set_correct_filter(&csm_motor3, NULL, NULL);

	cs_set_feedback_filter(&csm_motor1, &pid_do_filter, &pid_motor1);
	cs_set_feedback_filter(&csm_motor2, &pid_do_filter, &pid_motor2);
	cs_set_feedback_filter(&csm_motor3, &pid_do_filter, &pid_motor3);

	cs_set_process_out( &csm_motor1, &get_encoder_motor1, NULL);
	cs_set_process_out( &csm_motor2, &get_encoder_motor2, NULL);
	cs_set_process_out( &csm_motor3, &get_encoder_motor3, NULL);

	cs_set_process_in( &csm_motor1, &set_pwm_motor1, NULL);
	cs_set_process_in( &csm_motor2, &set_pwm_motor2, NULL);
	cs_set_process_in( &csm_motor3, &set_pwm_motor3, NULL);

	return;
}


void motor_cs_update(void* dummy, int32_t m1, int32_t m2, int32_t m3)
{
	// set consigns for motors CS
	cs_set_consign(&csm_motor1, m1);
	cs_set_consign(&csm_motor2, m2);
	cs_set_consign(&csm_motor3, m3);

	// update motors CS
	cs_manage(&csm_motor1);
	cs_manage(&csm_motor2);
	cs_manage(&csm_motor3);

	return;
}

int32_t get_encoder_motor1(void* dummy)
{
	//XXX return speed !
	return 0;
}

int32_t get_encoder_motor2(void* dummy)
{
	//XXX return speed !
	return 0;
}

int32_t get_encoder_motor3(void* dummy)
{
	//XXX return speed !
	return 0;
}

void set_pwm_motor1(void* dummy, int32_t pwm)
{
	//XXX
}

void set_pwm_motor2(void* dummy, int32_t pwm)
{
	//XXX
}

void set_pwm_motor3(void* dummy, int32_t pwm)
{
	//XXX
}
