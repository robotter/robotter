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
 *  Revision : $Id: f32_sqrt.c,v 1.7 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f32.h>
#include <s32_to_f32.h>

#define NEXT(n, i)  (((n) + (i)/(n)) >> 1)

static uint32_t u32_sqrt(uint32_t number) {
	uint32_t n  = 1;
	uint32_t n1 = NEXT(n, number);
	
	while(ABS(n1 - n) > 1) {
		n  = n1;
		n1 = NEXT(n, number);
	}
	while((n1*n1) > number) {
		n1 -= 1;
	}
	return n1;
}

f32 f32_sqrt(f32 f)
{
	uint32_t a,b,c,d;

	if (F32_IS_ZERO(f))
		return F32_ZERO;

	if (F32_IS_NEG(f))
		return F32_NAN;

	if(f.f32_integer) {
		/* sqrt(a+b) = sqrt(a)*sqrt(1+b/a) */
		a=(uint32_t)(f.f32_integer) << 16 ;
		b=(uint32_t)(f.f32_decimal) << 16 ;
		c=u32_sqrt(a);
		d=u32_sqrt(0x10000 + (b/a));
		return f32_mul(s32_to_f32( c<<8 ), s32_to_f32( d<<8 ));
	}
	else {
		b=(uint32_t)(f.f32_decimal) << 16 ;
		return s32_to_f32(u32_sqrt(b));
	}
}

