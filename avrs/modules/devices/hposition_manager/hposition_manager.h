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

/** \file hposition_manager.h
  * \author JD
  *
  * Manage holonomic robot encoders to calculate robot position
  *
  */

#ifndef _HPOSITION_MANAGER_H_
#define _HPOSITION_MANAGER_H_


typedef struct
{
  // Robot cartesian position
  double x,y;
  // Robot orientation in radians
  double alpha;

} hrobot_vector_t;

typedef struct 
{
  // Robot position
  hrobot_vector_t position;

  // Physical parameters of the robot

} hrobot_position_t;


/**@brief Initialize position management
  */
void hposition_init( hrobot_position_t* );

/**@brief Set robot position 
  *@param x position to set
  *@param y position to set
  *@param alpha orientation to set
  */
void hposition_set( hrobot_position_t*, double x, double y, double alpha);

/**@brief Return robot position
  */
void hposition_get( hrobot_position_t*, hrobot_vector_t* );

/**@brief Update robot position
  */
void hposition_update( hrobot_position_t* );

#endif/*_HPOSITION_MANAGER_H_*/
