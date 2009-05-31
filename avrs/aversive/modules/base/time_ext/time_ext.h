/*  
 *  Copyright Droids Corporation (2008)
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
 */

/*
 * Author : Julien LE GUEN - jlg@jleguen.info
 */
#ifndef _TIME_EXT_H_
#define _TIME_EXT_H


#include <time_ext_config.h>

/*
 *	Since we want the maximum resolution available,
 *	the prescaler of timer2 is set to 1.
 *	Thus counter2 is incremented every positive edge of the external quartz.
 *	You can define the frequency of your quartz in time_ext_config.h
 */


/* Number of NANOSECONDS */
#define NANO_PER_US	1000UL
#define NANO_PER_MS	1000000UL
#define NANO_PER_S	1000000000UL


/* Prescaler */
#define TIMER2_PRESCALER_OFF	0
#define TIMER2_PRESCALER_1		1
#define TIMER2_PRESCALER_8		2
#define TIMER2_PRESCALER_32		3
#define TIMER2_PRESCALER_64		4
#define TIMER2_PRESCALER_128	5
#define TIMER2_PRESCALER_256	6
#define TIMER2_PRESCALER_1024	7


/* Useful defines */
#define NANO_PER_QUARTZ_TICK	TIME_EXT_QUARTZ_PERIOD




/*
 *	Time structure.
 *	We want to have the best resolution possible.
 *	Thus, we store nano-seconds and seconds.
 */
typedef struct _time_ext
{
	uint32_t sec;
	uint32_t nano;
} time_ext_t;


/* Initialize the module */
void time_ext_init(void);

/* 
 * Setter and getter for the prescaler 
 * By default, it is set to 1
 */
inline void time_ext_set_prescaler(uint8_t p);
inline uint8_t time_ext_get_prescaler(void);

/*
 *	Get time (seconds only, nanos only, or both)
 */
inline uint32_t time_ext_get_s(void);
inline uint32_t time_ext_get_ns(void);
time_ext_t time_ext_get(void);

/*
 *	Sets the global time.
 *	This resets TCNT2 as well
 */
inline void time_ext_set(uint32_t sec, uint32_t nano);

#endif /* _TIME_EXT_H_ */
