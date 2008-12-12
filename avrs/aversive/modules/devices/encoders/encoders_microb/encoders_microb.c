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
 *  Revision : $Id: encoders_microb.c,v 1.8 2008-01-10 19:21:48 zer0 Exp $
 *
 */

/** \file encoders_microb.c
 *  \brief Implementation for getting motor position
 *
 *  \todo test the module
 *
 *  \test nothing done
 *
 * This module provides functions for getting position from
 * coders. Its implementation depends on hardware, so that's why there
 * is (or will be) multiple implementation of this module.
 * 
 * The harware is quite simple here :
 * 
 * \verbatim         
 * ----------
 * |        |  8
 * |    PINx|<-/---  value
 * |        |   
 * |        |  8
 * |    PINy|<-/---  value
 * |        |
 * |        |  8
 * |    PINz|<-/---  value
 * |        |
 * |    ....|
 * |        |
 * |    SEL |---->  (1 bit)
 * |        |  
 * |        |
 * |        |
 * ----------
 * \endverbatim         
 */

#include <stdlib.h>

#include <aversive.h>
#include <aversive/wait.h>

#include <encoders_microb.h>
#include <encoders_microb_config.h>


/******************************************/
int32_t g_encoders_microb_values[ENCODERS_MICROB_NUMBER];
int8_t g_encoders_microb_previous[ENCODERS_MICROB_NUMBER];

/******************************************/

#define SEL_A() cbi(ENCODERS_MICROB_SEL_PORT,ENCODERS_MICROB_SEL_BIT)
#define SEL_B() sbi(ENCODERS_MICROB_SEL_PORT,ENCODERS_MICROB_SEL_BIT)

/******************************************/

#define READ(n)                                     \
do {                                                \
val = ENCODERS_MICROB##n##_PIN;                     \
nop();                                              \
if (val != ENCODERS_MICROB##n##_PIN)                \
     val = ENCODERS_MICROB##n##_PIN;                \
                                                    \
res = (val - g_encoders_microb_previous[n]);        \
g_encoders_microb_previous[n] = val;                \
                                                    \
g_encoders_microb_values[n] += (int32_t)res ;           \
} while(0)

/******************************************/

#define INIT(n)   do {                              \
g_encoders_microb_values[n] = 0;                    \
} while(0)

/******************************************/





/** 
 * Initialisation of encoders, variables
 */
void encoders_microb_init(void)
{
  uint8_t flags;

  sbi(DDR(ENCODERS_MICROB_SEL_PORT),ENCODERS_MICROB_SEL_BIT);
  SEL_A();
  // wait at least 10us
  wait_4cyc(50);
  encoders_microb_manage(NULL);
  wait_4cyc(50);
  encoders_microb_manage(NULL);

  IRQ_LOCK(flags);
#ifdef ENCODERS_MICROB0_ENABLED
  INIT(0);
#endif

#ifdef ENCODERS_MICROB2_ENABLED
  INIT(2);
#endif

#ifdef ENCODERS_MICROB4_ENABLED
  INIT(4);
#endif

#ifdef ENCODERS_MICROB6_ENABLED
  INIT(6);
#endif

  
  SEL_B();
  // wait at least 10us
  wait_4cyc(50);

#ifdef ENCODERS_MICROB1_ENABLED
  INIT(1);
#endif

#ifdef ENCODERS_MICROB3_ENABLED
  INIT(3);
#endif

#ifdef ENCODERS_MICROB5_ENABLED
  INIT(5);
#endif

#ifdef ENCODERS_MICROB7_ENABLED
  INIT(7);
#endif
  IRQ_UNLOCK(flags);

}


/** 
 * Update encoders values, need to be done quite often
 * (Fmax_encoders/64). First, encoders 0 2 4 6 are read, and at next call
 * encoders 1 3 5 7. 
 * 
 * \param dummy : a (void *) pointer that is not used. It is here according
 *                to the encoders interface.
 */
void encoders_microb_manage(void * dummy)
{
  static uint8_t sel=0;
  uint8_t flags;


  int8_t val, res;

  IRQ_LOCK(flags);

  if ( ! sel) /* here SEL_A() is set since last call */
    {
#ifdef ENCODERS_MICROB0_ENABLED
      READ(0);
#endif
      
#ifdef ENCODERS_MICROB2_ENABLED
      READ(2);
#endif
      
#ifdef ENCODERS_MICROB4_ENABLED
      READ(4);
#endif
      
#ifdef ENCODERS_MICROB6_ENABLED
      READ(6);
#endif

      SEL_B();
    }
  else /* here SEL_B() is set since last call */
    {
#ifdef ENCODERS_MICROB1_ENABLED
      READ(1);
#endif
      
#ifdef ENCODERS_MICROB3_ENABLED
      READ(3);
#endif
      
#ifdef ENCODERS_MICROB5_ENABLED
      READ(5);
#endif
      
#ifdef ENCODERS_MICROB7_ENABLED
      READ(7);
#endif

      SEL_A();
    }
  
  sel = !sel;

  IRQ_UNLOCK(flags);

}



/** Extract encoder value.
 *
 * \param number : a (void *) that is casted in (int) containing the number
 *                 of the encoder to be read.
 */
int32_t encoders_microb_get_value(void * number)
{
  int32_t value;
  uint8_t flags;

  IRQ_LOCK(flags);
  value = g_encoders_microb_values[(int)number];
  IRQ_UNLOCK(flags);

  return value;
}

/** Set an encoder value
 *
 * \param number : a (void *) that is casted in (int) containing the number
 *                 of the encoder to be read.
 * \param v      : the value
 */
void encoders_microb_set_value(void * number, int32_t v)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  g_encoders_microb_values[(int)number] = v;
  IRQ_UNLOCK(flags);
}
