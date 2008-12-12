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
 *  Revision : $Id: main.c,v 1.9 2007-05-24 13:08:47 zer0 Exp $
 *
 */

#include <avr/io.h>
#include <aversive.h>

extern int test_stack_size(void);
extern int test_int_show(void);




// change this value to test either the stack size utility or the int show one
//volatile uint8_t test_ss = 1; // stack size demo
volatile uint8_t test_ss = 0; // int show demo

int main(void)
{

  if (test_ss)
    test_stack_size();
  else
    test_int_show();


  return 0;
}
