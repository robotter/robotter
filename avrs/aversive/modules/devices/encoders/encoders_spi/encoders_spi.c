/*  
 *  Copyright Droids Corporation (2009)
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
 *  Revision : $Id: encoders_spi.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 *  Olivier MATZ <zer0@droids-corp.org>
 */

/* This modules handles encoders: values are read through a SPI
 * interface. Basically, frames are formatted with 4 words of 16 bits,
 * describing the values of the 4 encoders. */

#include <string.h>

#include <aversive.h>
#include <aversive/parts.h>

#include <spi.h>

#include <encoders_spi.h>
#include <encoders_spi_config.h>

static int32_t g_encoders_spi_values[ENCODERS_SPI_NUMBER];
static int16_t g_encoders_spi_previous[ENCODERS_SPI_NUMBER];


/* Initialisation of encoders, variables */
void encoders_spi_init(void)
{
	memset(g_encoders_spi_values, 0, sizeof(g_encoders_spi_values));
	memset(g_encoders_spi_previous, 0, sizeof(g_encoders_spi_previous));
	spi_register_ss_line(&ENCODERS_SPI_SS_PORT, ENCODERS_SPI_SS_BIT);
	spi_init(SPI_MODE_MASTER, ENCODERS_SPI_FORMAT, ENCODERS_SPI_CLK_RATE);
	spi_set_data_order(ENCODERS_SPI_DATA_ORDER);
}


/* Update encoders values */
void encoders_spi_manage(void *dummy)
{
	union {
		struct {
			uint8_t u8_lsb;
			uint8_t u8_msb;
		} s;
		int16_t s16;
	} enc;
	uint8_t i;
	int16_t diff;
	uint8_t flags;

	spi_slave_select(0);
	for (i=0; i<ENCODERS_SPI_NUMBER; i++) {
		enc.s.u8_lsb = spi_receive_byte();
		enc.s.u8_msb = spi_receive_byte();
		diff = enc.s16 - g_encoders_spi_previous[i];
		g_encoders_spi_previous[i] = enc.s16;
		IRQ_LOCK(flags);
		g_encoders_spi_values[i] += diff;
		IRQ_UNLOCK(flags);
	}
	spi_slave_deselect(0);
}



/* Extract encoder value */
int32_t encoders_spi_get_value(void *encoder)
{
	int32_t value;
	uint8_t flags;

	IRQ_LOCK(flags);
	value = g_encoders_spi_values[(int)encoder];
	IRQ_UNLOCK(flags);

	return value;
}

/* Set an encoder value */
void encoders_spi_set_value(void *encoder, int32_t val)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	g_encoders_spi_values[(int)encoder] = val;
	IRQ_UNLOCK(flags);
}
