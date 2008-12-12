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
 *  Revision : $Id: pwm.h,v 1.12 2008-04-13 16:55:31 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Implementation for PWM
 */
/** \file pwm.h
 *  \brief Interface for the PWM module.
 *
 *  \todo Test the module.
 *
 *  \test No tests for the moment.
 *
 * This module provides functions for using a pwm 
 */

#ifndef _PWM_H_
#define _PWM_H_

#include <aversive.h>
#include <aversive/timers.h>
#include <aversive/parts.h>

#include <pwm_config.h>



/** PWM signs & sign ligne inversion */
#define PWM_NORMAL                           0x00 
#define PWM_REVERSE                          0x01
#define PWM_SIGN_INVERTED                    0x02
#define PWM_SIGNED                           0x04
#define PWM_SPECIAL_SIGN_MODE                0x08

/** value to be used for limiting inputs */
#define PWM_MAX ((1<< PWM_SIGNIFICANT_BITS)-1)
#define PWM_MIN (-PWM_MAX)


 /** global functions*/
extern void pwm_init(void);

/** apply a PWM.
 * \param data is a pointer that is casted in (uint8_t) to
 *        specify the number of the PWM.
 * \param value is the value of the pwm.
 */
extern void pwm_set(void * data, int32_t value); 


#if (defined PWM1A_NUM) && (defined PWM1A_ENABLED)
extern void pwm_init_1A(void);
extern void pwm_set_1A(int16_t value);
#endif // (defined PWM1A_NUM) && (defined PWM1A_ENABLED)

#if (defined PWM1B_NUM) && (defined PWM1B_ENABLED)
extern void pwm_init_1B(void);
extern void pwm_set_1B(int16_t value);
#endif // (defined PWM1B_NUM) && (defined PWM1B_ENABLED)

#if (defined PWM1C_NUM) && (defined PWM1C_ENABLED)
extern void pwm_init_1C(void);
extern void pwm_set_1C(int16_t value);
#endif // (defined PWM1C_NUM) && (defined PWM1C_ENABLED)

#if (defined PWM2_NUM) && (defined PWM2_ENABLED)
extern void pwm_init_2(void);
extern void pwm_set_2(int16_t value);
#endif // (defined PWM2_NUM) && (defined PWM2_ENABLED)

#if (defined PWM3A_NUM) && (defined PWM3A_ENABLED)
extern void pwm_init_3A(void);
extern void pwm_set_3A(int16_t value);
#endif // (defined PWM3A_NUM) && (defined PWM3A_ENABLED)

#if (defined PWM3B_NUM) && (defined PWM3B_ENABLED)
extern void pwm_init_3B(void);
extern void pwm_set_3B(int16_t value);
#endif // (defined PWM3B_NUM) && (defined PWM3B_ENABLED)

#if (defined PWM3C_NUM) && (defined PWM3C_ENABLED)
extern void pwm_init_3C(void);
extern void pwm_set_3C(int16_t value);
#endif // (defined PWM3C_NUM) && (defined PWM3C_ENABLED)


#endif // _PWM_H_
