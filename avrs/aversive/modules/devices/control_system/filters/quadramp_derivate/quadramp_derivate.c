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
 *  Revision : $Id: quadramp_derivate.c,v 1.4 2008-01-08 22:12:04 zer0 Exp $
 *
 */

#include <stdio.h>

#include <aversive.h>
#include <quadramp_derivate.h>


void quadramp_derivate_init(struct quadramp_derivate_filter * q)
{
	uint8_t flags;
	IRQ_LOCK(flags);

	q->var_2nd_ord_pos = 1;
	q->var_2nd_ord_neg = 1;
	q->var_1st_ord_pos = 0;
	q->var_1st_ord_neg = 0;
	
	q->previous_in_position = 0;
	q->previous_out_speed = 0;
  
	q-> gain_anticipation= 0;
	q-> goal_window= 0;
  
	q-> divisor = 1;
  
	q-> pivot = 0;
  
	IRQ_UNLOCK(flags);
}


void quadramp_derivate_set_gain_anticipation(struct quadramp_derivate_filter * q, uint16_t gain_anticipation)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	q->gain_anticipation = gain_anticipation;
	IRQ_UNLOCK(flags);
}

void quadramp_derivate_set_goal_window(struct quadramp_derivate_filter * q, uint32_t goal_window)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	q->goal_window = goal_window;
	IRQ_UNLOCK(flags);
}

void quadramp_derivate_set_2nd_order_vars(struct quadramp_derivate_filter * q, uint32_t var_2nd_ord_pos, uint32_t var_2nd_ord_neg)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	q->var_2nd_ord_pos = var_2nd_ord_pos;
	q->var_2nd_ord_neg = var_2nd_ord_neg;
	IRQ_UNLOCK(flags);
}

void quadramp_derivate_set_1st_order_vars(struct quadramp_derivate_filter * q, uint32_t var_1st_ord_pos, uint32_t var_1st_ord_neg)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	q->var_1st_ord_pos = var_1st_ord_pos;
	q->var_1st_ord_neg = var_1st_ord_neg;
	IRQ_UNLOCK(flags);
}


void quadramp_derivate_set_divisor(struct quadramp_derivate_filter * q, uint8_t divisor)
{
	uint8_t flags;
	IRQ_LOCK(flags);
  
	q->divisor = divisor;
	q->divisor_counter = 1;
  
	IRQ_UNLOCK(flags);
}


/**
 * Process the ramp
 * 
 * \param data should be a (struct quadramp_derivate_filter *) pointer
 * \param in is the input of the filter
 * 
 */
int32_t quadramp_derivate_do_filter(void * data, int32_t in_position)
{
	struct quadramp_derivate_filter * q = data;
	int32_t position_pivot, speed, var_2nd_ord, acceleration_consign, speed_consign;
  
	/** sampling divisor
	    this is a state machine who executes the algorithm only one time out of "divisor" */
	if( q->divisor != 1) {
		if (-- (q->divisor_counter) !=0 ) {
			// if it is not time to exec the algorithm, we just test the goal_window
			if(ABS( in_position ) < q->goal_window)
				q->previous_out_speed =0;
			// and return the previous consign
			return q->previous_out_speed;
		}
		
		q->divisor_counter = q->divisor;
	}
	
  
  
	/** compensation of the inversion before the input 
	    (inversion of the control system where error = consign - feedback)
	*/
	in_position = -in_position; 
  
  
	// calculating the actual speed (derivate)
	speed = in_position - q->previous_in_position;
  
  
  
	/** limitation of this speed, due to overflows, and calculations based on theoretical max value
	    and also the peak created when the position_consign changes */
	if (speed >=0) {
		if(q->var_1st_ord_pos)
			MAX(speed , (q->var_1st_ord_pos * q-> divisor) ); // divisor reequilibrates the value.
	}
	else {
		if(q->var_1st_ord_neg)
			MIN(speed , (-(q->var_1st_ord_neg* q-> divisor)) ); // divisor reequilibrates the value.
	}
	
  
  
  
	/** calculation of the pivot position.
	    when this position is atteined, it is just the right time to begin to deccelerate.
	    The length to this position is given by a linear decceleration to 0 : x = speed²/ (2 * acceleration)
      
	*/
  
	// taking the concerned acc. value
	if (speed >=0) // why not position ?
		var_2nd_ord = q->var_2nd_ord_pos;
	else
		var_2nd_ord = q->var_2nd_ord_neg;
  
	// anticipation, proportionnal to speed. Gain_anticipation is a fixed point value, with 8 bits shift
	position_pivot = (ABS(speed) * q->gain_anticipation) >>8 ;

	// if necessary, compensation of the output units, when using a sampler divisor
	if(q->divisor != 1) {
		var_2nd_ord    *= q-> divisor;
		position_pivot /= q-> divisor;
	}
	
	// pivot calculation itself
	position_pivot += speed*speed /(2*var_2nd_ord);
  
	// taking the right sign
	if(speed >=0)
		position_pivot =  - position_pivot;

	// mem only for debug
	q-> pivot = position_pivot;

	/** this is the heart of the trajectory generation.
	    Pretty simple but indeed unstable, 
	    because of this corresponds to an infinite gain, in the following equation :
	    acceleration_consign = ( position_pivot - in_position ) * gain
      
	    In fact this unstability is erased by the fact that the acc value is nearly always limited
	*/
	if(position_pivot >= in_position)
		acceleration_consign = q->var_2nd_ord_pos;
	else
		acceleration_consign = -q->var_2nd_ord_neg;
  


	/** integration and limitation of the acceleration to obtain a speed consign */
	speed_consign = q->previous_out_speed + acceleration_consign;

	if (speed_consign >=0) {
		if(q->var_1st_ord_pos)
			MAX(speed_consign , q->var_1st_ord_pos);
	}
	else {
		if(q->var_1st_ord_neg)
			MIN(speed_consign , -q->var_1st_ord_neg);
	}
	
	
	/** creation of an end arrival window. This is done to stop the oscillations when the goal is achieved. */
	if(ABS( in_position ) < q->goal_window)
		speed_consign=0;
  
	/** refresh the memories */
	q->previous_in_position = in_position;
	q->previous_out_speed = speed_consign;
  
  
	return speed_consign ;
}
