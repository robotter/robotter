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
 *  Revision : $Id: pwm.c,v 1.13 2008-04-13 16:55:31 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Implementation for PWM
 */
/** \file pwm.c
 *  \brief Implementation for the PWM module.
 *
 *  \todo Test the module.
 *
 *  \test The modul fonctions and had been tested by Lamygalle.
 *
 * This module provides functions for using a pwm 
 */

#include <aversive.h>

#include "pwm.h"

#include <aversive/parts.h>
#include <aversive/timers.h>

#include <pwm_config.h>

#include "timers_synch.h"

#if _PWM_CONFIG_VERSION_ != 2 
#warning "You are using an old version of pwm_config.h file"
#warning "_PWM_CONFIG_VERSION_ is != 2"
#warning "Look in modules/base/pwm/config directory to import changes"
#warning "You should now use TIMERx_PRESCALER_DIV_XX from"
#warning "include/aversive/parts.h that is arch specific"
#endif

#ifdef TIMER1_MODE

#if (TIMER1_MODE == TIMER_16_MODE_PWM_10)
#define TIMER1_PWM_BITS 10
#elif (TIMER1_MODE == TIMER_16_MODE_PWM_9)
#define TIMER1_PWM_BITS 9
#elif (TIMER1_MODE == TIMER_16_MODE_PWM_8)
#define TIMER1_PWM_BITS 8
#else
#error TIMER1 mode not valid, check pwm_config.h
#endif

#endif // TIMER1_MODE

#ifdef TIMER3_MODE

#if (TIMER3_MODE == TIMER_16_MODE_PWM_10)
#define TIMER3_PWM_BITS 10
#elif (TIMER3_MODE == TIMER_16_MODE_PWM_9)
#define TIMER3_PWM_BITS 9
#elif (TIMER3_MODE == TIMER_16_MODE_PWM_8)
#define TIMER3_PWM_BITS 8
#else
#error TIMER3 mode not valid, check pwm_config.h
#endif

#endif // TIMER3_MODE

#if (PWM0_MODE & PWM_SIGNED)
#define pwm0_init_ddr()                                          \
      sbi(DDR(PWM0_SIGN_PORT), PWM0_SIGN_BIT);                   \
      cbi(PWM0_SIGN_PORT, PWM0_SIGN_BIT);
#if (PWM0_MODE & PWM_SIGN_INVERTED)
#define pwm0_sign_set()   sbi(PWM0_SIGN_PORT, PWM0_SIGN_BIT);
#define pwm0_sign_reset() cbi(PWM0_SIGN_PORT, PWM0_SIGN_BIT);
#else /* (PWM0_MODE & PWM_SIGN_INVERTED) */
#define pwm0_sign_set()   cbi(PWM0_SIGN_PORT, PWM0_SIGN_BIT);
#define pwm0_sign_reset() sbi(PWM0_SIGN_PORT, PWM0_SIGN_BIT);
#endif /* (PWM0_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM0_MODE & PWM_SIGNED) */
#define pwm0_init_ddr()
#define pwm0_sign_set()
#define pwm0_sign_reset()
#endif /* (PWM0_MODE & PWM_SIGNED) */

#if (PWM1A_MODE & PWM_SIGNED)
#define pwm1A_init_ddr()                                          \
      sbi(DDR(PWM1A_SIGN_PORT), PWM1A_SIGN_BIT);                  \
      cbi(PWM1A_SIGN_PORT, PWM1A_SIGN_BIT);
#if (PWM1A_MODE & PWM_SIGN_INVERTED)
#define pwm1A_sign_set()   sbi(PWM1A_SIGN_PORT, PWM1A_SIGN_BIT);
#define pwm1A_sign_reset() cbi(PWM1A_SIGN_PORT, PWM1A_SIGN_BIT);
#else /* (PWM1A_MODE & PWM_SIGN_INVERTED) */
#define pwm1A_sign_set()   cbi(PWM1A_SIGN_PORT, PWM1A_SIGN_BIT);
#define pwm1A_sign_reset() sbi(PWM1A_SIGN_PORT, PWM1A_SIGN_BIT);
#endif /* (PWM1A_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM1A_MODE & PWM_SIGNED) */
#define pwm1A_init_ddr()
#define pwm1A_sign_set()
#define pwm1A_sign_reset()
#endif /* (PWM1A_MODE & PWM_SIGNED) */

#if (PWM1B_MODE & PWM_SIGNED)
#define pwm1B_init_ddr()                                          \
      sbi(DDR(PWM1B_SIGN_PORT), PWM1B_SIGN_BIT);                  \
      cbi(PWM1B_SIGN_PORT, PWM1B_SIGN_BIT);
