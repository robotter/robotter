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
 *  Revision : $Id: test_stack_size.c,v 1.4 2007-05-24 13:08:47 zer0 Exp $
 *
 */

#include <avr/io.h>
#include <aversive.h>


#include <uart.h>
#include <aversive/wait.h>
#include <stdio.h>

#include <diagnostic.h>



// this functions calls itself and consumes stack every time
// the stack space indication should decrement every time
// when the stack is all consumed, the processor can do crazy things.
// most time it will reset
void recursive_call(void)
{
  volatile int stack_size; // volatile necessary to put variable on stack

  // printing the stacck space
  stack_size = min_stack_space_available();
  printf("stack size : %i\n", stack_size);
  
  
  wait_ms(50);
  
  // consuming stack space
  recursive_call();
}



int test_stack_size(void)
{

  // uart stuff
  uart_init();  
  sei();
  fdevopen(uart0_dev_send,NULL);

  // bonjour
  printf("\n\nhello, I just reset !\nperhaps a lack of stack space\n");

  // the beginning of the loop
  recursive_call();

  return 0;
}
