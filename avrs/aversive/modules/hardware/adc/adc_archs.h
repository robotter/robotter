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
 *  Revision : $Id: adc_archs.h,v 1.6 2009-03-15 21:51:19 zer0 Exp $
 *
 */
#ifndef _ADC_ARCHS_
#define _ADC_ARCHS_


/** this file contains definitions for following configuration constants : 
    
    ADC_REF_xxx : selection of a reference source
    
    MUX_xxx     : selection options for the analog input multiplexerof the ADC
    
    prescaler   : selected automatically with your clock setting.
*/


/* ------------------------------------------------------------------------------------
   ----------------------------   REGISTER VARIATIONS   -------------------------------
   ------------------------------------------------------------------------------------ */

/*

Detailed register configurations, over the various AVR micros: 

           ADMUX                                                ADCSRA                                               ADCSRB                                             SFIOR
           7     6     5     4     3     2     1     0          7     6     5     4     3     2     1     0          7     6     5     4     3     2     1     0         7     6     5     4     3     2     1    0
ATM64      REFS1 REFS0 ADLAR MUX4  MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0                                    ADTS2 ADTS1 ADTS0
also AT90CAN64 AT90CAN64 ATM164 ATM324 ATM644 ATM165 (ATM325 ATM3250 ATM645 ATM5450)

ATM128     REFS1 REFS0 ADLAR MUX4  MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADFR  ADIF  ADIE  ADPS2 ADPS1 ADPS0
also ATtiny26

AT90CAN128 REFS1 REFS0 ADLAR MUX4  MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0      ADHSM                         ADTS2 ADTS1 ADTS0
also AT90USB1286 ATUSB1287 ATUSB646 ATUSB647

ATM16      REFS1 REFS0 ADLAR MUX4  MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0                                                          ADTS2 ADTS1 ADTS0
also ATM32 ATM8535

ATM48      REFS1 REFS0 ADLAR -     MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0                                    ADTS2 ADTS1 ADTS0
also ATM88 ATM168 ATM169 ATM329 ATM3290 ATM649  ATM6490

ATM8       REFS1 REFS0 ADLAR -     MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADFR  ADIF  ADIE  ADPS2 ADPS1 ADPS0

AT90PWM2   REFS1 REFS0 ADLAR -     MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0      ADHSM                  ADASCR ADTS2 ADTS1 ADTS0
also AT90PWM3 (! AT90PWM2B and 3B do not have ADASCR !)

ATM640     REFS1 REFS0 ADLAR MUX4  MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0                               MUX5 ADTS2 ADTS1 ADTS0
also ATM1280 ATM1281 ATM2560 ATM2561

ATtiny13   -     REFS0 ADLAR -     -     -     MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0                                    ADTS2 ADTS1 ADTS0
ATtiny15   REFS1 REFS0 ADLAR -     -     MUX2  MUX1  MUX0       ADEN  ADSC  ADFR  ADIF  ADIE  ADPS2 ADPS1 ADPS0
ATtiny24   REFS1 REFS0 MUX5  MUX4  MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0      BIN                    ADLAR  ADTS2 ADTS1 ADTS0
also ATtiny44 ATtiny84
ATtiny25   REFS1 REFS0 ADLAR REFS2 MUX3  MUX2  MUX1  MUX0       ADEN  ADSC  ADATE ADIF  ADIE  ADPS2 ADPS1 ADPS0      BIN   -     IPR               ADTS2 ADTS1 ADTS0
also ATtiny45 ATtiny85



----------
ATmega325_3250_645_6540 : preliminary incomplete DS, so not implemented now

NO ADC : ATM162 ATM8515 ATtiny11 ATtiny12 ATtiny2313 ATtiny28

ATMEGA406 : completely different, 12bits, not implemented
*/


/* some default defines */
#define MUX5_MASK_IN_CONFIG (1<<MUX5)
#define ADLAR_MASK_IN_CONFIG (1<<ADLAR)




#if ( defined (__AVR_ATmega162__)     \
    || defined (__AVR_ATmega8515__)   \
    || defined (__AVR_ATtiny11__) || defined (__AVR_ATtiny12__) \
    || defined (__AVR_ATtiny2313__) || defined (__AVR_ATtiny28__)  )

