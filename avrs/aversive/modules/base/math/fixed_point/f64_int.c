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
 *  Revision : $Id: f64_int.c,v 1.6 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f64.h>

/**************** int32_t,uint32_t <-> f64 */

f64 f64_from_integer(int32_t i, uint32_t d)
{
	f64 f;
	f.f64_integer = i;
	f.f64_decimal = d;
    
	return f;
}

/**************** int32_t <-> f64 */

f64 f64_from_msb(int32_t i)
{
	f64 f;
	f.f64_integer = i;
	f.f64_decimal = 0;
    
	return f;
}


/**************** int32_t <-> f64 */

f64 f64_from_lsb(int32_t i)
{
	f64 f;
	if ( i >= 0 ) {
		f.f64_integer = 0;
		f.f64_decimal = i;
	}
	else {
		f.f64_integer = -1;
		f.f64_decimal = i;
	}
	return f;
}
