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
 *  Revision : $Id: pid.h,v 1.8 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#ifndef _PID_H_
#define _PID_H_

#include <aversive.h>
#include <stdlib.h>

#include <pid_config.h>


/** this is the pid_filter structure*/
struct pid_filter
{
	int16_t gain_P; /**< Gain of Proportionnal module */
	int16_t gain_I; /**< Gain of Integral module */
	int16_t gain_D; /**< Gain of Derivate module */

	uint8_t out_shift; /**< big common divisor for output */

	uint8_t derivate_nb_samples; /**< sample count for derivate filter */
	uint8_t index; /**< index in circular buffer below */
	int32_t prev_samples[PID_DERIVATE_FILTER_MAX_SIZE]; /**< previous in (circular buf) */
	
	int32_t max_in; /**<  In saturation levels */
	int32_t max_I; /**<   Integral saturation levels */
	int32_t max_out; /**< Out saturation levels */

	int32_t integral; /**< previous integral parameter */
	int32_t prev_D;   /**< previous derivate parameter */
	int32_t prev_out; /**< previous out command (for debug only) */
};

/** init pid */
void pid_init(struct pid_filter *p);

/** reset state (derivate and intergral state) */
void pid_reset(struct pid_filter *p);

/* Use these functions to change one parameter on pid_filter structure */
void pid_set_gains(struct pid_filter *p, int16_t gp, int16_t gi, int16_t gd) ;
void pid_set_maximums(struct pid_filter *p, int32_t max_in, int32_t max_I, int32_t max_out);
void pid_set_out_shift(struct pid_filter *p, uint8_t out_shift);
int8_t pid_set_derivate_filter(struct pid_filter *p, uint8_t nb_samples);

/* accessors of all parameter of pid structure*/
int16_t pid_get_gain_P(struct pid_filter *p);
int16_t pid_get_gain_I(struct pid_filter *p);
int16_t pid_get_gain_D(struct pid_filter *p);
int32_t pid_get_max_in(struct pid_filter *p);
int32_t pid_get_max_I(struct pid_filter *p);
int32_t pid_get_max_out(struct pid_filter *p);
uint8_t pid_get_out_shift(struct pid_filter *p);
uint8_t pid_get_derivate_filter(struct pid_filter *p);

/** get the sum of all nput samples since the filter initialisation */
int32_t pid_get_value_I(struct pid_filter *p);

/** get previous input value */
int32_t pid_get_value_in(struct pid_filter *p);

/** get previous derivate value (without gain) */
int32_t pid_get_value_D(struct pid_filter *p);

/** get previous output value */
int32_t pid_get_value_out(struct pid_filter *p);

/** PID process */
int32_t pid_do_filter(void *p, int32_t in);
        
        
#endif
