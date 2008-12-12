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
 *  Revision : $Id: int_show.c,v 1.8 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <avr/io.h>
#include <aversive.h>
#include <diagnostic.h>


#ifdef INTERRUPT_SHOW_PORT

/** this loop is to be used as main program if you have interrupts
  * running and want to see how much time is consumed by the
  * interrupts.  you must then observe the test pin with an
  * oscilloscope, or eventually a multimeter.  as long as there are no
  * interrupts, the test port will toggle at 50% rate. when an
  * interrupt occurs, the port stops to toggle, and remain low. the
  * space before the next impulsion is the int time (always one toggle
  * between ints!)  if you look whith a multimeter, the processor free
  * time is proportinnal to the observed voltage.  0V corresponds to
  * an always busy processor, while if you read Vcc/2 the processor is
  * almost always free. */
void show_int_loop(void)
{
	sbi(DDR(INTERRUPT_SHOW_PORT), INTERRUPT_SHOW_BIT);

	while(1) {
		cbi(INTERRUPT_SHOW_PORT, INTERRUPT_SHOW_BIT); // port to 0
		
		sei();
		nop(); // ints can only arrive there (on low level of probe pin)
		cli();
		
		sbi(INTERRUPT_SHOW_PORT, INTERRUPT_SHOW_BIT); // port to 1
		
		nop(); // is there to equalize the duty cycle
	}
}
#endif
