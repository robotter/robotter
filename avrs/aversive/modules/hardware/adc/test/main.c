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
 *  Revision : $Id: main.c,v 1.7 2008-01-08 20:05:04 zer0 Exp $
 *
 */
 
#include <avr/io.h>
#include <aversive/wait.h>
#include <aversive.h>

#include <adc.h>

#include <uart.h>
#include <stdio.h>
#include <aversive/pgmspace.h>

void event(int16_t);



int main(void)
{
	int16_t a; int32_t b;

	uart_init();
	fdevopen(uart0_dev_send,NULL);

	sei();

	adc_init();
  
  	while(1) {
    
		printf_P(PSTR("\n\nHello everybody\n This is the ADC test\n"));
    
		wait_ms(20);
        
		/* simple polling */
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC0 );
    
		printf_P(PSTR("polling : ADC0 = %i\n"),a);
		wait_ms(20);
    
    		/* pre-launch */
    
		adc_launch( ADC_REF_AVCC | MUX_ADC1 );
		wait_ms(1);
		/* this function should take less time */
		a = adc_get_value( ADC_NO_CONFIG );
    
		printf_P(PSTR("pre-launch : ADC1 = %i\n"),a);
		wait_ms(20);
    
    		/* test of free running mode */
    
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC2 | ADC_MODE_TRIGGERED );
		printf_P(PSTR("free run mode : ADC2 = %i\n"),a);
		wait_ms(1);
		/* this function should take less time */
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC3 | ADC_MODE_TRIGGERED ); 
		printf_P(PSTR("free run mode : ADC3 = %i\n\n"),a);
		wait_ms(1);
    
    
		/* test of different outputs formats */
    
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC0  | ADC_MODE_16_BITS );
		printf_P(PSTR("normal output 16: ADC0 = %u ( div = %u)\n"),
			 a, ((uint16_t)a)/(1<<6));
    
		b = adc_get_value32( (void*)(ADC_REF_AVCC | MUX_ADC0  | 
					     ADC_MODE_16_BITS) );
		printf_P(PSTR("normal output 16(32): ADC0 = %ld ( div = %lu)\n"),
			 b, b/(1l<<6));
    
		/* ADC_MODE_10_BITS default */
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC0  );
		printf_P(PSTR("normal output 10: ADC0 = %u\n"),a); 
    
		/* ADC_MODE_10_BITS default */
		b = adc_get_value32( (void*)(ADC_REF_AVCC | MUX_ADC0 ) );
		printf_P(PSTR("normal output 10(32): ADC0 = %lu\n"),b);
    
		printf_P(PSTR("now try a signed differential conversion\n"));
    
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC0  | ADC_MODE_10_BITS );
		b = adc_get_value( ADC_REF_AVCC | MUX_ADC1  | ADC_MODE_10_BITS );
		printf_P(PSTR("computed : ADC0-ADC1 = %i\n"), 
			 ((int16_t)a - (int16_t)b) /2);
    
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC0_ADC1);
    
		printf_P(PSTR("signed output 10: ADC0-ADC1 = %i\n"),a);
    
		b = adc_get_value32( (void*)(ADC_REF_AVCC | MUX_ADC0_ADC1 ) );
		printf_P(PSTR("signed output 10(32): ADC0-ADC1 = %li\n"),b);
    
		a = adc_get_value( ADC_REF_AVCC | MUX_ADC0_ADC1 | 
				   ADC_MODE_16_BITS );
		printf_P(PSTR("signed output 16: ADC0-ADC1 = %i ( div = %i)\n"),
			 a, a/(1<<6)); 
    
		b = adc_get_value32( (void*)(ADC_REF_AVCC | MUX_ADC0_ADC1  | 
					     ADC_MODE_16_BITS ) );
		printf_P(PSTR("signed output 16(32): ADC0-ADC1 = %li ( div = %li)\n\n"),
			 b, b/(1<<6));
    
		/* test of interrupt mode : we scan once the 8
		   inputs */
    
		adc_register_event(event);
		adc_launch( ADC_REF_AVCC | MUX_ADC0 | ADC_MODE_INT );
		wait_ms(20);
    
		wait_ms(2000);
	}

	return 0;
}



void event(int16_t result)
{
	static int i = 0;

	sei();
  
	/* The printf in an interrupt is not a good idea, but ok for
	 * the test program */
	printf_P(PSTR("from interrupt : ADC%i = %i\n"),i,result); 
  
	if(++i != 8)
		adc_launch( ADC_REF_AVCC | ( MUX_ADC0 + i ) | ADC_MODE_INT );
	else
		i = 0; /* end, reinitialisation for the next time */
}