#if (PWM1B_MODE & PWM_SIGN_INVERTED)
#define pwm1B_sign_set()   sbi(PWM1B_SIGN_PORT, PWM1B_SIGN_BIT);
#define pwm1B_sign_reset() cbi(PWM1B_SIGN_PORT, PWM1B_SIGN_BIT);
#else /* (PWM1B_MODE & PWM_SIGN_INVERTED) */
#define pwm1B_sign_set()   cbi(PWM1B_SIGN_PORT, PWM1B_SIGN_BIT);
#define pwm1B_sign_reset() sbi(PWM1B_SIGN_PORT, PWM1B_SIGN_BIT);
#endif /* (PWM1B_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM1B_MODE & PWM_SIGNED) */
#define pwm1B_init_ddr()
#define pwm1B_sign_set()
#define pwm1B_sign_reset()
#endif /* (PWM1B_MODE & PWM_SIGNED) */

#if (PWM1C_MODE & PWM_SIGNED)
#define pwm1C_init_ddr()                                          \
      sbi(DDR(PWM1C_SIGN_PORT), PWM1C_SIGN_BIT);                  \
      cbi(PWM1C_SIGN_PORT, PWM1C_SIGN_BIT);
#if (PWM1C_MODE & PWM_SIGN_INVERTED)
#define pwm1C_sign_set()   sbi(PWM1C_SIGN_PORT, PWM1C_SIGN_BIT);
#define pwm1C_sign_reset() cbi(PWM1C_SIGN_PORT, PWM1C_SIGN_BIT);
#else /* (PWM1C_MODE & PWM_SIGN_INVERTED) */
#define pwm1C_sign_set()   cbi(PWM1C_SIGN_PORT, PWM1C_SIGN_BIT);
#define pwm1C_sign_reset() sbi(PWM1C_SIGN_PORT, PWM1C_SIGN_BIT);
#endif /* (PWM1C_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM1C_MODE & PWM_SIGNED) */
#define pwm1C_init_ddr()
#define pwm1C_sign_set()
#define pwm1C_sign_reset()
#endif /* (PWM1C_MODE & PWM_SIGNED) */

#if (PWM2_MODE & PWM_SIGNED)
#define pwm2_init_ddr()                                          \
      sbi(DDR(PWM2_SIGN_PORT), PWM2_SIGN_BIT);                   \
      cbi(PWM2_SIGN_PORT, PWM2_SIGN_BIT);
#if (PWM2_MODE & PWM_SIGN_INVERTED)
#define pwm2_sign_set()   sbi(PWM2_SIGN_PORT, PWM2_SIGN_BIT);
#define pwm2_sign_reset() cbi(PWM2_SIGN_PORT, PWM2_SIGN_BIT);
#else /* (PWM2_MODE & PWM_SIGN_INVERTED) */
#define pwm2_sign_set()   cbi(PWM2_SIGN_PORT, PWM2_SIGN_BIT);
#define pwm2_sign_reset() sbi(PWM2_SIGN_PORT, PWM2_SIGN_BIT);
#endif /* (PWM2_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM2_MODE & PWM_SIGNED) */
#define pwm2_init_ddr()
#define pwm2_sign_set()
#define pwm2_sign_reset()
#endif /* (PWM2_MODE & PWM_SIGNED) */

#if (PWM3A_MODE & PWM_SIGNED)
#define pwm3A_init_ddr()                                          \
      sbi(DDR(PWM3A_SIGN_PORT), PWM3A_SIGN_BIT);                  \
      cbi(PWM3A_SIGN_PORT, PWM3A_SIGN_BIT);
#if (PWM3A_MODE & PWM_SIGN_INVERTED)
#define pwm3A_sign_set()   sbi(PWM3A_SIGN_PORT, PWM3A_SIGN_BIT);
#define pwm3A_sign_reset() cbi(PWM3A_SIGN_PORT, PWM3A_SIGN_BIT);
#else /* (PWM3A_MODE & PWM_SIGN_INVERTED) */
#define pwm3A_sign_set()   cbi(PWM3A_SIGN_PORT, PWM3A_SIGN_BIT);
#define pwm3A_sign_reset() sbi(PWM3A_SIGN_PORT, PWM3A_SIGN_BIT);
#endif /* (PWM3A_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM3A_MODE & PWM_SIGNED) */
#define pwm3A_init_ddr()
#define pwm3A_sign_set()
#define pwm3A_sign_reset()
#endif /* (PWM3A_MODE & PWM_SIGNED) */

