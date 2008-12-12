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
 *  Revision : $Id: scheduler_del.c,v 1.3 2007-05-24 13:08:46 zer0 Exp $
 *
 */

#include <aversive.h>
#include <scheduler_config.h>
#include <scheduler_private.h>

void scheduler_del_event(int8_t i)
{
	uint8_t flags;
	
	/* if scheduled, it will be deleted after execution.
	 * if active, free it. 
	 * else do nothing. */
	IRQ_LOCK(flags);
	if (g_tab_event[i].state == SCHEDULER_EVENT_SCHEDULED) {
		g_tab_event[i].state = SCHEDULER_EVENT_DELETING;
	}
	else if (g_tab_event[i].state == SCHEDULER_EVENT_ACTIVE) {
		g_tab_event[i].state = SCHEDULER_EVENT_FREE;
	}
	IRQ_UNLOCK(flags);
}
