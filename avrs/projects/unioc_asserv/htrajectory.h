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

/** \file htrajectory.h
 * \date 02/01/2010 
 * \author JD
 *
 * Trajectory management NG
 *
 */

#ifndef HTRAJECTORY_H
#define HTRAJECTORY_H

#include <aversive.h>
#include <quadramp.h>
#include "robot_cs.h"
#include "hposition_manager.h"
#include "vector.h"

#include "htrajectory_config.h"

typedef enum
{
  STATE_STOP = 0,

  STATE_PATH_MID,
  STATE_PATH_LAST

}htrajectory_state_t;

typedef struct
{
  hrobot_position_t *hrp;
  robot_cs_t *rcs;
  struct quadramp_filter *qramp_a;

  // trajectory parameters
  
  double aSpeed;
  double aAcc;

  double cruiseSpeed;
  double cruiseAcc;

  double steeringSpeed;
  double steeringAcc;

  double stopSpeed;
  double stopAcc;

  double xySteeringWindow;

  double xyStopWindow;
  double aStopWindow;

  // internal variables

  vect_xy_t carrot;
  double carrotSpeed;

  double carrotA;

  // trajectory
  vect_xy_t path[HTRAJECTORY_MAX_POINTS];
  uint8_t pathSize;

  // status
  uint8_t pathIndex;

  htrajectory_state_t state;

} htrajectory_t;

/**\brief Initialize trajectory manager */
void htrajectory_init( htrajectory_t *htj, 
                        hrobot_position_t *hrp,
                        robot_cs_t* rcs,
                        struct quadramp_filter* qramp_angle);

/* -- speed management -- */

/**\brief Change robot A speed */
void htrajectory_setASpeed( htrajectory_t *htj, double speed, double acc );

/**\brief Change robot XY cruise speed */
void htrajectory_setXYCruiseSpeed( htrajectory_t *htj, double speed, double acc );

/**\brief Change robot XY steering speed */
void htrajectory_setXYSteeringSpeed( htrajectory_t *htj, double speed, double acc );

/**\brief Change robot XY stop speed */
void htrajectory_setXYStopSpeed( htrajectory_t *htj, double speed, double acc );

/* -- target window management -- */

/**\brief Change robot window along path */
void htrajectory_setSteeringWindow( htrajectory_t *htj, double xywin );

/**\brief Change robot window on stop */
void htrajectory_setStopWindows( htrajectory_t *htj, double xywin, double awin );

/* -- orders -- */

/**\brief Load and run path */
void htrajectory_run( htrajectory_t *htj, vect_xy_t *hrv, uint8_t n);

/**\brief Turn robot by 'a'  */
void htrajectory_gotoA( htrajectory_t *htj, double a);

/**\brief Goto (x,y) point */
void htrajectory_gotoXY( htrajectory_t *htj, double x, double y);

/* -- status -- */

/**\brief Return 1 if robot is turned to it consign, 0 otherwise */
uint8_t htrajectory_doneA( htrajectory_t *htj );

/**\brief Return 1 if robot is in (x,y) position, 0 otherwise */
uint8_t htrajectory_doneXY( htrajectory_t *htj );

/* -- trajectory update -- */

void htrajectory_update( htrajectory_t *htj );

#endif/*HTRAJECTORY_H*/
