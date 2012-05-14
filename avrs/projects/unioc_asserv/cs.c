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
#include <timer.h>
#include <scheduler.h>
#include <perlimpinpin.h>

#include "cs.h"
#include "robot_cs.h"
#include "htrajectory.h"
#include "time.h"
#include "avoidance.h"
#include "color_detection.h"

#include "settings.h"

// Robot position
hrobot_position_t position;

// Robot system
hrobot_system_t system;

// Robot control systems
robot_cs_t robot_cs;

// Trajectory management
htrajectory_t trajectory;

// color detectors
color_detector_t color0;
color_detector_t color120;
color_detector_t color240;

// robot_cs quadramps
extern struct quadramp_filter qramp_angle;

// Avoidance system
avoidance_t avoidance;

// CSs cpu usage in percents
uint8_t cs_cpuUsage;

// over pwm counter
extern uint8_t motor_overpwm_count[3];

void cs_initialize(void)
{
  NOTICE(0,"Initializing color detectors");
  color_detection_init(&color0, SETTING_COLOR_DETECTOR_0);
  color_detection_set_threshold(&color0, CO_RED, SETTING_COLOR_DETECTOR_0_RED_THRESHOLD);
  color_detection_set_threshold(&color0, CO_BLUE, SETTING_COLOR_DETECTOR_0_BLUE_THRESHOLD);

  color_detection_init(&color120, SETTING_COLOR_DETECTOR_120);
  color_detection_set_threshold(&color120, CO_RED, SETTING_COLOR_DETECTOR_120_RED_THRESHOLD);
  color_detection_set_threshold(&color120, CO_BLUE, SETTING_COLOR_DETECTOR_120_BLUE_THRESHOLD);

  color_detection_init(&color240, SETTING_COLOR_DETECTOR_240);
  color_detection_set_threshold(&color240, CO_RED, SETTING_COLOR_DETECTOR_240_RED_THRESHOLD);
  color_detection_set_threshold(&color240, CO_BLUE, SETTING_COLOR_DETECTOR_240_BLUE_THRESHOLD);
  
  // Initialize robot manager
  NOTICE(0,"Initializing robot manager");
  hrobot_init(&system);

  // Initialize position manager
  NOTICE(0,"Initializing position manager");
  hposition_init( &position );

  // Initialize control systems for robot
  NOTICE(0,"Initializing robot control systems");
  robot_cs_init(&robot_cs);
  robot_cs_set_hrobot_manager(&robot_cs,&system);
  robot_cs_set_hposition_manager(&robot_cs,&position);
  
  // Initialize trajectory management
  NOTICE(0,"Initializing trajectory management");
  htrajectory_init(&trajectory,&position,&robot_cs,&qramp_angle);
  htrajectory_setASpeed(&trajectory, SETTING_TRAJECTORY_A_SPEED,
                                     SETTING_TRAJECTORY_A_ACC);
  htrajectory_setXYCruiseSpeed(&trajectory, SETTING_TRAJECTORY_XYCRUISE_SPEED,
                                            SETTING_TRAJECTORY_XYCRUISE_ACC);
  htrajectory_setXYSteeringSpeed(&trajectory, SETTING_TRAJECTORY_XYSTEERING_SPEED,
                                              SETTING_TRAJECTORY_XYSTEERING_ACC);
  htrajectory_setXYStopSpeed(&trajectory, SETTING_TRAJECTORY_XYSTOP_SPEED,
                                          SETTING_TRAJECTORY_XYSTOP_ACC);

  htrajectory_setSteeringWindow(&trajectory, SETTING_TRAJECTORY_STEERING_XYWIN);
  htrajectory_setStopWindows(&trajectory, SETTING_TRAJECTORY_STOP_XYWIN,
                                          SETTING_TRAJECTORY_STOP_AWIN);

  hposition_set( &position, SETTING_POSITION_INIT_X,
                            SETTING_POSITION_INIT_Y,
                            SETTING_POSITION_INIT_A);



  // Initialize avoidance system
  NOTICE(0,"Initializing avoidance system");
  avoidance_init(&avoidance);
}

uint16_t dbg_timer;

void cs_update(void* dummy)
{
  uint16_t dt;
  static uint8_t led = 0;

  // some LED feedback on UNIOC-NG
  // (quite strange code for a great flashing effect :p)
  _SFR_MEM8(0x1800) = (led+=10)>50;

  // overpwm
  // XXX PUT ME BACK PLEASE XXX
  //for(i=0;i<3;i++)
  //  if( motor_overpwm_count[i] >= 255 )
  //    EMERG(0,"Over PWM detected (i=%d)",i);

  // reset TIMER3
  timer3_set(0);

#ifndef SETTING_UART_UI_ENABLED
  // update communications with perlimpinpin
  ppp_update();
#endif

  // update avoidance system
  avoidance_update(&avoidance);

  // update trajectory management
  htrajectory_update(&trajectory);

	// update robot position 
	hposition_update(&position);

	// update control systems
	robot_cs_update(&robot_cs);

  // compute CPU usage
  dt = timer3_get();
  cs_cpuUsage = (100*timer3_tics_to_us(dt))
      /(SETTING_SCHED_CS_PERIOD*SCHEDULER_UNIT);

  #ifndef SETTING_OVERRIDE_CPUUSAGE
  // if cpu usage get over 95%, throw an error
  if(cs_cpuUsage > 95)
    ERROR(CS_ERROR,"cs_update CPU usage go over 95% : %d",cs_cpuUsage);
  #endif
}