#if (PWM3B_MODE & PWM_SIGNED)
#define pwm3B_init_ddr()                                          \
      sbi(DDR(PWM3B_SIGN_PORT), PWM3B_SIGN_BIT);                  \
      cbi(PWM3B_SIGN_PORT, PWM3B_SIGN_BIT);
#if (PWM3B_MODE & PWM_SIGN_INVERTED)
#define pwm3B_sign_set()   sbi(PWM3B_SIGN_PORT, PWM3B_SIGN_BIT);
#define pwm3B_sign_reset() cbi(PWM3B_SIGN_PORT, PWM3B_SIGN_BIT);
#else /* (PWM3B_MODE & PWM_SIGN_INVERTED) */
#define pwm3B_sign_set()   cbi(PWM3B_SIGN_PORT, PWM3B_SIGN_BIT);
#define pwm3B_sign_reset() sbi(PWM3B_SIGN_PORT, PWM3B_SIGN_BIT);
#endif /* (PWM3B_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM3B_MODE & PWM_SIGNED) */
#define pwm3B_init_ddr()
#define pwm3B_sign_set()
#define pwm3B_sign_reset()
#endif /* (PWM3B_MODE & PWM_SIGNED) */

#if (PWM3C_MODE & PWM_SIGNED)
#define pwm3C_init_ddr()                                          \
      sbi(DDR(PWM3C_SIGN_PORT), PWM3C_SIGN_BIT);                  \
      cbi(PWM3C_SIGN_PORT, PWM3C_SIGN_BIT);
#if (PWM3C_MODE & PWM_SIGN_INVERTED)
#define pwm3C_sign_set()   sbi(PWM3C_SIGN_PORT, PWM3C_SIGN_BIT);
#define pwm3C_sign_reset() cbi(PWM3C_SIGN_PORT, PWM3C_SIGN_BIT);
#else /* (PWM3C_MODE & PWM_SIGN_INVERTED) */
#define pwm3C_sign_set()   cbi(PWM3C_SIGN_PORT, PWM3C_SIGN_BIT);
#define pwm3C_sign_reset() sbi(PWM3C_SIGN_PORT, PWM3C_SIGN_BIT);
#endif /* (PWM3C_MODE & PWM_SIGN_INVERTED) */
#else /* (PWM3C_MODE & PWM_SIGNED) */
#define pwm3C_init_ddr()
#define pwm3C_sign_set()
#define pwm3C_sign_reset()
#endif /* (PWM3C_MODE & PWM_SIGNED) */


#define pwm_invert_value(mode, value)                                      \
do {									   \
	if ( mode & PWM_SPECIAL_SIGN_MODE ) {				   \
		value = value & PWM_MAX;				   \
	}								   \
	else {								   \
		value = -value;						   \
	}                                                                  \
} while(0)


