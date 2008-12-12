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
 *  Revision : $Id: brushless_config.h,v 1.2 2007-03-04 13:53:45 zer0 Exp $
 *
 */

#ifndef BRUSHLESS_TYPE
#define BRUSHLESS_TYPE BRUSHLESS_DIGITAL


/** a setting of 1 gives 6 steps per electrical turn 
    the number of electrical poles per mechanical revolution depends on your motor.
    Please consider that a value different from 1 rises the processor load ! so try to use 1
    */
#define BRUSHLESS_POSITION_PRECISION 1


typedef int16_t brushless_speed;
typedef int32_t brushless_position;

typedef int16_t brushless_torque; // max value is that of the PWM


/** motor connection definition */

/** inversion of sensors*/
#define BRUSHLESS_SENSORS_INVERT

/** sensor  pull ups. This is recommended for safety */
//#define BRUSHLESS_SENSORS_PULL_UP_RESISTORS

/** sensors port definitions */
#define BRUSHLESS_SENSOR_1_PORT PORTA
#define BRUSHLESS_SENSOR_1_BIT  0
#define BRUSHLESS_SENSOR_2_PORT PORTA
#define BRUSHLESS_SENSOR_2_BIT  1
#define BRUSHLESS_SENSOR_3_PORT PORTA
#define BRUSHLESS_SENSOR_3_BIT  2

/** PWM definitions 
    Please activate the PWM synch in pwm.h if you use PWMs from separate timers
  */
#define BRUSHLESS_PWM_SET_1(value) pwm_set_1A(value)
#define BRUSHLESS_PWM_SET_2(value) pwm_set_1B(value)
#define BRUSHLESS_PWM_SET_3(value) pwm_set_2(value)

/** this selects the timer overflow int to use
    please enter the timer number of one of the 3 PWMs
    for example,if one of your pwm is the 2A, enter "2" here
    */
#define BRUSHLESS_TIMER  1



/** total inversion of the motor behaviour, other configuration remains the same */
#define BRUSHLESS_INVERT

/** following  parameters calculateas such : 
    
    fsample = fpwm / PWM_TO_SAMPLE_DIVISOR
    
    fevent = fsample / SAMPLE_TO_EVENT_DIVISOR
    
    it is recommended to have fsample at approx 10 kHz max, less if you plan a slow motor
    SAMPLE_TO_EVENT_DIVISOR should be at least 100, or more, so that the event is slow enough for your need
    
    these parameters should be carefully chosen to not overload the processor
    
  */
  
/** max 255  */
#define BRUSHLESS_PWM_TO_SAMPLE_DIVISOR   3
/** max 65535, min recommended 100 */
#define BRUSHLESS_SAMPLE_TO_EVENT_DIVISOR 10000 // 1,041s with a 8 MHz quartz


/** max speed, is in general to BRUSHLESS_SAMPLE_TO_EVENT_DIVISOR
    but can be adapted to your needs, if you need to go further down with the speed */
#define BRUSHLESS_MAX_SPEED   BRUSHLESS_SAMPLE_TO_EVENT_DIVISOR 




#endif // BRUSHLESS_TYPE 
