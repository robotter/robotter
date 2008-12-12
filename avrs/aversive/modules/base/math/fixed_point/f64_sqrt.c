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
 *  Revision : $Id: f64_sqrt.c,v 1.7 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f64.h>
#include <s64_to_f64.h>

#define NEXT(n, i)  (((n) + (i)/(n)) >> 1)

static uint64_t u64_sqrt(uint64_t number) {
	uint64_t n  = 1;
	uint64_t n1 = NEXT(n, number);
	
	while(ABS(n1 - n) > 1) {
		n  = n1;
		n1 = NEXT(n, number);
	}
	while((n1*n1) > number) {
		n1 -= 1;
	}
	return n1;
}

f64 f64_sqrt(f64 f)
{
	uint64_t a,b,c,d;

	if (F64_IS_ZERO(f))
		return F64_ZERO;

	if (F64_IS_NEG(f))
		return F64_NAN;

	if(f.f64_integer) {
		/* sqrt(a+b) = sqrt(a)*sqrt(1+b/a) */
		a=(uint64_t)(f.f64_integer) << 32 ;
		b=(uint64_t)(f.f64_decimal) << 32 ;
		c=u64_sqrt(a);
		d=u64_sqrt(0x100000000 + (b/a));
		return f64_mul(s64_to_f64( c<<16 ), s64_to_f64( d<<16 ));
	}
	else {
		b=(uint64_t)(f.f64_decimal) << 32 ;
		return s64_to_f64(u64_sqrt(b));
	}
}
