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
 *  Revision : $Id: encoders_spi_config.h,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */
#ifndef _ENCODERS_SPI_CONFIG_H_
#define _ENCODERS_SPI_CONFIG_H_

#define ENCODERS_SPI_NUMBER 4
#define ENCODERS_SPI_SS_PORT SS_PORT
#define ENCODERS_SPI_SS_BIT  SS_BIT

/* see spi configuration */
#define ENCODERS_SPI_CLK_RATE     SPI_CLK_RATE_16
#define ENCODERS_SPI_FORMAT       SPI_FORMAT_3
#define ENCODERS_SPI_DATA_ORDER   SPI_LSB_FIRST

#endif
