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
 *  Revision : $Id: main.c,v 1.7 2007-05-24 13:08:47 zer0 Exp $
 *
 */

#include <aversive.h>

#include <uart.h>
#include <aversive/wait.h>
#include <stdio.h>
#include <stdarg.h>

#include <aversive/error.h>
#include <aversive/pgmspace.h>


void mylog(struct error * e, ...)
{
	va_list ap;

	va_start(ap, e);
	printf_P(PSTR("[%d]: E%d "), e->severity, e->err_num);
	vfprintf_P(stdout, e->text, ap); 
	printf_P(PSTR(", "));
	printf_P(e->file);
	printf_P(PSTR(", L%d\n"), e->line);
	va_end(ap);
}

int main(void)
{
#ifndef HOST_VERSION
	/* uart stuff */
	uart_init();  
	sei();
	fdevopen(uart0_dev_send,NULL);
#endif
	
	/* hello */
	printf_P(PSTR("test error module\n"));
	printf("%d\n",sizeof(va_list));
	
	/* don't display anything */
	ERROR(54, "pouet");
	
	error_register_emerg(mylog);
	error_register_error(mylog);
	
	EMERG(3, "this is an emerg log");
	EMERG(3, "this is an emerg log with param %d", 453);
	ERROR(54, "this is another log, level = error");
	
	/* don't display it, fcts are not registered */
	WARNING(4, "not displayed");
	NOTICE(5, "not displayed");
	DEBUG(6, "not displayed");
	
	while(1);
	return 0;
}
