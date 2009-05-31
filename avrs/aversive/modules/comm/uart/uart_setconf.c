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
 *  Revision : $Id: uart_setconf.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2009 */

#include <uart.h>
#include <uart_defs.h>
#include <uart_private.h>

/** The emission fifo of uart  */
#ifdef UART0_COMPILE
char g_tx0_buf[UART0_TX_FIFO_SIZE];
char g_rx0_buf[UART0_RX_FIFO_SIZE];
#endif
#ifdef UART1_COMPILE
char g_tx1_buf[UART1_TX_FIFO_SIZE];
char g_rx1_buf[UART1_RX_FIFO_SIZE];
#endif
#ifdef UART2_COMPILE
char g_tx2_buf[UART2_TX_FIFO_SIZE];
char g_rx2_buf[UART2_RX_FIFO_SIZE];
#endif
#ifdef UART3_COMPILE
char g_tx3_buf[UART3_TX_FIFO_SIZE];
char g_rx3_buf[UART3_RX_FIFO_SIZE];
#endif

#if UART_IS_USART

static int8_t uart_set_nbits_parity(uint8_t num, struct uart_config * u)
{
	uint8_t ucsrc = 0;

	/* number of bit in the frame */
#ifdef CONFIG_MODULE_UART_9BITS
	if (u->nbits < 5 || u->nbits > 9) {
		return ENOTSUP;
	}
#else
	if (u->nbits < 5 || u->nbits > 8) {
		return ENOTSUP;
	}
#endif

	ucsrc |= ( ((u->nbits - 5) & 0x03) << UCSZ0 );
#ifdef CONFIG_MODULE_UART_9BITS
	if (u->nbits == 9)
		*uart_regs[num].ucsrb |= (1 << UCSZ2);
	else
#endif
		*uart_regs[num].ucsrb &= ~(1 << UCSZ2);

	/* parity */
	if (u->parity == UART_PARTITY_ODD)
		ucsrc |= ((1 << UPM0) | (1 << UPM1));
	else if (u->parity == UART_PARTITY_EVEN)
		ucsrc |= (1 << UPM1);
	else if (u->parity != UART_PARTITY_NONE) {
		return EINVAL;
	}

	/* nb of stop bits */
	if (u->stop_bits == UART_STOP_BITS_2)
		ucsrc |= (1 << USBS);
	else if (u->stop_bits != UART_STOP_BITS_1)
		return EINVAL;

#ifdef URSEL
	/* some uC use a special bit URSEL to access to UCSRC */
	ucsrc |= (1<<URSEL);
#endif
	*uart_regs[num].ucsrc = ucsrc;

	return ESUCCESS;
}

#else /* UART_IS_USART */

static int8_t uart_set_nbits_parity(int8_t num, struct uart_config * u)
{
	/* number of bit in the frame */
	if (u->nbits == 8)
		*uart_regs[num].ucsrb &= ~(1 << CHR9);
#ifdef CONFIG_MODULE_UART_9BITS
	else if (u->nbits == 9)
		*uart_regs[num].ucsrb |= (1 << CHR9);
#endif
	else
		return ENOTSUP;

	/* parity and stop */
	if (u->parity != UART_PARTITY_NONE ||
	    u->stop_bits != UART_STOP_BITS_1) {
		return ENOTSUP;
	}

	return ESUCCESS;
}
#endif  /* UART_IS_USART */


#if UART_IS_USART

static int8_t uart_set_baudreg(uint8_t num, uint16_t baudreg)
{
	uint8_t lo, hi;

	/* set msb bit of hi to 0 (useful fot uC with URSEL, and not
	 * important for the others because the baudreg will never be
	 * as big */
	lo = (uint8_t)baudreg;
	hi = (uint8_t)(baudreg>>8) & 0x7F;

	*uart_regs[num].ubrrl = lo;
	*uart_regs[num].ubrrh = hi;

	return ESUCCESS;
}

#else /* UART_IS_USART */

static int8_t uart_set_baudreg(uint8_t num, uint16_t baudreg)
{
	uint8_t lo, hi;

	lo=(uint8_t)baudreg;
	hi=(uint8_t)(baudreg>>8);

	if (hi != 0)
		return EINVAL;
	*uart_regs[num].ubrrl = lo;

	return ESUCCESS;
}
#endif /* UART_IS_USART */

