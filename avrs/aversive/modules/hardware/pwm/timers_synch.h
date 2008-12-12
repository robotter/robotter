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
 *  Revision : $Id: timers_synch.h,v 1.2 2006-02-28 00:13:10 zer0 Exp $
 *
 */


/** \file timers_synch.c
 *  \brief this code synchronizes the timers in order to optain synchronous PWMs
 *
 *  \todo Test this function on various uC
 *  \todo modify if there exists other prescaler configurations
 *
 *  \test This feature is not 100% shure for the moment, but has been tested on M32 and M128
 *
 *
 * this code synchronizes the timers in order to optain synchronous PWMs,
 * such a feature can be used for driving 3-phase motors with PWMS from different timers
 * 
 * 
 * to synch PWMs you need to enshure that the timers have same prescales,
 * and the same PWM mode
 * 
 * There is one little side effect : if there are common prescalers in your controller they will all be reset
 */


#ifndef _PWM_SYNCH_
#define _PWM_SYNCH_


#if ( (defined TIMER0_SYNCH) || (defined TIMER1_SYNCH) || (defined TIMER2_SYNCH) || (defined TIMER3_SYNCH) )
extern void pwm_synch(void);
#endif // ( (defined TIMER0_SYNCH) || (defined TIMER1_SYNCH) || (defined TIMER2_SYNCH) || (defined TIMER3_SYNCH) )

#endif // _PWM_SYNCH_