#  error no ADC on your AVR device, please deactivate the ADC module
#endif // ...

#if ( defined (__AVR_ATmega406__) )
#  error no The ADC of the ATmega406 is currently not supported by the ADC module
#endif // ...

#if ( defined (__AVR_ATmega325__) || defined (__AVR_ATmega2350__)   \
    || defined (__AVR_ATmega645__) || defined (__AVR_ATmega6540__) )

#  error ADC module not implemented currently for your device (only incomplete preliminary Datasheet available)
#endif // ...

/* this is not used for the moment */
#if ( defined (__AVR_ATmega16__) || defined (__AVR_ATmega32__)   \
    || defined (__AVR_ATmega8535__) )
    
#  define ADTS_IN_SFIOR
#endif // ...

/* this is a pity, on these devices, two bits are relocated */
#if ( defined (__AVR_ATtiny24__) || defined (__AVR_ATtiny44__)   \
    || defined (__AVR_ATtiny84__) )
    
#  define ADLAR_IN_ADCSRB
#  define MUX5_IN_ADMUX
  
#  undef ADLAR_MASK_IN_CONFIG
#  define ADLAR_MASK_IN_CONFIG 0x0100
#endif // ...

/* additional mux5, this time at another location */
#if ( defined (__AVR_ATmega640__) \
    || defined (__AVR_ATmega1280__)  || defined (__AVR_ATmega1281__)   \
    || defined (__AVR_ATmega2560__)  || defined (__AVR_ATmega2561__)   )
    
#  define MUX5_IN_ADCSRB

#  undef MUX5_MASK_IN_CONFIG
#  define MUX5_MASK_IN_CONFIG 0x0100
#endif // ...

// substitute
#ifndef ADFR
#define ADFR ADATE
#endif



/* ------------------------------------------------------------------------------------
   ----------------------------   REF SELECTION   -------------------------------------
   ------------------------------------------------------------------------------------ */
/*
----------
REFS1-0 bits : 
0 : AREF is reference
1 : AVCC is reference
2 : internal reference2 (rarely available)
3 : internal reference1 (2.56 or 1.1 V, depends on AVR type, see DS)

VREF2 is available on : ATM164 ATM324 ATM644 ATM640 ATM1280 ATM1281 ATM2561
VREF2 is without external cap on : ATtiny24-44-84
more options on ATtiny25-45-85, not implmented yet
----------
*/

#define ADC_REF_AREF  (0 << REFS0)
#define ADC_REF_AVCC  (1 << REFS0)
#define ADC_REF_VREF2 (2 << REFS0)
#define ADC_REF_VREF  (3 << REFS0)



/* ------------------------------------------------------------------------------------
   ----------------------------   MUX  ------------------------------------------------
   ------------------------------------------------------------------------------------ */



/** standard MUX table. if variations, please define MUX_NON_STD in your device specificity */

/* lacking configs on some devices : 


no gain stages : ATM165 ATM169 aTM329 ATM3290 ATM649 ATM6490
no gain and no differential stages : ATM48 ATM88 ATM168 ATM8

*/
#if ( defined (__AVR_ATmega165__)     \
    || defined (__AVR_ATmega169__) || defined (__AVR_ATmega329__) || defined (__AVR_ATmega3290__) \
    || defined (__AVR_ATmega649__) || defined (__AVR_ATmega6490__) )

#  define MUX_NO_GAINS
#endif // ...

/*   we let a bit more in the config, not a problem, this will just set the reserved bit, with no effect */
#if ( defined (__AVR_ATmega48__) || defined (__AVR_ATmega88__) || defined (__AVR_ATmega168__)  \
    || defined (__AVR_ATmega8__) )

#  define MUX_NO_GAINS
#  define MUX_NO_DIFF
  
#endif // ...



/* 0x20 + 0x0-0x7 : individual channel 8 to 15 (ATM640 ATM1280 ATM1281 ATM2561 only !!) */

#if ( defined (__AVR_ATmega640__) || defined (__AVR_ATmega1280__) || defined (__AVR_ATmega1281__) \
    || defined (__AVR_ATmega2561__) || defined (__AVR_ATmega2560__) )


