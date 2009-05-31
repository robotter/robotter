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

/*
 *  -- INFO --
 *	This module enable the use of the SPI hardware
 *	on some AVRs. For now, only MASTER mode is available.
 *	You can have as many slaves as you want, as long as you
 *	don't confuse them by trying to speak to several at the same time.
 *
 *      BIG WARNING: If you use /SS as a slave selector, always
 *      register it using spi_register_ss_line() *before* calling
 *      spi_init(). Read carrefully the datasheet, especially the
 *      paragraph "SS Pin Functionnality" in SPI section. In master
 *      mode, the SS pin must be configured as an output OR driven
 *      high by an external circuitry.
 *
 *  -- USAGE --
 *	So you have one (or several) device(s) that want to speak to your
 *	shiny AVR over SPI ?
 *	This is fairly easy. First, summon this module with spi_init().
 *	You can configure
 *	 - the FORMAT of the link (sample on rising or falling edge, ...)
 *	 - the RATE of the connection (you set the prescaler dividing the CPU clock)
 *	You can also set the data order (MSB or LSB first on the link)
 *	
 *	After that you can register your devices using spi_register_ss_line();
 *	This returns you a device identifier you can use with spi_slave_[de]select();
 *
 *	Remember to ALWAYS select your slave before talking to it, and deselect if
 *	once your are done.
 */



#ifndef _SPI_H_
#define _SPI_H_

#include <stdint.h>

/* SPI modes */
typedef enum {
	SPI_MODE_UNINIT,	/* not initialized */
	SPI_MODE_MASTER		/* for now, only master mode as
				 * slave mode cannot be tested */
} spi_mode_t;


/* SPI transfert format 
 * This defines the SCK phase and polarity.
 * For instance in FORMAT_0, data lines are set on the falling edge
 * of SCK, and sampled on its rising edge. This determines the order
 * in which sampling and setting occurs.
 * For more information on SPI formats, please see your CPU datasheet.
 */
typedef enum {	
	SPI_FORMAT_0 = 0x00,                  /* Sample rising  Setup falling */
	SPI_FORMAT_1 = _BV(CPHA),             /* Setup rising   Sample falling */
	SPI_FORMAT_2 = _BV(CPOL),             /* Sample falling Setup rising */
	SPI_FORMAT_3 = _BV(CPHA) | _BV(CPOL), /* Setup falling  Sample rising*/
} spi_format_t;


/* SPI Clock Rate
 * This code the values for SPI2X (high nibble), SPR1 and SPR0 (low nibble)
 * f_sck = f_osc / SPI_CLK_RATE_xx
 */
typedef enum {
	SPI_CLK_RATE_2 =	0x10,
	SPI_CLK_RATE_4 =	0x00,
	SPI_CLK_RATE_8 =	0x11,
	SPI_CLK_RATE_16 =	0x01,
	SPI_CLK_RATE_32 =	0x12,
	SPI_CLK_RATE_64 =	0x02,
	SPI_CLK_RATE_128 =	0x03
} spi_clk_rate_t;


/* 
 * Data order (bits order)
 * order is either SPI_LSB_FIRST or SPI_MSB_FIRST
 * Default is MSB first
 */
#define SPI_MSB_FIRST	0
#define SPI_LSB_FIRST	1
void spi_set_data_order(uint8_t order);




/* Initialize the SPI
 * mode is SPI_MODE_MASTER (slave is not implemented)
 * format defines the transfert format (see above)
 * clk_rate defines the frequency of SCK line (f_sck = f_osc / clk_rate)
 */
void spi_init(spi_mode_t mode, spi_format_t format, spi_clk_rate_t clk_rate);


/*
 *	Returns the state of the SPI
 */
spi_mode_t spi_get_mode(void);


/* 
 * Register a pin as SS line
 * Returns a unique identifier, or -1 on error
 * There is always the physical SS line registered as 0
 */
int8_t spi_register_ss_line(volatile uint8_t *port, uint8_t bitnum);


/*
 *	Sends a byte (and receive one at the same time)
 *	Returns the received byte
 *	Wait for the end of transmission
 */
uint8_t spi_send_and_receive_byte(uint8_t byte);


/*
 *	Sends a byte, discards the received one.
 *	Do NOT wait for the end of transmission
 */
void spi_send_byte(uint8_t byte);

/*
 *	Receives a byte (sends a NULL)
 */
uint8_t spi_receive_byte(void);

/*
 *	Select or Deselect the SS line
 *	The SPI standard defines that only ONE slave can
 *	be selected at any time. An internal mecanism prevents
 *	the selection of several slaves at the same time, but
 *	this is not completely foolproof.
 *
 *	/!\ Behavior is NOT ASSURED if you mess with SS lines
 *	outside of this module, so PLEASE use these setters. /!\
 *
 *	This function returns EBUSY if there is already a selected slave
 */
uint8_t spi_slave_select(uint8_t slave);

/*
 *	Inconditionnaly releases the line.
 */
void spi_slave_deselect(uint8_t slave);

/*
 *	Display SS lines
 */
void spi_display_ss_lines(void);


#endif /* _SPI_H_ */

