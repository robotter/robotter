/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2006)
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
 *  Revision : $Id: timer_prescaler.h,v 1.3 2009-03-15 21:51:19 zer0 Exp $
 *
 */

#ifndef _TIMER_PRESCALER_H_
#define _TIMER_PRESCALER_H_

/* return <0 on error, else return reg value */ 
/* This static inline function is very optimized if div is
 * a constant */
static inline int16_t __timer0_div_to_reg(uint16_t div)
{
	switch(div) {
#if defined TIMER0_PRESCALER_REG_0 && TIMER0_PRESCALER_REG_0 >= 0
	case TIMER0_PRESCALER_REG_0:
		return 0;
#endif

#if defined TIMER0_PRESCALER_REG_1 && TIMER0_PRESCALER_REG_1 >= 0
	case TIMER0_PRESCALER_REG_1:
		return 1;
#endif

#if defined TIMER0_PRESCALER_REG_2 && TIMER0_PRESCALER_REG_2 >= 0
	case TIMER0_PRESCALER_REG_2:
		return 2;
#endif

#if defined TIMER0_PRESCALER_REG_3 && TIMER0_PRESCALER_REG_3 >= 0
	case TIMER0_PRESCALER_REG_3:
		return 3;
#endif

#if defined TIMER0_PRESCALER_REG_4 && TIMER0_PRESCALER_REG_4 >= 0
	case TIMER0_PRESCALER_REG_4:
		return 4;
#endif

#if defined TIMER0_PRESCALER_REG_5 && TIMER0_PRESCALER_REG_5 >= 0
	case TIMER0_PRESCALER_REG_5:
		return 5;
#endif

#if defined TIMER0_PRESCALER_REG_6 && TIMER0_PRESCALER_REG_6 >= 0
	case TIMER0_PRESCALER_REG_6:
		return 6;
#endif

#if defined TIMER0_PRESCALER_REG_7 && TIMER0_PRESCALER_REG_7 >= 0
	case TIMER0_PRESCALER_REG_7:
		return 7;
#endif

#if defined TIMER0_PRESCALER_REG_8 && TIMER0_PRESCALER_REG_8 >= 0
	case TIMER0_PRESCALER_REG_8:
		return 8;
#endif

#if defined TIMER0_PRESCALER_REG_9 && TIMER0_PRESCALER_REG_9 >= 0
	case TIMER0_PRESCALER_REG_9:
		return 9;
#endif

#if defined TIMER0_PRESCALER_REG_10 && TIMER0_PRESCALER_REG_10 >= 0
	case TIMER0_PRESCALER_REG_10:
		return 10;
#endif

#if defined TIMER0_PRESCALER_REG_11 && TIMER0_PRESCALER_REG_11 >= 0
	case TIMER0_PRESCALER_REG_11:
		return 11;
#endif

#if defined TIMER0_PRESCALER_REG_12 && TIMER0_PRESCALER_REG_12 >= 0
	case TIMER0_PRESCALER_REG_12:
		return 12;
#endif

#if defined TIMER0_PRESCALER_REG_13 && TIMER0_PRESCALER_REG_13 >= 0
	case TIMER0_PRESCALER_REG_13:
		return 13;
#endif

#if defined TIMER0_PRESCALER_REG_14 && TIMER0_PRESCALER_REG_14 >= 0
	case TIMER0_PRESCALER_REG_14:
		return 14;
#endif

#if defined TIMER0_PRESCALER_REG_15 && TIMER0_PRESCALER_REG_15 >= 0
	case TIMER0_PRESCALER_REG_15:
		return 15;
#endif
	default:
		return -1;
	}
}

/* return <0 on error, else return div value */ 
/* This static inline function is very optimized if reg is
 * a constant */
