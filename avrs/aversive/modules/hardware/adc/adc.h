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
 *  Revision : $Id: adc.h,v 1.9 2008-01-08 20:05:04 zer0 Exp $
 *
 */
/** \file adc.h
 *  \brief Interface of the ADC Module
 *
 *  \todo some ATtiny support to add
 *
 *  \test nothing done
 *
 * This module provides access to the built-in ADC unit of the AVR
 * uCs.
 */


#ifndef _ADC_H_
#define _ADC_H_

#include <aversive.h>

#include <adc_archs.h>
#include <adc_config.h>

/*
 * You must always specify a MUX and a REF flag.
 * MUX selection flags : 
 *
 * A lot of them exist, for more, see the capabilities of your uC in
 * the datasheet. Typical examples:
 *  
 *  MUX_ADC0             : selects input 0
 *  MUX_ADC0_ADC1        : selects the electrical signal ADC0-ADC1
 *  MUX_ADC0_ADC1_GAIN10 : selects the electrical signal (ADC0-ADC1) *10
 *  ...
 *  MUX_VBG              : selects the internal bandgap reference
 *  MUX_GND              : selects the GND pin (0V)
 *
 * See your Datasheet, and adc_archs.h for more info.
 *
 *
 *
 * Reference flags : use one of these four : 
 *
 *  ADC_REF_AREF  : a reference must be connected to the AREF pin :
 *                  default
 *  ADC_REF_AVCC  : using AVCC as reference : recommended for default !!!
 *  ADC_REF_VREF  : using the internal reference
 *  ADC_REF_VREF2 : internal ref, with options. Beware, this does not
 *                  work on all devices, see your Datasheet !!
 *
 * For some controllers (actually only ATtiny25-45-85) you can specify
 * more options, just use (1<<REFS2)|(1<<REFS0)
 *
 * YOU NEED TO SPECIFY THIS VALUE FOR EACH CONVERSION CONFIGURATION !!!!!
 */


/**
 * Set this flag for using interruptions instead of polling.
 * If you use this, do not call the adc_get_value() function ! 
 */
#define ADC_MODE_INT        0x0200

/**
 * Flag for triggered mode.
 */
#define ADC_MODE_TRIGGERED  0x0400

/*
 * Using one of this flags selects in which form the result is given
 *
 * These flags select the output format. The signed options are only
 * for the differential measurement ! Don't use them for single ended
 * measurements, or the results will be wrong.
 *
 * ADC_MODE_10_BITS : This format will give you a result between 0 and
 *                    1023 This format is default, you do not need to
 *                    specify the flag.

 * ADC_MODE_16_BITS : This will use all the span of the uint16_t (or
 *                    int16_t for a differential conversion) beware !!
 *                    Cast your result in the correct type since the
 *                    type depends of the type of channel you select.
 */
#define ADC_MODE_10_BITS            0
#define ADC_MODE_16_BITS            ADLAR_MASK_IN_CONFIG

/** 
 * this flag is used internally of the module, use it only if you set
 * manually a differential channel. 
 */
#define ADC_RESULT_SIGNED           0x1000


/** 
 * This specifies a conversion with no config (uses the previous
 * parameters) always use this flag alone !!
 */
#define ADC_NO_CONFIG            0xFFFF


/**************/


/**
 * Initialisation of ADC internal registers
 * Can be called for a wake up after a shutdown command 
 */
void adc_init(void);

/**
 * Shut down the ADC, for power consumption
 */
void adc_shutdown(void);


/**
 * Register callback event. The parameter function is called when the
 * conversion is finished.
 */
void adc_register_event(void (*f)(int16_t));



/**
 * Launch a conversion : this function launches a conversion with the
 * specified configuration.  The conversion_config is casted to an
 * int.
*/
void adc_launch(uint16_t conversion_config);


/**
 * This function gets an ADC value. If a conversion has been
 * previously started, with EXACTLY the same config (or specifying
 * ADC_NO_CONFIG) then it waits for it to finish. Else it launches a
 * new one with the given config, and polls the result.
 *
 * This function should not be used if you use interrupts, but only
 * can be used with triggered (or free run mode)
 */
int16_t adc_get_value(uint16_t conversion_config);


/**
 * Just a int32_t version for compatibility with control_system
 * function prototypes.
 */
extern int32_t adc_get_value32(void * conversion_config);



#endif // _ADC_H_
