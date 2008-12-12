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
 *  Revision : $Id: scheduler_host.c,v 1.6 2007-05-01 15:35:50 zer0 Exp $
 *
 */

#include <stdio.h>
#include <string.h>

#include <scheduler_config.h>
#include <scheduler_private.h>

/* this file is compiled for host version only */

/** declared in scheduler.c in case of AVR version */
struct event_t g_tab_event[SCHEDULER_NB_MAX_EVENT];

/** init all global data */
void scheduler_init(void)
{
	memset(g_tab_event, 0, sizeof(g_tab_event));
	printf("Scheduler init (host). Warning, you have to call\n"
	       "scheduler_interrupt() by yourself on host version\n");
	DUMP_EVENTS();
}

