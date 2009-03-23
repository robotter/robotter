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

/** \file hposition_manager.c
  * \author JD
  *
  * Manage holonomic robot encoders to calculate robot position
  *
  */

#include <aversive.h>
#include <stdlib.h>
#include <adns6010.h>

#include <hposition_manager.h>
#include "hposition_manager_config.h"

void hposition_init( hrobot_position_t* hpos )
{
  uint8_t flags;

  if(hpos == NULL)
    return;

  IRQ_LOCK(flags);
  hpos->position.x = 0.0; 
  hpos->position.y = 0.0; 
  hpos->position.alpha = 0.0; 
  
  IRQ_UNLOCK(flags);

  return;
}

void hposition_set( hrobot_position_t* hpos, double x, double y, double alpha)
{
  uint8_t flags;

  if(hpos == NULL)
    return;

  IRQ_LOCK(flags);
  hpos->position.x = x;
  hpos->position.y = y;
  hpos->position.alpha = alpha;
  IRQ_UNLOCK(flags);

  return;
}

void hposition_get( hrobot_position_t* hpos, hrobot_vector_t* hvec)
{
  uint8_t flags;

  if( (hpos == NULL) || (hvec == NULL) )
    return;

  IRQ_LOCK(flags);
  hvec->x = hpos->position.x;
  hvec->y = hpos->position.y;
  hvec->alpha = hpos->position.alpha;
  IRQ_UNLOCK(flags);

  return;
}

void hposition_update( hrobot_position_t* hpos )
{
  uint8_t flags;
  adns6010_encoders_t adns6010;

  if(hpos == NULL)
    return;

  // Access ADNS6010 values
  adns6010_encoders_get_value(&adns6010);
  
  // TODO

  IRQ_LOCK(flags);
  // TODO
  IRQ_UNLOCK(flags);

  return;
}
