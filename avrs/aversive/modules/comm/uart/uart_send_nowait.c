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
 *  Revision : $Id: uart_send_nowait.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2009 */

#include <uart.h>
#include <uart_defs.h>
#include <uart_private.h>


/* send a char, or put it in the fifo if uart is not ready. Return -1
 * if fifo is full */
int uart_send_nowait(uint8_t num, char c)
{
	uint8_t flags;

	IRQ_LOCK(flags);

	/* if uart intrp mode is disabled (note that we look rx */
	/* intrp -- RXCIE is 0) */
	if ( !(*uart_regs[num].ucsrb & (1 << RXCIE )) ) {
		/* we have to poll the status register before xmit */
		if (*uart_regs[num].ucsra & (1<<UDRE)) {
			uart_set_udr(num, c);
			IRQ_UNLOCK(flags);
			return (int)c;
		}
		else {
			IRQ_UNLOCK(flags);
			return -1;
		}
	}

	if (CIRBUF_IS_FULL(&g_tx_fifo[num])) {
		IRQ_UNLOCK(flags);
		return -1;
	}

	/* uart is ready to send */
	if (CIRBUF_IS_EMPTY(&g_tx_fifo[num]) && 
	    *uart_regs[num].ucsra & (1<<UDRE)) {
		uart_set_udr(num, c);
		sbi(*uart_regs[num].ucsrb, UDRIE); /* XXX */
	}
	else { /* not ready, put char in fifo */
		cirbuf_add_head(&g_tx_fifo[num], c);
	}

	IRQ_UNLOCK(flags);
	return (int)c;
}
