/*  
 *  Copyright Droids Corporation (2008)
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
 */

/*
 * Author : Julien LE GUEN - jlg@jleguen.info
 */

#include <aversive.h>
#include <aversive/pgmspace.h>
#include <aversive/error.h>
#include <aversive/errno.h>
#include <aversive/wait.h>
#include <avr/interrupt.h>

#include <stdio.h>
#include <string.h>
#include <math.h>

#include <uart.h>
#include <spi.h>
#include <cc2420.h>
#include <cc2420_arch.h>
#include <time_ext.h>


#include "firefly2_2.h"


uint8_t i;



/*
 *	When an unexpected interrupt occurs
 */
ISR(__vector_default)
{
	/* Notify the user */
	EMERG(EFAULT, "Bad interrupt vector !");

	/* Loop and blink the leds */
	while(TRUE)
	{
		LED_SET(LED_BLUE);
		LED_SET(LED_GREEN);
		LED_SET(LED_ORANGE);
		LED_SET(LED_RED);
		wait_ms(100);

		LED_CLR(LED_BLUE);
		LED_CLR(LED_RED);
		LED_CLR(LED_ORANGE);
		LED_CLR(LED_GREEN);
		wait_ms(100);
	}
}


/*
 *	LOG function
 */
void mylog(struct error * e, ...)
{
	char *severity;
	char *module;
	va_list ap;
	uint16_t stream_flags = stdout->flags;
	volatile time_ext_t time = time_ext_get();


	switch(e->severity)
	{
		case ERROR_SEVERITY_EMERG:		severity = "[EMERG]";	break;
		case ERROR_SEVERITY_ERROR:		severity = "[ERROR]";	break;
		case ERROR_SEVERITY_WARNING:	severity = "[WARNING]";	break;
		case ERROR_SEVERITY_NOTICE:		severity = "[NOTICE]";	break;
		case ERROR_SEVERITY_DEBUG:		severity = "[DEBUG]";	break;
		default:						severity = "[DEFAULT]"; break;
	}

	switch(e->err_num)
	{
		case E_SPI:			module = "[SPI]   "; break;
		case E_CC2420:		module = "[CC2420]"; break;
		case E_TIME_EXT:	module = "[TIME]  "; break;
		default:			module = ""; break;
	}

	va_start(ap, e);
	//vfprintf_P(stdout, severity, ap);
	//vfprintf_P(stdout, module, ap);
	printf_P(PSTR("(%lu %lu) "), time.sec, time.nano);
	printf_P(PSTR("%s"), severity);
	printf_P(PSTR("%s "), module);
	vfprintf_P(stdout, e->text, ap);
	printf_P(PSTR("\r\n"));
	va_end(ap);
	stdout->flags = stream_flags;
}


void init_ports(void)
{
	/* No pull-up resistor */
	MCUCR |= (1<<PUD);
		
	/* Leds -> ouputs */
	LED_DDR = _BV(LED_ORANGE) | _BV(LED_BLUE) | _BV(LED_GREEN) | _BV(LED_RED);
	
	/* Button -> output */
	cbi(BUTTON_DDR, BUTTON_PIN);
}