static inline int16_t __timer0_reg_to_div(uint8_t reg)
{
	switch(reg) {
#if defined TIMER0_PRESCALER_DIV_0
	case TIMER0_PRESCALER_DIV_0:
		return 0;
#endif

#if defined TIMER0_PRESCALER_DIV_1
	case TIMER0_PRESCALER_DIV_1:
		return 1;
#endif

#if defined TIMER0_PRESCALER_DIV_2
	case TIMER0_PRESCALER_DIV_2:
		return 2;
#endif

#if defined TIMER0_PRESCALER_DIV_4
	case TIMER0_PRESCALER_DIV_4:
		return 4;
#endif

#if defined TIMER0_PRESCALER_DIV_8
	case TIMER0_PRESCALER_DIV_8:
		return 8;
#endif

#if defined TIMER0_PRESCALER_DIV_16
	case TIMER0_PRESCALER_DIV_16:
		return 16;
#endif

#if defined TIMER0_PRESCALER_DIV_32
	case TIMER0_PRESCALER_DIV_32:
		return 32;
#endif

#if defined TIMER0_PRESCALER_DIV_64
	case TIMER0_PRESCALER_DIV_64:
		return 64;
#endif

#if defined TIMER0_PRESCALER_DIV_128
	case TIMER0_PRESCALER_DIV_128:
		return 128;
#endif

#if defined TIMER0_PRESCALER_DIV_256
	case TIMER0_PRESCALER_DIV_256:
		return 256;
#endif

#if defined TIMER0_PRESCALER_DIV_512
	case TIMER0_PRESCALER_DIV_512:
		return 512;
#endif

#if defined TIMER0_PRESCALER_DIV_1024
	case TIMER0_PRESCALER_DIV_1024:
		return 1024;
#endif

#if defined TIMER0_PRESCALER_DIV_2048
	case TIMER0_PRESCALER_DIV_2048:
		return 2048;
#endif

#if defined TIMER0_PRESCALER_DIV_4096
	case TIMER0_PRESCALER_DIV_4096:
		return 4096;
#endif

#if defined TIMER0_PRESCALER_DIV_8192
	case TIMER0_PRESCALER_DIV_8192:
		return 8192;
#endif

#if defined TIMER0_PRESCALER_DIV_16384
	case TIMER0_PRESCALER_DIV_16384:
		return 16384;
#endif

	default:
		return -1;
	}
}


/* return <0 on error, else return reg value */ 
/* This static inline function is very optimized if div is
 * a constant */
static inline int16_t __timer1_div_to_reg(uint16_t div)
{
	switch(div) {
#if defined TIMER1_PRESCALER_REG_0 && TIMER1_PRESCALER_REG_0 >= 0
	case TIMER1_PRESCALER_REG_0:
		return 0;
#endif

#if defined TIMER1_PRESCALER_REG_1 && TIMER1_PRESCALER_REG_1 >= 0
	case TIMER1_PRESCALER_REG_1:
		return 1;
#endif

#if defined TIMER1_PRESCALER_REG_2 && TIMER1_PRESCALER_REG_2 >= 0
	case TIMER1_PRESCALER_REG_2:
		return 2;
#endif

#if defined TIMER1_PRESCALER_REG_3 && TIMER1_PRESCALER_REG_3 >= 0
	case TIMER1_PRESCALER_REG_3:
		return 3;
#endif

#if defined TIMER1_PRESCALER_REG_4 && TIMER1_PRESCALER_REG_4 >= 0
	case TIMER1_PRESCALER_REG_4:
		return 4;
#endif

#if defined TIMER1_PRESCALER_REG_5 && TIMER1_PRESCALER_REG_5 >= 0
	case TIMER1_PRESCALER_REG_5:
		return 5;
#endif

#if defined TIMER1_PRESCALER_REG_6 && TIMER1_PRESCALER_REG_6 >= 0
	case TIMER1_PRESCALER_REG_6:
		return 6;
#endif

#if defined TIMER1_PRESCALER_REG_7 && TIMER1_PRESCALER_REG_7 >= 0
	case TIMER1_PRESCALER_REG_7:
		return 7;
#endif

#if defined TIMER1_PRESCALER_REG_8 && TIMER1_PRESCALER_REG_8 >= 0
	case TIMER1_PRESCALER_REG_8:
		return 8;
#endif

#if defined TIMER1_PRESCALER_REG_9 && TIMER1_PRESCALER_REG_9 >= 0
	case TIMER1_PRESCALER_REG_9:
		return 9;
#endif

#if defined TIMER1_PRESCALER_REG_10 && TIMER1_PRESCALER_REG_10 >= 0
	case TIMER1_PRESCALER_REG_10:
		return 10;
#endif

#if defined TIMER1_PRESCALER_REG_11 && TIMER1_PRESCALER_REG_11 >= 0
	case TIMER1_PRESCALER_REG_11:
		return 11;
#endif

#if defined TIMER1_PRESCALER_REG_12 && TIMER1_PRESCALER_REG_12 >= 0
	case TIMER1_PRESCALER_REG_12:
		return 12;
#endif

#if defined TIMER1_PRESCALER_REG_13 && TIMER1_PRESCALER_REG_13 >= 0
	case TIMER1_PRESCALER_REG_13:
		return 13;
#endif

#if defined TIMER1_PRESCALER_REG_14 && TIMER1_PRESCALER_REG_14 >= 0
	case TIMER1_PRESCALER_REG_14:
		return 14;
#endif

#if defined TIMER1_PRESCALER_REG_15 && TIMER1_PRESCALER_REG_15 >= 0
	case TIMER1_PRESCALER_REG_15:
		return 15;
#endif
	default:
		return -1;
	}
}

