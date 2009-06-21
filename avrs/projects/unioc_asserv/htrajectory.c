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
  * Simple trajectory management 
  *
  */

#include <aversive/wait.h>
#include <aversive/error.h>
#include <scheduler.h>
#include <quadramp.h>
#include <math.h>

#include "htrajectory.h"



void htrajectory_init(htrajectory_t *htj,
                        robot_cs_t *rcs, 
                        hrobot_position_t *hps,
												struct quadramp_filter* qr_x,
												struct quadramp_filter* qr_y,
												struct quadramp_filter* qr_a)
{
  htj->rcs = rcs;
  htj->hps = hps;
	htj->qr_x = qr_x;
	htj->qr_y = qr_y;
	htj->qr_a = qr_a;

  htj->mind = 1.0;
  htj->mina = 1.0;

	htj->event = 0;

	htj->in_position = 1;
}

void htrajectory_set_xy_speed(htrajectory_t *htj, double v, double a)
{
  quadramp_set_1st_order_vars(htj->qr_x, v, v);
  quadramp_set_2nd_order_vars(htj->qr_x, a, a);
  quadramp_set_1st_order_vars(htj->qr_y, v, v);
  quadramp_set_2nd_order_vars(htj->qr_y, a, a);
}

void htrajectory_set_a_speed(htrajectory_t *htj, double v, double a)
{
  quadramp_set_1st_order_vars(htj->qr_a, v, v);
  quadramp_set_2nd_order_vars(htj->qr_a, a, a);
}

void htrajectory_set_precision(htrajectory_t *htj, double d, double a)
{
  htj->mind = d;
  htj->mina = a;
}

void htrajectory_goto_xya(htrajectory_t *htj, double x, double y, double a)
{
  // save target position
  htj->tx = x;
  htj->ty = y;
  htj->ta = a;

	htj->in_position = 0;

	// start a scheduler task
	htj->event =
		scheduler_add_periodical_event_priority(&htrajectory_manage_xya, htj,
																							HTRAJECTORY_DT,110);

	DEBUG(0,"trajectory task %d : goto XYA (%2.1f,%2.1f,%2.2f)",htj->event,x,y,a);
}


void htrajectory_gotor_xya(htrajectory_t *htj, double x, double y, double a)
{
  hrobot_vector_t vector;

  hposition_get(htj->hps, &vector);
  htrajectory_goto_xya(htj, x + vector.x, y + vector.y, a + vector.alpha );
}

void htrajectory_goto_xya_wait(htrajectory_t *htj, double x, double y, double a)
{
  htrajectory_goto_xya(htj,x,y,a);
	
  while(!htrajectory_done(htj));
}

void htrajectory_gotor_xya_wait(htrajectory_t *htj, double x, double y, double a)
{
  htrajectory_gotor_xya(htj,x,y,a);

  while(!htrajectory_done(htj));
}

void htrajectory_manage_xya(void *dummy)
{
	htrajectory_t *htj = (htrajectory_t*)dummy;

	if(!htj)
		ERROR(HTRAJECTORY_ERROR,"%s received a null pointer",__func__);
	
	// set consign to high level cs
  robot_cs_set_consigns(htj->rcs, (htj->tx)*RCS_MM_TO_CSUNIT,
                                  (htj->ty)*RCS_MM_TO_CSUNIT,
                                  (htj->ta)*RCS_RAD_TO_CSUNIT);

	if(htrajectory_in_position(htj))
	{
		DEBUG(0,"trajectory task %d : in position",htj->event);

		scheduler_del_event(htj->event);
		htj->in_position = 1;
	}
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

uint8_t htrajectory_done(htrajectory_t *htj)
{
	return htj->in_position;
}
