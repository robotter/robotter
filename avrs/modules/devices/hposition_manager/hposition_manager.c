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
  * Manages holonomic robot encoders to calculate robot position
  *
  */

#include <aversive.h>
#include <stdlib.h>
#include <math.h>
#include <adns6010.h>

#include <hposition_manager.h>
#include "hposition_manager_config.h"

void hposition_init( hrobot_position_t* hpos )
{
  uint8_t flags;
  int i;

  if(hpos == NULL)
    return;

  IRQ_LOCK(flags);
  hpos->position.x = 0.0; 
  hpos->position.y = 0.0; 
  hpos->position.alpha = 0.0; 
  IRQ_UNLOCK(flags);

  for(i=0;i<6;i++)
    hpos->pAdnsVectors[i] = 0;

  hpos->firstUpdate = 1;

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

void hposition_update(void *dummy)
{
  uint8_t flags;
  int i,k;
  int32_t v[6];
  double dp[3],alpha,x,y;

  hrobot_position_t* hpos  = dummy;

  adns6010_encoders_t adns6010;

  if(hpos == NULL)
    return;

  //------------------------
  // Access ADNS6010 values
  adns6010_encoders_get_value(&adns6010);
 
  // first time update => update vector, quit
  if( hpos->firstUpdate )
  {
    for(i=0;i<6;i++)
      hpos->pAdnsVectors[i] = adns6010.vectors[i];

    hpos->firstUpdate = 0;
    return;
  }

  //----------------------------------------------------------
  // Transform speed in ADNS coordinates to robot coordinates

  // compute speed in ADNS coordinates
  for(i=0;i<6;i++)
    v[i] = hpos->pAdnsVectors[i] - adns6010.vectors[i];

  // update previous ADNS vectors
  for(i=0;i<6;i++)
    hpos->pAdnsVectors[i] = adns6010.vectors[i];

  // for each robot coordinate (x,y,a) compute a dx of mouvement
  for(k=0;k<3;k++)
  {
    dp[k] = 0.0;
    
    // for each ADNS coordinate (vx1,vy1,vx2,vy2,vx3,vy3) 
    for(i=0;i<6;i++)
    {
      dp[k] += hrobot_adnsMatrix[k][i]*v[i];
    }
  }

  //--------------------------------------------------
  // Integrate speed in robot coordinates to position
  
  alpha = hpos->position.alpha;

  x = hpos->position.x + dp[HROBOT_DX]*cos(alpha) - dp[HROBOT_DY]*sin(alpha);
  y = hpos->position.y + dp[HROBOT_DX]*sin(alpha) + dp[HROBOT_DY]*cos(alpha);

  alpha += dp[HROBOT_DA];

  //------------------------------------
  // Latch computed values to accessors
  IRQ_LOCK(flags);
  hpos->position.x = x;
  hpos->position.y = y;
  hpos->position.alpha = alpha;
  IRQ_UNLOCK(flags);

  return;
}
