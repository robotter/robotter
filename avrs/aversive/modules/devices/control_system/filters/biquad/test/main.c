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
 *  Revision : $Id: main.c,v 1.2 2007-03-04 13:53:45 zer0 Exp $
 *
 */
#include <uart.h>
#include <biquad.h>
#include <wait.h>

#include <stdio.h>
#include <avr/pgmspace.h>

int main(void)
{

  
  
	struct biquad_filter filter;
  
  
	// filter as in the wiki documentation
	biquad_init(&filter);
	biquad_set_numerator_coeffs  (&filter, 5, 10, 5);
	biquad_set_deniminator_coeffs(&filter,-400, 164);
	biquad_set_divisor_shifts(&filter, 8, 8);
  
	// init uart
	uart_init();
	fdevopen(uart0_send,NULL, 0);

  
  
	while(1) {
		// variables
		int32_t   noise, filtered_noise;
    
		// generate white noise (is rand a white noise ??) 
		noise = rand() / (RAND_MAX /100); // from 0 to 100
    
		// apply filter
		filtered_noise = biquad_do_filter(& filter, noise);
    
		// output in a logging format : n10f30\n
		printf_P(PSTR("n%lif%li\n"), noise, filtered_noise);
    
	}
}