int main(void)
{
	uint16_t reg;
	uint8_t buffer[368];
	uint16_t i;
	uint8_t j;

	/* Initialize Time module */
	time_ext_init();
	time_ext_set(0, 0);
	//sei();

	/* Initialize firefly ports */
	init_ports();

	/* Initialize uart1 to send debug messages */
	uart_init();
	fdevopen(uart1_dev_send, uart1_dev_recv);

	/* register log function */
	error_register_emerg(mylog);
	error_register_error(mylog);
	error_register_warning(mylog);
	error_register_notice(mylog);
	error_register_debug(mylog);

	NOTICE(ESUCCESS, "\r\n\r\n\r\n\r\n\r\n\r\n **************************************");
	NOTICE(ESUCCESS, "MCUSR = 0x%x", MCUSR);


	/* Clear all leds*/
	LED_CLR(LED_GREEN);
	LED_CLR(LED_ORANGE);
	LED_CLR(LED_RED);
	LED_CLR(LED_BLUE);

	/* Light up yellow led */
	LED_SET(LED_ORANGE);

	cc2420_init();


	NOTICE(ESUCCESS, "Ready !");


	/* Test SPI link: reading CC2420 registers */
	// MAIN - default = 0xF800
	reg = cc2420_read_register(MAIN);
	if(reg == 0xF800)
		NOTICE(ESUCCESS, "MAIN read [OK]");
	else
		ERROR(42, "MAIN should be 0xF800, read 0x%x", reg);


	NOTICE(ESUCCESS, "MANFIDH = 0x%x", cc2420_read_register(MANFIDH));
	NOTICE(ESUCCESS, "MANFIDL = 0x%x", cc2420_read_register(MANFIDL));
	NOTICE(ESUCCESS, "SYNCWORD = 0x%x", cc2420_read_register(SYNCWORD));
	cc2420_write_register(SYNCWORD, 0xdead);
	NOTICE(ESUCCESS, "SYNCWORD = 0x%x", cc2420_read_register(SYNCWORD));
	NOTICE(ESUCCESS, "STAT = 0x%x", cc2420_get_status());


	uint8_t tmp = 0x42;
	cc2420_read_ram(RAM_IEEEADR, &tmp, 1);
	NOTICE(ESUCCESS, "RAM_IEEEADR = 0x%x", tmp);
	NOTICE(ESUCCESS, "STAT = 0x%x", cc2420_get_status());
	tmp = 0x42;
	cc2420_write_ram(RAM_IEEEADR, &tmp, 1);
	NOTICE(ESUCCESS, "STAT = 0x%x", cc2420_get_status());
	cc2420_read_ram(RAM_IEEEADR, &tmp, 1);
	NOTICE(ESUCCESS, "RAM_IEEEADR = 0x%x", tmp);
	NOTICE(ESUCCESS, "STAT = 0x%x", cc2420_get_status());


//#if 0
	/* test TXFIFO and RAM access */
	for(i = 0; i < 128; i++)
		buffer[i] = i;
	NOTICE(ESUCCESS, "Writing to RXFIFO...");
	cc2420_write_rxfifo(buffer, 128);
	/* Read all RAM */
	NOTICE(ESUCCESS, "Reading RXFIFO...");
	cc2420_read_rxfifo(buffer, 128);

	/* Dump buffer contents */
	NOTICE(ESUCCESS, "RAM content after RXFIFO write");
	for(i = 0; i < 23; i++)
	{
		printf("0x%x \t| ", i*16);
		for(j = 0; j < 16; j++)
			printf("%x ", buffer[i*16+j]);
		printf("\r\n");
	}


	/* Write and Read RAM */
	for(i = 0; i < 128; i++)
		buffer[i] = i;
	NOTICE(ESUCCESS, "Writing to RAM...");
	cc2420_write_ram(RAM_TXFIFO, buffer, 128);
	/* Read all RAM */
	NOTICE(ESUCCESS, "Reading RAM...");
	cc2420_read_ram(RAM_TXFIFO, buffer, 368);

	/* Dump buffer contents */
	NOTICE(ESUCCESS, "RAM content after write to RAM");
	for(i = 0; i < 23; i++)
	{
		printf("0x%x \t| ", i*16);
		for(j = 0; j < 16; j++)
			printf("%x ", buffer[i*16+j]);
		printf("\r\n");
	}
//#endif


	/*
	 *	TEST for PORT and DDR and stuff
	 */
	NOTICE(ESUCCESS, "&PORTC = 0x%x | PORTC = 0x%x | *(&PORTC) = 0x%x",
			&PORTC, PORTC, *(&PORTC));
	spi_display_ss_lines();


	/* Infinite loop */
	while(1)
	{
		if(!TST(BUTTON_PORT, BUTTON_PIN))
		{
			time_ext_t local_time = time_ext_get();
			LED_SET(LED_BLUE);
			NOTICE(ESUCCESS, "Button event at %ld %ld",
				local_time.sec, local_time.nano);
			NOTICE(ESUCCESS, "STAT = 0x%x", cc2420_get_status());
			NOTICE(ESUCCESS, "DDRC = 0x%x | PORTC = 0x%x", DDRC, PORTC);
			while(!TST(BUTTON_PORT, BUTTON_PIN))
				;
			NOTICE(ESUCCESS, "STAT = 0x%x", cc2420_get_status());
		}
		else
			LED_CLR(LED_BLUE);
	}
}
