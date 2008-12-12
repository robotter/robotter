/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2006)
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
 *  Revision : $Id: multiservo_config.h,v 1.3 2006-07-22 09:30:42 zer0 Exp $
 *
 */


#ifndef _MULTISERVO_CONFIG_H_
#define _MULTISERVO_CONFIG_H_

/** we need one timer, can be 0, 1, 2, 3 (depending on arch)  */
#define MULTISERVO_TIMER 2

/* You should specify the config for prescaler
 * It is in TCCRnB for 16 bits timer or in TCCRn for
 * 8 bits timer. See the doc of your AVR device.
 * This is not automatic because it would be too complicated.
 *
 * Example (for timer 3, prescaler 1) :
 * 
 * #define MULTISERVO_TIMER_PRESCALER 1
 * #define MULTISERVO_TIMER_PRESCALER_CONFIG (1 << CS30)
 *
 * Another example (for timer 2, prescaler 32) :
 * 
 * #define MULTISERVO_TIMER_PRESCALER 128
 * #define MULTISERVO_TIMER_PRESCALER_CONFIG ((1 << CS22) | (1 << CS20))
 * 
 * XXX : currently, the user has to choose a good prescaler 
 * value. A good prescaler value is the more precise value 
 * (the highest) that can count during 2 ms.
 */

/* this is ok for atm 32... */
#define MULTISERVO_TIMER_PRESCALER 256
#define MULTISERVO_TIMER_PRESCALER_CONFIG ((1 << CS22) | (1 << CS21))

#define MULTISERVO_NB_MAX 4

#endif
