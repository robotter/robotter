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
 *  Revision : $Id: brushless.h,v 1.2 2007-03-04 13:53:45 zer0 Exp $
 *
 */


#ifndef _BRUSHLESS_
#define _BRUSHLESS_

#include <utils.h>

#include <brushless_3phase_digital_hall_double_config.h>



/** This module handles two brushless motors with 3 phases, wired in triangle or star.
    2x 3 hall sensors are used wih digital output.
    2x 3 PWM are outputted, these MUST be synchronized !!
    
    The control value is a voltage. This can be assimiled to a torque at low speeds.
    
    There is a possibility of also of limiting the speed. This is accomplished by slowing down the sampling speed of the 
    sensors. Doing this,the motor effective torque is reduced when the speed is such that the sensor actuation
    approaches the sampling frequency.
    use this technique carefully, because the motor has already his full voltage applied, an can dissipate a lot of energy, especially at low speeds.
    
    
    there is no external manage function, as the manage is done at the PWM speed (overflow of one PWM timer is used.)
    This function is speed optimized.
    */

typedef struct
{
  brushless_speed   speed;
  brushless_position  position;
}
brushless;


 /** initialisation, also executes pwm_init */
extern void brushless_init(void);

/** sets a consign speed and torque 
    if you do not use the speed coarse limitation, please configure with BRUSHLESS_MAX_SPEED */
extern void brushless_0_set_parameters(brushless_speed speed, brushless_torque torque);
extern void brushless_1_set_parameters(brushless_speed speed, brushless_torque torque);

/** calculates the speed update info. To be called externally only if not internally, ie
    if the BRUSHLESS_MANAGE_EXTERNAL is set
    */
#ifdef BRUSHLESS_MANAGE_EXTERNAL
extern void brushless_speed_update_manage(void * dummy);
#endif

/** get current speed and position
    This function is very useful to get synchronous speed and torque info
*/
extern brushless brushless_0_get_mesures(void);
extern brushless brushless_1_get_mesures(void);

/**  sets the position counter */
extern void brushless_0_set_position(brushless_position p);
extern void brushless_1_set_position(brushless_position p);

/** registers an event function that triggers periodically, and synchronously with the speed measurement */
extern void brushless_0_register_periodic_event(void (*f)(brushless));
extern void brushless_1_register_periodic_event(void (*f)(brushless));



/** acess functions for the control system interface */


/** get speed function, compatible with control_system. 
    Argument is the  number of the adressed motor, which is casted to (void*) */
extern int32_t brushless_get_speed(void * );

/** get position function, compatible with control_system.
    Argument is the  number of the adressed motor, which is casted to (void*)  */
extern int32_t brushless_get_pos(void * );

/** set torque function, compatible with control_system.
    Argument is the  number of the adressed motor, which is casted to (void*) */
extern void brushless_set_torque(void *, int32_t torque);

/** set speed function, compatible with control_system.
    Argument is the  number of the adressed motor, which is casted to (void*) */
extern void brushless_set_speed(void *, int32_t speed);



#endif
