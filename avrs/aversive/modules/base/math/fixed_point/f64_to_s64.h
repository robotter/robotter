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
 *  Revision : $Id: f64_to_s64.h,v 1.5 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <aversive.h>

#ifndef _F64_TO_S64_H_
#define _F64_TO_S64_H_

#if HOST_VERSION
/* not optimized, but will work with any endianness */
static inline int64_t f64_to_s64(f64 f)
{
	return ( ((int64_t)(f.f64_integer))<<32 ) |  ((int64_t)(f.f64_decimal));
}

#else
/* only for AVR, faster */
static inline int64_t f64_to_s64(f64 f)
{
	return f.u.s64;
}

#endif

#endif
