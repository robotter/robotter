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
 *  Revision : $Id: adc.c,v 1.11 2008-01-08 20:05:04 zer0 Exp $
 *
 */

#include <stdlib.h>

#include <aversive.h>
#include <adc.h>

 /* keep the previous config */
static uint16_t g_adc_previous_config = ADC_NO_CONFIG;

/* function pointer definition for event */
static void (*adc_event)(int16_t) = NULL;


/**
 * Initialisation of ADC internal registers
 * Can be called for a wake up after a shutdown command 
 */
void adc_init(void)
{
#ifdef PRADC
	cbi(PRR, PRADC);
#endif

	ADCSRA =  (1<<ADEN) | (ADC_PRESCALE << ADPS0);
	ADMUX = 0;
#ifdef ADCSRB
	ADCSRB = 0;
#endif
}

/**
 * Shut down the ADC, for power consumption
 */
void adc_shutdown(void)
{
	ADCSRA = 0; // erases all the register

#ifdef PRADC
	sbi(PRR, PRADC);
#endif
}


/**
 * Register callback event. The parameter function is called when the
 * conversion is finished.
 */
void adc_register_event(void (*f)(int16_t))
{
	uint8_t flags;

	IRQ_LOCK(flags);
	adc_event = f;
	IRQ_UNLOCK(flags);
}

/**
 * Interrupt function, other interrupts are disabled during its
 * execution.
 */
SIGNAL(SIG_ADC)
{
	if (adc_event) {
		int16_t result;

		result = ADC;

		/* sign extension to fill the 16 bits when negative
		 * (for the 16 bits output format, the output is
		 * already right.) */
		if(  ( g_adc_previous_config & ADC_RESULT_SIGNED )
		     && !(g_adc_previous_config & ADC_MODE_16_BITS)
		     && (result & 0x0200) )
			result |= 0xFE00;

		adc_event(result);
	}
}



/**
 * Launch a conversion : this function launches a conversion with the
 * specified configuration.  The conversion_config is casted to an
 * int.
*/
void adc_launch(uint16_t conversion_config)
{
	/* configure multiplexer : done first, so the maxium time is
	 * left before the real conversion launch */
	ADMUX = conversion_config & 0xFF ;

	/**
	 * This disables and reenables the ADC when a different
	 * channel is selected AND the new channel is a differential
	 * one. Using this trick, the ADC recalibrates, and the time
	 * for this allows the amplifier to settle.
	 *
	 * Datasheet says :
	 * When switching to a differential gain channel, the first
	 * conversion result may have a poor accuracy due to the
	 * required settling time for the automatic offset
	 * cancellation circuitry.  The user should preferably
	 * disregard the first conversion result.
	 */
	if ( (conversion_config & ADC_RESULT_SIGNED) &&
	     (g_adc_previous_config != conversion_config) ) {
		cbi(ADCSRA,ADEN);
		sbi(ADCSRA,ADEN);
	}

	/* save config */
	g_adc_previous_config = conversion_config;

	/* for some devices, one additionnal MUX bit is in ADCSRB */
#ifdef MUX5_IN_ADCSRB
	if( conversion_config & MUX5_MASK_IN_CONFIG )
		sbi(ACSRB, MUX5);
	else
		cbi(ACSRB, MUX5);
#endif // MUX5_IN_ADCSRB

	/* Enable free run or not (triggered mode) */
	if( conversion_config  & ADC_MODE_TRIGGERED )
		sbi(ADCSRA, ADFR);
	else
		cbi(ADCSRA, ADFR);

	/* Start conversion, with or without enabling interrupts */
	if ( conversion_config & ADC_MODE_INT ) {
		/* Clear flag from previous intr (in case of previous
		 * conversion was not using intr), and enable
		 * interrupt */
		ADCSRA |=  (1 << ADSC) | (1 << ADIF) | (1 << ADIE);
	}
	else {
		/* clear flag from previous int, used as a 'conversion
		   finished' flag */
		cbi(ADCSRA, ADIE);
		ADCSRA |=  (1 << ADSC) | (1 << ADIF);
	}
}

/**
 * This function gets an ADC value. If a conversion has been
 * previously started, with EXACTLY the same config (or specifying
 * ADC_NO_CONFIG) then it waits for it to finish. Else it launches a
 * new one with the given config, and polls the result.
 *
 * This function should not be used if you use interrupts, but only
 * can be used with triggered (or free run mode)
*/
int16_t adc_get_value(uint16_t conversion_config)
{
	int16_t result;

	/* conversion has previously been launched, or no change */
	if ((conversion_config == ADC_NO_CONFIG) ||
	    (conversion_config == g_adc_previous_config)) {
		if (bit_is_clear(ADCSRA, ADSC) &&
		    bit_is_clear(ADCSRA, ADIF)) {
			/* no result is available now and no
			   conversion is pending -> launch it... */
			adc_launch(g_adc_previous_config);
		}
	}
	/* The previous conversion had a different configuration : we
	 * must launch a new one */
	else {
		/* Cancel previous triggered mode, if it was set and
		 * reset interrupt mask */
		cbi(ADCSRA, ADFR);
		cbi(ADCSRA, ADIE);

		/* waitig for the previous conv to finish, result will
		 * be lost */
		while(bit_is_set(ADCSRA, ADSC));

		/* launch new one */
		adc_launch(conversion_config);
	}

	/* waitig for the result, works even in triggered mode, then
	 * clear the flag. */
	while(bit_is_clear(ADCSRA, ADIF));
	sbi(ADCSRA, ADIF);

	result = ADC;

	/* If we are in SIGNED_MODE + 10 bits format, and if the
	 * result is negative, set the 7 first MSB bits to 1 */
	if(  ( g_adc_previous_config & ADC_RESULT_SIGNED ) &&
	     !(g_adc_previous_config & ADC_MODE_16_BITS) &&
	     (result & 0x0200) ) {
		result |= 0xFE00;
	}

	return result;
}


/**
 * Just a int32_t version for compatibility with control_system
 * function prototypes.
 */
int32_t adc_get_value32(void * conversion_config)
{
	return adc_get_value((uint16_t)conversion_config);
}

