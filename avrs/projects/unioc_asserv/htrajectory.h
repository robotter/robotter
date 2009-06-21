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

/** \file htrajectory.h
  * \author JD
  *
  * Manage simple trajectory management 
  *
  */

#ifndef HTRAJECTORY_H
#define HTRAJECTORY_H

#include "robot_cs.h"
#include <hposition_manager.h>

#define HTRAJECTORY_ERROR 0x50

#define HTRAJECTORY_DT 200

typedef struct
{
  robot_cs_t *rcs;
  hrobot_position_t *hps;

  double mind;
  double mina;

  double tx,ty,ta;

	uint8_t event;

	volatile uint8_t in_position;

	struct quadramp_filter *qr_x;
	struct quadramp_filter *qr_y;
	struct quadramp_filter *qr_a;

}htrajectory_t;

void htrajectory_init(htrajectory_t *htj,
                        robot_cs_t *rcs,
                        hrobot_position_t *hps,
												struct quadramp_filter* qr_x,
												struct quadramp_filter* qr_y,
												struct quadramp_filter* qr_a);

void htrajectory_set_xy_speed(htrajectory_t *htj, double v, double a);

void htrajectory_set_a_speed(htrajectory_t *htj, double v, double a);

void htrajectory_set_precision(htrajectory_t *htj, double d, double a);

void htrajectory_manage_xya(void *dummy);

void htrajectory_goto_xya(htrajectory_t *htj, double x, double y, double a);
void htrajectory_gotor_xya(htrajectory_t *htj, double x, double y, double a);

void htrajectory_goto_xya_wait(htrajectory_t *htj, double x, double y, double a);
void htrajectory_gotor_xya_wait(htrajectory_t *htj, double x, double y, double a);

uint8_t htrajectory_in_position(htrajectory_t *htj);

uint8_t htrajectory_done(htrajectory_t *htj);

#endif/*HTRAJECTORY_H*/