/* return <0 on error, else return div value */ 
/* This static inline function is very optimized if reg is
 * a constant */
static inline int16_t __timer1_reg_to_div(uint8_t reg)
{
	switch(reg) {
#if defined TIMER1_PRESCALER_DIV_0
	case TIMER1_PRESCALER_DIV_0:
		return 0;
#endif

#if defined TIMER1_PRESCALER_DIV_1
	case TIMER1_PRESCALER_DIV_1:
		return 1;
#endif

#if defined TIMER1_PRESCALER_DIV_2
	case TIMER1_PRESCALER_DIV_2:
		return 2;
#endif

#if defined TIMER1_PRESCALER_DIV_4
	case TIMER1_PRESCALER_DIV_4:
		return 4;
#endif

#if defined TIMER1_PRESCALER_DIV_8
	case TIMER1_PRESCALER_DIV_8:
		return 8;
#endif

#if defined TIMER1_PRESCALER_DIV_16
	case TIMER1_PRESCALER_DIV_16:
		return 16;
#endif

#if defined TIMER1_PRESCALER_DIV_32
	case TIMER1_PRESCALER_DIV_32:
		return 32;
#endif

#if defined TIMER1_PRESCALER_DIV_64
	case TIMER1_PRESCALER_DIV_64:
		return 64;
#endif

#if defined TIMER1_PRESCALER_DIV_128
	case TIMER1_PRESCALER_DIV_128:
		return 128;
#endif

#if defined TIMER1_PRESCALER_DIV_256
	case TIMER1_PRESCALER_DIV_256:
		return 256;
#endif

#if defined TIMER1_PRESCALER_DIV_512
	case TIMER1_PRESCALER_DIV_512:
		return 512;
#endif

#if defined TIMER1_PRESCALER_DIV_1024
	case TIMER1_PRESCALER_DIV_1024:
		return 1024;
#endif

#if defined TIMER1_PRESCALER_DIV_2048
	case TIMER1_PRESCALER_DIV_2048:
		return 2048;
#endif

#if defined TIMER1_PRESCALER_DIV_4096
	case TIMER1_PRESCALER_DIV_4096:
		return 4096;
#endif

#if defined TIMER1_PRESCALER_DIV_8192
	case TIMER1_PRESCALER_DIV_8192:
		return 8192;
#endif

#if defined TIMER1_PRESCALER_DIV_16384
	case TIMER1_PRESCALER_DIV_16384:
		return 16384;
#endif

	default:
		return -1;
	}
}



/* return <0 on error, else return reg value */ 
/* This static inline function is very optimized if div is
 * a constant */
