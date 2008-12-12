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

#include <stdio.h>
#include <string.h>
#include <math.h>

#include <aversive/pgmspace.h>
#include <uart.h>
#include <aversive.h>
#include <aversive/wait.h>

#include <base64.h>

int main(void)
{
	/*      Text content   "Man" */
	/*      ASCII            77        97      110 */
	/*      Bit pattern /8  01001101 01100001 01101110 */
	/*      Bit pattern /6  010011 010110 000101 101110 */
	/*      Index            19      22     5      46 */
	/*      Base64-Encoded "TWFu" */
	char *toto = "Input ends with carnal pleasure.";
	char test1[256], test2[256];
	int ret;

#ifndef HOST_VERSION
	/* UART */
	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);

	sei();
#endif

	ret =   raw_to_base64(toto, strlen(toto), test1, 256);
	printf("%d\n", ret);
	test1[ret]=0;	
	printf("%s\n", test1);
	memset(test2, 0, 256);
	ret =   base64_to_raw(test1, ret, test2, 255);
	printf("%s\n", test2);

	while(1);

	return 0;
}
