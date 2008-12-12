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
 *  Revision : $Id: f32_double.c,v 1.6 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f32.h>

/* value of 2^^16 in float */
#define POW2_16F (65536.0)


/**************** double <-> f32 */

f32 f32_from_double(double d)
{
	f32 f;
	f.f32_decimal = (uint16_t) ((d - (int16_t)d) * POW2_16F);
	f.f32_integer = (d < 0 && f.f32_decimal != 0 ? (int16_t)d-1 : (int16_t)d) ;
	
	return f;
}

double f32_to_double(f32 f)
{
	double d;
	
	d = f.f32_integer;
	d += ((double)f.f32_decimal / POW2_16F);
	
	return d;
}
