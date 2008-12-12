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
 *  Revision : $Id: scheduler.c,v 1.12 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <aversive/parts.h>
#include <aversive.h>

#include <scheduler.h>
#include <scheduler_private.h>
#include <scheduler_config.h>


/* this file is compiled for AVR version only */

/** declared in scheduler_host.c in case of host version */
struct event_t g_tab_event[SCHEDULER_NB_MAX_EVENT];


void scheduler_init(void)
{
	memset(g_tab_event, 0, sizeof(g_tab_event));

#ifdef CONFIG_MODULE_SCHEDULER_USE_TIMERS
	SCHEDULER_TIMER_REGISTER();
#endif

#ifdef CONFIG_MODULE_SCHEDULER_TIMER0
	/* activation of corresponding interrupt */
	sbi(TIMSK, TOIE0); 

	TCNT0 = 0; 
	TCCR0 = SCHEDULER_CK; 
#endif
}


#ifdef CONFIG_MODULE_SCHEDULER_TIMER0
SIGNAL(SIG_OVERFLOW0)
{
	scheduler_interrupt();
}
#endif /* CONFIG_MODULE_SCHEDULER_USE_TIMERS */
