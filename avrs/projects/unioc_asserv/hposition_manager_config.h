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

/** \file hposition_manager_config.h
  * \author JD
  *
  * Manage holonomic robot encoders to calculate robot position
  *
  */

#ifndef _HPOSITION_MANAGER_CONFIG_H_
#define _HPOSITION_MANAGER_CONFIG_H_

//@ matrix output unit is 2^14 (mm), divide result by 2^14 to get mm
#define HPOSITION_MANAGER_MATRIX_UNITPOW 14

//@ matrix transforming coordinates in ADNS system to (x,y,a) robot coordinate system

// motor encoder step -> um (micro-meters) / mrads
double hrobot_motors_invmatrix[9] = {
-10.86875093, 5.53375458, 5.39700173,
 -0.08183981,  9.39777427, -9.3669796,
  0.03245103,  0.03405628,  0.03413506
};

#endif/*_HPOSITION_MANAGER_CONFIG_H_*/
