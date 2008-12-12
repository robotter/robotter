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
 *  Revision : $Id: f64_double.c,v 1.6 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f64.h>

/* value of 2^^32 in float */
#define POW2_32F (4294967296.0)


/**************** double <-> f64 */

f64 f64_from_double(double d)
{
	f64 f;
	f.f64_decimal = (uint32_t) ((d - (int32_t)d) * POW2_32F);
	f.f64_integer = (d < 0 && f.f64_decimal != 0 ? (int32_t)d-1 : (int32_t)d) ;
    
	return f;
}

double f64_to_double(f64 f)
{
	double d;
    
	d = f.f64_integer;
	d += ((double)f.f64_decimal / POW2_32F);
  
	return d;
}