/* configuration from uart_config.h */
#define UART_SET_STATICCONF(x)						\
	u->enabled = UART##x##_ENABLED;					\
	u->intr_enabled = UART##x##_INTERRUPT_ENABLED;			\
	u->use_double_speed = UART##x##_USE_DOUBLE_SPEED;		\
	u->parity =  UART##x##_PARITY;					\
	u->stop_bits = UART##x##_STOP_BIT;				\
	u->nbits = UART##x##_NBITS;					\
	u->baudrate = UART##x##_BAUDRATE;				\
	break

int8_t uart_setconf(uint8_t num, struct uart_config *u)
{
	uint8_t ret = ESUCCESS;
	uint16_t baudrate_reg;
	struct uart_config static_conf;
	uint8_t flags;

	IRQ_LOCK(flags);

	/* static configuration */
	if (!u) {
		u = &static_conf;
		switch (num) {
#ifdef UART0_COMPILE
		case 0:
			UART_SET_STATICCONF(0);
#endif
#ifdef UART1_COMPILE
		case 1:
			UART_SET_STATICCONF(1);
#endif
#ifdef UART2_COMPILE
		case 2:
			UART_SET_STATICCONF(2);
#endif
#ifdef UART3_COMPILE
		case 3:
			UART_SET_STATICCONF(3);
#endif
		default:
			ret = EINVAL;
			goto out;
		}
	}

	/* wait xmit finished (UDRE = 1) */
	while( !(*uart_regs[num].ucsra & (1<<UDRE)) );

	switch (num) {
#ifdef UART0_COMPILE
	case 0:
		cirbuf_init(&g_tx_fifo[0], g_tx0_buf, 0, UART0_TX_FIFO_SIZE);
		cirbuf_init(&g_rx_fifo[0], g_rx0_buf, 0, UART0_RX_FIFO_SIZE);
		break;
#endif
#ifdef UART1_COMPILE
	case 1:
		cirbuf_init(&g_tx_fifo[1], g_tx1_buf, 0, UART1_TX_FIFO_SIZE);
		cirbuf_init(&g_rx_fifo[1], g_rx1_buf, 0, UART1_RX_FIFO_SIZE);
		break;
#endif
#ifdef UART2_COMPILE
	case 2:
		cirbuf_init(&g_tx_fifo[2], g_tx2_buf, 0, UART2_TX_FIFO_SIZE);
		cirbuf_init(&g_rx_fifo[2], g_rx2_buf, 0, UART2_RX_FIFO_SIZE);
		break;
#endif
#ifdef UART3_COMPILE
	case 3:
		cirbuf_init(&g_tx_fifo[3], g_tx3_buf, 0, UART3_TX_FIFO_SIZE);
		cirbuf_init(&g_rx_fifo[3], g_rx3_buf, 0, UART3_RX_FIFO_SIZE);
		break;
#endif
	default:
		ret = EINVAL;
		goto out;
	}
	*uart_regs[num].ucsra = 0;
	
	if (u->enabled)
		*uart_regs[num].ucsrb = ((1 << TXEN) | (1 << RXEN));
	else {
		*uart_regs[num].ucsrb = 0;
		goto out; /* no more conf */
	}

	/* we only enable recv interrupt, the xmit intrpt will be
	 * enabled in the xmit function */
	if (u->intr_enabled)
		*uart_regs[num].ucsrb |= (1 << RXCIE);

	if (UART_HAS_U2X) { /* if u2x is supported */
		if (u->use_double_speed) /* u2x is enabled */
			*uart_regs[num].ucsra |= (1 << U2X);
		else
			*uart_regs[num].ucsra &= ~(1 << U2X);
	}
	else if (u->use_double_speed) {
		ret = ENOTSUP;
		goto out;
	}

	uart_set_nbits_parity(num, u);

	/* baudrate */
	if(u->use_double_speed)
		baudrate_reg = (F_CPU / (u->baudrate*8l)) - 1;
	else
		baudrate_reg = (F_CPU / (u->baudrate*16l)) - 1;

	uart_set_baudreg(num, baudrate_reg);

	/* exit */
 out:
	IRQ_UNLOCK(flags);
	return ret;
}
