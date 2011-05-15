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

/** \file hrobot_manager_config.h
  * \author JD
  *
  * Abstract robot hardware
  *
  */

#ifndef _HROBOT_MANAGER_CONFIG_H_
#define _HROBOT_MANAGER_CONFIG_H_

// um/mrads -> motor encoder step
double hrobot_motors_matrix[9] = {
-6.22287912e-02,   4.95384615e-04,   9.97476284e+00,
 2.92931868e-02,   5.31196703e-02,   9.94506718e+00,
 2.99331868e-02,  -5.34680220e-02,   9.89061232e+00
 };

#endif/*_HROBOT_MANAGER_CONFIG_H_*/
