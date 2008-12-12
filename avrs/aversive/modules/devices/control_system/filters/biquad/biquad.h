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
 *  Revision : $Id: biquad.h,v 1.3 2008-01-08 22:12:04 zer0 Exp $
 *
 */

#ifndef _BIQUAD_H_
#define _BIQUAD_H_

#include <aversive.h>
#include <stdlib.h>

/** this is the biquad structure */
struct biquad_filter
{

	int16_t     b0, b1, b2;
	int16_t     a1, a2; /* never access it directly, use accessors */
  
	uint8_t     out_shift;
	uint8_t     recursive_shift;

	int32_t     mem_in_1;
	int32_t     mem_in_2;
	int32_t     mem_out_1;
	int32_t     mem_out_2;
  
	struct biquad_filter * son;
  
};




/** Prototyping */

/** 
 * init sets an unity filter, as usual initialization is absolutely
 * necessary !
 */
extern void biquad_init (struct biquad_filter * p);


extern void biquad_set_numerator_coeffs  (struct biquad_filter *p, int16_t b0, int16_t b1, int16_t b2);
extern void biquad_set_deniminator_coeffs(struct biquad_filter *p,             int16_t a1, int16_t a2);

extern void biquad_set_divisor_shifts(struct biquad_filter *p, uint8_t recursive_shift, uint8_t out_shift);

/** 
 * this sets a filter to put in series.
 * use as following  : 
 *   
 * biquad_set_series_son(& filter1, &filter2)
 *   
 * then please use ONLY the filter1. The filter 2 will recursively
 * be called into the filter 1 function : 
 * output =  biquad_do_filter(& filter1, input);
 *   
 * You can put in series as much biquad filters as you want.
 */
extern void biquad_set_series_son(struct biquad_filter *p,   struct biquad_filter *son);

/** 
 * this is useful for cleaning the filter memories before a new data
 * set.
 * 
 * With this you avoid having old data in the filter memories when
 * beginning to filter a new stream.  Can also be used after
 * changing the coefficients, to avoid jumps of the output value.
 */
extern void biquad_flush_memories(struct biquad_filter *p);


/** 
 * filter processing, 1 iteration.
 * This function is not protected against writing in the structure while 
 * execution is ongoing! 
 */
extern int32_t biquad_do_filter(void * data , int32_t in);
        
        
#endif
