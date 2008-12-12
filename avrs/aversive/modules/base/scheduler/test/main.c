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
 *  Revision : $Id: main.c,v 1.12 2007-06-11 10:03:26 zer0 Exp $
 *
 */

#include <scheduler.h>
#include <aversive/wait.h>
#include <stdio.h>
#include <uart.h>

uint8_t event_id;

void f1(void * nothing)
{
	printf("%s\n", __FUNCTION__);
}

void f2(void * nothing)
{
	printf("%s\n", __FUNCTION__);
}

void f3(void * nothing)
{
	printf("%s START\n", __FUNCTION__);
	wait_ms(1000);
	printf("%s END\n", __FUNCTION__);
}

void supp(void * nothing)
{
  scheduler_del_event(event_id);
}

int main(void)
{
#ifndef HOST_VERSION
	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);
	sei();
#else
	int i;
#endif
	printf("init\n");

#ifdef CONFIG_MODULE_TIMER
	timer_init();
#endif
	scheduler_init();
	printf("init2\n");
	wait_ms(2000);
	printf("init3\n");

	event_id = scheduler_add_periodical_event_priority(f1, NULL, 500000l/SCHEDULER_UNIT, 200);
	scheduler_add_periodical_event_priority(f2, NULL, 500000l/SCHEDULER_UNIT, 100);
	scheduler_add_periodical_event(f3, NULL, 1000000l/SCHEDULER_UNIT);
	
	//  scheduler_add_single_event(supp,65);
	

#ifdef HOST_VERSION
	for (i=0 ; i<50000 ; i++)
		scheduler_interrupt();
#endif
	return 0;
}


