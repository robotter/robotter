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
 *  Revision : $Id: timer_init.c,v 1.4 2009-03-15 21:51:19 zer0 Exp $
 *
 */

#include <aversive/timers.h>
#include <timer.h>
#include <timer_intr.h>
#include <timer_prescaler.h>

#include <timer_config.h>

/** Init of all timers with static configutaion (see timer_config.h) */
void timer_init(void)
{
	uint8_t flags;
	
	IRQ_LOCK(flags);
	timer_intr_init();

#if defined TIMER0_ENABLED && defined TIMER0_AVAILABLE
	CS00_REG = __timer0_div_to_reg(TIMER0_PRESCALER_DIV) << CS00 ;
	TCNT0 = 0;
#endif
#if defined TIMER1_ENABLED && defined TIMER1_AVAILABLE
	CS10_REG = __timer1_div_to_reg(TIMER1_PRESCALER_DIV) << CS10 ;
	TCNT1 = 0;
#endif
#if defined TIMER2_ENABLED && defined TIMER2_AVAILABLE
	CS20_REG = __timer2_div_to_reg(TIMER2_PRESCALER_DIV) << CS20 ;
	TCNT2 = 0;
#endif
#if defined TIMER3_ENABLED && defined TIMER3_AVAILABLE
	CS30_REG = __timer3_div_to_reg(TIMER3_PRESCALER_DIV) << CS30 ;
	TCNT3 = 0;
#endif
#if defined TIMER4_ENABLED && defined TIMER4_AVAILABLE
	CS40_REG = __timer4_div_to_reg(TIMER4_PRESCALER_DIV) << CS40 ;
	TCNT4 = 0;
#endif
#if defined TIMER5_ENABLED && defined TIMER5_AVAILABLE
	CS50_REG = __timer5_div_to_reg(TIMER5_PRESCALER_DIV) << CS50 ;
	TCNT5 = 0;
#endif
	IRQ_UNLOCK(flags);
}
