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
 * @brief ADNS9500 SPI timings
 * @note All timings must be specified in microseconds (us)
 */

#ifndef ADNS9500_TIMINGS_H
#define ADNS9500_TIMINGS_H


/// Internal CRC computation time
#define ADNS9500_TIMINGS_CRC_DELAY 10000

/// Frame maximum period
#define ADNS9500_TIMINGS_FRAME_PERIOD 150

/// RESET pulse width
#define ADNS9500_TIMINGS_PWRESET 10

/// Delay after RESET command
#define ADNS9500_TIMINGS_SPICMDRESET 50000

/// SPI read - address delay
#define ADNS9500_TIMINGS_SRAD 50

/// SPI time between read and subsequent commands
#define ADNS9500_TIMINGS_SRWSRR 1

/// SPI time between write commands
#define ADNS9500_TIMINGS_SWW 120

/// SPI time between write and read commands
#define ADNS9500_TIMINGS_SWR 50

/// SPI, NCS to SCLK active/inactive
#define ADNS9500_TIMINGS_NCS_SCLK 1

/// ADNS PROM download and frame capture byte-to-byte delay
#define ADNS9500_TIMINGS_LOAD 15

/// Time to drive NCS high in order to exit burst mode
#define ADNS9500_TIMINGS_BEXIT 1

/// Time from VDD = 3.0V to RESET sampled
#define ADNS9500_TIMINGS_OP 250

/// Time from RESET falling edge to inputs active
#define ADNS9500_TIMINGS_INRST 550

/// Time between firmware download end and first access
#define ADNS9500_TIMINGS_FIRMWEND 160


#endif/*ADNS9500_TIMINGS_H*/
