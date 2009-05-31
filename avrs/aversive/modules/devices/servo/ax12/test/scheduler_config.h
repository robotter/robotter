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
 *  Revision : $Id: scheduler_config.h,v 1.2 2009-03-15 21:51:19 zer0 Exp $
 *
 */

#ifndef _SCHEDULER_CONFIG_H_
#define _SCHEDULER_CONFIG_H_

#define _SCHEDULER_CONFIG_VERSION_ 4

/** maximum number of allocated events */
#define SCHEDULER_NB_MAX_EVENT 7


#define SCHEDULER_UNIT_FLOAT 512.0
#define SCHEDULER_UNIT 512L

/** number of allowed imbricated scheduler interrupts. The maximum
 * should be SCHEDULER_NB_MAX_EVENT since we never need to imbricate
 * more than once per event. If it is less, it can avoid to browse the
 * event table, events are delayed (we loose precision) but it takes
 * less CPU */
#define SCHEDULER_NB_STACKING_MAX SCHEDULER_NB_MAX_EVENT

/** define it for debug infos (not recommended, because very slow on
 *  an AVR, it uses printf in an interrupt). It can be useful if
 *  prescaler is very high, making the timer interrupt period very
 *  long in comparison to printf() */
/* #define SCHEDULER_DEBUG */

#endif // _SCHEDULER_CONFIG_H_