#  define MUX_ADC8   ((0 <<MUX0) | MUX5_MASK_IN_CONFIG)
#  define MUX_ADC9   ((1 <<MUX0) | MUX5_MASK_IN_CONFIG)
#  define MUX_ADC10  ((2 <<MUX0) | MUX5_MASK_IN_CONFIG)
#  define MUX_ADC11  ((3 <<MUX0) | MUX5_MASK_IN_CONFIG)
#  define MUX_ADC12  ((4 <<MUX0) | MUX5_MASK_IN_CONFIG)
#  define MUX_ADC13  ((5 <<MUX0) | MUX5_MASK_IN_CONFIG)
#  define MUX_ADC14  ((6 <<MUX0) | MUX5_MASK_IN_CONFIG)
#  define MUX_ADC15  ((7 <<MUX0) | MUX5_MASK_IN_CONFIG)
  
#endif // ...

/*
AT30PWM2 &3 : only 4 MUX bits, as follow : 
0x0 - 0xA : individual channel 0 to 10
0xB : amplifier0
0xC : amplifier1
0xE : Vbg
0xF : GND

  we let a bit more in the config, not a problem, this will just set the reserved bit, with no effect
*/
#if ( defined (__AVR_ATmega48__) || defined (__AVR_ATmega88__) || defined (__AVR_ATmega168__)  \
    || defined (__AVR_ATmega8__) )

#  define MUX_NO_GAINS
#  define MUX_NO_DIFF
  
#  define MUX_AMP0 (0xB<<MUX0)
#  define MUX_AMP1 (0xC<<MUX0)
  
#endif // ...

/** \todo : finish implmentation fully */
/*
ATtiny13 : only 4 inputs, no gain, no diff, no ref voltage
ATtiny15 : 

0x0 - 0x3 : individual channel
0x4 : ADC2-ADC2
0x5 : (ADC2 - ADC2) *20
0x6 : ADC2-ADC3
0x7 : (ADC2 - ADC3) *20

ATtiny24-44-84 : different table, not implemented yet
ATtiny25-45-85 : different table, not implemented yet
ATtiny26       : different table, not implemented yet
ATUSBxxx       : different gains not implemanted yet, diffs available

TO IMPLEMENT FULLY!!
yet these devices generate a warning, and select the default table, limited to 8 inputs 

*/

#if ( defined (__AVR_ATtiny13__) || defined (__AVR_ATtiny15__) \
    || defined (__AVR_ATtiny24__) || defined (__AVR_ATtiny44__) || defined (__AVR_ATtiny84__) \
    || defined (__AVR_ATtiny25__) || defined (__AVR_ATtiny45__) || defined (__AVR_ATtiny85__) \
    || defined (__AVR_ATtiny26__)   \
    || defined (__AVR_AT90USB1286__) || defined (__AVR_AT90USB1287__) \
    || defined (__AVR_AT90USB646__) || defined (__AVR_AT90USB647__) )
    
#  warning The ADC MUX table of your device is not fully defined, some inputs could not work correctly, see adc_archs.h
  
#  define MUX_NO_GAINS
#  define MUX_NO_DIFF
  
#endif // ...



/*
currently implemented STD table is following : 

MUX4-0 bits : 
0x0 - 0x7 : individual channel

01000 : (ADC0 - ADC0) * 10
01001 : (ADC1 - ADC0) * 10
01010 : (ADC0 - ADC0) * 200
01011 : (ADC1 - ADC0) * 200

01100 : (ADC2 - ADC2) * 10
01101 : (ADC3 - ADC2) * 10
01110 : (ADC2 - ADC2) * 200
01111 : (ADC3 - ADC2) * 200

10000 + 0x0-0x7 : ADCx - ADC1
11000 + 0x0-0x5 : ADCx - ADC2

0x1E  : internal VBG reference (1.22V)
0x1F  : GND


*/

#ifndef MUX_NON_STD

#  define MUX_ADC0 (0 <<MUX0)
#  define MUX_ADC1 (1 <<MUX0)
#  define MUX_ADC2 (2 <<MUX0)
#  define MUX_ADC3 (3 <<MUX0)
#  define MUX_ADC4 (4 <<MUX0)
#  define MUX_ADC5 (5 <<MUX0)
#  define MUX_ADC6 (6 <<MUX0)
#  define MUX_ADC7 (7 <<MUX0)

