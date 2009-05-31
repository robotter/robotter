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
 *  Revision : $Id: uart_private.h,v 1.4 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2009 */

#ifndef _UART_PRIVATE_H_
#define _UART_PRIVATE_H_

#include <aversive.h>
#include <aversive/list.h>

#include <uart.h>
#include <uart_defs.h>
#include <uart_config.h>

typedef volatile uint8_t *uart_reg_t;

struct regs {
        uart_reg_t udr;
        uart_reg_t ucsra;
        uart_reg_t ucsrb;
        uart_reg_t ucsrc;
        uart_reg_t ubrrl;
        uart_reg_t ubrrh;
};

const struct regs uart_regs[UART_HW_NUM];

typedef void (event)(char);
typedef void (event_9bits)(int);

/** The emission fifo of uart */
extern struct cirbuf g_tx_fifo[UART_HW_NUM];

/** The reception fifo of uart  */
extern struct cirbuf g_rx_fifo[UART_HW_NUM];

extern event *rx_event[UART_HW_NUM];
extern event *tx_event[UART_HW_NUM];

void uart_send_next_char(uint8_t num);
int8_t uart_setconf(uint8_t num, struct uart_config *u);

static inline char uart_get_udr(uint8_t num)
{
	return *uart_regs[num].udr;
}

static inline void uart_set_udr(uint8_t num, char c)
{
	*uart_regs[num].udr = c;
	/* tx event function. We suppose interrupts are already
	 * locked, so no pb with tx_event pointer */
	if (tx_event[num])
		tx_event[num](c);
}

#ifdef CONFIG_MODULE_UART_9BITS
static inline int uart_get_udr_9bits(uint8_t num)
{
	int val = *uart_regs[num].udr;
	val |= (*uart_regs[num].ucsrb & ((1 << RXB8) ? 0x100 : 0));
	return val;
}

static inline void uart_set_udr_9bits(uint8_t num, int c)
{
	if (c & 0x100 )
		*uart_regs[num].ucsrb |= (1 << RXB8);
	else
		*uart_regs[num].ucsrb &= ~(1 << RXB8);
	*uart_regs[num].udr = c;

	/* tx event function. We suppose interrupts are already
	 * locked, so no pb with tx_event pointer */
	if (tx_event[num])
		((event_9bits *)tx_event[num])(c);
}
#endif /* CONFIG_MODULE_UART_9BITS */

#endif /* _UART_PRIVATE_H_ */
