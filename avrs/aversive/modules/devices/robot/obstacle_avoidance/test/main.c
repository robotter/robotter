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
 *  Revision : $Id: main.c,v 1.2 2008-01-08 20:05:03 zer0 Exp $
 *
 */

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>

#include <aversive.h>
#include <aversive/error.h>

#include <obstacle_avoidance.h>

#define PTX 75
#define PTY 105
#define SIZE 45

/* log function, add a command to configure
 * it dynamically */
void mylog(struct error * e, ...) 
{
	va_list ap;

	va_start(ap, e);
	printf_P(PSTR("[%d]: E%d "), e->severity, e->err_num);
	vfprintf_P(stdout, e->text, ap);
	printf_P(PSTR("\r\n"));
	va_end(ap);
}


int main(int argc, char** argv)
{
	oa_poly_t *pol;

	/* LOGS */
	error_register_emerg(mylog);
	error_register_error(mylog);
	error_register_warning(mylog);
	error_register_notice(mylog);
	error_register_debug(mylog);

	oa_init();

	oa_start_end_points(30, 30, 90, 170);

	pol = oa_new_poly(4);
	oa_poly_set_point(pol, PTX-SIZE, PTY-SIZE, 0);
	oa_poly_set_point(pol, PTX+SIZE, PTY-SIZE, 1);
	oa_poly_set_point(pol, PTX+SIZE, PTY+SIZE, 2);
	oa_poly_set_point(pol, PTX-SIZE, PTY+SIZE, 3);
	oa_process();
	
	return 0;
}


