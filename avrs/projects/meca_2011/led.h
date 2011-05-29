/*  
 *  Copyright RobOtter (2010) 
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

/** \file led.h
  * \author JD
  */

#ifndef _LED_H_
#define _LED_H_

#include <aversive.h>

#define LED_ERROR 0x50

/**@brief Initialize LEDs ports */
void led_init(void);

/**@brief Turn LED n ON */
void led_on(uint8_t n);

/**@brief Turn LED n OFF */
void led_off(uint8_t n);

/**@brief Blink LED n*/
void led_toggle(uint8_t n);

#endif/*_LED_H_*/
