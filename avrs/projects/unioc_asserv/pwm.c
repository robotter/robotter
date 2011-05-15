/*  
 *  Copyright RobOtter (2011)
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

/** \file pwm.c
  * \author JD
  */

#include <aversive/error.h>
#include "pwm.h"

#include "settings.h"

#define PWM_PW(n) (_SFR_MEM16(PWM_REGISTER_PW_L##n))
#define PWM_PERIOD (SETTING_FPGA_FREQUENCY_KHZ/SETTING_PWM_FREQUENCY_KHZ)

void pwm_init(void)
{
  // activate watchdog
  _SFR_MEM8(PWM_REGISTER_WATCHDOG_STATUS) = 0;//_BV(1);
  _SFR_MEM8(PWM_REGISTER_WATCHDOG_PERIOD_MS) = 20;

  // activate 3 PWMs
  _SFR_MEM8(PWM_REGISTER_CONFIG) = _BV(2)|_BV(1)|_BV(0);

  // set periods
  _SFR_MEM16(PWM_REGISTER_PERIOD_L1) = PWM_PERIOD;
  _SFR_MEM16(PWM_REGISTER_PERIOD_L2) = PWM_PERIOD;
  _SFR_MEM16(PWM_REGISTER_PERIOD_L3) = PWM_PERIOD;

  // clear pulse widths
  PWM_PW(1) = 0;
  PWM_PW(2) = 0;
  PWM_PW(3) = 0;

}

void pwm_set_A(int16_t value)
{
  PWM_PW(3) = (PWM_PERIOD*SETTING_MOTOR_A_DIR*value)/1000;
}

void pwm_set_B(int16_t value)
{
  PWM_PW(2) = (PWM_PERIOD*SETTING_MOTOR_B_DIR*value)/1000;
}

void pwm_set_C(int16_t value)
{
  PWM_PW(1) = (PWM_PERIOD*SETTING_MOTOR_C_DIR*value)/1000;
}
