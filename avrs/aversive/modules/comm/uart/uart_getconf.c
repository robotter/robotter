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
 *  Revision : $Id: uart_getconf.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2007 */

#include <uart.h>
#include <uart_defs.h>
#include <uart_private.h>

#if UART_IS_USART

static inline uint8_t get_ucsrc(uint8_t num)
{
#ifdef URSEL
	uint8_t tmp;
	/* on some uC, reading UCSRxC is a bit tricky */
	switch(num) {
#ifdef UART0_COMPILE
		case 0:
			tmp = UBRR0H;
			tmp = UCSR0C;
			break;
#endif
#ifdef UART1_COMPILE
		case 1:
			tmp = UBRR1H;
			tmp = UCSR1C;
			break;
#endif
#ifdef UART2_COMPILE
		case 2:
			tmp = UBRR2H;
			tmp = UCSR2C;
			break;
#endif
#ifdef UART3_COMPILE
		case 3:
			tmp = UBRR3H;
			tmp = UCSR3C;
			break;
#endif
		default:
			tmp = 0;
			break;
	}
	return tmp;
#else
	return *uart_regs[num].ucsrc;
#endif /* URSEL */
}

/* return number of bits in current conf. Intr must be disabled. */
uint8_t uart_getconf_nbits(uint8_t num)
{
	uint8_t nbits;

	nbits = (get_ucsrc(num) >> UCSZ0) & 0x03;
#ifdef CONFIG_MODULE_UART_9BITS
	if (*uart_regs[num].ucsrb & (1 << UCSZ2))
		nbits += 4;
#endif
	nbits += 5;
	return nbits;
}

#else /* UART_IS_USART */

/* return number of bits in current conf */
uint8_t uart_getconf_nbits(uint8_t num)
{
#ifdef CONFIG_MODULE_UART_9BITS
	if (*uart_regs[num].ucsrb & (uint8_t)(1 << CHR9))
		return 8;
	else
		return 9;
#else
	return 8;
#endif
}

#endif /* UART_IS_USART */


#if UART_IS_USART

/* return number of bits in current conf */
static inline uint16_t uart_get_baudreg(uint8_t num)
{
	return ((uint16_t)*uart_regs[num].ubrrh << 8) | 
		(uint16_t)*uart_regs[num].ubrrl;
}

#else /* UART_IS_USART */

/* return number of bits in current conf */
static inline uint16_t uart_get_baudreg(uint8_t num)
{
	return (uint16_t)*uart_regs[num].ubrrl;
}

#endif /* UART_IS_USART */


/* get the running uart configurtion */
void uart_getconf(uint8_t num, struct uart_config *u)
{
	uint8_t tmp;
	uint8_t flags;

	IRQ_LOCK(flags);

	/* XXX */
	/* enabled if RXEN is set */
	if (*uart_regs[num].ucsrb & (1 << RXEN))
		u->enabled = 1;
	else
		u->enabled = 0;

	/* intrp enabled if RXCIE is set */
	if (*uart_regs[num].ucsrb & (1 << RXCIE))
		u->intr_enabled = 1;
	else
		u->intr_enabled = 0;

	/* use double speed */
	if (UART_HAS_U2X && (*uart_regs[num].ucsra & (1 << U2X)))
		u->use_double_speed = 1;
	else
		u->use_double_speed = 0;


	/* parity */
	if (UART_IS_USART) {
		tmp = get_ucsrc(num) & ((1 << UPM1) | (1 << UPM0));
		if (tmp == ((1 << UPM1) | (1 << UPM0)))
			u->parity = UART_PARTITY_ODD;
		else if (tmp == (1 << UPM1))
			u->parity = UART_PARTITY_EVEN;
		else
			u->parity = UART_PARTITY_NONE;
	}
	else {
		u->parity = UART_PARTITY_NONE;
	}

	/* stop_bits */
	if  (UART_IS_USART && (get_ucsrc(num) & (1 << USBS))) {
		u->stop_bits = UART_STOP_BITS_2;
	}
	else {
		u->stop_bits = UART_STOP_BITS_1;
	}

	/* nbits */
	u->nbits = uart_getconf_nbits(num);
	u->baudrate = (F_CPU / ((uart_get_baudreg(num)+1) * 16)) ;

	IRQ_UNLOCK(flags);
}
