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
 *  Revision : $Id: timer_declarations.h,v 1.2 2007-05-01 15:35:53 zer0 Exp $
 *
 */

#ifndef _TIMER_DECLARATIONS_H
#define _TIMER_DECLARATIONS_H_

#define DECLARE_TIMER_FUNCS(x)                                             \
									   \
/** start the timer at initial prescaler */				   \
void timer##x##_start(void);						   \
									   \
/** stop the timer */							   \
void timer##x##_stop(void);						   \
									   \
/** Set the timer value */						   \
void timer##x##_set(uint16_t t);					   \
									   \
/** return the value of the timer */					   \
uint16_t timer##x##_get(void);						   \
									   \
									   \
/** Enable overflow interruption, and register a function to be called	*/ \
/*	every interrupt. If func is NULL, unregisters interrupt. */	   \
void timer##x##_register_OV_intr(void (*func)(void));			   \
									   \
/**  Enable output compare interruption, and register a function to be */  \
/*	called every output compare interrupt. Note that interruption  */  \
/*	will occur when the timer will reach the same value than t. If	*/ \
/*	func is NULL, unregisters interrupt (other arg is useless). */	   \
void timer##x##A_register_OC_intr_at_tics(void (*func)(void), uint16_t t); \
void timer##x##B_register_OC_intr_at_tics(void (*func)(void), uint16_t t); \
void timer##x##C_register_OC_intr_at_tics(void (*func)(void), uint16_t t); \
									   \
/**  Enable output compare interruption, and register a function to be	*/ \
/*	called every output compare interrupt. Note that interruption  */  \
/*	will occur when the timer will reach CURRENT_TIMER + t_us	*/ \
/*	(parameter is in microseconds). If func is NULL, unregisters	*/ \
/*	interrupt (other arg is useless). return 0 on success */	   \
/*	WARNING : this function can be slower due to float conversion */   \
/*      If you are in static timer mode (no dynamic modifications of */    \
/*      the prescaler), and if your value is a constant, you should use */ \
/*      a code like this to allow beeing optmized by the preprocessor: */  \
/*           timerxy_register_OC_intr_in_tics(timerx_us_to_tics(1000)); */ \
/*      Indeed this code is optimized. In any case, it is better to */     \
/*      them in 2 separated funcs, because you can save the result of */   \
/*      timerx_us_to_tics() in a variable. */ 				   \
int8_t timer##x##A_register_OC_intr_in_us(void (*func)(void), uint16_t t); \
int8_t timer##x##B_register_OC_intr_in_us(void (*func)(void), uint16_t t); \
int8_t timer##x##C_register_OC_intr_in_us(void (*func)(void), uint16_t t); \
									   \
/** Return current prescaler divisor. If CONFIG_MODULE_TIMER_DYNAMIC  */   \
/*	is not defined, it only returns TIMERX_PRESCALER specified in */   \
/*	configuration. If you use a dynamic configuration, it reads the	*/ \
/*	current prescaler register value and converts it to divisor  */	   \
/*	value. */							   \
uint16_t timer##x##_get_prescaler_div(void);				   \
									   \
/** Configure the prescaler register depending on divisor param. */	   \
/*  only defined if CONFIG_MODULE_TIMER_DYNAMIC is 'y' */		   \
void timer##x##_set_prescaler_div(uint16_t);				   \
									   \
/** Use timerX_get_prescaler_div() and CONFIG_QUARTZ to do the	 */	   \
/* conversion from microseconds to tics (timer unit) */			   \
/* Be carreful, this function is inline static, so if you use it */        \
/* quite often,  you should include it in a standard function and call */  \
/* this function instead */						   \
static inline float timer##x##_us_to_tics(float us);			   \
									   \
/** Use timerX_get_prescaler_div() and CONFIG_QUARTZ to do the	*/	   \
/* conversion from tics to microseconds */                                 \
/* Be carreful, this function is inline static, so if you use it */        \
/* quite often,  you should include it in a standard function and call */  \
/* this function instead */						   \
static inline float timer##x##_tics_to_us(float t);

#endif
