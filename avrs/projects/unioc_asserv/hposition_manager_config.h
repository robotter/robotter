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

//@ matrix transforming coordinates in ADNS system to (x,y,a) robot coordinate system
double hrobot_adnsMatrix[3][6] = {
{ 0.0000897,  0.0041783, -0.0032225, -0.0021137,  0.0034996, -0.0021684},
{ 0.0039630,  0.0002610, -0.0019085,  0.0035498, -0.0022024, -0.0034904},
{-0.0000009, -0.0000343,  0.0000008, -0.0000338,  0.0000017, -0.0000336}
};

#endif/*_HPOSITION_MANAGER_CONFIG_H_*/
