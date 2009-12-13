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

#define HTRAJECTORY_ROBOT_LENGTH 300.0

typedef struct
{
  robot_cs_t *rcs;
  hrobot_position_t *hps;

  double mind;
  double mina;
  
  double realignspeed;

  double tx,ty,ta;

	uint8_t event;

	volatile uint8_t in_position;

	struct quadramp_filter *qr_x;
	struct quadramp_filter *qr_y;
	struct quadramp_filter *qr_a;

}htrajectory_t;

/**@brief Realignement vector */
typedef enum 
{
  RV_XPLUS = 0,
  RV_XMINUS,
  RV_YPLUS,
  RV_YMINUS
}realignvector_t;

/**@brief Initialize trajectory management 
  *@param rcs reference to robot_cs_t structure
  *@param hps reference to hrobot_position_t structure
  *@param qr_x reference to /x CS quadramp filter
  *@param qr_y reference to /y CS quadramp filter
  *@param qr_angle reference to /angle CS quadramp filter
  */
void htrajectory_init(htrajectory_t *htj,
                        robot_cs_t *rcs,
                        hrobot_position_t *hps,
												struct quadramp_filter* qr_x,
												struct quadramp_filter* qr_y,
												struct quadramp_filter* qr_a);

/**@brief Set XY robot speeds 
  *@param v maximum speed
  *@param a maximum acceleration
  */
void htrajectory_set_xy_speed(htrajectory_t *htj, double v, double a);

/**@brief Set angle robot speed
  *@param v maximum speed
  *@param a maximum acceleration
  */
void htrajectory_set_a_speed(htrajectory_t *htj, double v, double a);

/**@brief Set realignement speed
  *@param v realignement speed
  */
void htrajectory_set_realign_speed(htrajectory_t *htj, double v);

/**@brief Set position precision
  *@param d minimum distance to target in mm
  *@param a minimum angle to angle target in rads
  */
void htrajectory_set_precision(htrajectory_t *htj, double d, double a);

/**@brief Scheduler event managing trajectory*/
void htrajectory_manage_xya(void *dummy);

/**@brief Goto (x,y,a) in robot space, return immediatly*/
void htrajectory_goto_xya(htrajectory_t *htj, double x, double y, double a);

/**@brief Goto (x,y,a) relatively to current position in robot space, return immediatly */
void htrajectory_gotor_xya(htrajectory_t *htj, double x, double y, double a);

/**@brief Goto (x,y,a) in robot space, return when target is reached */
void htrajectory_goto_xya_wait(htrajectory_t *htj, double x, double y, double a);

/**@brief Goto (x,y,a) relatively to current position in robot space, return when target is reached */
void htrajectory_gotor_xya_wait(htrajectory_t *htj, double x, double y, double a);

/**@brief Check if target is reached 
  *@return 1 if target reached, 0 otherwise */
uint8_t htrajectory_in_position(htrajectory_t *htj);

/**@brief Check if trajectory done
  *@return 1 if trajectory done, 0 otherwise */
uint8_t htrajectory_done(htrajectory_t *htj);

/**@brief Perform robot realignement 
  *@param realignv robot vector/orientation to perform realignement
  *@param newpos position of the border the robot is realigning on
  */
uint8_t htrajectory_realign(htrajectory_t* htj, realignvector_t realignv, double newpos);

#endif/*HTRAJECTORY_H*/
