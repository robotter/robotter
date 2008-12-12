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
 *  Revision : $Id: f32.h,v 1.8 2008-05-14 13:27:12 zer0 Exp $
 *
 */

/* Here is an example of what is fixed point. This is the f16 type : 
 *
 *   int dec   1/256 = 0.00390625 
 *
 *    07 01 : 7 + 0x01*0.00390625 = 7.0039625
 *    07 80 : 7 + 0x80*0.00390625 = 7.5
 *    07 FF : 7 + 0xFF*0.00390625 = 7.99609375
 *    00 00 : 0
 *    FF 00 : -1
 *    FF FF : -1 + 0xFF*0.00390625 = -0.0039625
 *    7F 00 : +127
 *    7F FF : +127 + 0xFF*0.00390625 = 127.99609375
 *    80 00 : -128
 *
 * For f32 the structure is composed by 2 integer of 16 bits. */

#ifndef _F32_H_
#define _F32_H_

#include <aversive.h>

typedef struct fixed_32 {
	union {
		struct {
			uint16_t decimal;
			int16_t integer;
		} s;
		int32_t s32;
	} u;
} f32;
#define f32_decimal u.s.decimal
#define f32_integer u.s.integer

#define F32_ZERO (    \
{                     \
    f32 __f;          \
    __f.u.s32 = 0;    \
    __f;              \
})

#define F32_NAN (              \
{                              \
    f32 __f;                   \
    __f.u.s32 = 0xFFFFFFFF;    \
    __f;                       \
})

#define F32_IS_GT(x,y) (f32_to_s32(x) >  f32_to_s32(y))
#define F32_IS_LT(x,y) (f32_to_s32(x) <  f32_to_s32(y))
#define F32_IS_GE(x,y) (f32_to_s32(x) >= f32_to_s32(y))
#define F32_IS_LE(x,y) (f32_to_s32(x) <= f32_to_s32(y))
#define F32_IS_EQ(x,y) (f32_to_s32(x) == f32_to_s32(y))
#define F32_IS_NE(x,y) (f32_to_s32(x) != f32_to_s32(y))
#define F32_IS_NEG(x)  ((x).f32_integer < 0)
#define F32_IS_ZERO(x)  ((x).f32_integer == 0 && (x).f32_decimal == 0)

/** convert a double to a f32 */
f32 f32_from_double(double f);

/** convert a f32 to a double */
double f32_to_double(f32 fix);

/** convert 2 integer (int16_t and uint16_t) to a f32 */
f32 f32_from_integer(int16_t i, uint16_t d);

/** convert msb integer (int16_t) to a f32 */
f32 f32_from_msb(int16_t i);

/** convert lsb integer (int16_t) to a f32 
 *	( -0.5 < ret < 0.5 ) 
 */
f32 f32_from_lsb(int16_t i);

/** return opposite of the number (=-f) */
f32 f32_neg(f32 f);

/** add a with b (=a+b) */
f32 f32_add(f32 a, f32 b);

/** add a with b (=a-b) */
f32 f32_sub(f32 a, f32 b);

/** return opposite of the number (=1/f) */
f32 f32_inv(f32 f);

/** mul a with b (=a*b) */
f32 f32_mul(f32 a, f32 b);

/** mul a with b (=a*b), but return only the msb */
f32 f32_mul_msb(f32 a, f32 b);

/** div a with b (=a/b) */
f32 f32_div(f32 a, f32 b);

/** sqrt of f */
f32 f32_sqrt(f32 f);

/** function that display a f32 to the standard output */
void f32_print(f32 fix);

#endif
