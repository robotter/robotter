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

/** \file pwm.h
  * \author JD
  */

#ifndef _PWM_H_
#define _PWM_H_

#include <aversive.h>
#include "pwm_config.h"

#define PWM_REGISTER_WATCHDOG_STATUS (PWM_FPGA_ADDR + 1)
#define PWM_REGISTER_WATCHDOG_PERIOD_MS (PWM_FPGA_ADDR + 2)
#define PWM_REGISTER_CONFIG (PWM_FPGA_ADDR + 3)

#define PWM_REGISTER_PERIOD_L1 (PWM_FPGA_ADDR + 4)
#define PWM_REGISTER_PERIOD_H1 (PWM_FPGA_ADDR + 5)
#define PWM_REGISTER_PW_L1 (PWM_FPGA_ADDR + 6)
#define PWM_REGISTER_PW_H1 (PWM_FPGA_ADDR + 7)

#define PWM_REGISTER_PERIOD_L2 (PWM_FPGA_ADDR + 8)
#define PWM_REGISTER_PERIOD_H2 (PWM_FPGA_ADDR + 9)
#define PWM_REGISTER_PW_L2 (PWM_FPGA_ADDR + 10)
#define PWM_REGISTER_PW_H2 (PWM_FPGA_ADDR + 11)

#define PWM_REGISTER_PERIOD_L3 (PWM_FPGA_ADDR + 12)
#define PWM_REGISTER_PERIOD_H3 (PWM_FPGA_ADDR + 13)
#define PWM_REGISTER_PW_L3 (PWM_FPGA_ADDR + 14)
#define PWM_REGISTER_PW_H3 (PWM_FPGA_ADDR + 15)

void pwm_init(void);

void pwm_set_A(int16_t value);
void pwm_set_B(int16_t value);
void pwm_set_C(int16_t value);

#endif/*_PWM_H_*/
