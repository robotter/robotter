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
 *  Revision : $Id: timers_synch.c,v 1.4 2006-11-03 09:05:13 zer0 Exp $
 *
 */


/** \file timers_synch.c
 *  \brief this code synchronizes the timers in order to optain synchronous PWMs
 *
 *  \todo Test this function on various uC
 *  \todo modify if there exists other prescaler configurations
 *
 *  \test This feature is not 100% shure for the moment, but has been tested on M32 and M128
 *
 *
 * this code synchronizes the timers in order to optain synchronous PWMs,
 * such a feature can be used for driving 3-phase motors with PWMS from different timers
 * 
 * 
 * to synch PWMs you need to enshure that the timers have same prescales,
 * and the same PWM mode
 * 
 * There is one little side effect : if there are common prescalers in your controller they will all be reset
 */


  
#include <avr/io.h>
#include <pwm.h> // for config

#include <timers_synch.h>



#if ( (defined TIMER0_SYNCH) || (defined TIMER1_SYNCH) || (defined TIMER2_SYNCH) || (defined TIMER3_SYNCH) )


void pwm_synch(void)
{
	uint8_t flags;

// computations of prescale for sync
#ifdef TIMER0_SYNCH
  #undef PWM_SYNCH_PRESCALE
  #define PWM_SYNCH_PRESCALE TIMER0_PRESCALE
#endif
#ifdef TIMER1_SYNCH
  #undef PWM_SYNCH_PRESCALE
  #define PWM_SYNCH_PRESCALE TIMER1_PRESCALE
#endif
#ifdef TIMER2_SYNCH
  #undef PWM_SYNCH_PRESCALE
  #define PWM_SYNCH_PRESCALE TIMER2_PRESCALE
#endif
#ifdef TIMER3_SYNCH
  #undef PWM_SYNCH_PRESCALE
  #define PWM_SYNCH_PRESCALE TIMER3_PRESCALE
#endif

// verify that all the prescales are the same

#ifdef TIMER0_SYNCH
  #if (PWM_SYNCH_PRESCALE  != TIMER0_PRESCALE)
    #error TIMER0: not the same prescaler for synchronized PWMs, please verify your pwm_config.h
  #endif
#endif
#ifdef TIMER1_SYNCH
  #if (PWM_SYNCH_PRESCALE  != TIMER1_PRESCALE)
    #error TIMER1: not the same prescaler for synchronized PWMs, please verify your pwm_config.h
  #endif
#endif
#ifdef TIMER2_SYNCH
  #if (PWM_SYNCH_PRESCALE  != TIMER2_PRESCALE)
    #error TIMER2: not the same prescaler for synchronized PWMs, please verify your pwm_config.h
  #endif
#endif
#ifdef TIMER3_SYNCH
  #if (PWM_SYNCH_PRESCALE  != TIMER3_PRESCALE)
    #error TIMER3: not the same prescaler for synchronized PWMs, please verify your pwm_config.h
  #endif
#endif



// step between timer activations

#if (PWM_SYNCH_PRESCALE  == TIMER_8_PRESCALE_1)
  #define STEP 1
#else
  #define STEP 0
#endif


  
  IRQ_LOCK(flags);
  
  {
  //***************************************************
  // register declarations
  //***************************************************
  
#ifdef TIMER0_SYNCH
  register uint8_t tccr0;
#endif
#ifdef TIMER1_SYNCH
  register uint8_t tccr1b;
#endif
#ifdef TIMER2_SYNCH
  register uint8_t tccr2;
#endif
#ifdef TIMER3_SYNCH
  register uint8_t tccr3b;
#endif

  register uint8_t sfior;

  //***************************************************
  // save state and stop timers
  //***************************************************
  
#ifdef TIMER0_SYNCH
  tccr0 = TCCR0;
  TCCR0 = 0x00;
#endif
#ifdef TIMER1_SYNCH
 tccr1b = TCCR1B;
 TCCR1B = 0x00;
#endif
#ifdef TIMER2_SYNCH
  tccr2 = TCCR2;
  TCCR2 = 0x00;
#endif
#ifdef TIMER3_SYNCH
  tccr3b = TCCR3B;
  TCCR3B = 0x00;
#endif

  //***************************************************
  // the timers are now stopped, we set the TCNT's to given values
  // set timers to given values
  // the timers would then be startes one after another,
  // and synchronize themselves while starting with the right offset
  //***************************************************

#ifdef TIMER0_SYNCH
  TCNT0 = 0;
#endif
#ifdef TIMER1_SYNCH
  TCNT1H = 0;
  TCNT1L = 1l * STEP;
#endif
#ifdef TIMER2_SYNCH
  TCNT2 = 2l * STEP;
#endif
#ifdef TIMER3_SYNCH
  TCNT3H = 0;
  TCNT3L = 4l * STEP; // one more, cause TCCR acess takes one instruction more (see TCCR3B acess, down)
#endif

  //***************************************************
  // resetting prescalers (some could influence unwanted timers, enshure that there are no problems with that )
  // this is done this manner to be absolutely synchronous
  //***************************************************

  sfior = SFIOR;

  // mega 128
#if (defined PSR321) && ( (defined TIMER3_SYNCH) || (defined TIMER2_SYNCH)  || (defined TIMER1_SYNCH) )
  sfior |= (1<<PSR321);
#endif
#if (defined PSR0) && (defined TIMER0_SYNCH)
  sfior |= (1<<PSR0);
#endif
  // mega  163, 32 ...
#if (defined PSR10) && ( (defined TIMER1_SYNCH) || (defined TIMER0_SYNCH))
  sfior |= (1<<PSR10);
#endif
#if (defined PSR2) && (defined TIMER2_SYNCH)
  sfior |= (1<<PSR2);
#endif

  //////////////////////////////////////////////////
  // here begins the time critical  section
  // this all is done within less than 8 cycles, to assure function even with a prescaler set to 8
  //////////////////////////////////////////////////
  
  
  SFIOR = sfior;
  
  
  //***************************************************
  // running timers
  //***************************************************
  
#ifdef TIMER0_SYNCH
  TCCR0 = tccr0;
#else
  nop();
#endif
#ifdef TIMER1_SYNCH
  TCCR1B = tccr1b;
#else
  nop();
#endif
#ifdef TIMER2_SYNCH
  TCCR2 = tccr2;
#else
  nop();
#endif
#ifdef TIMER3_SYNCH
  TCCR3B = tccr3b; // this instruction takes 2 cycles (on ATMEGA128)
#else
  /* nop(); // optimized, not necessary, coz nothing after
  nop(); */
#endif

  //////////////////////////////////////////////////
  // here ends the time critical  section
  // this all is done within less than 8 cycles, to assure function even with a prescaler set to 8
  //////////////////////////////////////////////////




  }
  IRQ_UNLOCK(flags);


}

#endif // ( (defined TIMER0_SYNCH) || (defined TIMER1_SYNCH) || (defined TIMER2_SYNCH) || (defined TIMER3_SYNCH) )
