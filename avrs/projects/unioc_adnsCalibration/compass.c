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

/** \file compass.c
  * \author JD
  *
  * Manage magnetic compass sensor
  *
  */

#include <aversive/error.h>
#include "compass.h"

void compass_init(compass_t* compass, uint16_t address)
{
	// set compass address on FPGA wishbone bus
	compass->address = address;

	compass->offset = 0.0;

	// initialize filter
	compass->k = 0;
	compass->praw_heading = -1;
}

void compass_update(compass_t* compass)
{
	int32_t raw_heading, heading, delta;
	double fheading;
	uint8_t flags;
	
	// get raw heading from compass in 1/10 degrees
	raw_heading = _SFR_MEM16( compass->address );

	// change orientation
	raw_heading = COMPASS_TENTH_DEGREES_2PI - raw_heading;

	// if prawheading == -1 this is the first update
	if(compass->praw_heading != -1)
	{
		// compute delta since last update
		delta = raw_heading - compass->praw_heading;
	
		if(delta > COMPASS_DELTA_MAX)
			compass->k--;

		if(delta < -COMPASS_DELTA_MAX)
			compass->k++;
	}
	
	// remember previous value
	compass->praw_heading = raw_heading;

	// get filtered value in 1/10 degrees
	heading = raw_heading + (compass->k)*COMPASS_TENTH_DEGREES_2PI;

	// convert value from 1/10 degrees to radians
	fheading = (double)heading*COMPASS_TDEG_TO_RADS;

	// latch value
	IRQ_LOCK(flags);
	compass->heading = fheading;
	IRQ_UNLOCK(flags);

	return;
}

double compass_get_heading_rad(compass_t* compass)
{	
	return (compass->heading)-(compass->offset);
}

void compass_set_heading_rad(compass_t* compass, double heading)
{
	// perform one update to set heading
	compass_update(compass);
	
	// compute offset
	compass->offset = heading + (compass->heading) - (compass->offset);
}