#define pwm_timer_8bits_init(n, mode, prescale, timer_mode)                    \
do {									       \
	TCCR##n  =  ( ( ( timer_mode & 0x01 )?( 1 << WGM##n##0 ):0   )  |      \
              ( ( timer_mode & 0x02 )?( 1 << WGM##n##1 ):0   )  |	       \
		      ( ( prescale  << CS##n##0  ) ) );			       \
	if(mode & PWM_REVERSE) {					       \
		TCCR##n = ( ( (TCCR##n) & (~(0x03 << COM##n##0)) ) |	       \
			    (0x01  << COM##n##0) );			       \
	}								       \
	else {								       \
	TCCR##n = ( ( (TCCR##n) & (~(0x03 << COM##n##0)) ) |		       \
		    (0x02  << COM##n##0) );				       \
	}								       \
	OCR##n = 0x00;							       \
	sbi(OCR##n##_DDR,OCR##n##_BIT);					       \
	pwm##n##_init_ddr();                                                   \
} while(0)
     
/***********************************************************/
     
     
#define pwm_timer_16bits_init(n, m, mode, prescale, timer_mode)                \
do {									       \
	TCCR##n##A =   (TCCR##n##A |					       \
			( ( timer_mode & 0x01 )?( 1 << WGM##n##0 ):0   )  |    \
			( ( timer_mode & 0x02 )?( 1 << WGM##n##1 ):0   )  )  ; \
									       \
	TCCR##n##B =  ( ( ( timer_mode & 0x04 )?( 1 << WGM##n##2 ):0   )  |    \
			( ( timer_mode & 0x08 )?( 1 << WGM##n##3 ):0   )  |    \
			( ( prescale  << CS##n##0  )  )  );		       \
	if(mode & PWM_REVERSE) {					       \
		TCCR##n##A = ( ( (TCCR##n##A) &				       \
				 (~(0x03 << COM##n##m##0)) ) |		       \
			       (0x01  << COM##n##m##0) );		       \
	}								       \
	else {								       \
		TCCR##n##A = ( ( (TCCR##n##A) &				       \
				 (~(0x03 << COM##n##m##0)) ) |		       \
			       (0x02  << COM##n##m##0) );		       \
	}								       \
	OCR##n##m = 0;							       \
	sbi(OCR##n##m##_DDR,OCR##n##m##_BIT);				       \
	pwm##n##m##_init_ddr();                                                \
} while(0)
     
/***********************************************************/
     

#define pwm_timer_8bits_set(n, value, mode)                                    \
do {									       \
	MAX(value, PWM_MAX);						       \
	if ( mode & PWM_SIGNED ) {					       \
		MIN(value, PWM_MIN);					       \
		if (value < 0) {					       \
			pwm##n##_sign_set();				       \
			pwm_invert_value(mode, value);			       \
		}							       \
		else {							       \
			pwm##n##_sign_reset();				       \
		}							       \
	}								       \
	else {								       \
		MIN(value, 0);						       \
	}								       \
	OCR##n =(uint8_t) ( value >> ( PWM_SIGNIFICANT_BITS - 8 ));            \
} while(0)

/***********************************************************/
 

#define pwm_timer_16bits_set(n, m, value, mode)                                \
do {									       \
	MAX(value, PWM_MAX);						       \
	if ( mode & PWM_SIGNED ) {					       \
		MIN(value, PWM_MIN);					       \
		if (value < 0) {					       \
			pwm##n##m##_sign_set();				       \
			pwm_invert_value(mode, value);			       \
		}							       \
		else {							       \
			pwm##n##m##_sign_reset();			       \
		}							       \
	}								       \
	else {								       \
		MIN(value, 0);						       \
	}								       \
	OCR##n##m = ( value >> ( PWM_SIGNIFICANT_BITS 			       \
				 -  TIMER##n##_PWM_BITS )) ;                   \
} while(0)


/***********************************************************/

#if (defined PWM0_NUM) && (defined PWM0_ENABLED)
void pwm_init_0(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_8bits_init(0,PWM0_MODE,TIMER0_PRESCALE, TIMER0_MODE);
  IRQ_UNLOCK(flags);
}

/***********************************************************/

void pwm_set_0(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_8bits_set(0,value,PWM0_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM0_NUM) && (defined PWM0_ENABLED)

/***********************************************************/


/***********************************************************/

#if (defined PWM1A_NUM) && (defined PWM1A_ENABLED)
void pwm_init_1A(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_init(1,A,PWM1A_MODE,TIMER1_PRESCALE, TIMER1_MODE);
  IRQ_UNLOCK(flags);
}


/***********************************************************/

void pwm_set_1A(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_set(1,A,value,PWM1A_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM1A_NUM) && (defined PWM1A_ENABLED)



/***********************************************************/


/***********************************************************/

#if (defined PWM1B_NUM) && (defined PWM1B_ENABLED)
void pwm_init_1B(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_init(1,B,PWM1B_MODE,TIMER1_PRESCALE, TIMER1_MODE);
  IRQ_UNLOCK(flags);
}


/***********************************************************/

void pwm_set_1B(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_set(1,B,value,PWM1B_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM1B_NUM) && (defined PWM1B_ENABLED)



/***********************************************************/


/***********************************************************/

#if (defined PWM1C_NUM) && (defined PWM1C_ENABLED)
void pwm_init_1C(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_init(1,C,PWM1C_MODE,TIMER1_PRESCALE, TIMER1_MODE);
  IRQ_UNLOCK(flags);
}


/***********************************************************/

void pwm_set_1C(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_set(1,C,value, PWM1C_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM1C_NUM) && (defined PWM1C_ENABLED)



/***********************************************************/


/***********************************************************/

#if (defined PWM2_NUM) && (defined PWM2_ENABLED)
void pwm_init_2(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_8bits_init(2,PWM2_MODE,TIMER2_PRESCALE, TIMER2_MODE);
  IRQ_UNLOCK(flags);
}


/***********************************************************/

void pwm_set_2(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_8bits_set(2,value,PWM2_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM2_NUM) && (defined PWM2_ENABLED)



/***********************************************************/


/***********************************************************/

#if (defined PWM3A_NUM) && (defined PWM3A_ENABLED)
void pwm_init_3A(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_init(3,A,PWM3A_MODE,TIMER3_PRESCALE, TIMER3_MODE);
  IRQ_UNLOCK(flags);
}


/***********************************************************/

void pwm_set_3A(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_set(3,A,value,PWM3A_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM3A_NUM) && (defined PWM3A_ENABLED)



/***********************************************************/


/***********************************************************/

#if (defined PWM3B_NUM) && (defined PWM3B_ENABLED)
void pwm_init_3B(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_init(3,B,PWM3B_MODE,TIMER3_PRESCALE, TIMER3_MODE);
  IRQ_UNLOCK(flags);
}


/***********************************************************/

void pwm_set_3B(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_set(3,B,value,PWM3B_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM3B_NUM) && (defined PWM3B_ENABLED)



/***********************************************************/


/***********************************************************/

#if (defined PWM3C_NUM) && (defined PWM3C_ENABLED)
void pwm_init_3C(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_init(3,C,PWM3C_MODE,TIMER3_PRESCALE, TIMER3_MODE);
  IRQ_UNLOCK(flags);
}


/***********************************************************/

void pwm_set_3C(int16_t value)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pwm_timer_16bits_set(3,C,value,PWM3C_MODE);
  IRQ_UNLOCK(flags);
}
#endif // (defined PWM3C_NUM) && (defined PWM3C_ENABLED)


/***********************************************************/


/***********************************************************/

// global init
void pwm_init(void)
{
#if (defined PWM0_NUM) && (defined PWM0_ENABLED)
  pwm_init_0();
#endif

#if (defined PWM1A_NUM) && (defined PWM1A_ENABLED)
  pwm_init_1A();
#endif
#if (defined PWM1B_NUM) && (defined PWM1B_ENABLED)
  pwm_init_1B();
#endif
#if (defined PWM1C_NUM) && (defined PWM1C_ENABLED)
  pwm_init_1C();
#endif

#if (defined PWM2_NUM) && (defined PWM2_ENABLED)
  pwm_init_2();
#endif

#if (defined PWM3A_NUM) && (defined PWM3A_ENABLED)
  pwm_init_3A();
#endif
#if (defined PWM3B_NUM) && (defined PWM3B_ENABLED)
  pwm_init_3B();
#endif
#if (defined PWM3C_NUM) && (defined PWM3C_ENABLED)
  pwm_init_3C();
#endif


#if ( (defined TIMER0_SYNCH) || (defined TIMER1_SYNCH) || (defined TIMER2_SYNCH) || (defined TIMER3_SYNCH) )
  pwm_synch();
#endif // ( (defined TIMER0_SYNCH) || (defined TIMER1_SYNCH) || (defined TIMER2_SYNCH) || (defined TIMER3_SYNCH) )


}
/***********************************************************/


/***********************************************************/

/* global SET FUNCTION : we use a (void *) to be compliant with
 * control_system functions. For instance pwm_set((void *)(PWM1B_NUM), x) 
 * is equivalent to pwm_set_1B(x) */
void pwm_set(void * data, int32_t value)
{
  uint8_t num = (uint8_t)(int)data;
  S_MAX(value, 0x7FFF);

  switch(num)
    {
#if (defined PWM0_NUM) && (defined PWM0_ENABLED)
    case PWM0_NUM:
      pwm_set_0(value);
      break;
#endif

#if (defined PWM1A_NUM) && (defined PWM1A_ENABLED)
    case PWM1A_NUM:
      pwm_set_1A(value);
      break;
#endif
#if (defined PWM1B_NUM) && (defined PWM1B_ENABLED)
    case PWM1B_NUM:
      pwm_set_1B(value);
      break;
#endif
#if (defined PWM1C_NUM) && (defined PWM1C_ENABLED)
    case PWM1C_NUM:
      pwm_set_1C(value);
      break;
#endif

#if (defined PWM2_NUM) && (defined PWM2_ENABLED)
    case PWM2_NUM:
      pwm_set_2(value);
      break;
#endif

#if (defined PWM3A_NUM) && (defined PWM3A_ENABLED)
    case PWM3A_NUM:
      pwm_set_3A(value);
      break;
#endif
#if (defined PWM3B_NUM) && (defined PWM3B_ENABLED)
    case PWM3B_NUM:
      pwm_set_3B(value);
      break;
#endif
#if (defined PWM3C_NUM) && (defined PWM3C_ENABLED)
    case PWM3C_NUM:
      pwm_set_3C(value);
      break;
#endif

    default:
      break;
    }

}