static inline int16_t __timer2_div_to_reg(uint16_t div)
{
	switch(div) {
#if defined TIMER2_PRESCALER_REG_0 && TIMER2_PRESCALER_REG_0 >= 0
	case TIMER2_PRESCALER_REG_0:
		return 0;
#endif

#if defined TIMER2_PRESCALER_REG_1 && TIMER2_PRESCALER_REG_1 >= 0
	case TIMER2_PRESCALER_REG_1:
		return 1;
#endif

#if defined TIMER2_PRESCALER_REG_2 && TIMER2_PRESCALER_REG_2 >= 0
	case TIMER2_PRESCALER_REG_2:
		return 2;
#endif

#if defined TIMER2_PRESCALER_REG_3 && TIMER2_PRESCALER_REG_3 >= 0
	case TIMER2_PRESCALER_REG_3:
		return 3;
#endif

#if defined TIMER2_PRESCALER_REG_4 && TIMER2_PRESCALER_REG_4 >= 0
	case TIMER2_PRESCALER_REG_4:
		return 4;
#endif

#if defined TIMER2_PRESCALER_REG_5 && TIMER2_PRESCALER_REG_5 >= 0
	case TIMER2_PRESCALER_REG_5:
		return 5;
#endif

#if defined TIMER2_PRESCALER_REG_6 && TIMER2_PRESCALER_REG_6 >= 0
	case TIMER2_PRESCALER_REG_6:
		return 6;
#endif

#if defined TIMER2_PRESCALER_REG_7 && TIMER2_PRESCALER_REG_7 >= 0
	case TIMER2_PRESCALER_REG_7:
		return 7;
#endif

#if defined TIMER2_PRESCALER_REG_8 && TIMER2_PRESCALER_REG_8 >= 0
	case TIMER2_PRESCALER_REG_8:
		return 8;
#endif

#if defined TIMER2_PRESCALER_REG_9 && TIMER2_PRESCALER_REG_9 >= 0
	case TIMER2_PRESCALER_REG_9:
		return 9;
#endif

#if defined TIMER2_PRESCALER_REG_10 && TIMER2_PRESCALER_REG_10 >= 0
	case TIMER2_PRESCALER_REG_10:
		return 10;
#endif

#if defined TIMER2_PRESCALER_REG_11 && TIMER2_PRESCALER_REG_11 >= 0
	case TIMER2_PRESCALER_REG_11:
		return 11;
#endif

#if defined TIMER2_PRESCALER_REG_12 && TIMER2_PRESCALER_REG_12 >= 0
	case TIMER2_PRESCALER_REG_12:
		return 12;
#endif

#if defined TIMER2_PRESCALER_REG_13 && TIMER2_PRESCALER_REG_13 >= 0
	case TIMER2_PRESCALER_REG_13:
		return 13;
#endif

#if defined TIMER2_PRESCALER_REG_14 && TIMER2_PRESCALER_REG_14 >= 0
	case TIMER2_PRESCALER_REG_14:
		return 14;
#endif

#if defined TIMER2_PRESCALER_REG_15 && TIMER2_PRESCALER_REG_15 >= 0
	case TIMER2_PRESCALER_REG_15:
		return 15;
#endif
	default:
		return -1;
	}
}

/* return <0 on error, else return div value */ 
/* This static inline function is very optimized if reg is
 * a constant */
static inline int16_t __timer2_reg_to_div(uint8_t reg)
{
	switch(reg) {
#if defined TIMER2_PRESCALER_DIV_0
	case TIMER2_PRESCALER_DIV_0:
		return 0;
#endif

#if defined TIMER2_PRESCALER_DIV_1
	case TIMER2_PRESCALER_DIV_1:
		return 1;
#endif

#if defined TIMER2_PRESCALER_DIV_2
	case TIMER2_PRESCALER_DIV_2:
		return 2;
#endif

#if defined TIMER2_PRESCALER_DIV_4
	case TIMER2_PRESCALER_DIV_4:
		return 4;
#endif

#if defined TIMER2_PRESCALER_DIV_8
	case TIMER2_PRESCALER_DIV_8:
		return 8;
#endif

#if defined TIMER2_PRESCALER_DIV_16
	case TIMER2_PRESCALER_DIV_16:
		return 16;
#endif

#if defined TIMER2_PRESCALER_DIV_32
	case TIMER2_PRESCALER_DIV_32:
		return 32;
#endif

#if defined TIMER2_PRESCALER_DIV_64
	case TIMER2_PRESCALER_DIV_64:
		return 64;
#endif

#if defined TIMER2_PRESCALER_DIV_128
	case TIMER2_PRESCALER_DIV_128:
		return 128;
#endif

#if defined TIMER2_PRESCALER_DIV_256
	case TIMER2_PRESCALER_DIV_256:
		return 256;
#endif

#if defined TIMER2_PRESCALER_DIV_512
	case TIMER2_PRESCALER_DIV_512:
		return 512;
#endif

#if defined TIMER2_PRESCALER_DIV_1024
	case TIMER2_PRESCALER_DIV_1024:
		return 1024;
#endif

#if defined TIMER2_PRESCALER_DIV_2048
	case TIMER2_PRESCALER_DIV_2048:
		return 2048;
#endif

#if defined TIMER2_PRESCALER_DIV_4096
	case TIMER2_PRESCALER_DIV_4096:
		return 4096;
#endif

#if defined TIMER2_PRESCALER_DIV_8192
	case TIMER2_PRESCALER_DIV_8192:
		return 8192;
#endif

#if defined TIMER2_PRESCALER_DIV_16384
	case TIMER2_PRESCALER_DIV_16384:
		return 16384;
#endif

	default:
		return -1;
	}
}



