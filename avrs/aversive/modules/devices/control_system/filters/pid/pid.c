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
 *  Revision : $Id: pid.c,v 1.8 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <string.h>
#include <pid.h>


/** this function will initialize all fieds of pid structure to 0 */
void pid_init(struct pid_filter *p)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	memset(p, 0, sizeof(*p));
	p->gain_P = 1 ;
	p->derivate_nb_samples = 1;
	IRQ_UNLOCK(flags);
}

/** this function will initialize all fieds of pid structure to 0 */
void pid_reset(struct pid_filter *p)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	memset(p->prev_samples, 0, sizeof(p->prev_samples));
	p->integral = 0;
	p->prev_D = 0;
	p->prev_out = 0;
	IRQ_UNLOCK(flags);
}

void pid_set_gains(struct pid_filter *p, int16_t gp, int16_t gi, int16_t gd)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	p->gain_P  = gp;
	p->gain_I  = gi;
	p->gain_D  = gd;
	IRQ_UNLOCK(flags);
}

void pid_set_maximums(struct pid_filter *p, int32_t max_in, int32_t max_I, int32_t max_out)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	p->max_in  = max_in;
	p->max_I   = max_I;
	p->max_out = max_out;
	IRQ_UNLOCK(flags);
}

void pid_set_out_shift(struct pid_filter *p, uint8_t out_shift)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	p->out_shift=out_shift;
	IRQ_UNLOCK(flags);
}

int8_t pid_set_derivate_filter(struct pid_filter *p, uint8_t nb_samples)
{
	uint8_t flags;
	int8_t ret;
	IRQ_LOCK(flags);
	if (nb_samples > PID_DERIVATE_FILTER_MAX_SIZE) {
		ret = -1;
	}
	else {
		p->derivate_nb_samples = nb_samples;
		ret = 0;
	}
	IRQ_UNLOCK(flags);
	return ret;
}

int16_t pid_get_gain_P(struct pid_filter *p)
{
	return (p->gain_P);
}

int16_t pid_get_gain_I(struct pid_filter *p)
{
	return (p->gain_I);
}

int16_t pid_get_gain_D(struct pid_filter *p)
{
	return (p->gain_D);
}


int32_t pid_get_max_in(struct pid_filter *p)
{
	return (p->max_in);
}

int32_t pid_get_max_I(struct pid_filter *p)
{
	return (p->max_I);
}

int32_t pid_get_max_out(struct pid_filter *p)
{
	return (p->max_out);
}


uint8_t pid_get_out_shift(struct pid_filter *p)
{
	return (p->out_shift);
}

uint8_t pid_get_derivate_filter(struct pid_filter *p)
{
	return (p->derivate_nb_samples);
}

int32_t pid_get_value_I(struct pid_filter *p)
{
	uint8_t flags;
	int32_t ret;
	IRQ_LOCK(flags);
	ret = (p->integral);
	IRQ_UNLOCK(flags);
	return ret;
}

int32_t pid_get_value_in(struct pid_filter *p)
{
	uint8_t flags;
	int32_t ret;
	IRQ_LOCK(flags);
	ret = p->prev_samples[p->index];
	IRQ_UNLOCK(flags);
	return ret;
}

int32_t pid_get_value_D(struct pid_filter *p)
{
	uint8_t flags;
	int32_t ret;
	IRQ_LOCK(flags);
	ret = p->prev_D;
	IRQ_UNLOCK(flags);
	return ret;
}

int32_t pid_get_value_out(struct pid_filter *p)
{
	uint8_t flags;
	int32_t ret;
	IRQ_LOCK(flags);
	ret = (p->prev_out);
	IRQ_UNLOCK(flags);
	return ret;
}

/* first parameter should be a (struct pid_filter *) */
int32_t pid_do_filter(void * data, int32_t in)
{
	int32_t derivate ;
	int32_t command ;
	struct pid_filter * p = data;
	uint8_t prev_index;
   
	/* 
	 * Integral value : the integral become bigger with time .. (think
	 * to area of graph, we add one area to the previous) so, 
	 * integral = previous integral + current value
	 */

	/* derivate value                                             
	*             f(t+h) - f(t)        with f(t+h) = current value
	*  derivate = -------------             f(t)   = previous value
	*                    h
	* so derivate = current error - previous error
	*
	* We can apply a filter to reduce noise on the derivate term,
	* by using a bigger period.
	*/
	
	prev_index = p->index + 1;
	prev_index %= p->derivate_nb_samples;
	derivate = in - p->prev_samples[prev_index];

	/* saturate input... it influences integral */
	if (p->max_in)
		S_MAX(in, p->max_in) ;

	p->integral += in ;

	if (p->max_I)
		S_MAX(p->integral, p->max_I) ;

	/* so, command = P.coef_P + I.coef_I + D.coef_D */
	command = in * p->gain_P + 
		p->integral * p->gain_I +
		(derivate * p->gain_D) / p->derivate_nb_samples ;

	if ( command < 0 )
		command = -( -command >> p->out_shift );
	else
		command = command >> p->out_shift ;

	if (p->max_out)
		S_MAX (command, p->max_out) ;


	/* backup of current error value (for the next calcul of derivate value) */
	p->prev_samples[p->index] = in ;
	p->index ++;
	p->index %= p->derivate_nb_samples;
	p->prev_D = derivate ;
	p->prev_out = command ;
	
	return command;
} 
