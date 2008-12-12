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
 *  Revision : $Id: main.c,v 1.5 2007-05-24 13:08:48 zer0 Exp $
 *
 */

#include <stdio.h>
#include <aversive/pgmspace.h>

#include <aversive.h>
#include <aversive/wait.h>
#include <lcd.h>


#define DELAY 100

int lcd_dev_putc_delay(char c, FILE* f)
{
  lcd_putc(c);
  wait_ms(DELAY);
  return c;
}


int main(void)
{
  FILE * slow;
  uint8_t i;


  wait_ms(100);


  lcd_init(LCD_DISP_ON);


  lcd_putc('j'); // ne doit pas etre visible


  lcd_putc('\f'); // effacement




  lcd_gotoxy(5,0);
  lcd_putc('h'); wait_ms(DELAY);
  lcd_putc('e'); wait_ms(DELAY);
  lcd_putc('l'); wait_ms(DELAY);
  lcd_putc('l'); wait_ms(DELAY);
  lcd_putc('o'); wait_ms(DELAY);

  lcd_putc('\n');


  for(i=0;i<5;i++) lcd_putc(' ');

  lcd_putc('w'); wait_ms(DELAY);
  lcd_putc('o'); wait_ms(DELAY);
  lcd_putc('r'); wait_ms(DELAY);
  lcd_putc('l'); wait_ms(DELAY);
  lcd_putc('d'); wait_ms(DELAY);




  wait_ms(20*DELAY);

  // with printf :)
  fdevopen(lcd_dev_putc,NULL);
 
  lcd_putc('\f'); // effacement
  printf_P(PSTR("big brother"));

  wait_ms(20*DELAY);

  slow = fdevopen(lcd_dev_putc_delay,NULL);

  fprintf_P(slow, PSTR("\fl' AVR c'est top\nl' AVR c'est tof"));

  while(1);
  return 0;
}




