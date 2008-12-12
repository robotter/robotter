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
 *  Revision : $Id: scheduler_private.h,v 1.5 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#ifndef _SCHEDULER_PRIVATE_H_
#define _SCHEDULER_PRIVATE_H_

/* sanity checks */
#if _SCHEDULER_CONFIG_VERSION_ != 4
#warning "You are using an old version of scheduler_config.h file"
#warning "_SCHEDULER_CONFIG_VERSION_ is != 4"
#warning "Look in modules/base/scheduler/config directory to import changes"
#warning "You should define SCHEDULER_NB_STACKING_MAX and SCHEDULER_CK"
#endif

#include <stdint.h>

#include <aversive/queue.h>

/** state of events */
enum event_state_t {
	SCHEDULER_EVENT_FREE,      /**< event is free */
	SCHEDULER_EVENT_ALLOCATED, /**< a place is reserved in the tab */
	SCHEDULER_EVENT_ACTIVE,    /**< fields are filled correctly, event can be scheduled */
	SCHEDULER_EVENT_SCHEDULED, /**< event is inserted in a list to be running soon, or is running */
	SCHEDULER_EVENT_DELETING,  /**< event is scheduled but we asked to delete it */
};

/** The event structure */
struct event_t
{
	void (*f)(void *);        /**< a pointer to the scheduled function */
	void * data;              /**< a pointer to the data parameters */
	uint16_t period;          /**< interval between each call */
	uint16_t current_time;    /**< time remaining before next call */
	uint8_t priority;         /**< if many events occur at the
				   same time, the first to be executed
				   will be the one with the highest
				   value of priority */
	enum event_state_t state; /**< (scheduled, active, allocated, free, deleting) */

        SLIST_ENTRY(event_t) next;
};

extern struct event_t g_tab_event[SCHEDULER_NB_MAX_EVENT];


/* define dump_events() if we are in debug mode */
#ifdef SCHEDULER_DEBUG
#define DUMP_EVENTS() dump_events()
void dump_events(void);

#else /* SCHEDULER_DEBUG */
#define DUMP_EVENTS() do {} while(0)

#endif /* SCHEDULER_DEBUG */

#endif /* _SCHEDULER_PRIVATE_H_ */
