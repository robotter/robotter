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

  htj->realignspeed = 2000;

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

void htrajectory_set_realign_speed(htrajectory_t *htj, double v)
{
  htj->realignspeed = v;
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

	// set consign to high level cs
  robot_cs_set_consigns(htj->rcs, (htj->tx)*RCS_MM_TO_CSUNIT,
                                  (htj->ty)*RCS_MM_TO_CSUNIT,
                                  (htj->ta)*RCS_RAD_TO_CSUNIT);

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

uint8_t htrajectory_realign(htrajectory_t *htj,
                              realignvector_t realignv, double newpos)
{ 
  double newangle;
  double reavx,reavy;
  hrobot_vector_t robv;

  // perform robot realignement
  NOTICE(0,"performing robot realignement vector %d, new position %f",
              realignv,newpos);

  // get position in mm, rads
  hposition_get(htj->hps, &robv);

  // compute angle to face to realign
  switch(realignv)
  {
    case RV_XPLUS:
      newangle = +M_PI/6.0;
      reavx = -(htj->realignspeed)*cos(M_PI/6.0);
      reavy = (htj->realignspeed)*sin(M_PI/6.0);
      break;

    case RV_XMINUS:
      newangle = -M_PI/6.0;
      reavx = (htj->realignspeed)*cos(M_PI/6.0);
      reavy = (htj->realignspeed)*sin(M_PI/6.0);
      break;

    case RV_YPLUS:
      newangle = 0;
      reavx = 0;
      reavy = -(htj->realignspeed);
      break;

    case RV_YMINUS:
      newangle = +M_PI/3.0;
      reavx = (htj->realignspeed)*cos(M_PI/6.0);
      reavy = (htj->realignspeed)*sin(M_PI/6.0);
      break;

    default: 
      ERROR(HTRAJECTORY_ERROR,"realign vector wrong value realignv=%d",
                    realignv); 
      break;
  }

  htrajectory_goto_xya_wait(htj, robv.x, robv.y, newangle);
  
  robot_cs_activate(htj->rcs, 0);
  DEBUG(0,"upper CSs deactivated.");

  hrobot_set_motors(htj->rcs->hrs, reavx, reavy, 0);
  
  uint8_t firsttime = 1;
  uint8_t ipcount=0;
  double ds;
  hrobot_vector_t probv;

  while(1)
  {
    hposition_get(htj->hps, &robv);
    
    if(firsttime)
      firsttime = 0;
    else
    { 
      //  compute distance squared between now and previous position
      ds = pow(probv.x - robv.x,2) + pow(probv.y - robv.y,2);

      if(ds < 0.1)
        ipcount++;

      // blocked, in position
      if(ipcount >=  2)
        break;  
    }

    probv = robv;
    wait_ms(100);
  }
  
  // set new position
  hposition_get(htj->hps, &robv);

  switch(realignv)
  {
    case RV_XPLUS:  hposition_set(htj->hps, newpos+(HTRAJECTORY_ROBOT_LENGTH/3.0), robv.y, newangle); break;
    case RV_XMINUS: hposition_set(htj->hps, newpos-(HTRAJECTORY_ROBOT_LENGTH/3.0), robv.y, newangle); break;
    case RV_YPLUS:  hposition_set(htj->hps, robv.x, newpos+(HTRAJECTORY_ROBOT_LENGTH/3.0), newangle); break;
    case RV_YMINUS: hposition_set(htj->hps, robv.x, newpos-(HTRAJECTORY_ROBOT_LENGTH/3.0), newangle); break;
    default:
      ERROR(HTRAJECTORY_ERROR,"realign vector wrong value realignv=%d",
                    realignv);
      break;
  }
  
  // DEBUG
  hposition_get(htj->hps, &robv);
  DEBUG(0,"new position is (%f,%f,%f)",robv.x,robv.y,robv.alpha);

  hrobot_set_motors(htj->rcs->hrs, 0, 0, 0);
  
  // magic trick to reinitialize CSs
  htrajectory_goto_xya(htj, robv.x, robv.y, robv.alpha);

  // reactivate rock'n'roll
  robot_cs_activate(htj->rcs, 1);

  DEBUG(0,"upper CSs reactivated.");
  
  while(!htrajectory_done(htj));

  // move away from wall
  switch(realignv)
  {
    case RV_XPLUS:  htrajectory_gotor_xya(htj, +70, 0, 0); break;
    case RV_XMINUS: htrajectory_gotor_xya(htj, -70, 0, 0); break;
    case RV_YPLUS:  htrajectory_gotor_xya(htj, 0, +70, 0); break;
    case RV_YMINUS: htrajectory_gotor_xya(htj, 0, -70, 0); break;
    default:
      ERROR(HTRAJECTORY_ERROR,"realign vector wrong value realignv=%d",
                    realignv);
      break;
  }


  while(!htrajectory_done(htj));

  NOTICE(0,"realignement done");

  return 1;
}


