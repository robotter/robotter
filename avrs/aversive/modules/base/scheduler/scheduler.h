/*  
 *  Copyright Droids Corporation (2007)
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
 *  Revision : $Id: scheduler.h,v 1.12 2008-01-08 20:05:02 zer0 Exp $
 *
 */

/* Olivier MATZ <zer0@droids-corp.org>
 * Interface of the SCHEDULER Module
 */

/** \file scheduler.h
 *
 * This module provides a function scheduler. You can call
 * scheduler_add_event for adding a function to the scheduler, and
 * specifying what interval between each call. During the execution of
 * the function, interrupts are masked !! So use this module with
 * caution (small functions) for avoiding problems.
 *
 * Functions with a high priority value will be call before others
 * (default is 128).
 *
 * This module uses Timer 0
 */


#ifndef _SCHEDULER_H_
#define _SCHEDULER_H_

#include <aversive.h>

#ifdef CONFIG_MODULE_SCHEDULER_USE_TIMERS
#include <timer.h>
#endif /* CONFIG_MODULE_SCHEDULER_USE_TIMERS */

#include <scheduler_config.h>

#ifdef CONFIG_MODULE_SCHEDULER_USE_TIMERS
#if SCHEDULER_TIMER_NUM == 0
#define SCHEDULER_TIMER_REGISTER()  timer0_register_OV_intr(scheduler_interrupt)
#define SCHEDULER_CLOCK_PRESCALER timer0_get_prescaler_div()
#ifdef TCNT0H
#define SCHEDULER_TIMER_BITS 16
#else
#define SCHEDULER_TIMER_BITS 8
#endif

#elif SCHEDULER_TIMER_NUM == 1
#define SCHEDULER_TIMER_REGISTER()  timer1_register_OV_intr(scheduler_interrupt)
#define SCHEDULER_CLOCK_PRESCALER timer1_get_prescaler_div()
#ifdef TCNT1H
#define SCHEDULER_TIMER_BITS 16
#else
#define SCHEDULER_TIMER_BITS 8
#endif

#elif SCHEDULER_TIMER_NUM == 2
#define SCHEDULER_TIMER_REGISTER()  timer2_register_OV_intr(scheduler_interrupt)
#define SCHEDULER_CLOCK_PRESCALER timer2_get_prescaler_div()
#ifdef TCNT2H
#define SCHEDULER_TIMER_BITS 16
#else
#define SCHEDULER_TIMER_BITS 8
#endif

#elif SCHEDULER_TIMER_NUM == 3
#define SCHEDULER_TIMER_REGISTER()  timer3_register_OV_intr(scheduler_interrupt)
#define SCHEDULER_CLOCK_PRESCALER timer3_get_prescaler_div()
#ifdef TCNT3H
#define SCHEDULER_TIMER_BITS 16
#else
#define SCHEDULER_TIMER_BITS 8
#endif

#else
#error "Bad SCHEDULER_TIMER_NUM value in config file"
#endif

#endif /* CONFIG_MODULE_SCHEDULER_USE_TIMERS */

#ifdef CONFIG_MODULE_SCHEDULER_TIMER0
#define SCHEDULER_TIMER_BITS 8
#endif /* CONFIG_MODULE_SCHEDULER_TIMER0 */

#ifndef CONFIG_MODULE_SCHEDULER_MANUAL

/** TIME_UNIT is the number of microseconds between each interruption
 * if the prescaler equals 1 */
#if SCHEDULER_TIMER_BITS == 8
#define TIMER_UNIT_FLOAT ( 256000000.0 / (double)(CONFIG_QUARTZ) )
#else
#define TIMER_UNIT_FLOAT ( 65536000000.0 / (double)(CONFIG_QUARTZ) )
#endif

/** SCHEDULER_UNIT is the number of microseconds between each
 *  scheduler interruption. We can use it like this :
 *    scheduler_add_periodical_event(f, 1000L/SCHEDULER_UNIT);
 *  The function f will be called every ms. 
 */
#define SCHEDULER_UNIT_FLOAT ( TIMER_UNIT_FLOAT * (double)SCHEDULER_CLOCK_PRESCALER )
#define SCHEDULER_UNIT ( (unsigned long) SCHEDULER_UNIT_FLOAT )

#endif /* ! CONFIG_MODULE_SCHEDULER_MANUAL */



#define SCHEDULER_PERIODICAL 0
#define SCHEDULER_SINGLE 1

#define SCHEDULER_DEFAULT_PRIORITY 128


/** Initialisation of the module */
void scheduler_init(void);

/** 
 * Add an event to the event table.
 * Return the id of the event on succes and -1 on error
 * You can use static inline funcs below for simpler use.
 */
int8_t scheduler_add_event(uint8_t unicity, void (*f)(void *), void * data, uint16_t period, uint8_t priority);


/** 
 * Add a single event to the event table, specifying the priority
 */
static inline int8_t scheduler_add_single_event_priority(void (*f)(void *), void * data, uint16_t period, uint8_t priority)
{
	return scheduler_add_event(SCHEDULER_SINGLE, f, data, period, priority);
}

/** 
 * Add a periodical event to the event table, specifying the priority
 */
static inline int8_t scheduler_add_periodical_event_priority(void (*f)(void *), void * data, uint16_t period, uint8_t priority)
{
	return scheduler_add_event(SCHEDULER_PERIODICAL, f, data, period, priority);
}

/** 
 * Add a single event to the event table, with the default priority
 */
static inline int8_t scheduler_add_single_event(void (*f)(void *), void * data, uint16_t period)
{
	return scheduler_add_event(SCHEDULER_SINGLE, f, data, period, SCHEDULER_DEFAULT_PRIORITY);
}

/** 
 * Add a periodical event to the event table, with the default priority
 */
static inline int8_t scheduler_add_periodical_event(void (*f)(void *), void * data, uint16_t period)
{
	return scheduler_add_event(SCHEDULER_PERIODICAL, f, data, period, SCHEDULER_DEFAULT_PRIORITY);
}

/**
 * Dels an event from the table by its ID. If there is no event,
 * nothing is done.
 */
int8_t scheduler_del_event(int8_t num);

/** Function called by the interruption. It is public in case of host
 *  version, because you have to call it by hand. In AVR version, you
 *  don't have to do anything with this function, it is called
 *  automatilcally by the timer interruption. */
void scheduler_interrupt(void);

#endif
