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
 *  Revision : $Id: main.c,v 1.5 2007-05-24 13:08:48 zer0 Exp $
 *
 */

#include <stdio.h>

#include <aversive/error.h>
#include <uart.h>
#include <aversive/wait.h>
#include <multiservo.h>


void mylog(struct error * e, ...)
{
	va_list ap;
	
	va_start(ap, e);
	printf_P(PSTR("[%d]: E%d "), e->severity, e->err_num);
	vfprintf_P(stdout, e->text, ap); 
	printf_P(PSTR("\n"));
	va_end(ap);
}

int main(void)
{
#ifndef HOST_VERSION
  /* uart stuff */
	uart_init();  
	fdevopen(uart0_dev_send,NULL);
#endif
	
	error_register_debug(mylog);
	printf_P("hello !!\n");
	
	multiservo_init();
	multiservo_add(&PORTC, 7); /* return id 0 (atm32) */
	//  multiservo_add(&PORTF, 0); /* return id 0 (atm 128) */
	sei();
	while(1) {
		multiservo_set(0, 1200);
		wait_ms(1000);
		multiservo_set(0, 1800);
		wait_ms(1000);
	}
	return 0;
}