#  ifndef MUX_NO_GAINS
#    define MUX_ADC0_ADC0_GAIN10  ((0x8 <<MUX0) | ADC_RESULT_SIGNED ) /* specifies that the result is in signed mode */
#    define MUX_ADC1_ADC0_GAIN10  ((0x9 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC0_ADC0_GAIN200 ((0xA <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC1_ADC0_GAIN200 ((0xB <<MUX0) | ADC_RESULT_SIGNED )

#    define MUX_ADC2_ADC2_GAIN10  ((0xC <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC3_ADC2_GAIN10  ((0xD <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC2_ADC2_GAIN200 ((0xE <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC3_ADC2_GAIN200 ((0xF <<MUX0) | ADC_RESULT_SIGNED )
#  endif // MUX_NO_GAINS
  
#  ifndef MUX_NO_DIFF
#    define MUX_ADC0_ADC1 ((0x10 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC1_ADC1 ((0x11 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC2_ADC1 ((0x12 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC3_ADC1 ((0x13 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC4_ADC1 ((0x14 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC5_ADC1 ((0x15 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC6_ADC1 ((0x16 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC7_ADC1 ((0x17 <<MUX0) | ADC_RESULT_SIGNED )
    
#    define MUX_ADC0_ADC2 ((0x18 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC1_ADC2 ((0x19 <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC2_ADC2 ((0x1A <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC3_ADC2 ((0x1B <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC4_ADC2 ((0x1C <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC5_ADC2 ((0x1D <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC6_ADC2 ((0x1E <<MUX0) | ADC_RESULT_SIGNED )
#    define MUX_ADC7_ADC2 ((0x1F <<MUX0) | ADC_RESULT_SIGNED )
#  endif // MUX_NO_DIFF
  
#  ifndef MUX5
#    define MUX_VBG (0x1E <<MUX0)
#    define MUX_GND (0x1F <<MUX0)
#  else
#    define MUX_VBG ((0x1E <<MUX0) | MUX5_MASK_IN_CONFIG)
#    define MUX_GND ((0x1F <<MUX0) | MUX5_MASK_IN_CONFIG)
#  endif // MUX5

#endif // MUX_NON_STD




/* ------------------------------------------------------------------------------------
   ----------------------------   PRESCALER   -----------------------------------------
   ------------------------------------------------------------------------------------ */

/*
----------
ADPS bits : 

0 : prescaler = 2
1 : prescaler = 2
2 : prescaler = 4
3 : prescaler = 8
4 : prescaler = 16
5 : prescaler = 32
6 : prescaler = 64
7 : prescaler = 128

This table is yet totally standard 
the selection is based on the quartz frequency, given in autoconf.h

*/

#include <autoconf.h>

#if ( CONFIG_QUARTZ < 100000l)
#  warning your clock is too slow, the ADC result is not guaranted
#endif

#if (CONFIG_QUARTZ <= 400000l)      // up to 400 kHz : PS = 2
#  define ADC_PRESCALE 0
#elif (CONFIG_QUARTZ <= 800000l)   // up to 800 kHz : PS = 4
#  define ADC_PRESCALE 2
#elif (CONFIG_QUARTZ <= 1600000l)  // up to 1.6 MHz : PS = 8
#  define ADC_PRESCALE 3
#elif (CONFIG_QUARTZ <= 3200000l)  // up to 3.2 MHz : PS = 16
#  define ADC_PRESCALE 4
#elif (CONFIG_QUARTZ <= 6400000l)  // up to 6.4 MHz : PS = 32
#  define ADC_PRESCALE 5
#elif (CONFIG_QUARTZ <= 12800000l) // up to 12.8 MHz : PS = 64
#  define ADC_PRESCALE 6
#elif ( CONFIG_QUARTZ <= 25600000l) // up to 25.6 MHz : PS = 128
#  define ADC_PRESCALE 7
#else
#  define ADC_PRESCALE 7
#  warning your clock is too fast, the ADC result is not guaranted
#endif






#endif // _ADC_ARCHS_
