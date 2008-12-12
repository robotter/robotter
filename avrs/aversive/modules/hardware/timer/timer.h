/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2006)
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
 *  Revision : $Id: timer.h,v 1.3 2007-05-24 13:08:48 zer0 Exp $
 *
 */

/** 
 *  Olivier MATZ - Droids-corp 2006
 * 
 *  \brief Interface of the timer module
 * 
 *  The objective of this module is to provide a simple and portable
 *  interface to the hardware timers of AVR devices.
 */

#ifndef _TIMER_H_
#define _TIMER_H_

#include <aversive/parts.h>

#include <aversive.h>
#include <timer_declarations.h>
#include <timer_definitions.h>
#include <timer_prescaler.h>

#include <timer_config.h>


/** Init of all timers with static configutaion (see timer_config.h) */
void timer_init(void);

/* declare all timer functions (see timer_declarations.h) */

#if defined TIMER0_ENABLED && defined TIMER0_AVAILABLE
DECLARE_TIMER_FUNCS(0)
#endif

#if defined TIMER1_ENABLED && defined TIMER1_AVAILABLE
DECLARE_TIMER_FUNCS(1)
#endif

#if defined TIMER2_ENABLED && defined TIMER2_AVAILABLE
DECLARE_TIMER_FUNCS(2)
#endif

#if defined TIMER3_ENABLED && defined TIMER3_AVAILABLE
DECLARE_TIMER_FUNCS(3)
#endif

/* define static inline functions (see timer_definitions.h) */

#if defined TIMER0_ENABLED && defined TIMER0_AVAILABLE
DEFINE_TIMER_US_CONVERSIONS(0)
#endif

#if defined TIMER1_ENABLED && defined TIMER1_AVAILABLE
DEFINE_TIMER_US_CONVERSIONS(1)
#endif

#if defined TIMER2_ENABLED && defined TIMER2_AVAILABLE
DEFINE_TIMER_US_CONVERSIONS(2)
#endif

#if defined TIMER3_ENABLED && defined TIMER3_AVAILABLE
DEFINE_TIMER_US_CONVERSIONS(3)
#endif

#endif
