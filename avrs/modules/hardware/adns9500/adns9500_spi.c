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

/** @file adns9500_spi.c
  * @author JD
  *
  * Functions controlling FPGA driven SPI to ADNS
  */

#include <aversive.h>
#include <stdint.h>

#include "adns9500_spi.h"
#include "adns9500_fpga.h"


void adns9500_spi_init()
{
  adns9500_spi_cs(0);
  return;
}


uint8_t adns9500_spi_sendrecv(uint8_t send)
{
  uint8_t flags;
  uint8_t recv;

  IRQ_LOCK(flags);

  while( bit_is_set(ADNS9500_SPI_CTRL,ADNS9500_SPICTRL_BIT_BUSY) );

  // Drive senddata low to initiate SPI communication
  cbi(ADNS9500_SPI_CTRL, ADNS9500_SPICTRL_BIT_SENDDATA);

  // Load byte on SPI data register
  ADNS9500_SPI_DATA = send;

  // Drive senddata high to send byte
  sbi(ADNS9500_SPI_CTRL, ADNS9500_SPICTRL_BIT_SENDDATA);

  while( !bit_is_set(ADNS9500_SPI_CTRL,ADNS9500_SPICTRL_BIT_BUSY) );

  // Drive senddata low to initiate SPI communication
  cbi(ADNS9500_SPI_CTRL, ADNS9500_SPICTRL_BIT_SENDDATA);

  while( bit_is_set(ADNS9500_SPI_CTRL,ADNS9500_SPICTRL_BIT_BUSY) );

  // Read received data
  recv = ADNS9500_SPI_DATA;

  IRQ_UNLOCK(flags);

  return recv;
}


void adns9500_spi_send(uint8_t byte)
{
  adns9500_spi_sendrecv(byte);
  return;
}


uint8_t adns9500_spi_recv()
{
  uint8_t byte;
  byte = adns9500_spi_sendrecv(0x00);
  return byte;
}


void adns9500_spi_cs(uint8_t cs)
{
  uint8_t byte;

  byte = ADNS9500_SPI_CTRL;

  switch(cs)
  {
    case 0:
      // No ADNS selected
      cbi(byte,ADNS9500_SPICTRL_BIT_CS0);
      cbi(byte,ADNS9500_SPICTRL_BIT_CS1);
      break;

    case 1:
      // ADNS#1
      sbi(byte,ADNS9500_SPICTRL_BIT_CS0);
      cbi(byte,ADNS9500_SPICTRL_BIT_CS1);
      break;

    case 2:
      // ADNS#2
      cbi(byte,ADNS9500_SPICTRL_BIT_CS0);
      sbi(byte,ADNS9500_SPICTRL_BIT_CS1);
      break;

    case 3:
      // ADNS#3
      sbi(byte,ADNS9500_SPICTRL_BIT_CS0);
      sbi(byte,ADNS9500_SPICTRL_BIT_CS1);
      break;

    default:
      break;
  }

  ADNS9500_SPI_CTRL = byte;

  return;
}
