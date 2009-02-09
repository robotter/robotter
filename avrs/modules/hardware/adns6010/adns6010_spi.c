/*  
 *  Copyright RobOtter (2009)
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
 */

/** @file adns6010_spi.c
  * @author JD
  *
  * Functions controlling FPGA driven SPI to ADNS
  */
#include <aversive.h>
#include <stdint.h>

#include "adns6010_spi.h"
#include "adns6010_fpga.h"

/*-------------------------------------*/
void adns6010_spi_init()
{

	return;
}

/*-------------------------------------*/
uint8_t adns6010_spi_sendrecv(uint8_t send)
{
	uint8_t recv;

	// Drive senddata low to initiate SPI communication
	cbi(ADNS6010_SPI_CTRL, ADNS6010_SPICTRL_BIT_SENDDATA);
	
	// Load byte on SPI data register
	ADNS6010_SPI_DATA = send;

	// Drive senddata high to send byte
	sbi(ADNS6010_SPI_CTRL, ADNS6010_SPICTRL_BIT_SENDDATA);

	while( !bit_is_set(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_BUSY) );

	// Drive senddata low to initiate SPI communication
	cbi(ADNS6010_SPI_CTRL, ADNS6010_SPICTRL_BIT_SENDDATA);

	// Wait for transmission end
	while( bit_is_set(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_BUSY) );

	// Read received data
	recv = ADNS6010_SPI_DATA;

	return recv;
}

/*-------------------------------------*/
void adns6010_spi_send(uint8_t byte)
{
	adns6010_spi_sendrecv(byte);
	return;
}

/*-------------------------------------*/
uint8_t adns6010_spi_recv()
{
	uint8_t byte;
	byte = adns6010_spi_sendrecv(0x00);
	return byte;
}

/*-------------------------------------*/
void adns6010_spi_cs(uint8_t cs)
{
	switch(cs)
	{
		default:
		case 0:
			cbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS0);
			cbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS1);
			break;

		case 1:
			sbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS0);
			cbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS1);
			break;

		case 2:
			cbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS0);
			sbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS1);
			break;

		case 3:
			sbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS0);
			sbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_CS1);
			break;
		
	}

	return;
}
