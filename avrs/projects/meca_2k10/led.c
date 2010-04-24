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

/** \file led.c
  * \author JD
  */

#include "led.h"

#include "cli.h"
#include "logging.h"
#include "setting.h"

void led_init(void)
{
  // WARNING : LEDs logic is inverted on meca 2k10 board

  // set all LEDs to OFF
  SETTING_LEDS_PORT |= SETTING_LEDS_MASK;

  // set all LEDs pins to output
  SETTING_LEDS_DDR |= SETTING_LEDS_MASK;

  return;
}

void led_on(uint8_t n)
{
  if(n > SETTING_LEDS_N)
    ERROR(LED_ERROR,"LED %d is out of range",n);

  // turn on LED n (write 0 to PORT)
  SETTING_LEDS_PORT &= ~(1<<n);
  return;
}

void led_off(uint8_t n)
{
  if(n > SETTING_LEDS_N)
    ERROR(LED_ERROR,"LED %d is out of range",n);

  // turn off LED n (write 1 to PORT)
  SETTING_LEDS_PORT |= (1<<n);

  return;
}

void led_toggle(uint8_t n)
{
  if(n > SETTING_LEDS_N)
    ERROR(LED_ERROR,"LED %d is out of range",n);
    
  // toggle LED n 
  SETTING_LEDS_PORT ^= (1<<n);

  return;
}