/* return <0 on error, else return reg value */ 
/* This static inline function is very optimized if div is
 * a constant */
static inline int16_t __timer3_div_to_reg(uint16_t div)
{
	switch(div) {
#if defined TIMER3_PRESCALER_REG_0 && TIMER3_PRESCALER_REG_0 >= 0
	case TIMER3_PRESCALER_REG_0:
		return 0;
#endif

#if defined TIMER3_PRESCALER_REG_1 && TIMER3_PRESCALER_REG_1 >= 0
	case TIMER3_PRESCALER_REG_1:
		return 1;
#endif

#if defined TIMER3_PRESCALER_REG_2 && TIMER3_PRESCALER_REG_2 >= 0
	case TIMER3_PRESCALER_REG_2:
		return 2;
#endif

#if defined TIMER3_PRESCALER_REG_3 && TIMER3_PRESCALER_REG_3 >= 0
	case TIMER3_PRESCALER_REG_3:
		return 3;
#endif

#if defined TIMER3_PRESCALER_REG_4 && TIMER3_PRESCALER_REG_4 >= 0
	case TIMER3_PRESCALER_REG_4:
		return 4;
#endif

#if defined TIMER3_PRESCALER_REG_5 && TIMER3_PRESCALER_REG_5 >= 0
	case TIMER3_PRESCALER_REG_5:
		return 5;
#endif

#if defined TIMER3_PRESCALER_REG_6 && TIMER3_PRESCALER_REG_6 >= 0
	case TIMER3_PRESCALER_REG_6:
		return 6;
#endif

#if defined TIMER3_PRESCALER_REG_7 && TIMER3_PRESCALER_REG_7 >= 0
	case TIMER3_PRESCALER_REG_7:
		return 7;
#endif

#if defined TIMER3_PRESCALER_REG_8 && TIMER3_PRESCALER_REG_8 >= 0
	case TIMER3_PRESCALER_REG_8:
		return 8;
#endif

#if defined TIMER3_PRESCALER_REG_9 && TIMER3_PRESCALER_REG_9 >= 0
	case TIMER3_PRESCALER_REG_9:
		return 9;
#endif

#if defined TIMER3_PRESCALER_REG_10 && TIMER3_PRESCALER_REG_10 >= 0
	case TIMER3_PRESCALER_REG_10:
		return 10;
#endif

#if defined TIMER3_PRESCALER_REG_11 && TIMER3_PRESCALER_REG_11 >= 0
	case TIMER3_PRESCALER_REG_11:
		return 11;
#endif

#if defined TIMER3_PRESCALER_REG_12 && TIMER3_PRESCALER_REG_12 >= 0
	case TIMER3_PRESCALER_REG_12:
		return 12;
#endif

#if defined TIMER3_PRESCALER_REG_13 && TIMER3_PRESCALER_REG_13 >= 0
	case TIMER3_PRESCALER_REG_13:
		return 13;
#endif
#if defined TIMER3_PRESCALER_REG_14 && TIMER3_PRESCALER_REG_14 >= 0
	case TIMER3_PRESCALER_REG_14:
		return 14;
#endif

#if defined TIMER3_PRESCALER_REG_15 && TIMER3_PRESCALER_REG_15 >= 0
	case TIMER3_PRESCALER_REG_15:
		return 15;
#endif
	default:
		return -1;
	}
}

/* return <0 on error, else return div value */ 
/* This static inline function is very optimized if reg is
 * a constant */
