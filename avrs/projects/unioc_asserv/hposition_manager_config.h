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

/*
double hrobot_adnsMatrix[3][6] = {
{-35.781580, 28.399174,105.112128,60.017257,-13.142046,-97.052602},
{-35.816923,-71.486213,-58.009188,58.157963,88.065688,-17.224137},
{0.034753,0.643015,0.165637,0.730988,-0.249461,0.600171}
};*/

double hrobot_adnsMatrix[3][6] = {
{0.0, 0.0, 118.452074,74.665099,-21.904382,-93.862231},
{0.0, 0.0, -89.310190,49.369667,138.330408,-55.652601},
{0.0, 0.0, 0.452389,0.874157,-0.637186,0.876430}
};

double hrobot_motorEncodersMatrix[3][3] = {
{179.366384,-90.211383,-90.152142},
{4.396372,-154.929332,157.074376},
{-0.460245,-0.460034,-0.469241}
};

//double hrobot_adnsMatrix[3][6] = {
//{68.518845,59.552341,-3.081089,-111.226574,-58.789334,57.941438},
//{-35.786237,71.445762,146.139536,-6.391199,-34.441108,-71.250745},
//{0.064932,0.650341,-0.000176,0.482276,-0.105445,0.642571}
//};

#endif/*_HPOSITION_MANAGER_CONFIG_H_*/
