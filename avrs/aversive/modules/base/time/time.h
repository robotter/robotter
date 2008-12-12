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
 *  Revision : $Id: time.h,v 1.4 2007-05-24 13:08:46 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Interface of the time module
 */

/**
 *  This module can be used to get a human readable time. It uses the
 *  scheduler module. Its goal is not to be very precise, but just
 *  simple to use.  provides two timers: one in s and us, and one in
 *  us which doesn't overflow on seconds (better to substract two
 *  times)
 */

#ifndef _TIME_H_
#define _TIME_H_

#include <aversive.h>

/* a 16 bit variable cannot cover one day */
typedef int32_t seconds; 
typedef int32_t microseconds;


/** the time structure */
typedef struct 
{
  microseconds us;
  seconds s;
} time_h;



/**********************************************************/

/** init time module : schedule the event with the givent priority */
void time_init(uint8_t priority);

/**********************************************************/

/** get time in second since last init/reset */
seconds time_get_s(void);

/**********************************************************/

/** get time in microsecond since last init/reset */
microseconds time_get_us(void);

/**********************************************************/

/** get the complete time struct since last init/reset */
time_h time_get_time(void); 

/**********************************************************/

/** reset time counter */
void time_reset(void);

/**********************************************************/

/** set time */
void time_set(seconds s, microseconds us);

/**********************************************************/

/** This is an equivalent of 'wait_ms(x)', but uses time value, so it
 *  is independant of CPU load. Warning, you should not use this
 *  function in a irq locked context, or in a scheduled function with
 *  higher priority than time module */
void time_wait_ms(uint16_t ms);

/**********************************************************/

/** get a microsecond timer that overflows naturally */
microseconds time_get_us2(void);

#endif
