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
 *  Revision : $Id: position_manager.h,v 1.6 2008-01-08 20:05:03 zer0 Exp $
 *
 */


#ifndef _ROBOT_POSITION_MANAGER_H_
#define _ROBOT_POSITION_MANAGER_H_

#include <math.h>
#include <robot_system.h>

/** 
 * structure that stores the number of impulsions that corresponds to
 * a cm or a degre. We also need to specify the track of the
 */
struct robot_physical_params 
{
	double track_cm;
	double distance_imp_per_cm;
};


/** 
 * stores a cartesian position on the area in double
 * WARNING : a is stored in radian
 */
struct xya_position 
{
	double x;
	double y;
	double a;
};

/**
 * stores a cartesian position on the area in integers
 * WARNING : a is stored in degree
 */
struct xya_position_s16
{
	int16_t x;
	int16_t y;
	int16_t a;
};

/**
 * Structure that stores everthing we need to get and stores the
 * position of the robot 
 */
struct robot_position
{
	uint8_t use_ext;
	struct robot_physical_params phys;
	struct xya_position pos_d;
	struct xya_position_s16 pos_s16;
	struct rs_polar prev_encoders;
	struct robot_system * rs;
};


/** initialization of the robot_position pos, everthing is set to 0 */
void position_init(struct robot_position * pos);

/** Set a new robot position */
void position_set(struct robot_position * pos, int16_t x, int16_t y, int16_t a);

void position_use_ext(struct robot_position * pos);
void position_use_mot(struct robot_position * pos);


/** 
 * Set the physical parameters of the robot : 
 *  - distance between wheels (track, in cm)
 *  - number of impulsions for 1 cm (distance)
 */
void position_set_physical_params(struct robot_position * pos, double track_cm,
				  double distance_imp_per_cm);

/** 
 * Save in pos structure the pointer to the associated robot_system. 
 * The robot_system structure is used to get values from virtual encoders
 * that return angle and distance.
 */
void position_set_related_robot_system(struct robot_position * pos, struct robot_system * rs);

/** 
 * Process the absolute position (x,y,a) depending on the delta on
 * virtual encoders since last read, and depending on physical
 * parameters.
 */
void position_manage(struct robot_position * pos);


/**
 * returns current x
 */
int16_t position_get_x_s16(struct robot_position *pos);

/**
 * returns current y
 */
int16_t position_get_y_s16(struct robot_position *pos);

/**
 * returns current alpha
 */
int16_t position_get_a_deg_s16(struct robot_position *pos);

/**
 * returns current x
 */
double position_get_x_double(struct robot_position *pos);

/**
 * returns current y
 */
double position_get_y_double(struct robot_position *pos);

/**
 * returns current alpha
 */
double position_get_a_rad_double(struct robot_position *pos);


#endif
