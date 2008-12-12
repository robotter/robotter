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
 *  Revision : $Id: timer_intr.h,v 1.3 2007-05-24 13:08:49 zer0 Exp $
 *
 */

#include <aversive/parts.h>

typedef void (*timer_callback_t)(void);

extern volatile timer_callback_t timer_OV_callback_table[SIG_OVERFLOW_TOTAL_NUM];
extern volatile timer_callback_t timer_OC_callback_table[SIG_OUTPUT_COMPARE_TOTAL_NUM];

/* initialisation of callback table */
void timer_intr_init(void);
