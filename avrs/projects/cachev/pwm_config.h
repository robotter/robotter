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
 *  Revision : $Id: pwm_config.h,v 1.4 2008-01-08 20:05:04 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Config for PWM
 */
/** \file pwm_config.h
    \brief Module to operate all PWM outputs

    \test not tested
 
*/


#ifndef _PWM_CONFIG_
#define _PWM_CONFIG_

#define _PWM_CONFIG_VERSION_ 2

/* Which PWM are enabled ? */
#define PWM0_ENABLED
#define PWM1A_ENABLED
//#define PWM1B_ENABLED
//#define PWM1C_ENABLED
#define PWM2_ENABLED
//#define PWM3A_ENABLED
//#define PWM3B_ENABLED
//#define PWM3C_ENABLED


/** max value for PWM entry, default 12 bits > 4095 */
#define PWM_SIGNIFICANT_BITS 12

// timer configs (not all possibilities can be used at this time)
#define TIMER0_MODE     TIMER_8_MODE_PWM
#define TIMER0_PRESCALE TIMER0_PRESCALER_DIV_64

#define TIMER1_MODE     TIMER_16_MODE_PWM_10
#define TIMER1_PRESCALE TIMER1_PRESCALER_DIV_8

#define TIMER2_MODE     TIMER_8_MODE_PWM
#define TIMER2_PRESCALE TIMER1_PRESCALER_DIV_64

#define TIMER3_MODE     TIMER_16_MODE_PWM_10
#define TIMER3_PRESCALE TIMER3_PRESCALER_DIV_8

/** config for pwm and signs

The pwm mode is defined as follows :
you can add flags like the ones who follow : 

PWM_NORMAL            : normal pwm, just to put a value if nothing else is needed
PWM_REVERSE           : invert pwm output, not sign

PWM_SIGNED            : activate the sign output on a port (see config)
PWM_SIGN_INVERTED     : invert sign output
PWM_SPECIAL_SIGN_MODE : if defined, the pwm is always near 0 for low values, 
                        else negative low values are near 100%

the values of PWMxx_SIGN_PORT and PWMxx_SIGN_BIT are simply ignored if the PWM is not signed

if you need for example a PWM1A with special sign mode you configure like this : 

#define PWM1A_MODE       (PWM_SIGNED | PWM_SPECIAL_SIGN_MODE)
#define PWM1A_SIGN_PORT  PORTB
#define PWM1A_SIGN_BIT   2

*/

// for motor 1
#define PWM1A_MODE       (PWM_SIGNED)
#define PWM1A_SIGN_PORT  PORTC
#define PWM1A_SIGN_BIT   6
// for motor2
#define PWM0_MODE       (PWM_SIGNED)
#define PWM0_SIGN_PORT  PORTC
#define PWM0_SIGN_BIT   7
// for motor3
#define PWM2_MODE       (PWM_SIGNED)
#define PWM2_SIGN_PORT  PORTD
#define PWM2_SIGN_BIT   6

/** 
PWM synchronization.

this makes the PWMs synchronized.
just activate the timers you want to synchronize

to synch PWMs you need to enshure that the timers have same prescales. This is verified.
you need also to enshure that the PWM mode is the same, this is NOT verified !!
especially, for syncing 8 and 16 bit timers, the PWM mode should be 8 bit.


side effect : on some controllers prescalers are shared, so unwanted prescalers can be reset.

This feature is not 100% shure for the moment, but has been tested on M32 and M128
*/

//#define TIMER0_SYNCH
//#define TIMER1_SYNCH
//#define TIMER2_SYNCH
//#define TIMER3_SYNCH
#endif

