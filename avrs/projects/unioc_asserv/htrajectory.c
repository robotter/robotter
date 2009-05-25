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

/** \file htrajectory.c
  * \author JD
  *
  * Manage simple trajectory management 
  *
  */

#include "htrajectory.h"

#include <math.h>


void htrajectory_init(htrajectory_t *htj,
                        robot_cs_t *rcs, 
                        hrobot_position_t *hps)
{
  htj->rcs = rcs;
  htj->hps = hps;
  htj->mind = 1.0;
  htj->mina = 1.0;
}

void htrajectory_set_precision(htrajectory_t *htj, double d, double a)
{
  htj->mind = d;
  htj->mina = a;
}

void htrajectory_goto_xya(htrajectory_t *htj, double x, double y, double a)
{
  double diff_a;
  hrobot_vector_t vector;

  // save target position
  htj->tx = x;
  htj->ty = y;
  htj->ta = a;

  // set consign to high level cs
  robot_cs_set_consigns(htj->rcs, x*RCS_MM_TO_CSUNIT,
                                  y*RCS_MM_TO_CSUNIT,
                                  a*RCS_RAD_TO_CSUNIT);
}

uint8_t htrajectory_in_position(htrajectory_t *htj)
{
  hrobot_vector_t vector;

  // get position in mm, rads
  hposition_get(htj->hps, &vector);

  // in position
  if( (fabs( vector.x - htj->tx ) < htj->mind )
    &&(fabs( vector.y - htj->ty ) < htj->mind )
    &&(fabs( vector.alpha - htj->ta ) < htj->mina ) )
    return 1;
  else
    return 0;
}
