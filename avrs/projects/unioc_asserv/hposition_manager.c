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
  * Manages holonomic robot encoders to compute robot position
  *
  */

#include <aversive.h>
#include <aversive/error.h>
#include <stdlib.h>
#include <math.h>
#include <adns6010.h>
#include "acfilter.h"
#include "compass.h"
#include "settings.h"
#include "motor_encoders.h"

#include "hposition_manager.h"
#include "hposition_manager_config.h"

// compass 
extern compass_t compass;

// ADNS/compass filter
extern acfilter_t acfilter;

// ADNS encoders
adns6010_encoders_t adns6010;

void hposition_init( hrobot_position_t* hpos )
{
  uint8_t flags;
  int i;

  IRQ_LOCK(flags);
  hpos->position.x = 0.0; 
  hpos->position.y = 0.0; 
  hpos->position.alpha = 0.0; 
  IRQ_UNLOCK(flags);

  for(i=0;i<6;i++)
    hpos->pAdnsVectors[i] = 0;

  hpos->firstUpdate = 1;

  hpos->adns_alpha = 0.0;

  return;
}

void hposition_set( hrobot_position_t* hpos, double x, double y, double alpha)
{
  uint8_t flags;
  double nadnsalpha;

  // compute a new adns alpha value

  nadnsalpha = hpos->adns_alpha + (alpha - hpos->position.alpha);


  IRQ_LOCK(flags);
  hpos->position.x = x;
  hpos->position.y = y;
  hpos->position.alpha = alpha;
  hpos->adns_alpha = nadnsalpha;
  IRQ_UNLOCK(flags);

  return;
}

void hposition_get_xy( hrobot_position_t *hpos, vect_xy_t *pv )
{
  uint8_t flags;

  IRQ_LOCK(flags);
  pv->x = hpos->position.x;
  pv->y = hpos->position.y;
  IRQ_UNLOCK(flags);
}

void hposition_get_a( hrobot_position_t *hpos, double *pa )
{
  uint8_t flags;

  IRQ_LOCK(flags);
  *pa = hpos->position.alpha;
  IRQ_UNLOCK(flags);
}

void hposition_get( hrobot_position_t *hpos, hrobot_vector_t *hvec)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  *hvec = hpos->position;
  IRQ_UNLOCK(flags);

  return;
}

void hposition_update(void *dummy)
{
  uint8_t flags;
  int i,k;
  int32_t v;
  double dp[3];
  double dpm[3];
  double *s_dp;
  hrobot_vector_t vec;
  double _ca,_sa;
	double compass_a;
  motor_encoders_t motors;

  hrobot_position_t* hpos  = dummy;

  //------------------------
  // access ADNS6010 values
  adns6010_encoders_get_value(&adns6010);

  // access motor encoders values
  motor_encoders_get_value(&motors);

  // override warning if ADNS boot was previously skipped
  #ifndef SETTING_OVERRIDE_ADNSBOOT 
  // FAULT register is set
  if( adns6010.fault )
    WARNING(HROBOT_ERROR, "ADNS6010 FAULT register is set : fault=0x%X",
                            adns6010.fault);
  #endif

  // first time update => update vector, quit
  if( hpos->firstUpdate )
  {
    for(i=0;i<6;i++)
      hpos->pAdnsVectors[i] = adns6010.vectors[i];

    for(i=0;i<3;i++)
      hpos->pMotorVectors[i] = motors.vectors[i];

    hpos->firstUpdate = 0;
    return;
  }

  //----------------------------------------------------------
  // Transform speed in ADNS coordinates to robot coordinates

  for(k=0;k<3;k++)
    dp[k] = 0.0;

  for(k=0;k<3;k++)
    dpm[k] = 0.0;

  // for each ADNS coordinate (vx1,vy1,vx2,vy2,vx3,vy3) 
  for(i=0;i<6;i++)
  {
    // compute speed in ADNS coordinates
    v = hpos->pAdnsVectors[i] - adns6010.vectors[i];
    // update previous ADNS vectors
    hpos->pAdnsVectors[i] = adns6010.vectors[i];

    // for each robot coordinate (x,y,a) compute a dx of mouvement
    for(k=0;k<3;k++)
      dp[k] += hrobot_adnsMatrix[k][i]*v;
  }

  // for each motor encoder coordinate (vm1,vm2,vm3)
  for(i=0;i<3;i++)
  {
    // compute speed in motor coordinates
    v = hpos->pMotorVectors[i] - motors.vectors[i];
    // update previous motor vectors
    hpos->pMotorVectors[i] = motors.vectors[i];
    
    for(k=0;k<3;k++)
      dpm[k] += hrobot_motorEncodersMatrix[k][i]*v;
  }

  // convert d(movement) from (2^14mm) to (mm)
  for(k=0;k<3;k++)
    dp[k] = dp[k]/(double)(1<<HPOSITION_MANAGER_MATRIX_UNITPOW);
  
  // convert d(movement) from (2^14mm) to (mm)
  for(k=0;k<3;k++)
    dpm[k] = dpm[k]/(double)(1<<HPOSITION_MANAGER_MATRIX_UNITPOW);

	// apply ADNS/Compass filtering
	compass_a = compass_get_heading_rad(&compass);
	
	// compute filtered alpha
	vec.alpha = hpos->adns_alpha;//acfilter_do(&acfilter, hpos->adns_alpha, compass_a);

  #ifdef SETTING_ENCODERS_ADNS
    s_dp = dp;
  #else
    s_dp = dpm;
  #endif

	// update ADNS angular position
	hpos->adns_alpha += s_dp[HROBOT_DA];

	// transform ADNS position to table  
  _ca = cos(vec.alpha);
  _sa = sin(vec.alpha);
 
  //--------------------------------------------------
  // Integrate speed in robot coordinates to position

  vec.x = hpos->position.x + s_dp[HROBOT_DX]*_ca - s_dp[HROBOT_DY]*_sa;
  vec.y = hpos->position.y + s_dp[HROBOT_DX]*_sa + s_dp[HROBOT_DY]*_ca;

  //------------------------------------
  // Latch computed values to accessors
  IRQ_LOCK(flags);

  hpos->position = vec;
  
  IRQ_UNLOCK(flags);

  return;
}
