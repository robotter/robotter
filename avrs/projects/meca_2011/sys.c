/*  
 *  Copyright RobOtter (2010) 
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

/** \file sys.c
  * \author JD
  */

#include <aversive.h>
#include <aversive/error.h>
#include <ax12.h>
#include <timer.h>
#include <scheduler.h>
#include <perlimpinpin.h>

#include "sys.h"
#include "led.h"
#include "ax12_user.h"
#include "ground_detector.h"
#include "actuators.h"
#include "settings.h"
#include "scanner.h"

// ax12s
AX12 ax12;

// actuators
actuators_t actuators;

// ground detectors
ground_detector_t gd_left;
ground_detector_t gd_right;

uint8_t gd_left_last = 0;
uint8_t gd_right_last = 0;

// scanner
uint8_t scanner_source_address;
scanner_state_t scanner_state;

// SYS cpu usage in percents
uint8_t sys_cpuUsage;

void sys_init(void)
{
  NOTICE(0,"Initializing AX12s");
  ax12_user_init();

  NOTICE(0,"Initializing actuators");
  actuators_init(&actuators);

  NOTICE(0,"Initializing ground detectors");
  ground_detector_set_pwm_port(&gd_right, &PORTG, 3);
  ground_detector_set_enable_port(&gd_right, &PORTC, 4);
  ground_detector_set_object_present_pin(&gd_right, &PINE, 7);
  ground_detector_set_sensor_output_mux_select_port(&gd_right, &PORTC, 3);
  ground_detector_set_sensor_number(&gd_right, 0);
  ground_detector_init (&gd_right);

  ground_detector_set_pwm_port(&gd_left, &PORTG, 4);
  ground_detector_set_enable_port(&gd_left, &PORTC, 4);
  ground_detector_set_object_present_pin(&gd_left, &PINE, 7);
  ground_detector_set_sensor_output_mux_select_port(&gd_left, &PORTC, 3);
  ground_detector_set_sensor_number(&gd_left, 1);
  ground_detector_init (&gd_left);

  ground_detector_set_object_present_threshold(&gd_right, SETTING_GD_RIGHT_THRESHOLD);
  ground_detector_set_object_present_threshold(&gd_left, SETTING_GD_LEFT_THRESHOLD);

  scanner_state = ST_NONE;
 
}

void sys_update(void* dummy)
{
  uint16_t dt;
  static uint8_t led = 0;

  // some LED feedback
  if( (led+=40)>50 )
    led_on(0);
  else
    led_off(0);

  // update communication
  ppp_update();

  // manage scanner
  uint8_t scertainty;
  double sx,sy,sh;
  switch(scanner_state)
  {
    case ST_SCHEDULED_LEFT:
      scertainty = scanner_detect(ARM_LEFT, &sx, &sy, &sh);
      PPP_SEND_ARM_SCAN_R(scanner_source_address, scertainty, sx, sy, sh);
      scanner_state = ST_NONE;
      break;

    case ST_SCHEDULED_RIGHT:
      scertainty = scanner_detect(ARM_RIGHT, &sx, &sy, &sh);
      PPP_SEND_ARM_SCAN_R(scanner_source_address, scertainty, sx, sy, sh);
      scanner_state = ST_NONE;
      break;

    case ST_NONE:
    default: 
      break;
  }

  // poll ground detectors
  uint8_t l,r;
  l = ground_detector_is_object_present(&gd_left);
  r = ground_detector_is_object_present(&gd_right);
  
  if( l && !gd_left_last )
    PPP_SEND_ARM_PAWN_PRESENT(ROID_STRAT|PPP_UART_ROID, ARM_LEFT, 1);
  if( !l && gd_left_last )
    PPP_SEND_ARM_PAWN_PRESENT(ROID_STRAT|PPP_UART_ROID, ARM_LEFT, 0);

  if( r && !gd_right_last )
    PPP_SEND_ARM_PAWN_PRESENT(ROID_STRAT|PPP_UART_ROID, ARM_RIGHT, 1);
  if( !r && gd_right_last )
    PPP_SEND_ARM_PAWN_PRESENT(ROID_STRAT|PPP_UART_ROID, ARM_RIGHT, 0);

  gd_right_last = r;
  gd_left_last = l;
  
  // reset TIMER3
  timer3_set(0);

  // compute CPU usage
  dt = timer3_get();
  sys_cpuUsage = (100*timer3_tics_to_us(dt))
       /(SETTING_SCHED_SYS_PERIOD*SCHEDULER_UNIT);

  #ifndef SETTING_OVERRIDE_CPUUSAGE
    if(sys_cpuUsage > 95)
      ERROR(SYS_ERROR,"sys_update CPU usage go over 95% : %d",sys_cpuUsage);
  #endif
}