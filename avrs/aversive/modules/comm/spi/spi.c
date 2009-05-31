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
#include <aversive/parts.h>
#include <aversive/error.h>

#include <stdlib.h>
#include <string.h>

#include <spi.h>
#include <spi_config.h>

/* internal structure to store SS pins */
typedef struct _ss_pin {
	volatile uint8_t *port;
	uint8_t bitnum;
} ss_pin_t;


/* global vars */
static volatile ss_pin_t g_ss_lines[SPI_MAX_SLAVES+1];
static volatile uint8_t g_ss_number;
static volatile spi_mode_t g_spi_mode;
static volatile uint8_t g_slave_selected;




/* 
 * Register a pin as SS line
 * Returns a unique identifier, or -1 on error
 * There is always the physical SS line registered as 0
 */
int8_t spi_register_ss_line(volatile uint8_t *port, uint8_t bitnum)
{
	DEBUG(E_SPI, "Trying to register new SS line: port 0x%x, bitnum %d", port, bitnum);
	/* too much SS lines (try to change SPI_MAX_SLAVES) */
	if (g_ss_number >= SPI_MAX_SLAVES+1)
		return -1;
	
	g_ss_lines[g_ss_number].port = port;
	g_ss_lines[g_ss_number].bitnum = bitnum;
	*(port-1) |= _BV(bitnum); // was DDR(port) |= _BV(bitnum);
	/* Unselected at first */
	*port |= (_BV(bitnum));

	NOTICE(E_SPI, "New Slave Line registered: %d", g_ss_number);

	return g_ss_number++;
}


/*
 *	Set data order (default: MSB first)
 */
inline void spi_set_data_order(uint8_t order)
{
	if (order == SPI_LSB_FIRST)
		SPCR |= _BV(DORD);
	else
		SPCR &= ~(_BV(DORD));
}

/*
 *	Get data order
 */
inline uint8_t spi_get_data_order(void)
{
	if (SPCR & _BV(DORD))
		return SPI_LSB_FIRST;
	return SPI_MSB_FIRST;
}


/*
 *	Initialize SPI
 */
void spi_init(spi_mode_t mode, spi_format_t format, spi_clk_rate_t clk_rate)
{
	NOTICE(E_SPI, "Init SPI: mode %d, format %d, clk_rate %d",
	       mode, format, clk_rate);

	/* Configure SPI pins */
	DDR(SCK_PORT) |= _BV(SCK_BIT);
	DDR(MOSI_PORT) |= _BV(MOSI_BIT);
	DDR(MISO_PORT) &= ~(_BV(MISO_BIT));
	/* SS pin is not driven by SPI hardware 
	 * This is taken care of by spi_register_ss_line()
	 * EVEN for the "default" SS line */
	g_ss_number = 0;
	g_slave_selected = FALSE;

	/* Registers init */
#ifdef PRR0
	PRR0 &= ~(_BV(PRSPI));		/* Clear power reduction bit */
#endif
	SPCR =	0;
	SPSR =	0;

	SPCR |= _BV(MSTR);		/* XXX Master only for now ! */
	SPCR |= (uint8_t)format;	/* Clock polarity and phase */
	
	/* clockrate: SPR0, SPR1, SPI2X */
	if (clk_rate & 0x01)
		SPR0_REG |= _BV(SPR0);
	else
		SPR0_REG &= ~(_BV(SPR0));
	if (clk_rate & 0x02)
		SPR1_REG |= _BV(SPR1);
	else
		SPR1_REG &= ~(_BV(SPR1));
	if (clk_rate & 0x10)
		SPI2X_REG |= _BV(SPI2X);
	else
		SPI2X_REG &= ~(_BV(SPI2X));
	
	SPCR |= _BV(SPE);		/* Enable SPI */

	g_spi_mode = SPI_MODE_MASTER;
	NOTICE(E_SPI, "Init done");
}

/*
 *	Returns the state of SPI
 */
inline spi_mode_t spi_get_mode(void)
{
	return g_spi_mode;
}

/*
 *	Send a byte (and receive one)
 *	Returns the received byte
 */
uint8_t spi_send_and_receive_byte(uint8_t byte)
{
	//DEBUG(E_SPI, "Sending 0x%x", byte);
	/* Start transmission */
	SPDR = byte;

	/* Wait for transmission complete 
	 * Timings are VERY important, do not bypass this ! */
	while(!(SPSR & (1<<SPIF)))
		;
	/* Return received byte */
	return SPDR;
}

/*
 *	Send a byte, discard the result
 */
inline void spi_send_byte(uint8_t byte)
{
	spi_send_and_receive_byte(byte);
}

/*
 *	Receives a byte (sends a NULL)
 */
uint8_t spi_receive_byte(void)
{
	return spi_send_and_receive_byte(0x00);
}

/*
 *	Activates the selected SS line
 */
uint8_t spi_slave_select(uint8_t slave)
{
	if (g_slave_selected) {
		ERROR(E_SPI, "A slave is already selected !");
		return EBUSY;
	}

	*(g_ss_lines[slave].port) &= ~(_BV(g_ss_lines[slave].bitnum));
	g_slave_selected = TRUE;
	return ESUCCESS;
}

/*
 *	Desactivates the selected SS line
 */
void spi_slave_deselect(uint8_t slave)
{
	*(g_ss_lines[slave].port) |= (_BV(g_ss_lines[slave].bitnum));
	g_slave_selected = FALSE;
}

/*
 *	Display SS lines
 */
void spi_display_ss_lines(void)
{
	uint8_t i;
	for (i = 0; i < g_ss_number; i++) {
		DEBUG(E_SPI, "SS%d: adr 0x%x bitnum %d value 0x%x",
		      i,
		      g_ss_lines[i].port,
		      g_ss_lines[i].bitnum,
		      *(g_ss_lines[i].port));
	}
}
