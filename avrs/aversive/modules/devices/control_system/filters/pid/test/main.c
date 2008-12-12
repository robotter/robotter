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
 *  Revision : $Id: main.c,v 1.6 2008-01-08 20:05:03 zer0 Exp $
 *
 */

#include <stdio.h>

#include <pid.h>

int32_t tab[] = { 0, 1, 2, 5, 6, 0, 0, 1, 0, 0, -10, -8, -5, -1 };

int main(void)
{
	struct pid_filter p;
	int32_t val;
	int i;

	pid_init(&p);
	pid_set_gains(&p, 1000, 30, 5000);
	pid_set_maximums(&p, 0, 50000, 4095);
	pid_set_out_shift(&p, 10);
	pid_set_derivate_filter(&p, 4);

	for (i=0; i < (sizeof(tab)/sizeof(int32_t)); i++) {
		val = pid_do_filter(&p, tab[i]);
		printf("in  = %" PRId32 "\n", tab[i]);
		printf("out = %" PRId32 "\n", val);
		printf("I   = %" PRId32 "\n", p.integral);
		printf("D   = %" PRId32 "\n\n", p.prev_D);
	}

	return 0;
}


