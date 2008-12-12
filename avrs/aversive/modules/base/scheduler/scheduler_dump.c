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
 *  Revision : $Id: scheduler_dump.c,v 1.3 2007-05-24 13:08:46 zer0 Exp $
 *
 */

#include <stdio.h>

#include <aversive.h>
#include <scheduler_config.h>
#include <scheduler_private.h>

/** Dump the event structure table */
void
dump_events(void)
{
	int i;

	printf("== Dump events ==\n");
	for (i=0 ; i<SCHEDULER_NB_MAX_EVENT ; i++) {
		printf("  [%d]@%p : ", i, &g_tab_event[i]);
		printf("  state=%d", g_tab_event[i].state);
		if (g_tab_event[i].state >= SCHEDULER_EVENT_ACTIVE ) {
			printf(", ");
			printf("f=%p, ", g_tab_event[i].f);
			printf("data=%p, ", g_tab_event[i].data);
			printf("period=%d, ", g_tab_event[i].period);
			printf("current_time=%d, ", g_tab_event[i].current_time);
			printf("priority=%d, ", g_tab_event[i].priority);
			printf("list_next=%p\n", SLIST_NEXT(&g_tab_event[i], next));
		}
		else {
			printf("\n");
		}
	}
}


