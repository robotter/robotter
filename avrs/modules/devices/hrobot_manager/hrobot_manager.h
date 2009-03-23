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

/** \file hrobot_manager.h
  * \author JD
  *
  * Abstract robot hardware
  *
  */

#ifndef _HROBOT_MANAGER_H_
#define _HROBOT_MANAGER_H_

// TODO
/**@todo find a way to do that in one step */
#define _HROBOT_SETPWM(n,value) pwm_set_##n(value)
#define HROBOT_SETPWM(n,value) _HROBOT_SETPWM(n,value)

// PWM maximum value
#define HROBOT_PWMMAXVALUE ( (1<<PWM_SIGNIFICANT_BITS) - 1 )


/**@brief Initialize robot hardware
  */
void hrobot_init(void);

/**@brief Set robot course and speed 
  *@param speed motors speed in PWM values
  *@param course in radians
  */
void hrobot_setMotors( int16_t speed, double course);

#endif/*_HROBOT_MANAGER_H_*/
