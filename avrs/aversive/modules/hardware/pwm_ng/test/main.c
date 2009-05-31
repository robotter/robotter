/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2009)
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
 *  Revision : $Id: main.c,v 1.2 2009-03-15 21:51:19 zer0 Exp $
 *
 */

#include <pwm_ng.h>

/* this program tests pwm output */

int main(void)
{
	struct pwm_ng pwm;

	pwm_ng_timer_16bits_init(1, TIMER_16_MODE_PWM_10, 
				 TIMER1_PRESCALER_DIV_256);
	
	pwm_ng_init(&pwm, 16, 10, PWM_NG_MODE_SIGNED,
		    &OCR1A, COM1A0, &TCCR1A, &PORTD, 3, &PORTE, 0);

	pwm_ng_set(&pwm, 100);

	while(1);
	return 0;
}


