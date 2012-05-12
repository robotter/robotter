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
 *  Revision : $Id: ax12_user.c,v 1.4 2009/04/24 19:30:42 zer0 Exp $
 *
 */

#include <aversive.h>
#include <aversive/list.h>
#include <aversive/wait.h>
#include <aversive/error.h>

#include <ax12.h>
#include <uart.h>
#include <time.h>

#include "ax12_user.h"

#define AX12USER_ERROR 0x40

#define AX12_ERROR(args...) ERROR(AX12USER_ERROR, args)
#define AX12_WARNING(args...) WARNING(AX12USER_ERROR, args)
#define AX12_MAX_TRIES 1

/*
 * Cmdline interface for AX12. Use the PC to command a daisy-chain of
 * AX12 actuators with a nice command line interface.
 * 
 * The circuit should be as following:
 *
 *    |----------|
 *    |	    uart3|------->--- PC (baudrate=57600)
 *    |		 |-------<---
 *    |	atmega128|
 *    |		 |
 *    |	    uart0|---->---+-- AX12 (baudrate 115200)
 *    |		 |----<---| 
 *    |----------|
 *
 * Note that RX and TX pins of UART1 are connected together to provide
 * a half-duplex UART emulation.
 *
 */

#define AX12_TIMEOUT 50000L /* in us */

extern AX12 ax12;

static uint32_t ax12_stats_ops = 0;   /* total ops */
static uint32_t ax12_stats_fails = 0; /* number of fails */
static uint32_t ax12_stats_drops = 0; /* number of drops (3 fails) */
static uint32_t ax12_dropped_logs = 0; /* error messages that were not displayed */
static microseconds t_prev_msg = 0;

/********************************* AX12 commands */

/*
 * We use synchronous access (not interrupt driven) to the hardware
 * UART, because we have to be sure that the transmission/reception is
 * really finished when we return from the functions.
 *
 * We don't use the CM-5 circuit as described in the AX12
 * documentation, we simply connect TX and RX and use TXEN + RXEN +
 * DDR to manage the port directions.
 */

static volatile uint8_t ax12_state = AX12_STATE_READ;
static volatile uint8_t ax12_nsent = 0;

/* Called by ax12 module to send a character on serial line. Count the
 * number of transmitted bytes. It will be used in ax12_recv_char() to
 * drop the bytes that we transmitted. */
static int8_t ax12_send_char(uint8_t c)
{
	UART_AX12(send)(c);
	ax12_nsent++;
	return 0;
}

/* for atmega256 */
#ifndef TXEN
#define TXEN TXEN0
#endif

/* Called by ax12 module when we want to receive a char. Note that we
 * also receive the bytes we sent ! So we need to drop them. */
static int16_t ax12_recv_char(void)
{
	microseconds t = time_get_us2();
	int c;
	while (1) {
		c = UART_AX12(recv_nowait)();
		if (c != -1) {
			if (ax12_nsent == 0)
				return c;
			ax12_nsent --;
		}

		/* 5 ms timeout */
		if ((time_get_us2() - t) > AX12_TIMEOUT)
			return -1;
	}
	return c;
}

/* called by ax12 module when we want to switch serial line. */
static void ax12_switch_uart(uint8_t state)
{
	uint8_t flags;

	if (state == AX12_STATE_WRITE) {
		IRQ_LOCK(flags);
		ax12_nsent=0;
		while (UART_AX12(recv_nowait)() != -1);
		sbi(PORTD,4);

		ax12_state = AX12_STATE_WRITE;
		IRQ_UNLOCK(flags);
	}
	else {
		UART_AX12(disable_tx)(true);
		IRQ_LOCK(flags);
		cbi(PORTD,4);
		ax12_state = AX12_STATE_READ;
		IRQ_UNLOCK(flags);
	}
}

/* ----- */ 

/* log rate limit */
static void ax12_print_error(uint8_t err, uint16_t line)
{
	microseconds t2;
	
	/* no more than 1 log per sec */
	t2 = time_get_us2();

#if 0
	if (t2 - t_prev_msg < 1000000L) {
		ax12_dropped_logs++;
		return;
	}
#endif
	AX12_WARNING("AX12 error %x at line %d (%ld messages dropped)",
		   err, line, ax12_dropped_logs);
	ax12_dropped_logs = 0;
	t_prev_msg = t2;
}

uint8_t __ax12_user_write_byte(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			       uint8_t data, uint16_t line)
{
	uint8_t err, i;

	ax12_stats_ops++;

	for (i=0; i<AX12_MAX_TRIES ; i++) {
		err = AX12_write_byte(ax12, id, address, data);
		if (err == 0)
			break;
		wait_ms(2); /* BAD HACK XXX */
		ax12_stats_fails++;
	}
	if (err == 0)
		return 0;

	ax12_print_error(err, line);
	ax12_stats_drops++;
	return err;
}

uint8_t __ax12_user_write_int(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			    uint16_t data, uint16_t line)
{
	uint8_t err, i;

	ax12_stats_ops++;

	for (i=0; i<AX12_MAX_TRIES ; i++) {
		err = AX12_write_int(ax12, id, address, data);
		if (err == 0)
			break;
		wait_ms(2); /* BAD HACK XXX */
		ax12_stats_fails++;
	}
	if (err == 0)
		return 0;

	ax12_print_error(err, line);
	ax12_stats_drops++;
	return err;
}

uint8_t __ax12_user_read_byte(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			    uint8_t *val, uint16_t line)
{
	uint8_t err, i;

	ax12_stats_ops++;

	for (i=0; i<AX12_MAX_TRIES ; i++) {
		err = AX12_read_byte(ax12, id, address, val);
		if (err == 0)
			break;
		wait_ms(2); /* BAD HACK XXX */
		ax12_stats_fails++;
	}
	if (err == 0) {
		/* XXX hack for broadcast */
		if (id == AX12_BROADCAST_ID)
			wait_ms(1);
		return 0;
	}

	ax12_print_error(err, line);
	ax12_stats_drops++;
	return err;
}

uint8_t __ax12_user_read_int(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			   uint16_t *val, uint16_t line)
{
	uint8_t err, i;

	ax12_stats_ops++;

	for (i=0; i<AX12_MAX_TRIES ; i++) {
		err = AX12_read_int(ax12, id, address, val);
		if (err == 0)
			break;
		wait_ms(2); /* BAD HACK XXX */
		ax12_stats_fails++;
	}
	if (err == 0) {
		/* XXX hack for broadcast */
		if (id == AX12_BROADCAST_ID)
			wait_ms(1);
		return 0;
	}

	ax12_print_error(err, line);
	ax12_stats_drops++;
	return err;
}

void ax12_dump_stats(void)
{
	printf_P(PSTR("AX12 stats:\r\n"));
	printf_P(PSTR("  total ops:   %ld\r\n"), ax12_stats_ops);
	printf_P(PSTR("  total fails: %ld\r\n"), ax12_stats_fails);
	printf_P(PSTR("  total drops: %ld\r\n"), ax12_stats_drops);
	printf_P(PSTR("  logs dropped since last message: %ld\r\n"), ax12_dropped_logs);
}

void ax12_user_init(void)
{

  sbi(DDRD,4);
  cbi(PORTD,4);
  
	/* AX12 */

	AX12_init(&ax12);
	AX12_set_hardware_send(&ax12, ax12_send_char);
	AX12_set_hardware_recv(&ax12, ax12_recv_char);
	AX12_set_hardware_switch(&ax12, ax12_switch_uart);
	t_prev_msg = time_get_us2();
}
