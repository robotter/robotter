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
 *  Revision : $Id: f16_sqrt.c,v 1.7 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f16.h>
#include <s16_to_f16.h>


#define NEXT(n, i)  (((n) + (i)/(n)) >> 1)

static uint16_t u16_sqrt(uint16_t number) {
	uint16_t n  = 1;
	uint16_t n1 = NEXT(n, number);
	
	while(ABS(n1 - n) > 1) {
		n  = n1;
		n1 = NEXT(n, number);
	}
	while((n1*n1) > number) {
		n1 -= 1;
	}
	return n1;
}


f16 f16_sqrt(f16 f)
{
	uint16_t a,b,c,d;

	if (F16_IS_NEG(f))
		return F16_NAN;

	if(f.f16_integer) {
		/* sqrt(a+b) = sqrt(a)*sqrt(1+b/a) */
		a=(uint16_t)(f.f16_integer) << 8 ;
		b=(uint16_t)(f.f16_decimal) << 8 ;
		c=u16_sqrt(a);
		d=u16_sqrt(0x100 + (b/a));
		return f16_mul(s16_to_f16( c<<4 ), s16_to_f16( d<<4 ));
	}
	else {
		b=(uint16_t)(f.f16_decimal) << 8 ;
		return s16_to_f16(u16_sqrt(b));
	}
}
