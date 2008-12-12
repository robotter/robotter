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
 *  Revision : $Id: f64.h,v 1.8 2008-05-14 13:27:12 zer0 Exp $
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
 * For f64 the structure is composed by 2 integer of 32 bits. */

#include <aversive.h>

#ifndef _F64_H_
#define _F64_H_

typedef struct fixed_64 {
	union {
		struct {
			uint32_t decimal;
			int32_t integer;
		} s;
		int64_t s64;
	} u;
} f64;
#define f64_integer u.s.integer
#define f64_decimal u.s.decimal

#define F64_ZERO (    \
{                     \
    f64 __f;          \
    __f.u.s64 = 0;    \
    __f;              \
})

#define F64_NAN (                      \
{                                      \
    f64 __f;                           \
    __f.u.s64 = 0xFFFFFFFFFFFFFFFF;    \
    __f;                               \
})

#define F64_IS_GT(x,y) (f64_to_s64(x) >  f64_to_s64(y))
#define F64_IS_LT(x,y) (f64_to_s64(x) <  f64_to_s64(y))
#define F64_IS_GE(x,y) (f64_to_s64(x) >= f64_to_s64(y))
#define F64_IS_LE(x,y) (f64_to_s64(x) <= f64_to_s64(y))
#define F64_IS_EQ(x,y) (f64_to_s64(x) == f64_to_s64(y))
#define F64_IS_NE(x,y) (f64_to_s64(x) != f64_to_s64(y))
#define F64_IS_NEG(x)  ((x).f64_integer < 0)
#define F64_IS_ZERO(x)  ((x).f64_integer == 0 && (x).f64_decimal == 0)


/** convert a double to a f64 */
f64 f64_from_double(double f);

/** convert a f64 to a double */
double f64_to_double(f64 fix);

/** convert 2 integer (int32_t and uint32_t) to a f64 */
f64 f64_from_integer(int32_t i, uint32_t d);

/** convert msb integer (int32_t) to a f64 */
f64 f64_from_msb(int32_t i);

/** convert lsb integer (int32_t) to a f64 
 *	( -0.5 < ret < 0.5 ) 
 */
f64 f64_from_lsb(int32_t i);

/** return opposite of the number (=-f) */
f64 f64_neg(f64 f);

/** add a with b (=a+b) */
f64 f64_add(f64 a, f64 b);

/** add a with b (=a-b) */
f64 f64_sub(f64 a, f64 b);

/** return opposite of the number (=1/f) */
f64 f64_inv(f64 f);

/** mul a with b (=a*b) */
f64 f64_mul(f64 a, f64 b);

/** mul a with b (=a*b), but return only the msb */
int32_t f64_msb_mul(f64 a, f64 b);

/** div a with b (=a/b) */
f64 f64_div(f64 a, f64 b);

/** sqrt of f */
f64 f64_sqrt(f64 f);

/** function that display a f64 to the standard output */
void f64_print(f64 fix);

#endif
