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
 *  Revision : $Id: f16_int.c,v 1.6 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f16.h>


/**************** int8_t,uint8_t <-> f16 */

f16 f16_from_integer(int8_t i, uint8_t d)
{
	f16 f;
	f.f16_integer = i;
	f.f16_decimal = d;
    
	return f;
}

/**************** int8_t <-> f16 */

f16 f16_from_msb(int8_t i)
{
	f16 f;
	f.f16_integer = i;
	f.f16_decimal = 0;
    
	return f;
}


/**************** int8_t <-> f16 */

f16 f16_from_lsb(int8_t i)
{
	f16 f;
	if ( i >= 0 ) {
		f.f16_integer = 0;
		f.f16_decimal = i;
	}
	else {
		f.f16_integer = -1;
		f.f16_decimal = i;
	}
	return f;
}