static inline int16_t __timer3_reg_to_div(uint8_t reg)
{
	switch(reg) {
#if defined TIMER3_PRESCALER_DIV_0
	case TIMER3_PRESCALER_DIV_0:
		return 0;
#endif

#if defined TIMER3_PRESCALER_DIV_1
	case TIMER3_PRESCALER_DIV_1:
		return 1;
#endif

#if defined TIMER3_PRESCALER_DIV_2
	case TIMER3_PRESCALER_DIV_2:
		return 2;
#endif

#if defined TIMER3_PRESCALER_DIV_4
	case TIMER3_PRESCALER_DIV_4:
		return 4;
#endif

#if defined TIMER3_PRESCALER_DIV_8
	case TIMER3_PRESCALER_DIV_8:
		return 8;
#endif

#if defined TIMER3_PRESCALER_DIV_16
	case TIMER3_PRESCALER_DIV_16:
		return 16;
#endif

#if defined TIMER3_PRESCALER_DIV_32
	case TIMER3_PRESCALER_DIV_32:
		return 32;
#endif

#if defined TIMER3_PRESCALER_DIV_64
	case TIMER3_PRESCALER_DIV_64:
		return 64;
#endif

#if defined TIMER3_PRESCALER_DIV_128
	case TIMER3_PRESCALER_DIV_128:
		return 128;
#endif

#if defined TIMER3_PRESCALER_DIV_256
	case TIMER3_PRESCALER_DIV_256:
		return 256;
#endif

#if defined TIMER3_PRESCALER_DIV_512
	case TIMER3_PRESCALER_DIV_512:
		return 512;
#endif

#if defined TIMER3_PRESCALER_DIV_1024
	case TIMER3_PRESCALER_DIV_1024:
		return 1024;
#endif

#if defined TIMER3_PRESCALER_DIV_2048
	case TIMER3_PRESCALER_DIV_2048:
		return 2048;
#endif

#if defined TIMER3_PRESCALER_DIV_4096
	case TIMER3_PRESCALER_DIV_4096:
		return 4096;
#endif

#if defined TIMER3_PRESCALER_DIV_8192
	case TIMER3_PRESCALER_DIV_8192:
		return 8192;
#endif

#if defined TIMER3_PRESCALER_DIV_16384
	case TIMER3_PRESCALER_DIV_16384:
		return 16384;
#endif

	default:
		return -1;
	}
}

/* return <0 on error, else return reg value */ 
/* This static inline function is very optimized if div is
 * a constant */
static inline int16_t __timer4_div_to_reg(uint16_t div)
{
	switch(div) {
#if defined TIMER4_PRESCALER_REG_0 && TIMER4_PRESCALER_REG_0 >= 0
	case TIMER4_PRESCALER_REG_0:
		return 0;
#endif

#if defined TIMER4_PRESCALER_REG_1 && TIMER4_PRESCALER_REG_1 >= 0
	case TIMER4_PRESCALER_REG_1:
		return 1;
#endif

#if defined TIMER4_PRESCALER_REG_2 && TIMER4_PRESCALER_REG_2 >= 0
	case TIMER4_PRESCALER_REG_2:
		return 2;
#endif

#if defined TIMER4_PRESCALER_REG_3 && TIMER4_PRESCALER_REG_3 >= 0
	case TIMER4_PRESCALER_REG_3:
		return 3;
#endif

#if defined TIMER4_PRESCALER_REG_4 && TIMER4_PRESCALER_REG_4 >= 0
	case TIMER4_PRESCALER_REG_4:
		return 4;
#endif

#if defined TIMER4_PRESCALER_REG_5 && TIMER4_PRESCALER_REG_5 >= 0
	case TIMER4_PRESCALER_REG_5:
		return 5;
#endif

#if defined TIMER4_PRESCALER_REG_6 && TIMER4_PRESCALER_REG_6 >= 0
	case TIMER4_PRESCALER_REG_6:
		return 6;
#endif

#if defined TIMER4_PRESCALER_REG_7 && TIMER4_PRESCALER_REG_7 >= 0
	case TIMER4_PRESCALER_REG_7:
		return 7;
#endif

#if defined TIMER4_PRESCALER_REG_8 && TIMER4_PRESCALER_REG_8 >= 0
	case TIMER4_PRESCALER_REG_8:
		return 8;
#endif

#if defined TIMER4_PRESCALER_REG_9 && TIMER4_PRESCALER_REG_9 >= 0
	case TIMER4_PRESCALER_REG_9:
		return 9;
#endif

#if defined TIMER4_PRESCALER_REG_10 && TIMER4_PRESCALER_REG_10 >= 0
	case TIMER4_PRESCALER_REG_10:
		return 10;
#endif

#if defined TIMER4_PRESCALER_REG_11 && TIMER4_PRESCALER_REG_11 >= 0
	case TIMER4_PRESCALER_REG_11:
		return 11;
#endif

#if defined TIMER4_PRESCALER_REG_12 && TIMER4_PRESCALER_REG_12 >= 0
	case TIMER4_PRESCALER_REG_12:
		return 12;
#endif

#if defined TIMER4_PRESCALER_REG_13 && TIMER4_PRESCALER_REG_13 >= 0
	case TIMER4_PRESCALER_REG_13:
		return 13;
#endif
#if defined TIMER4_PRESCALER_REG_14 && TIMER4_PRESCALER_REG_14 >= 0
	case TIMER4_PRESCALER_REG_14:
		return 14;
#endif

#if defined TIMER4_PRESCALER_REG_15 && TIMER4_PRESCALER_REG_15 >= 0
	case TIMER4_PRESCALER_REG_15:
		return 15;
#endif
	default:
		return -1;
	}
}

