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
 *  Revision : $Id: timer_intr.c,v 1.3 2007-05-24 13:08:48 zer0 Exp $
 *
 */

#include <stdint.h>
#include <string.h>

#include <aversive/timers.h>

#include <timer.h>
#include <timer_definitions.h>
#include <timer_intr.h>

#include <timer_config.h>

volatile timer_callback_t timer_OV_callback_table[SIG_OVERFLOW_TOTAL_NUM];
volatile timer_callback_t timer_OC_callback_table[SIG_OUTPUT_COMPARE_TOTAL_NUM];

/*************************/

#if defined TIMER0_ENABLED && defined SIG_OVERFLOW0
DEFINE_OV_INTR(SIG_OVERFLOW0)
#endif

#if defined TIMER0_ENABLED && defined SIG_OUTPUT_COMPARE0
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE0)
#endif

/*************************/

#if defined TIMER1_ENABLED && defined SIG_OVERFLOW1
DEFINE_OV_INTR(SIG_OVERFLOW1)
#endif

#if defined TIMER1A_ENABLED && defined SIG_OUTPUT_COMPARE1A
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE1A)
#endif

#if defined TIMER1B_ENABLED && defined SIG_OUTPUT_COMPARE1B
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE1B)
#endif

#if defined TIMER1C_ENABLED && defined SIG_OUTPUT_COMPARE1C
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE1C)
#endif

/*************************/

#if defined TIMER2_ENABLED && defined SIG_OVERFLOW2
DEFINE_OV_INTR(SIG_OVERFLOW2)
#endif

#if defined TIMER2_ENABLED && defined SIG_OUTPUT_COMPARE2
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE2)
#endif

/*************************/

#if defined TIMER3_ENABLED && defined SIG_OVERFLOW3
DEFINE_OV_INTR(SIG_OVERFLOW3)
#endif

#if defined TIMER3A_ENABLED && defined SIG_OUTPUT_COMPARE3A
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE3A)
#endif

#if defined TIMER3B_ENABLED && defined SIG_OUTPUT_COMPARE3B
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE3B)
#endif

#if defined TIMER3C_ENABLED && defined SIG_OUTPUT_COMPARE3C
DEFINE_OC_INTR(SIG_OUTPUT_COMPARE3C)
#endif

/*************************/

void timer_intr_init(void)
{
	memset((void*)timer_OV_callback_table, 0, sizeof(timer_OV_callback_table));
	memset((void*)timer_OC_callback_table, 0, sizeof(timer_OC_callback_table));
}


