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
 *  Revision : $Id: timer_definitions.h,v 1.3 2007-05-24 13:08:48 zer0 Exp $
 *
 */

#ifndef _TIMER_DEFINITIONS_H_
#define _TIMER_DEFINITIONS_H_

/* needed by nearly all .c */
#include <aversive/parts.h>

#define DEFINE_TIMER_START_STOP(x)                                                       \
											 \
/** start the timer */									 \
void timer##x##_start(void)            							 \
{											 \
	TCNT##x = 0;									 \
	CS##x##0_REG = __timer##x##_div_to_reg(TIMER##x##_PRESCALER_DIV) << CS##x##0 ;	 \
}											 \
											 \
/** stop the timer */									 \
void timer##x##_stop(void)								 \
{											 \
	CS##x##0_REG = 0;								 \
	TCNT##x = 0;									 \
}



#define DEFINE_TIMER_GET_SET(x)                                                          \
											 \
uint16_t timer##x##_get(void)   							 \
{											 \
	return TCNT##x ;								 \
}											 \
											 \
void timer##x##_set(uint16_t t)					 	 		 \
{											 \
	TCNT##x = t;    								 \
}


#define DEFINE_OV_INTR(x)                               \
SIGNAL(x)                                               \
{                                                       \
	if(timer_OV_callback_table[x##_NUM])            \
		timer_OV_callback_table[x##_NUM]();     \
}


#define DEFINE_OC_INTR(x)                               \
SIGNAL(x)                                               \
{                                                       \
	if(timer_OC_callback_table[x##_NUM])            \
		timer_OC_callback_table[x##_NUM]();     \
}


#define DEFINE_REGISTER_OV_INTR(x)                                  \
								    \
void timer##x##_register_OV_intr(void (*func)(void))		    \
{								    \
	uint8_t flags;						    \
								    \
	IRQ_LOCK(flags);					    \
	timer_OV_callback_table[SIG_OVERFLOW##x##_NUM] = func;	    \
	if (func) {						    \
		TOIE##x##_REG |= (1<<TOIE##x);  		    \
	}							    \
	else {							    \
		TOIE##x##_REG &= (uint8_t)(~(1<<TOIE##x));	    \
	}							    \
	IRQ_UNLOCK(flags);                                          \
}


#define DEFINE_REGISTER_OC_INTR_AT_TICS(x)                           		\
								     		\
void timer##x##_register_OC_intr_at_tics(void (*func)(void), uint16_t t)	\
{								     		\
	uint8_t flags;						     		\
								     		\
	IRQ_LOCK(flags);					     		\
	timer_OC_callback_table[SIG_OUTPUT_COMPARE##x##_NUM] = func; 		\
	if (func) {						     		\
		OCIE##x##_REG |= (1<<OCIE##x);  		     		\
		OCR##x = t;					     		\
	}							     		\
	else {							     		\
		OCIE##x##_REG &= (uint8_t)(~(1<<OCIE##x));	     		\
	}							     		\
	IRQ_UNLOCK(flags);                                           		\
}


#define DEFINE_REGISTER_OC_INTR_IN_US(x,y)                           		\
								     		\
int8_t timer##y##_register_OC_intr_in_us(void (*func)(void), uint16_t t)	\
{								     		\
	uint8_t flags;						     		\
	float tics;						     		\
								     		\
	IRQ_LOCK(flags);					     		\
	if (! func) {						     		\
		timer_OC_callback_table[SIG_OUTPUT_COMPARE##y##_NUM] = func; 	\
		OCIE##y##_REG &= (uint8_t)(~(1<<OCIE##y));	     		\
		IRQ_UNLOCK(flags);                                           	\
		return 0;					     		\
	}							     		\
								     		\
	tics = timer##x##_us_to_tics(t);				     	\
	if ( tics > 0xFFFF ) {	/* XXX use MAX_TIMER */		     		\
		IRQ_UNLOCK(flags);                                           	\
		return -1;					     		\
	}							     		\
								     		\
	OCR##y = TCNT##x + tics;					     	\
	timer_OC_callback_table[SIG_OUTPUT_COMPARE##y##_NUM] = func; 		\
	OCIE##y##_REG |= (1<<OCIE##y);  		     			\
	IRQ_UNLOCK(flags);                                           		\
	return 0;                                           			\
}


#define DEFINE_DYNAMIC_PRESCALER_FUNCS(x)                           \
								    \
int16_t timer##x##_div_to_reg(uint16_t div)                         \
{								    \
	return __timer##x##_div_to_reg(div);			    \
}								    \
								    \
int16_t timer##x##_reg_to_div(uint8_t reg)			    \
{								    \
	return __timer##x##_reg_to_div(reg);                        \
}								    \
								    \
uint16_t timer##x##_get_prescaler_div(void)			    \
{								    \
	return __timer##x##_reg_to_div(CS##x##0_REG >> CS##x##0);   \
}                                                                   \
                                                                    \
void timer##x##_set_prescaler_div(uint16_t div)                     \
{                                                                   \
	CS##x##0_REG = __timer##x##_div_to_reg(div) << CS##x##0 ;   \
}


#define DEFINE_STATIC_PRESCALER_FUNCS(x)                            \
								    \
int16_t timer##x##_div_to_reg(uint16_t div)			    \
{								    \
	return __timer##x##_div_to_reg(TIMER##x##_PRESCALER_DIV);   \
}								    \
								    \
uint16_t timer##x##_get_prescaler_div(void)			    \
{								    \
	return TIMER##x##_PRESCALER_DIV;                            \
}

#define DEFINE_TIMER_US_CONVERSIONS(x)                                   \
									 \
static inline float timer##x##_us_to_tics(float us)			 \
{									 \
	return ((float)CONFIG_QUARTZ / 					 \
		((float)MHz * timer##x##_get_prescaler_div()) ) * us;	 \
}									 \
									 \
static inline float timer##x##_tics_to_us(float t)			 \
{									 \
	return t / ((float)CONFIG_QUARTZ / 				 \
		((float)MHz * timer##x##_get_prescaler_div()) );         \
}

#endif
