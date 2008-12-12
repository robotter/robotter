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
 *  Revision : $Id: main.c,v 1.19 2008-01-08 20:05:02 zer0 Exp $
 *
 */
#include <uart.h>
#include <aversive/wait.h>

#include <stdio.h>

#include <avr/io.h>
#include <avr/pgmspace.h>  // for printf_P and PSTR

#include <stdio.h>

#include <avr/io.h>
#include <avr/pgmspace.h>  // for printf_P and PSTR


/*
 * This code send the counter values to uart
 */

int main(void)
{  
	/** initializ uart 
	    with the default parameters ( see uart_config.h ) */
	uart_init();  
 
	/** autorize interrupts */
	sei();

	/** send some single characters */
	for(int i=0;i<10; i++) {
		uart0_send('x');
		uart0_send('0' + i);
		wait_ms(100);
	}
	uart0_send('\n');
  
	/** now we want to do a printf : we must register the uart0_send as stdout.
	    here no receive function is specified. 
	*/
	fdevopen(uart0_dev_send, NULL);
  
	/** ready to do a nice printf on the uart */
	printf("Uart is cool !!\n");
  
  
	/** one drawback of the previous printf is that the format chain is srored in RAM and this can take a huge
	    size if there are many printf.
	    To avoid this problem, please use printf_P together with PSTR, like in the next example
	*/ 
	while(1) {
		static int i =0;
	  
		// this is the best solution
		printf_P(PSTR("This format string takes no RAM space. %i\n"), i++);
	  
		wait_ms(1000);
	}
  
	return 0;
}


