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
 *  Revision : $Id: biquad.c,v 1.2 2007-03-04 13:53:45 zer0 Exp $
 *
 */


#include <biquad.h>
#include <string.h>

/** init sets an unity filter, as usual */
void biquad_init (struct biquad_filter * p)
{
	uint8_t flags;
	IRQ_LOCK(flags);
  
	/* set all structure to 0 */
	memset(p, 0, sizeof(struct biquad_filter));
	
	/* unity filter */
	p-> b0=1;
	
	IRQ_UNLOCK(flags);
}

/** this is useful for cleaning the filter memories before a new data
 *  set.  With this you avoid having old data in the filter memories
 *  when beginning to filter a new stream.  Can also be used after
 *  changing the coefficients, to avoid jumps of the output value.
 */
void biquad_flush_memories(struct biquad_filter *p)
{
	uint8_t flags;
	IRQ_LOCK(flags);

	/* empty mem cells */
	p->mem_in_1  = 0;
	p->mem_in_2  = 0;
	p->mem_out_1 = 0;
	p->mem_out_2 = 0;
  
	IRQ_UNLOCK(flags);
}

/** accessors to coefficients */
void biquad_set_numerator_coeffs(struct biquad_filter *p, int16_t b0, int16_t b1, int16_t b2)
{
	uint8_t flags;
	IRQ_LOCK(flags);
  
	p->b0 = b0;
	p->b1 = b1;
	p->b2 = b2;
  
	IRQ_UNLOCK(flags);
}

void biquad_set_deniminator_coeffs(struct biquad_filter *p, int16_t a1, int16_t a2)
{
	uint8_t flags;
	IRQ_LOCK(flags);
  
	p->a1 = -a1;
	p->a2 = -a2;
  
	IRQ_UNLOCK(flags);
}

void biquad_set_divisor_shifts(struct biquad_filter *p, uint8_t recursive_shift, uint8_t out_shift)
{
	uint8_t flags;
	IRQ_LOCK(flags);
  
	p-> out_shift       =  out_shift;
  p-> recursive_shift =  recursive_shift;
  
	IRQ_UNLOCK(flags);
}

void biquad_set_series_son(struct biquad_filter *p,   struct biquad_filter *son)
{
	uint8_t flags;
	IRQ_LOCK(flags);
  
	p->son = son;
  
	IRQ_UNLOCK(flags);
}

/** filter processing, 1 iteration.
    This function is not protected against writing in the structure while execution is ongoing! */
int32_t biquad_do_filter(void * data , int32_t in)
{
  
	int32_t output;
  
	struct biquad_filter * p = data;
  
	/* filter computation */
	output = p->b0 * in;
  
	output += p->b1 *  p->mem_in_1;
	output += p->b2 *  p->mem_in_2;
  
	output += p->a1 *  p->mem_out_1; /* minus, placed on the accessor */
	output += p->a2 *  p->mem_out_2; /* minus, placed on the accessor */
  

  
	/* update of the memories for next iteration */
	p->mem_in_2 = p->mem_in_1;
	p->mem_in_1 = in;
  
	p->mem_out_2 = p-> mem_out_1;
	p->mem_out_1 = output >> p-> recursive_shift; // recursive shift, this corresponds to a division on the a1 and a2 terms.
  

	/* output division with shifting */
	output >>= p-> out_shift;


	/* execute series filter */
	if(p->son != NULL)
		output = biquad_do_filter(p->son, output);
  
	/* finished */
	return output;
  
}
