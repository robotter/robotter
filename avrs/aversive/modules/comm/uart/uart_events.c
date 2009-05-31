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
 *  Revision : $Id: uart_events.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2009 */

#include <uart.h>
#include <uart_defs.h>
#include <uart_private.h>

/* This function is used to register another function which will be */
/* executed at each byte transmission. */
void uart_register_tx_event(uint8_t num, void (*f)(char))
{
	uint8_t flags;
	if (num >= UART_HW_NUM)
		return;
	IRQ_LOCK(flags);
	tx_event[num] = f;
	IRQ_UNLOCK(flags);
}

/* This function is used to register another function which will be */
/* executed at each byte reception */
void uart_register_rx_event(uint8_t num, void (*f)(char))
{
	uint8_t flags;
	if (num >= UART_HW_NUM)
		return;
	IRQ_LOCK(flags);
	rx_event[num] = f;
	IRQ_UNLOCK(flags);
}

