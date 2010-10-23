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

/** @file
 * @author JD
 *
 * Functions controlling FPGA driven SPI to ADNS
 */

#ifndef _ADNS9500_SPI_H_
#define _ADNS9500_SPI_H_

#define ADNS9500_SPI_WRITE 0x80

/** @brief Initialize FPGA/SPI interface
 */
void adns9500_spi_init(void);

/** @brief Perform a SPI send and recv
 * @param send byte to send
 * @return byte received
 */
uint8_t adns9500_spi_sendrecv(uint8_t send);

/** @brief Send a byte on SPI
 * @param byte to send
 */
void adns9500_spi_send(uint8_t byte);


/** @brief Receive a byte from an ADNS by SPI
 * @return received byte
 */
uint8_t adns9500_spi_recv(void);


/** @brief Set chip select for ADNS SPI
 */
void adns9500_spi_cs(uint8_t cs);


#endif/*_ADNS9500_SPI_H_*/
