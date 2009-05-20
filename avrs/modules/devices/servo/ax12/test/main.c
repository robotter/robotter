/*  
 *  Copyright Droids Corporation
 *  Olivier Matz <zer0@droids-corp.org>
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
 *  Revision : $Id: main.c,v 1.2 2009-03-15 21:51:19 zer0 Exp $
 *
 */

/*
 * Cmdline interface for AX12. Use the PC to command a daisy-chain of
 * AX12 actuators with a nice command line interface.
 * 
 * The circuit should be as following:
 *
 *    |----------|
 *    |	    uart0|------->--- PC (baudrate=57600)
 *    |		 |-------<---
 *    |	atmega128|
 *    |		 |
 *    |	    uart1|---->---+-- AX12 (baudrate 1 000 000)
 *    |		 |----<---| 
 *    |----------|
 *
 * Note that RX and TX pins of UART1 are connected together to provide
 * a half-duplex UART emulation.
 *
 */

#include <stdio.h>
#include <string.h>

#include <aversive.h>
#include <aversive/pgmspace.h>
#include <aversive/wait.h>

#include <uart.h>
#include <ax12.h>
#include <parse.h>
#include <rdline.h>
#include <scheduler.h>
#include <time.h>
#include <timer.h>

/* for cmdline interface */
struct rdline rdl;
char prompt[RDLINE_PROMPT_SIZE];
extern parse_pgm_ctx_t main_ctx[];

/* structure defining the AX12 servo */
AX12 ax12;

/******** For cmdline. See in commands.c for the list of commands. */
static void write_char(char c) 
{
	uart_send(0, c);
}

static void 
valid_buffer(const char * buf, uint8_t size) 
{
	int8_t ret;
	ret = parse(main_ctx, buf);
	if (ret == PARSE_AMBIGUOUS)
		printf_P(PSTR("Ambiguous command\r\n"));
	else if (ret == PARSE_NOMATCH)
		printf_P(PSTR("Command not found\r\n"));
	else if (ret == PARSE_BAD_ARGS)
		printf_P(PSTR("Bad arguments\r\n"));
}

static int8_t 
complete_buffer(const char * buf, char * dstbuf, uint8_t dstsize,
		int16_t * state)
{
	return complete(main_ctx, buf, state, dstbuf, dstsize);
}

/********************************* AX12 commands */

/*
 * --- use uart1 
 *
 * We use synchronous access (not interrupt driven) to the hardware
 * UART, because we have to be sure that the transmission/reception is
 * really finished when we return from the functions.
 *
 * We don't use the CM-5 circuit as described in the AX12
 * documentation, we simply connect TX and RX and use TXEN + RXEN +
 * DDR to manage the port directions.
 */

static volatile uint8_t ax12_state = AX12_STATE_READ;
extern volatile struct cirbuf g_tx_fifo[]; /* uart fifo */
static volatile uint8_t ax12_nsent = 0;

/* Called by ax12 module to send a character on serial line. Count the
 * number of transmitted bytes. It will be used in ax12_recv_char() to
 * drop the bytes that we transmitted. */
static int8_t ax12_send_char(uint8_t c)
{
	uart_send(1, c);
	ax12_nsent++;
	return 0;
}

/* called by uart module when the character has been written in
 * UDR. It does not mean that the byte is physically transmitted. */
static void ax12_send_callback(char c)
{
	if (ax12_state == AX12_STATE_READ) {
		/* disable TX when last byte is pushed. */
		if (CIRBUF_IS_EMPTY(&g_tx_fifo[1]))
			UCSR1B &= ~(1<<TXEN);
	}
}

/* Called by ax12 module when we want to receive a char. Note that we
 * also receive the bytes we sent ! So we need to drop them. */
static int16_t ax12_recv_char(void)
{
	microseconds t = time_get_us2();
	int c;
	while (1) {
		c = uart_recv_nowait(1);
		if (c != -1) {
			if (ax12_nsent == 0)
				return c;
			ax12_nsent --;
		}

		/* 50 ms timeout */
		if ((time_get_us2() - t) > 50000)
			return -1;
	}
	return c;
}

/* called by ax12 module when we want to switch serial line. As we
 * work in interruption mode, this function can be called to switch
 * back in read mode even if the bytes are not really transmitted on
 * the line. That's why in this case we do nothing, we will fall back
 * in read mode in any case when xmit is finished -- see in
 * ax12_send_callback() -- */
static void ax12_switch_uart(uint8_t state)
{
	uint8_t flags;

	if (state == AX12_STATE_WRITE) {
		IRQ_LOCK(flags);
		ax12_nsent=0;
		UCSR1B |= (1<<TXEN);
		ax12_state = AX12_STATE_WRITE;
		IRQ_UNLOCK(flags);
	}
	else {
		IRQ_LOCK(flags);
		if (CIRBUF_IS_EMPTY(&g_tx_fifo[1]))
			UCSR1B &= ~(1<<TXEN);
		ax12_state = AX12_STATE_READ;
		IRQ_UNLOCK(flags);
	}
}

static void main_timer_interrupt(void)
{
	static uint8_t cpt = 0;

	cpt++;

	if ((cpt & 0x3) == 0)
		scheduler_interrupt();
}

/***********************/

int main(void)
{
	int c;
	const char * history;
	int8_t ret;

	wait_ms(1000);

	uart_init();

	ax12_switch_uart(AX12_STATE_READ);
 	fdevopen(uart0_dev_send, uart0_dev_recv);

	/* AX12 */
	AX12_init(&ax12);
	AX12_set_hardware_send(&ax12, ax12_send_char);
	AX12_set_hardware_recv(&ax12, ax12_recv_char);
	AX12_set_hardware_switch(&ax12, ax12_switch_uart);
	uart_register_tx_event(1, ax12_send_callback);

	/* TIMER */
	timer_init();
	timer0_register_OV_intr(main_timer_interrupt);

	/* SCHEDULER */
	scheduler_init();

	sei();

	/* set status return level to 2 and torque to 0 */
	AX12_write_int(&ax12,0xFE, AA_TORQUE_ENABLE, 0x00);
	AX12_write_byte(&ax12, 0xFE, AA_STATUS_RETURN_LEVEL, 2);

	rdline_init(&rdl, write_char, valid_buffer, complete_buffer);
	snprintf(prompt, sizeof(prompt), "ax12 > ");	
	rdline_newline(&rdl, prompt);

	/* waiting for commands now... */

	while (1) {
		c = uart_recv_nowait(0);
		if (c == -1) 
			continue;
		ret = rdline_char_in(&rdl, c);
		if (ret != 2 && ret != 0) {
			history = rdline_get_buffer(&rdl);
			if (strlen(history) > 1)
				rdline_add_history(&rdl, history);
			rdline_newline(&rdl, prompt);
		}
	}

	return 0;
}
