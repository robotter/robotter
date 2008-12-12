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
 *  Revision : $Id: scheduler_interrupt.c,v 1.4 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <stdlib.h>

#include <aversive.h>
#include <scheduler_config.h>
#include <scheduler_private.h>

/** priority of the running event */
static volatile uint8_t priority_running=0;

/** number of imbricated scheduler interruptions */
static volatile uint8_t nb_stacking=0;
	

/** 
 *  this function is called from a timer interruption. If an event has
 *  to be scheduled, it will execute the fonction (IRQ are allowed
 *  during the execution of the function). This interruption can be
 *  interrupted by itself too, in this case only events with a higher
 *  priority can be scheduled.
 * 
 *  We assume that this function is called from a SIGNAL(), with
 *  global interrupt flag disabled --> that's why we can use cli() and
 *  sei() instead of IRQ_LOCK(flags).
 */
void
scheduler_interrupt(void)
{
	uint8_t i;
	uint8_t priority_tmp;
	SLIST_HEAD(event_list_t, event_t) event_list;
	struct event_t *e, *next_e, *prev_e=NULL;

	/* maximize the number of imbrications */
	if (nb_stacking >= SCHEDULER_NB_STACKING_MAX) {
		return;
	}
	nb_stacking ++;
	sei();

	SLIST_INIT(&event_list);

	/* browse events table to determine which events should be
	 * scheduled */
	for (i=0 ; i<SCHEDULER_NB_MAX_EVENT ; i++) {
		cli();

		/* the event is already present in a schedule list,
		 * only update its current time until it reaches 1 */
		if (g_tab_event[i].state == SCHEDULER_EVENT_SCHEDULED &&
		    g_tab_event[i].current_time > 1) {
			g_tab_event[i].current_time --;
			sei();
			continue;
		}

		/* nothing to do with other unactive events */
		if (g_tab_event[i].state != SCHEDULER_EVENT_ACTIVE) {
			sei();
			continue;
		}

		/* decrement current time (we know it is >0 if it is
		 * in SCHEDULER_EVENT_ACTIVE state */
		g_tab_event[i].current_time --;
		
		/* don't need to schedule now */
		if ( g_tab_event[i].current_time != 0 ) {
			sei();
			continue;
		}
		
		/* time to schedule, but priority is too low,
		 * delay it */
		if (g_tab_event[i].priority <= priority_running) {
			g_tab_event[i].current_time = 1;
			sei();
			continue;
		}

		/* reload event (it is 0 if it is non-periodical) */
		g_tab_event[i].current_time = g_tab_event[i].period;

		/* schedule it */
		g_tab_event[i].state = SCHEDULER_EVENT_SCHEDULED;
		sei();

		/* insert it in the list (list is ordered).
		   this should be quite fast since the list is
		   expected to be small. */

		/* easy case : list is empty */
		if (SLIST_FIRST(&event_list) == NULL) {
			SLIST_INSERT_HEAD(&event_list, &g_tab_event[i], next);
			continue;
		}

		/* harder : find the good place in list */
		SLIST_FOREACH(e, &event_list, next) {
			next_e = SLIST_NEXT(e, next);
			if (next_e == NULL || 
			    g_tab_event[i].priority >= next_e->priority) {
				SLIST_INSERT_AFTER(e, &g_tab_event[i], next);
				break;
			}
		}
	}

	/* only called if SCHEDULER_DEBUG is defined */
	DUMP_EVENTS();

	cli();
	priority_tmp = priority_running;

	SLIST_FOREACH(e, &event_list, next) {
		/* remove previous elt from list */
		if (prev_e)
			SLIST_NEXT(prev_e, next) = NULL;

		/* set running priority */
		priority_running = e->priority;
		sei();

		/* the following fields (f and data) can't be modified
		 * while an event is in state SCHEDULED */
		e->f(e->data);

		cli();
		/* free it if it is single (non-periodical) */
		if (!e->period) {
			e->state = SCHEDULER_EVENT_FREE;
		}

		/* free event if someone asked for deletion during
		 * schedule */
		if (e->state == SCHEDULER_EVENT_DELETING) {
			e->state = SCHEDULER_EVENT_FREE;
		}
		
		/* end of schedule, mark it as active */
		if (e->state == SCHEDULER_EVENT_SCHEDULED) {
			e->state = SCHEDULER_EVENT_ACTIVE;
		}

		prev_e = e;
	}
	/* remove previous elt from list */
	if (prev_e)
		SLIST_NEXT(prev_e, next) = NULL;

	priority_running = priority_tmp;
	nb_stacking--;
}
