/*  
 *  Copyright RobOtter (2011) 
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

/** \file 
  * \author Lamygalle
  */
#ifndef R3D2_CONFIG_H
#define R3D2_CONFIG_H
	
	// default motor speed (XXX manque min max XXX)
	#define DEFAULT_MOTOR_SPEED	2200

	// default reflector ratio (_
	#define DEFAULT_SURFACE_REFLECTION_RATIO 2.0

	// default number of motor rotation 
	#define DEFAULT_ROBOT_DETECTED_TIMEOUT_THRESHOLD 5

	// default number of motor rotation lost before detecting motor stop (expressed in r3d2_monitor tick)
	#define DEFAULT_MOTOR_ROTATING_TIMEOUT_THRESHOLD 3

	// angle offset added to the angle of the detected robot (in degree)
	#define DEFAULT_ROBOT_DETECTED_ANGLE_OFFSET 80

#endif // R3D2_CONFIG_H
