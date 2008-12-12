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
 *  Revision : $Id: f16.h,v 1.8 2008-05-14 13:27:12 zer0 Exp $
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
 * For f16 the structure is composed by 2 integer of 8 bits. */

#ifndef _F16_H_
#define _F16_H_

#include <aversive.h>

typedef struct fixed_16 {
	union {
		struct {
			uint8_t decimal;
			int8_t integer;
		} s;
		int16_t s16;
	} u;
} f16;
#define f16_decimal u.s.decimal
#define f16_integer u.s.integer

#define F16_ZERO (    \
{                     \
    f16 __f;          \
    __f.u.s16 = 0;    \
    __f;              \
})

#define F16_NAN (              \
{                              \
    f16 __f;                   \
    __f.u.s16 = 0xFFFF;        \
    __f;                       \
})

#define F16_IS_GT(x,y) (f16_to_s16(x) >  f16_to_s16(y))
#define F16_IS_LT(x,y) (f16_to_s16(x) <  f16_to_s16(y))
#define F16_IS_GE(x,y) (f16_to_s16(x) >= f16_to_s16(y))
#define F16_IS_LE(x,y) (f16_to_s16(x) <= f16_to_s16(y))
#define F16_IS_EQ(x,y) (f16_to_s16(x) == f16_to_s16(y))
#define F16_IS_NE(x,y) (f16_to_s16(x) != f16_to_s16(y))
#define F16_IS_NEG(x)  ((x).f16_integer < 0)
#define F16_IS_ZERO(x)  ((x).f16_integer == 0 && (x).f16_decimal == 0)


/** convert a double to a f16 */
f16 f16_from_double(double f);

/** convert a f16 to a double */
double f16_to_double(f16 fix);

/** convert 2 integer (int8_t and uint8_t) to a f16 */
f16 f16_from_integer(int8_t i, uint8_t d);

/** convert msb integer (int8_t) to a f16 */
f16 f16_from_msb(int8_t i);

/** convert lsb integer (int8_t) to a f16 
 *	( -0.5 < ret < 0.5 ) 
 */
f16 f16_from_lsb(int8_t i);

/** return opposite of the number (=-f) */
f16 f16_neg(f16 f);

/** add a with b (=a+b) */
f16 f16_add(f16 a, f16 b);

/** add a with b (=a-b) */
f16 f16_sub(f16 a, f16 b);

/** return opposite of the number (=1/f) */
f16 f16_inv(f16 f);

/** mul a with b (=a*b) */
f16 f16_mul(f16 a, f16 b);

/** mul a with b (=a*b), but return only the msb */
f16 f16_mul_msb(f16 a, f16 b);

/** div a with b (=a/b) */
f16 f16_div(f16 a, f16 b);

/** sqrt of f */
f16 f16_sqrt(f16 f);

/** function that display a f16 to the standard output */
void f16_print(f16 fix);

#endif
