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
 *  Revision : $Id: main.c,v 1.3 2007-05-24 13:08:49 zer0 Exp $
 *
 */

#include <uart.h>
#include <aversive.h>
#include <aversive/wait.h>
#include <stdio.h>
#include <timer.h>


void callback_ov(void)
{
	static int i=0;
	printf("CB%d\n", i++);
}

void callback_oc(void)
{
	static int i=0;

	i++;
	if ( (i%1000) == 0 ) {
		printf("%d\n", i/1000);
		if (i==5000) {
			timer3A_register_OC_intr_in_us(NULL, 0);
			return;
		}
	}

	timer3A_register_OC_intr_in_us(callback_oc, 1000);
}

/* Todo :
 * timer 8bits are differents...
 * timer1A_register_OC_intr_in_tics
 * functions with timer num as a parameter
 * return an error in timer1A_register_OC_intr_in_us if not adapted to presc
 * synch des timers (eventuellement)
 * clear on compare match could be useful
 * enhance help for funcs. Note that register_in_us is 100us long on a 16Mhz ATmega128 in dynamic mode
 *
 * aversive/parts.h can be included twice... bad
 * aversive/ATxxx.h can be included directly... bad too
 */

int main(void)
{
	int16_t a,b,c;

	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);
	timer_init();
	sei();

	//	printf("init\n");

	a=timer3_get();
	timer3A_register_OC_intr_in_us(callback_oc, 1000);
	b=timer3_get();
	c=timer3_get();
	printf("%d %d %d %d\n", a, b, c, OCR3A);

	timer1_register_OV_intr(callback_ov);
	printf("timer = %d\n", timer1_get());
	wait_ms(10);
	printf("timer = %d\n", timer1_get());
	wait_ms(10);
	printf("timer = %d\n", timer1_get());

	while(1);

	return 0;
}
