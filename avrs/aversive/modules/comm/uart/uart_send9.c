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
 *  Revision : $Id: uart_send9.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2009 */

#include <uart.h>
#include <uart_defs.h>
#include <uart_private.h>

int uart_send_9bits(uint8_t num, int c)
{
	/* if cannot send the char */
	if (uart_send_9bits_nowait(num, c) == -1) {

		/* if irq lock are masked and interrupt mode is on, we
		 * have to poll the status register */
		if (GLOBAL_IRQ_ARE_MASKED() && (*uart_regs[num].ucsrb & (1 << RXCIE)) ) {
			while( !(*uart_regs[num].ucsra & (1 << UDRE)) );
			/* send the next char in the fifo to free two
			 * places */
			uart_send_next_char(num);
			cirbuf_add_buf_head(&g_tx_fifo[num], (char *)&c, 2);
		}
		else {
			/* if irq are not locked, we can loop to emit */
			while(uart_send_9bits_nowait(num, c) == -1);
		}
	}
	return c;
}
