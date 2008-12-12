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
 *  Revision : $Id: main.c,v 1.3 2007-05-24 13:08:46 zer0 Exp $
 *
 */

#include <stdio.h>

#include <uart.h>
#include <aversive.h>
#include <aversive/wait.h>
#include <scheduler.h>
#include <mf2_client.h>

void mf2_print(char c)
{
	printf(">> %x\n", c);
}

int main(void)
{
	scheduler_init();
	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);
	mf2_client_init();
	sei();

	printf("Test MF2 protocol\n");

	mf2_client_register_rx_event(mf2_print);

	while(1) {

		wait_ms(100);
		while (!mf2_client_ready());
		mf2_client_send(0xED);
		while (!mf2_client_ready());
		mf2_client_send(0x01);

		wait_ms(100);
		while (!mf2_client_ready());
		mf2_client_send(0xED);
		while (!mf2_client_ready());
		mf2_client_send(0x04);

		wait_ms(100);
		while (!mf2_client_ready());
		mf2_client_send(0xED);
		while (!mf2_client_ready());
		mf2_client_send(0x02);
	}
	while(1);

	return 0;
}
