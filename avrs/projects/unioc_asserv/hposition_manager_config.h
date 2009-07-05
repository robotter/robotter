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
#define HPOSITION_MANAGER_ADNSMATRIX_UNITPOW 14

//@ matrix transforming coordinates in ADNS system to (x,y,a) robot coordinate system
double hrobot_adnsMatrix[3][6] = {
//{-0.0032629,   0.0018869,   0.0033326,   0.0018722,  -0.0000731,  -0.0038263},
//{-0.0018972,  -0.0032620,  -0.0018150,   0.0032504,   0.0037989,  -0.0000591},
//{-0.0000013,   0.0000340,  -0.0000005,   0.0000339,  -0.0000007,   0.0000340}
{-51.791208, 29.920036, 53.668538, 30.18088,  0.1020030,  -61.254635},
{-29.31355, -53.603126, -31.2853,    50.873856,  61.298388, -2.9207907}, 
{-0.0229983, 0.5671937,  -0.0035784, 0.5728521,  -0.0341206, 0.5637784}
};


#endif/*_HPOSITION_MANAGER_CONFIG_H_*/
