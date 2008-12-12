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
 *  Revision : $Id: s16_to_f16.h,v 1.4 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#ifndef _S16_TO_F16_H_
#define _S16_TO_F16_H_

#ifdef HOST_VERSION
/* not optimized, but will work with any endianness */
static inline f16 s16_to_f16(int16_t i)
{
	f16 f;
	f.f16_integer = ((i) >> 8);
	f.f16_decimal = (i);
	return f;
}
#else
/* only for AVR, faster */
static inline f16 s16_to_f16(int16_t i)
{
	f16 f;
	f.u.s16 = i;
	return f;
}
#endif

#endif
