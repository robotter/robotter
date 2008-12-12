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
 *  Revision : $Id: brushless_3phase_digital_hall_double_config.h,v 1.2 2007-03-04 13:53:46 zer0 Exp $
 *
 */

#ifndef BRUSHLESS_TYPE
#define BRUSHLESS_TYPE BRUSHLESS_DIGITAL_DOUBLE


/** a setting of 1 gives 6 steps per electrical turn 
    the number of electrical poles per mechanical revolution depends on your motor.
    Please consider that a value different from 1 rises the processor load ! so try to use 1
    */
#define BRUSHLESS_POSITION_PRECISION 1


typedef s16 brushless_speed;
typedef s32 brushless_position;

typedef s16 brushless_torque; // max value is that of the PWM


/** motor 0 connection definition */

/** inversion of sensors*/
//#define BRUSHLESS_0_SENSORS_INVERT

/** sensor  pull ups. This is recommended for safety */
//#define BRUSHLESS_0_SENSORS_PULL_UP_RESISTORS

/** sensors port definitions */
#define BRUSHLESS_0_SENSOR_1_PORT PORTA
#define BRUSHLESS_0_SENSOR_1_BIT  4
#define BRUSHLESS_0_SENSOR_2_PORT PORTA
#define BRUSHLESS_0_SENSOR_2_BIT  3
#define BRUSHLESS_0_SENSOR_3_PORT PORTA
#define BRUSHLESS_0_SENSOR_3_BIT  5

/** PWM definitions 
    Please activate the PWM synch in pwm.h if you use PWMs from separate timers
  */
#define BRUSHLESS_0_PWM_SET_1(value) pwm_set_1A(value)
#define BRUSHLESS_0_PWM_SET_2(value) pwm_set_1B(value)
#define BRUSHLESS_0_PWM_SET_3(value) pwm_set_1C(value)



/** total inversion of the motor behaviour, other configuration remains the same */
#define BRUSHLESS_0_INVERT


/** motor 1 connection definition */

/** inversion of sensors*/
//#define BRUSHLESS_1_SENSORS_INVERT

/** sensor  pull ups. This is recommended for safety */
//#define BRUSHLESS_1_SENSORS_PULL_UP_RESISTORS

/** sensors port definitions */
#define BRUSHLESS_1_SENSOR_1_PORT PORTA
#define BRUSHLESS_1_SENSOR_1_BIT  1
#define BRUSHLESS_1_SENSOR_2_PORT PORTA
#define BRUSHLESS_1_SENSOR_2_BIT  0
#define BRUSHLESS_1_SENSOR_3_PORT PORTA
#define BRUSHLESS_1_SENSOR_3_BIT  2

/** PWM definitions 
    Please activate the PWM synch in pwm.h if you use PWMs from separate timers
  */
#define BRUSHLESS_1_PWM_SET_1(value) pwm_set_3A(value)
#define BRUSHLESS_1_PWM_SET_2(value) pwm_set_3B(value)
#define BRUSHLESS_1_PWM_SET_3(value) pwm_set_3C(value)



/** total inversion of the motor behaviour, other configuration remains the same */
//#define BRUSHLESS_1_INVERT



/** this selects the timer overflow int to use
    please enter the timer number of one of the 6 PWMs
    for example,if one of your pwm is the 2A, enter "2" here
    */
#define BRUSHLESS_TIMER  1

/** following  parameters calculateas such : 
    
    fsample = fpwm / PWM_TO_SAMPLE_DIVISOR
    
    fevent = fsample / SAMPLE_TO_EVENT_DIVISOR
    
    it is recommended to have fsample at approx 10 kHz max, less if you plan a slow motor
    SAMPLE_TO_EVENT_DIVISOR should be at least 100, or more, so that the event is slow enough for your need
    
    these parameters should be carefully chosen to not overload the processor
    
  */
  
/** max 255  */
#define BRUSHLESS_PWM_TO_SAMPLE_DIVISOR   4 // PWM9 bits, quartz 16 MHz  >> 7.8 kHz
/** max 65535, min recommended 100 */
#define BRUSHLESS_SAMPLE_TO_EVENT_DIVISOR (78*1) // environ 10ms


/** max speed, is in general to BRUSHLESS_SAMPLE_TO_EVENT_DIVISOR
    but can be adapted to your needs, if you need to go further down with the speed */
#define BRUSHLESS_MAX_SPEED   BRUSHLESS_SAMPLE_TO_EVENT_DIVISOR 



//#define LOADTEST  // define this to test the maximum processor load !

//#define ASMHEADER // optimized PWM division : particularly useful with 8 bit timers ! Using this can display one warning


#endif // BRUSHLESS_TYPE


