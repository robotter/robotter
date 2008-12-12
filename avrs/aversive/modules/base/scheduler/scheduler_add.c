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
 *  Revision : $Id: scheduler_add.c,v 1.3 2007-05-24 13:08:46 zer0 Exp $
 *
 */

#include <aversive.h>
#include <scheduler_config.h>
#include <scheduler_private.h>

/** get a free event, mark it as allocated and return its index, or -1
 *  if not found. */
static inline int8_t
scheduler_alloc_event(void)
{
	uint8_t i;
	uint8_t flags;
	
	for (i=0 ; i<SCHEDULER_NB_MAX_EVENT ; i++) {
		IRQ_LOCK(flags);
		if( g_tab_event[i].state == SCHEDULER_EVENT_FREE ) {
			g_tab_event[i].state = SCHEDULER_EVENT_ALLOCATED;
			IRQ_UNLOCK(flags);
			return i;
		}
		IRQ_UNLOCK(flags);
	}
	return -1;
}


/** Alloc an event, and fill its field, then mark it as active.
 *  return its index in the table, or -1 if no evt is available */
int8_t 
scheduler_add_event(uint8_t unicity, void (*f)(void *), 
			   void * data, uint16_t period, 
			   uint8_t priority) {
	int8_t i;
	uint8_t flags;
	
	i = scheduler_alloc_event();
	if ( i == -1 )
		return -1;

	if(!unicity)
		g_tab_event[i].period = period ;
	else
		g_tab_event[i].period = 0 ;
	g_tab_event[i].current_time = period ;
	g_tab_event[i].priority = priority ;
	g_tab_event[i].f = f;
	g_tab_event[i].data = data;
	
	IRQ_LOCK(flags);
	g_tab_event[i].state = SCHEDULER_EVENT_ACTIVE;
	IRQ_UNLOCK(flags);

	return i;
}