/* return <0 on error, else return div value */ 
/* This static inline function is very optimized if reg is
 * a constant */
static inline int16_t __timer4_reg_to_div(uint8_t reg)
{
	switch(reg) {
#if defined TIMER4_PRESCALER_DIV_0
	case TIMER4_PRESCALER_DIV_0:
		return 0;
#endif

#if defined TIMER4_PRESCALER_DIV_1
	case TIMER4_PRESCALER_DIV_1:
		return 1;
#endif

#if defined TIMER4_PRESCALER_DIV_2
	case TIMER4_PRESCALER_DIV_2:
		return 2;
#endif

#if defined TIMER4_PRESCALER_DIV_4
	case TIMER4_PRESCALER_DIV_4:
		return 4;
#endif

#if defined TIMER4_PRESCALER_DIV_8
	case TIMER4_PRESCALER_DIV_8:
		return 8;
#endif

#if defined TIMER4_PRESCALER_DIV_16
	case TIMER4_PRESCALER_DIV_16:
		return 16;
#endif

#if defined TIMER4_PRESCALER_DIV_32
	case TIMER4_PRESCALER_DIV_32:
		return 32;
#endif

#if defined TIMER4_PRESCALER_DIV_64
	case TIMER4_PRESCALER_DIV_64:
		return 64;
#endif

#if defined TIMER4_PRESCALER_DIV_128
	case TIMER4_PRESCALER_DIV_128:
		return 128;
#endif

#if defined TIMER4_PRESCALER_DIV_256
	case TIMER4_PRESCALER_DIV_256:
		return 256;
#endif

#if defined TIMER4_PRESCALER_DIV_512
	case TIMER4_PRESCALER_DIV_512:
		return 512;
#endif

#if defined TIMER4_PRESCALER_DIV_1024
	case TIMER4_PRESCALER_DIV_1024:
		return 1024;
#endif

#if defined TIMER4_PRESCALER_DIV_2048
	case TIMER4_PRESCALER_DIV_2048:
		return 2048;
#endif

#if defined TIMER4_PRESCALER_DIV_4096
	case TIMER4_PRESCALER_DIV_4096:
		return 4096;
#endif

#if defined TIMER4_PRESCALER_DIV_8192
	case TIMER4_PRESCALER_DIV_8192:
		return 8192;
#endif

#if defined TIMER4_PRESCALER_DIV_16384
	case TIMER4_PRESCALER_DIV_16384:
		return 16384;
#endif

	default:
		return -1;
	}
}

/* return <0 on error, else return reg value */ 
/* This static inline function is very optimized if div is
 * a constant */
