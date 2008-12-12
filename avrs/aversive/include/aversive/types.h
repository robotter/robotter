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
 *  Revision : $Id: types.h,v 1.2 2007-05-24 13:08:44 zer0 Exp $
 *
 */

#ifndef _AVERSIVE_TYPES_H_
#define _AVERSIVE_TYPES_H_

#include <inttypes.h>

#define U08_MIN 0x00
#define U08_MAX 0xFF
#define U16_MIN 0x0000
#define U16_MAX 0xFFFF
#define U32_MIN 0x00000000
#define U32_MAX 0xFFFFFFFF
#define U64_MIN 0x0000000000000000
#define U64_MAX 0xFFFFFFFFFFFFFFFF
#define S08_MIN 0x80
#define S08_MAX 0x7F
#define S16_MIN 0x8000
#define S16_MAX 0x7FFF
#define S32_MIN 0x80000000
#define S32_MAX 0x7FFFFFFF
#define S64_MIN 0x8000000000000000
#define S64_MAX 0x7FFFFFFFFFFFFFFF

/* you should use uintXX_t instead of uXX which is more standard */

/* explicit types u = unsigned, s = signed  */
typedef uint8_t   u08;
typedef uint16_t  u16;
typedef uint32_t  u32;
typedef uint64_t  u64;
typedef int8_t    s08;
typedef int16_t   s16;
typedef int32_t   s32;
typedef int64_t   s64;


#endif /* _AVERSIVE_TYPES_H_ */
