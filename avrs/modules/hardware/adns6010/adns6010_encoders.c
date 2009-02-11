/*  
 *  Copyright RobOtter (2009)
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

/** @file adns6010_encoders.c
  * @author JD
  *
  * Manage ADNS6010 system while in automatic mode
  */

#include <aversive.h>
#include <util/delay.h>

#include "adns6010_encoders.h"

void adns6010_encoders_get_value(adns6010_encoders_t* encoders)
{
  // Latch all movement registers
  // (latch is triggered on lock rising edge)
  ADNS6010_LOCK = ADNS6010_LOCK_NONE;
  _delay_us(1);
  ADNS6010_LOCK = ADNS6010_LOCK_ALL;
  _delay_us(1);
  
  // ADNS 1
  encoders->x1 = ADNS6010_1_DELTAX;
  encoders->y1 = ADNS6010_1_DELTAY;
  encoders->squal1 = ADNS6010_1_SQUAL;
 
  // ADNS 2
  encoders->x2 = ADNS6010_2_DELTAX;
  encoders->y2 = ADNS6010_2_DELTAY;
  encoders->squal2 = ADNS6010_2_SQUAL; 

  // ADNS 3
  encoders->x3 = ADNS6010_3_DELTAX;
  encoders->y3 = ADNS6010_3_DELTAY;
  encoders->squal3 = ADNS6010_3_SQUAL;

  // FAULT register
  encoders->fault = ADNS6010_FAULT;

  return;
}
