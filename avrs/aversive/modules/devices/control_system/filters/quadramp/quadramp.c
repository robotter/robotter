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
 *  Revision : $Id: quadramp.c,v 1.8 2008-01-08 20:05:03 zer0 Exp $
 *
 */

#include <stdio.h>
#include <string.h>

#include <aversive.h>
#include <quadramp.h>

#define NEXT(n, i)  (((n) + (i)/(n)) >> 1)

static uint32_t u32_sqrt(uint32_t number) {
	uint32_t n  = 1;
	uint32_t n1 = NEXT(n, number);
	
	while(ABS(n1 - n) > 1) {
		n  = n1;
		n1 = NEXT(n, number);
	}
	while((n1*n1) > number) {
		n1 -= 1;
	}
	return n1;
}

void quadramp_init(struct quadramp_filter * q)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	memset(q, 0, sizeof(*q));
	IRQ_UNLOCK(flags);
}

void quadramp_set_2nd_order_vars(struct quadramp_filter * q, 
				 uint32_t var_2nd_ord_pos, 
				 uint32_t var_2nd_ord_neg)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	q->var_2nd_ord_pos = var_2nd_ord_pos;
	q->var_2nd_ord_neg = var_2nd_ord_neg;
	IRQ_UNLOCK(flags);
}

void quadramp_set_1st_order_vars(struct quadramp_filter * q, 
				 uint32_t var_1st_ord_pos, 
				 uint32_t var_1st_ord_neg)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	q->var_1st_ord_pos = var_1st_ord_pos;
	q->var_1st_ord_neg = var_1st_ord_neg;
	IRQ_UNLOCK(flags);
}


uint8_t quadramp_is_finished(struct quadramp_filter *q)
{
	return (q->previous_out == q->previous_in &&
		q->previous_var == 0);
}

/**
 * Process the ramp
 * 
 * \param data should be a (struct quadramp_filter *) pointer
 * \param in is the input of the filter
 * 
 */
int32_t quadramp_do_filter(void * data, int32_t in)
{
	struct quadramp_filter * q = data;
	int32_t d ;
	int32_t pos_target;
	int32_t var_1st_ord_pos = 0;
	int32_t var_1st_ord_neg = 0;
	int32_t var_2nd_ord_pos = 0;
	int32_t var_2nd_ord_neg = 0;
	int32_t previous_var, previous_out ;

	if ( q->var_1st_ord_pos )
		var_1st_ord_pos = q->var_1st_ord_pos ;  

	if ( q->var_1st_ord_neg )
		var_1st_ord_neg = -q->var_1st_ord_neg ;

	if ( q->var_2nd_ord_pos )
		var_2nd_ord_pos = q->var_2nd_ord_pos ;  

	if ( q->var_2nd_ord_neg )
		var_2nd_ord_neg = -q->var_2nd_ord_neg ;

	previous_var = q->previous_var;
	previous_out = q->previous_out;

	d = in - previous_out ;

	/* Deceleration ramp */
	if ( d > 0 && var_2nd_ord_neg) {
		int32_t ramp_pos;
		/* var_2nd_ord_neg < 0 */
		/* real EQ : sqrt( var_2nd_ord_neg^2/4 - 2.d.var_2nd_ord_neg ) + var_2nd_ord_neg/2 */
		ramp_pos = u32_sqrt( (var_2nd_ord_neg*var_2nd_ord_neg)/4 - 2*d*var_2nd_ord_neg ) + var_2nd_ord_neg/2;

		if(ramp_pos < var_1st_ord_pos)
			var_1st_ord_pos = ramp_pos ;
	}

	else if (d < 0 && var_2nd_ord_pos) {
		int32_t ramp_neg;
    
		/* var_2nd_ord_pos > 0 */
		/* real EQ : sqrt( var_2nd_ord_pos^2/4 - 2.d.var_2nd_ord_pos ) - var_2nd_ord_pos/2 */
		ramp_neg = -u32_sqrt( (var_2nd_ord_pos*var_2nd_ord_pos)/4 - 2*d*var_2nd_ord_pos ) - var_2nd_ord_pos/2;
	
		/* ramp_neg < 0 */
		if(ramp_neg > var_1st_ord_neg)
			var_1st_ord_neg = ramp_neg ;
	}
    
	/* try to set the speed : can we reach the speed with our acceleration ? */
	/* si on va moins vite que la Vmax */
	if ( previous_var < var_1st_ord_pos )  {
		/* acceleration would be to high, we reduce the speed */
		/* si rampe acceleration active ET qu'on ne peut pas atteindre Vmax,
		 * on sature Vmax a Vcourante + acceleration */
		if (var_2nd_ord_pos && ( var_1st_ord_pos - previous_var > var_2nd_ord_pos) )
			var_1st_ord_pos = previous_var + var_2nd_ord_pos ;
	}
	/* si on va plus vite que Vmax */
	else if ( previous_var > var_1st_ord_pos )  { 
		/* deceleration would be to high, we increase the speed */
		/* si rampe deceleration active ET qu'on ne peut pas atteindre Vmax,
		 * on sature Vmax a Vcourante + deceleration */
		if (var_2nd_ord_neg && ( var_1st_ord_pos - previous_var < var_2nd_ord_neg) )
			var_1st_ord_pos = previous_var + var_2nd_ord_neg;
	}
  
	/* same for the neg */
	/* si on va plus vite que la Vmin (en negatif : en vrai la vitesse absolue est inferieure) */
	if ( previous_var > var_1st_ord_neg )  {
		/* acceleration would be to high, we reduce the speed */
		/* si rampe deceleration active ET qu'on ne peut pas atteindre Vmin,
		 * on sature Vmax a Vcourante + deceleration */
		if (var_2nd_ord_neg && ( var_1st_ord_neg - previous_var < var_2nd_ord_neg) )
			var_1st_ord_neg = previous_var + var_2nd_ord_neg ;
	}
	/* si on va moins vite que Vmin (mais vitesse absolue superieure) */
	else if ( previous_var < var_1st_ord_neg )  {
		/* deceleration would be to high, we increase the speed */
		/* si rampe acceleration active ET qu'on ne peut pas atteindre Vmin,
		 * on sature Vmax a Vcourante + deceleration */
		if (var_2nd_ord_pos && (var_1st_ord_neg - previous_var > var_2nd_ord_pos) )
			var_1st_ord_neg = previous_var + var_2nd_ord_pos;
	}

	/*
	 * Position consign : can we reach the position with our speed ?
	 */
	if ( /* var_1st_ord_pos &&  */d > var_1st_ord_pos ) {
		pos_target = previous_out + var_1st_ord_pos ;
		previous_var = var_1st_ord_pos ;
	}
	else if ( /* var_1st_ord_neg &&  */d < var_1st_ord_neg ) {
		pos_target = previous_out + var_1st_ord_neg ;
		previous_var = var_1st_ord_neg ;
	}
	else {
		pos_target = previous_out + d ;
		previous_var = d ;
	}

	// update previous_out and previous_var
	q->previous_var = previous_var;
	q->previous_out = pos_target;
	q->previous_in = in;

	return pos_target ;
}
