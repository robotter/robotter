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
 *  Revision : $Id: uart_recv_nowait.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2009 */

#include <uart.h>
#include <uart_defs.h>
#include <uart_private.h>

/* get a char from the receive fifo */
int uart_recv_nowait(uint8_t num)
{
	char elt = 0;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	if( !CIRBUF_IS_EMPTY(&g_rx_fifo[num]) ) {
		elt = cirbuf_get_tail(&g_rx_fifo[num]);
		cirbuf_del_tail(&g_rx_fifo[num]);
		IRQ_UNLOCK(flags);
		return (int)elt;
	}
	IRQ_UNLOCK(flags);
	return (-1);
}
