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
 *  Revision : $Id: main.c,v 1.3 2007-05-24 13:08:48 zer0 Exp $
 *
 */

#include <aversive.h>
#include <uart.h>
#include <hamming.h>

/* in data is 24 bits */
uint32_t tab[] = { 
	0x00001200,
	0x00a843e1,
	0x00001560,
	0x001504e4,
	0x00d1d156,
	0x00000000,
	0x00123456,
	0x00d8de6a,
};

int main(void)
{
	uint32_t data;
	uint32_t data_try;
	uint8_t error;
	int i;

#ifndef HOST_VERSION
	/* UART */
	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);

	sei();
#endif


	for (i=0; i<(sizeof(tab)/sizeof(uint32_t)) ; i++) {
		data=tab[i];
		for(error=0; error<29 ; error++) {
			data_try = data;
			
			hamming_do(&data_try);
			data_try ^= (1L << error);
			
			// block if pb
			hamming_undo(&data_try);
			if (data != data_try) {
				printf("Hamming fail %d %d\n", i, error);
			}
		}
	}

	printf("Hamming success\n");
	return 0;
}
