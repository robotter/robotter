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

/** @file adns6010_timing.h
  * @author JD
	* @note All timings shall be specified in microseconds (us)
  *
  * ADNS6010 SPI timings
  */

#ifndef _ADNS6010_TIMINGS_H_
#define _ADNS6010_TIMINGS_H_


//@ Internal CRC computation time
#define ADNS6010_TIMINGS_CRC_DELAY 8000

//@ Frame maximum period
#define ADNS6010_TIMINGS_FRAME_PERIOD 150

//@ RESET pulse width
#define ADNS6010_TIMINGS_PWRESET 10

//@ SPI read - address delay
#define ADNS6010_TIMINGS_SRAD 50

//@ SPI time between read and subsequent commands
#define ADNS6010_TIMINGS_SRWSRR 1

//@ SPI time between write commands
#define ADNS6010_TIMINGS_SWW 50

//@ SPI time between write and read commands
#define ADNS6010_TIMINGS_SWR 50

//@ ADNS PROM download and frame capture byte-to-byte delay
#define ADNS6010_TIMINGS_LOAD 10
 
//@ Time to drive NCS high in order to exit burst mode
#define ADNS6010_TIMINGS_BEXIT 4

//@ Time from VDD = 3.0V to RESET sampled
#define ADNS6010_TIMINGS_OP 250

//@ Time from RESET falling edge to inputs active
#define ADNS6010_TIMINGS_INRST 550

//@ Time between firmware download end and first access
#define ADNS6010_TIMINGS_FIRMWEND 100


#endif/*_ADNS6010_TIMINGS_H_*/
