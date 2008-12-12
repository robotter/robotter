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
 *  Revision : $Id: main.c,v 1.5 2007-05-24 13:08:47 zer0 Exp $
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <aversive.h>
#include <aversive/wait.h>
#include <uart.h>
#include <scheduler.h>
#include <encoders_microb.h>

int main(void)
{
  uint8_t i=0;
  int32_t e0, e1, e2, e3;
  DDRE=0x0C;

  sbi(PORTE, 2);
  uart_init();
  scheduler_init();
  fdevopen(uart0_dev_send, uart0_dev_recv);
  encoders_microb_init();
  
  sei();

  /* add microb encoders management */
  scheduler_add_periodical_event(encoders_microb_manage, NULL, 1);

  while(1) {
    e0 = encoders_microb_get_value_adjusted((void *)0);
    e1 = encoders_microb_get_value_adjusted((void *)1);
    e2 = encoders_microb_get_value_adjusted((void *)2);
    e3 = encoders_microb_get_value_adjusted((void *)3);

    printf("%.8ld %.8ld %.8ld %.8ld\r\n", e0, e1, e2, e3);

    if (i++ % 2)
      sbi(PORTE, 2);
    else
      cbi(PORTE, 2);
    wait_ms(100);
  }
  
  return 0;
  
}
