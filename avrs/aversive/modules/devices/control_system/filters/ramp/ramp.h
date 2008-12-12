/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2005)
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
 *
 *
 */


/** \file ramp.h
* \brief This module provides structure and functions to filter a ramp.
* \author Vincent
* \version 1.0
* \date 6.01.2005 @ 12:00
* \todo Verify the english language
* \test filter a constante value to generate a ramp on the hardware. Everything is all right
*
*/



#ifndef _RAMP_H
#define _RAMP_H

/** \brief Definition of structur ramp_filter */

struct ramp_filter {
	uint32_t var_neg;         /**Authorized negative variation*/
	uint32_t var_pos;         /**Authorized positive variation*/
	int32_t prev_out;        /**Previous value calculated*/
};



/* Begin prototyping ************************/

/**\brief Initialisation of the ramp_filter structur
 *\param r ramp_filter structur to initiate
 **/

void ramp_init(struct ramp_filter * r );


/**\brief Set the fields of the ramp_filter structur
 *\param r ramp_structure to modificate
 *\param neg limit for the negative variation
 *\param pos limit for the positive variation
 */ 

void ramp_set_vars(struct ramp_filter * r, uint32_t neg, uint32_t pos);


/** \brief Apply ramp_filter to a ramp
* \param r ramp_filter used to filter the in
* \param in ramp to filter
* \return filtered in
*/


int32_t ramp_do_filter(void * r, int32_t in);

#endif /* ifndef _RAMP_H */
