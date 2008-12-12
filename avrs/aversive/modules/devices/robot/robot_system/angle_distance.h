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
 *  Revision : $Id: angle_distance.h,v 1.5 2008-01-08 20:05:03 zer0 Exp $
 *
 */

#ifndef _ANGLE_DISTANCE_H_
#define _ANGLE_DISTANCE_H_

#include <aversive.h>

struct rs_wheels {
	int32_t left;
	int32_t right;
};


struct rs_polar {
	int32_t distance;
	int32_t angle;
};

/**
 * convert the values of wheels encoders (left, right) into (distance,
 * angle)
 */
void rs_get_polar_from_wheels(struct rs_polar * p_dst, struct rs_wheels * w_src);

/**
 * convert (distance, angle) into (left, right)
 */
void rs_get_wheels_from_polar(struct rs_wheels * w_dst, struct rs_polar * p_src);

#endif
