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
 *  Revision : $Id: multiservo_archs.h,v 1.6 2008-04-13 16:55:31 zer0 Exp $
 *
 */

/* set in CTC mode */

#ifndef _MULTISERVO_ARCHS_H_
#define _MULTISERVO_ARCHS_H_

#include <aversive.h>

/* will be in aversive_timers */
#if defined (__AVR_ATmega128__) 

#if MULTISERVO_TIMER == 0
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE0
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE0
#define MULTISERVO_TCCRnA TCCR0
#define MULTISERVO_TCCRnA_VALUE ((1 << WGM01) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR0

#elif MULTISERVO_TIMER == 1
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE1A
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE1A
#define MULTISERVO_TCCRnA TCCR1A
#define MULTISERVO_TCCRnA_VALUE 0
#define MULTISERVO_TCCRnB TCCR1B
#define MULTISERVO_TCCRnB_VALUE ((1 << WGM12) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR1A

#elif MULTISERVO_TIMER == 2
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE2
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE2
#define MULTISERVO_TCCRnA TCCR2
#define MULTISERVO_TCCRnA_VALUE ((1 << WGM21) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR2

#elif MULTISERVO_TIMER == 3
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE3A
#define MULTISERVO_TIMSK ETIMSK
#define MULTISERVO_OCIE  OCIE3A
#define MULTISERVO_TCCRnA TCCR3A
#define MULTISERVO_TCCRnA_VALUE 0
#define MULTISERVO_TCCRnB TCCR3B
#define MULTISERVO_TCCRnB_VALUE ((1 << WGM32) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR3A

#else
#error "Bad timer number, check your multiservo_config.h"
#endif





#elif defined (__AVR_ATmega32__) 

#if MULTISERVO_TIMER == 0
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE0
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE0
#define MULTISERVO_TCCRnA TCCR0
#define MULTISERVO_TCCRnA_VALUE ((1 << WGM01) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR0

#elif MULTISERVO_TIMER == 1
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE1A
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE1A
#define MULTISERVO_TCCRnA TCCR1A
#define MULTISERVO_TCCRnA_VALUE 0
#define MULTISERVO_TCCRnB TCCR1B
#define MULTISERVO_TCCRnB_VALUE ((1 << WGM12) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR1A

#elif MULTISERVO_TIMER == 2
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE2
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE2
#define MULTISERVO_TCCRnA TCCR2
#define MULTISERVO_TCCRnA_VALUE ((1 << WGM21) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR2

#else
#error "Bad timer number, check your multiservo_config.h"
#endif

#elif defined (__AVR_ATtiny2313__) 

#if MULTISERVO_TIMER == 0
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE0
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE0
#define MULTISERVO_TCCRnA TCCR0A
#define MULTISERVO_TCCRnA_VALUE (1 << WGM01)
#define MULTISERVO_TCCRnA TCCR0B
#define MULTISERVO_TCCRnA_VALUE (MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR0

#elif MULTISERVO_TIMER == 1
#define MULTISERVO_SIG_OUTPUT_COMPARE SIG_OUTPUT_COMPARE1A
#define MULTISERVO_TIMSK TIMSK
#define MULTISERVO_OCIE  OCIE1A
#define MULTISERVO_TCCRnA TCCR1A
#define MULTISERVO_TCCRnA_VALUE 0
#define MULTISERVO_TCCRnB TCCR1B
#define MULTISERVO_TCCRnB_VALUE ((1 << WGM12) | MULTISERVO_TIMER_PRESCALER_CONFIG)
#define MULTISERVO_OCR OCR1A

#else
#error "Bad timer number, check your multiservo_config.h"
#endif



/* #elif XYZ */

/* Add other archs here */

#else

#error "This MCU is not supported, see in multiservo_archs.h"

#endif /* MCU CHOICE */


#endif /* _MULTISERVO_ARCHS_H_ */
