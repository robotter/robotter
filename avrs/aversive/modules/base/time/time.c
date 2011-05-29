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
 *  Revision : $Id: time.c,v 1.5 2008-01-08 20:05:02 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Implementation of the time module
 */

/** \file time.c
 *  \brief Implementation of the TIME module.
 *
 *
 *  This module can be used to get a human readable time. It uses the
 *  scheduler module. Its goal is not to be very precise, but just
 *  simple to use.
 */


/**********************************************************/

#include <stdlib.h>
#include <scheduler.h>

#include <time.h>
#include <time_config.h>

/**********************************************************/

#define NB_SCHEDULER_UNIT ( ((float)(TIME_PRECISION)) / SCHEDULER_UNIT_FLOAT )
#define NB_SCHEDULER_UNIT_NOT_NULL (NB_SCHEDULER_UNIT == 0 ? 1.0 : NB_SCHEDULER_UNIT)

static volatile time_h t;

static volatile microseconds us2; // this one overflows naturally


void time_increment(void * dummy);

/**********************************************************/

void time_init(uint8_t priority)
{
  time_reset();
  scheduler_add_periodical_event_priority(time_increment,NULL,
                                          (int)NB_SCHEDULER_UNIT_NOT_NULL, priority);
}

/**********************************************************/

seconds time_get_s(void)
{
  uint16_t tmp;
  uint8_t flags;
  IRQ_LOCK(flags);
  tmp = t.s;
  IRQ_UNLOCK(flags);
  return tmp;
}

/**********************************************************/

microseconds time_get_us(void)
{
  microseconds tmp;
  uint8_t flags;
  IRQ_LOCK(flags);
  tmp = t.us;
  IRQ_UNLOCK(flags);
  return tmp;
}

/**********************************************************/

microseconds time_get_us2(void)
{
  microseconds tmp;
  uint8_t flags;
  IRQ_LOCK(flags);
  tmp = us2;
  IRQ_UNLOCK(flags);
  return tmp;
}

/**********************************************************/

time_h time_get_time(void)
{
  time_h tmp;
  uint8_t flags;
  IRQ_LOCK(flags);
  tmp = t;
  IRQ_UNLOCK(flags);
  return tmp;
}

/**********************************************************/

void time_reset(void)
{
  uint8_t flags;
  IRQ_LOCK(flags);
  t.us = 0;
  t.s = 0;
  IRQ_UNLOCK(flags);
}

/**********************************************************/

void time_set(seconds s, microseconds us)
{
  uint8_t flags;
  IRQ_LOCK(flags);
  t.us = us;
  t.s = s;
  IRQ_UNLOCK(flags);
}

/**********************************************************/

void time_wait_ms(uint16_t ms)
{
	microseconds target = time_get_us2() + (uint32_t)ms*1000;
	while(time_get_us2() < target);
}

/**********************************************************/
/* private */
/**********************************************************/

void time_increment(void * dummy)
{
  uint8_t flags;
	/* XXX we should lock only when writing */
  IRQ_LOCK(flags); // for reading correct time inside an interrupt

  us2 += ((int)NB_SCHEDULER_UNIT_NOT_NULL * SCHEDULER_UNIT);
  t.us += ((int)NB_SCHEDULER_UNIT_NOT_NULL * SCHEDULER_UNIT);
  while (t.us > 1000000) {
      t.s ++;
      t.us -= 1000000;
  }

  IRQ_UNLOCK(flags);
}
