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

/** @file adns6010_spi_registers.h
  * @author JD
  *
  * ADNS6010 SPI registers
  */

#ifndef _ADNS6010_SPI_REGISTERS_H_
#define _ADNS6010_SPI_REGISTERS_H_

// Registers address

#define ADNS6010_SPIREGISTER_PRODUCTID      0x00
#define ADNS6010_SPIREGISTER_MOTION         0x02
#define ADNS6010_SPIREGISTER_CONFIGURATION  0x0A
#define ADNS6010_SPIREGISTER_DOUTLOW        0x0C
#define ADNS6010_SPIREGISTER_DOUTHI         0x0D
#define ADNS6010_SPIREGISTER_SROMENABLE     0x14
#define ADNS6010_SPIREGISTER_CONFIGURATION2 0x16
#define ADNS6010_SPIREGISTER_SROMID         0x1F
#define ADNS6010_SPIREGISTER_LPCFG0         0x2C
#define ADNS6010_SPIREGISTER_LPCFG1         0x2D
#define ADNS6010_SPIREGISTER_OBSERVATION    0x3D
#define ADNS6010_SPIREGISTER_INVPRODUCTID   0x3F
#define ADNS6010_SPIREGISTER_SROMLOAD       0x60

// Registers values

#define ADNS6010_SROMENABLE_LOAD1 0x1D
#define ADNS6010_SROMENABLE_LOAD2 0x18
#define ADNS6010_SROMENABLE_CRC   0xA1

// Registers bits

#define ADNS6010_MOTION_BIT_LPVALID 5
#define ADNS6010_MOTION_BIT_FAULT   1

#define ADNS6010_CONFIGURATION_BIT_SHUTTER 6
#define ADNS6010_CONFIGURATION_BIT_RES1    4
#define ADNS6010_CONFIGURATION_BIT_RES0    2
#define ADNS6010_CONFIGURATION_BIT_ONE     3

#define ADNS6010_CONFIGURATION2_BIT_FORCEDISABLE 1
#define ADNS6010_CONFIGURATION2_BIT_ONE 2

#define ADNS6010_OBSERVATION_BIT_OB7 7
#define ADNS6010_OBSERVATION_BIT_OB5 5

#endif/*_ADNS6010_SPI_REGISTERS_H_*/