static inline int16_t __timer5_div_to_reg(uint16_t div)
{
	switch(div) {
#if defined TIMER5_PRESCALER_REG_0 && TIMER5_PRESCALER_REG_0 >= 0
	case TIMER5_PRESCALER_REG_0:
		return 0;
#endif

#if defined TIMER5_PRESCALER_REG_1 && TIMER5_PRESCALER_REG_1 >= 0
	case TIMER5_PRESCALER_REG_1:
		return 1;
#endif

#if defined TIMER5_PRESCALER_REG_2 && TIMER5_PRESCALER_REG_2 >= 0
	case TIMER5_PRESCALER_REG_2:
		return 2;
#endif

#if defined TIMER5_PRESCALER_REG_3 && TIMER5_PRESCALER_REG_3 >= 0
	case TIMER5_PRESCALER_REG_3:
		return 3;
#endif

#if defined TIMER5_PRESCALER_REG_4 && TIMER5_PRESCALER_REG_4 >= 0
	case TIMER5_PRESCALER_REG_4:
		return 4;
#endif

#if defined TIMER5_PRESCALER_REG_5 && TIMER5_PRESCALER_REG_5 >= 0
	case TIMER5_PRESCALER_REG_5:
		return 5;
#endif

#if defined TIMER5_PRESCALER_REG_6 && TIMER5_PRESCALER_REG_6 >= 0
	case TIMER5_PRESCALER_REG_6:
		return 6;
#endif

#if defined TIMER5_PRESCALER_REG_7 && TIMER5_PRESCALER_REG_7 >= 0
	case TIMER5_PRESCALER_REG_7:
		return 7;
#endif

#if defined TIMER5_PRESCALER_REG_8 && TIMER5_PRESCALER_REG_8 >= 0
	case TIMER5_PRESCALER_REG_8:
		return 8;
#endif

#if defined TIMER5_PRESCALER_REG_9 && TIMER5_PRESCALER_REG_9 >= 0
	case TIMER5_PRESCALER_REG_9:
		return 9;
#endif

#if defined TIMER5_PRESCALER_REG_10 && TIMER5_PRESCALER_REG_10 >= 0
	case TIMER5_PRESCALER_REG_10:
		return 10;
#endif

#if defined TIMER5_PRESCALER_REG_11 && TIMER5_PRESCALER_REG_11 >= 0
	case TIMER5_PRESCALER_REG_11:
		return 11;
#endif

#if defined TIMER5_PRESCALER_REG_12 && TIMER5_PRESCALER_REG_12 >= 0
	case TIMER5_PRESCALER_REG_12:
		return 12;
#endif

#if defined TIMER5_PRESCALER_REG_13 && TIMER5_PRESCALER_REG_13 >= 0
	case TIMER5_PRESCALER_REG_13:
		return 13;
#endif
#if defined TIMER5_PRESCALER_REG_14 && TIMER5_PRESCALER_REG_14 >= 0
	case TIMER5_PRESCALER_REG_14:
		return 14;
#endif

#if defined TIMER5_PRESCALER_REG_15 && TIMER5_PRESCALER_REG_15 >= 0
	case TIMER5_PRESCALER_REG_15:
		return 15;
#endif
	default:
		return -1;
	}
}

/* return <0 on error, else return div value */ 
/* This static inline function is very optimized if reg is
 * a constant */
static inline int16_t __timer5_reg_to_div(uint8_t reg)
{
	switch(reg) {
#if defined TIMER5_PRESCALER_DIV_0
	case TIMER5_PRESCALER_DIV_0:
		return 0;
#endif

#if defined TIMER5_PRESCALER_DIV_1
	case TIMER5_PRESCALER_DIV_1:
		return 1;
#endif

#if defined TIMER5_PRESCALER_DIV_2
	case TIMER5_PRESCALER_DIV_2:
		return 2;
#endif

#if defined TIMER5_PRESCALER_DIV_4
	case TIMER5_PRESCALER_DIV_4:
		return 4;
#endif

#if defined TIMER5_PRESCALER_DIV_8
	case TIMER5_PRESCALER_DIV_8:
		return 8;
#endif

#if defined TIMER5_PRESCALER_DIV_16
	case TIMER5_PRESCALER_DIV_16:
		return 16;
#endif

#if defined TIMER5_PRESCALER_DIV_32
	case TIMER5_PRESCALER_DIV_32:
		return 32;
#endif

#if defined TIMER5_PRESCALER_DIV_64
	case TIMER5_PRESCALER_DIV_64:
		return 64;
#endif

#if defined TIMER5_PRESCALER_DIV_128
	case TIMER5_PRESCALER_DIV_128:
		return 128;
#endif

#if defined TIMER5_PRESCALER_DIV_256
	case TIMER5_PRESCALER_DIV_256:
		return 256;
#endif

#if defined TIMER5_PRESCALER_DIV_512
	case TIMER5_PRESCALER_DIV_512:
		return 512;
#endif

#if defined TIMER5_PRESCALER_DIV_1024
	case TIMER5_PRESCALER_DIV_1024:
		return 1024;
#endif

#if defined TIMER5_PRESCALER_DIV_2048
	case TIMER5_PRESCALER_DIV_2048:
		return 2048;
#endif

#if defined TIMER5_PRESCALER_DIV_4096
	case TIMER5_PRESCALER_DIV_4096:
		return 4096;
#endif

#if defined TIMER5_PRESCALER_DIV_8192
	case TIMER5_PRESCALER_DIV_8192:
		return 8192;
#endif

#if defined TIMER5_PRESCALER_DIV_16384
	case TIMER5_PRESCALER_DIV_16384:
		return 16384;
#endif

	default:
		return -1;
	}
}

#endif
