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

/** \file cord.c
  * \author JD
  */

#include <aversive.h>
#include <aversive/error.h>
#include "cord.h"

#include "settings.h"

void cord_init(void)
{
  // set DDR to input
  cbi(SETTING_CORD_DDR, SETTING_CORD_N);

  // set PORT to '1' (pull-up resistor to VCC)
  sbi(SETTING_CORD_PORT, SETTING_CORD_N);
}

uint8_t cord_isPlugged(void)
{
  uint8_t state;
  static uint8_t pstate = 1;

  // if PIN is not set
  if( bit_is_set(SETTING_CORD_PIN, SETTING_CORD_N) )
    state = 0;
  else 
    state = 1;
  
  if(pstate != state)
    DEBUG(0,"CORD state changed (state=%d)",state);

  pstate = state;

  return state;
}
