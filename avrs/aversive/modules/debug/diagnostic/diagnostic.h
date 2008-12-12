/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2005)
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
 *  Revision : $Id: diagnostic.h,v 1.7 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <diagnostic_config.h>



/** shows the interrupt cycles on an oscilloscope or a multimeter you
 * can then measure the interrupt busy time of your device.  this
 * function is an infinite loop which has to be the main program, and
 * will be interrupted.  a port bit is needed as diagnostic interface
 * with scope or multimeter.  if you use a scope : freezing of the
 * oscillation shows interrupt if you use a multimeter : voltage is
 * proportionnal to idle time
 * 0V     >>      0% idle (always busy)
 * Vcc/2  >>   100%  idle (not interupted)
 * be careful, you perhaps need a low pass filter for your voltmeter */
extern void show_int_loop(void);

/** This functuion allows to monitor the maximal stack space that was
 * used since the last reset (peak value) you can then monitor the
 * available space in your ram returns the minimal value of the free
 * space left */
extern uint16_t min_stack_space_available(void);

