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

/** @file adns9500_fpga.h
  * @author JD
  *
  * UNIOC NG FPGA registers on Wishbone internal bus
  */

#ifndef _ADNS9500_FPGA_H_
#define _ADNS9500_FPGA_H_


// Addresses on wishbone

#define ADNS9500_BASE (0x1300)

#define ADNS9500_ID       (_SFR_MEM8(ADNS9500_BASE  + 0))

#define ADNS9500_LOCK     (_SFR_MEM8(ADNS9500_BASE  + 1))

#define ADNS9500_1_DELTAX (_SFR_MEM32(ADNS9500_BASE + 2))
#define ADNS9500_1_DELTAY (_SFR_MEM32(ADNS9500_BASE + 6))
#define ADNS9500_1_SQUAL  (_SFR_MEM8(ADNS9500_BASE  + 10))

#define ADNS9500_2_DELTAX (_SFR_MEM32(ADNS9500_BASE + 11))
#define ADNS9500_2_DELTAY (_SFR_MEM32(ADNS9500_BASE + 15))
#define ADNS9500_2_SQUAL  (_SFR_MEM8(ADNS9500_BASE  + 19))

#define ADNS9500_3_DELTAX (_SFR_MEM32(ADNS9500_BASE + 20))
#define ADNS9500_3_DELTAY (_SFR_MEM32(ADNS9500_BASE + 24))
#define ADNS9500_3_SQUAL  (_SFR_MEM8(ADNS9500_BASE  + 28))

#define ADNS9500_FAULT    (_SFR_MEM8(ADNS9500_BASE  + 29))
#define ADNS9500_ENABLE   (_SFR_MEM8(ADNS9500_BASE  + 30))

#define ADNS9500_SPI_DATA (_SFR_MEM8(ADNS9500_BASE  + 31))
#define ADNS9500_SPI_CTRL (_SFR_MEM8(ADNS9500_BASE  + 32))

// Bit masks in registers

#define ADNS9500_SPICTRL_BIT_RESET    7
#define ADNS9500_SPICTRL_BIT_BUSY     3
#define ADNS9500_SPICTRL_BIT_SENDDATA 2
#define ADNS9500_SPICTRL_BIT_CS1      1 
#define ADNS9500_SPICTRL_BIT_CS0      0

#define ADNS9500_LOCK_ADNS1 0
#define ADNS9500_LOCK_ADNS2 1
#define ADNS9500_LOCK_ADNS3 2

// Specific values for registers

#define ADNS9500_LOCK_NONE 0x00
#define ADNS9500_LOCK_ALL  0xFF

#endif/*_ADNS9500_FPGA_H_*/
