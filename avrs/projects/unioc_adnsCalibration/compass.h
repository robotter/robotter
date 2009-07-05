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

/** \file compass.h
  * \author JD
  *
  * Manage magnetic compass sensor
  *
  */

#ifndef COMPASS_H
#define COMPASS_H

#include <aversive.h>

#define COMPASS_DELTA_MAX 1800
#define COMPASS_TENTH_DEGREES_2PI 3600
#define COMPASS_TDEG_TO_RADS 0.001745329251994

typedef struct
{
	uint16_t address;

	double heading;
	double offset;

	int k;
	int32_t praw_heading;
}compass_t;

/**@brief Initialize compass structure
	*@param address compass address on FPGA wishbone bus
	*/
void compass_init(compass_t*, uint16_t address);

/**@brief Update compass filter
	*/
void compass_update(compass_t*);

/**@brief Set compass value */
void compass_set_heading_rad(compass_t*, double heading);

/**@brief Return robot heading in radians
	*/
double compass_get_heading_rad(compass_t*);

#endif/*COMPASS_H*/
