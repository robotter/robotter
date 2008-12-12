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
 *  Revision : $Id: wait.h,v 1.2 2007-05-24 13:08:44 zer0 Exp $
 *
 */

/** 
 * This file is an interface for wait functions, in order to put the 
 * microcontroller in a loop state.
 */

/**********************************************************/

#ifndef _AVERSIVE_WAIT_H_
#define _AVERSIVE_WAIT_H_

#include <aversive.h>

#ifdef HOST_VERSION

#define wait_3cyc(n) do {} while(0)
#define wait_4cyc(n) do {} while(0)
#define wait_ms(n) do {} while(0)

#else /* HOST_VERSION */

#if __AVR_LIBC_VERSION__ < 10403UL
#include <avr/delay.h>
#else
#include <util/delay.h>
#endif

/** wait n "3 cycles time" 
 * n is 8 bits */
#define wait_3cyc(n) _delay_loop_1(n)

/** wait n "4 cycles time" 
 * n is 16 bits */
#define wait_4cyc(n) _delay_loop_2(n)

/** wait n milliseconds 
 * n is 16 bits
 */
static inline void wait_ms(uint16_t n) 
{
  while ( n -- ) 
    wait_4cyc(F_CPU/4000);
} 

#endif /* else HOST_VERSION */

#endif /* _AVERSIVE_WAIT_ */
