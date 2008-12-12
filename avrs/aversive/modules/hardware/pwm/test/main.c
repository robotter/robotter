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

#include <aversive/parts.h>

#include <aversive/wait.h>
#include <pwm.h>

/* this little program tests a pwm output, with afew parameters. 
 * you can use this test with signed or non signed pwms.
 * the normal output is: off, half, on, half, off... and then the same cycle reversed ...
 */

/* pwm output to test */
#define NUM ((void *)PWM1A_NUM)
/* maximal output */
#define P_MAX 4095
/* delay between tests */
#define DELAY 1000

int main(void)
{
  int16_t signe = 1;
  
  DDRG=0x3;
  PORTG=0x0;

  pwm_init();
  

  while(1)
    {
      pwm_set(NUM, 1 * signe); // not 0 to test for sign problems
      wait_ms(2* DELAY);

      pwm_set(NUM, P_MAX /2 * signe);
      wait_ms(DELAY);
      
      pwm_set(NUM, P_MAX* signe);
      wait_ms(DELAY);
      
      pwm_set(NUM, P_MAX /2 * signe);
      wait_ms(DELAY);

      signe *= -1;
    }

  return 0;
}


