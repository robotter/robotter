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
#include "actuators.h"
#include "brush.h"
#include "settings.h"

// ax12s
AX12 ax12;

// actuators
actuators_t actuators;

void sys_init(void)
{
  NOTICE(0,"Initializing AX12s");
  ax12_user_init();

  NOTICE(0,"Initializing actuators");
  actuators_init(&actuators);

  brush_init();
}

void sys_update(void* dummy)
{
  enum {
    SYS_STEP_ARM_LEFT = 0,
    SYS_STEP_ARM_RIGHT,
    SYS_STEP_END,
  };
  static uint8_t step = 0;
  // some LED feedback
  step++;
  if( step >= SYS_STEP_END )
  {
    step = 0;
    led_on(0);
  }
  else
    led_off(0);

#ifndef SETTING_UART_UI_ENABLED
  // update communication
  ppp_update();

  // poll arms position
  switch( step ) {
    case SYS_STEP_ARM_LEFT:
      actuators_arm_send_status(&actuators, ARM_LEFT);
      break;
    case SYS_STEP_ARM_RIGHT:
      actuators_arm_send_status(&actuators, ARM_RIGHT);
      break;
    default:
      break;
  }
#endif
}
