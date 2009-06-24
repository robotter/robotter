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

/** \file acfilter.h
  * \author JD
  *
  * Filter ADNS and compass headings 
  *
  */

#include "acfilter.h"

void acfilter_init(acfilter_t* acf, double igain)
{
	acf->igain = igain;

	acf->feedback = 0.0;
	acf->accumulator = 0.0;

	acf->output = 0.0;
}

double acfilter_do(acfilter_t* acf, double adns_heading, double compass_heading)
{
	double error;

	// set output 
	acf->output = adns_heading + (acf->feedback);
	
	// compute error between output and compass
	error = compass_heading - (acf->output);
	
	// integrate error
	acf->accumulator += error;

	// compute feedback
	acf->feedback = (acf->igain)*(acf->accumulator);

	return (acf->output);
}
