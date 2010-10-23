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

/** @file adns9500_spi_registers.h
  * @author JD
  *
  * ADNS9500 SPI registers
  */

#ifndef ADNS9500_SPI_REGISTERS_H
#define ADNS9500_SPI_REGISTERS_H

// Registers address

#define ADNS9500_SPIREGISTER_PRODUCTID        0x00
#define ADNS9500_SPIREGISTER_MOTION           0x02
#define ADNS9500_SPIREGISTER_DELTAXL          0x03
#define ADNS9500_SPIREGISTER_DELTAXH          0x04
#define ADNS9500_SPIREGISTER_DELTAYL          0x05
#define ADNS9500_SPIREGISTER_DELTAYH          0x06
#define ADNS9500_SPIREGISTER_SQUAL            0x07
#define ADNS9500_SPIREGISTER_CONFIGURATION    0x0A
#define ADNS9500_SPIREGISTER_SROMENABLE       0x13
#define ADNS9500_SPIREGISTER_LASERCTRL0       0x20
#define ADNS9500_SPIREGISTER_OBSERVATION      0x24
#define ADNS9500_SPIREGISTER_DOUTLOW          0x25
#define ADNS9500_SPIREGISTER_DOUTHI           0x26
#define ADNS9500_SPIREGISTER_SROMID           0x2A
//#define ADNS9500_SPIREGISTER_LPCFG0           0x2C
//#define ADNS9500_SPIREGISTER_LPCFG1           0x2D
#define ADNS9500_SPIREGISTER_CONFIGURATION1   0x0F
//#define ADNS9500_SPIREGISTER_CONFIGURATION2    0x10
#define ADNS9500_SPIREGISTER_CONFIGURATION4   0x39
#define ADNS9500_SPIREGISTER_CONFIGURATION5   0x2F
#define ADNS9500_SPIREGISTER_POWERUPRESET     0x3A
#define ADNS9500_SPIREGISTER_INVPRODUCTID     0x3F
#define ADNS9500_SPIREGISTER_SROMLOAD         0x62

// Registers values

#define ADNS9500_CONFIGURATION4_LOAD1   0x02
#define ADNS9500_SROMENABLE_LOAD1       0x1D
#define ADNS9500_SROMENABLE_LOAD2       0x18
#define ADNS9500_SROMENABLE_CRC         0x15
#define ADNS9500_POWERUPRESET_RESET     0x5A


// Registers bits

#define ADNS9500_MOTION_BIT_LPVALID 5
#define ADNS9500_MOTION_BIT_FAULT   1

#define ADNS9500_CONFIGURATION_BIT_SHUTTER 6
#define ADNS9500_CONFIGURATION_BIT_RES1    4
#define ADNS9500_CONFIGURATION_BIT_RES0    2
#define ADNS9500_CONFIGURATION_BIT_ONE     3

#define ADNS9500_CONFIGURATION2_BIT_FORCEDISABLE 1
#define ADNS9500_CONFIGURATION2_BIT_ONE 2

#define ADNS9500_OBSERVATION_BIT_OB7 7
#define ADNS9500_OBSERVATION_BIT_OB5 5

#endif/*_ADNS9500_SPI_REGISTERS_H_*/
