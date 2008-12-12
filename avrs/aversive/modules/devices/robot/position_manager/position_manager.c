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
 *  Revision : $Id: position_manager.c,v 1.9 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <string.h>
#include <math.h>

#include <robot_system.h>
#include <position_manager.h>

/** initialization of the robot_position pos, everthing is set to 0 */
void position_init(struct robot_position * pos)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	memset(pos, 0, sizeof(struct robot_position));
	IRQ_UNLOCK(flags);
}

/** Set a new robot position */
void position_set(struct robot_position * pos, int16_t x, int16_t y, int16_t a)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	pos->pos_d.a = ((double)a * M_PI)/ 180.0;
	pos->pos_d.x = x;
	pos->pos_d.y = y;
	pos->pos_s16.x = x;
	pos->pos_s16.y = y;
	pos->pos_s16.a = a;
	IRQ_UNLOCK(flags);
}

/** 
 * Save in pos structure the pointer to the associated robot_system. 
 * The robot_system structure is used to get values from virtual encoders
 * that return angle and distance.
 */
void position_set_related_robot_system(struct robot_position * pos, struct robot_system * rs)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	pos->rs = rs;
	IRQ_UNLOCK(flags);
}

/** 
 * Set the physical parameters of the robot : 
 *  - number of impulsions for 1 cm (distance)
 *  - number of impulsions for 1 degree (angle)
 */
void position_set_physical_params(struct robot_position * pos, double track_cm,
				  double distance_imp_per_cm)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	pos->phys.track_cm = track_cm;
	pos->phys.distance_imp_per_cm = distance_imp_per_cm;
	IRQ_UNLOCK(flags);
}

void position_use_ext(struct robot_position * pos)
{
	struct rs_polar encoders;
	uint8_t flags;

	IRQ_LOCK(flags);
	encoders.distance = rs_get_ext_distance(pos->rs);
	encoders.angle = rs_get_ext_angle(pos->rs);
	pos->prev_encoders = encoders;
	pos->use_ext = 1;
	IRQ_UNLOCK(flags);
}

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
void position_use_mot(struct robot_position * pos)
{
	struct rs_polar encoders;
	uint8_t flags;

	IRQ_LOCK(flags);
	encoders.distance = rs_get_mot_distance(pos->rs);
	encoders.angle = rs_get_mot_angle(pos->rs);
	pos->prev_encoders = encoders;
	pos->use_ext = 0;
	IRQ_UNLOCK(flags);
}
#endif

/** 
 * Process the absolute position (x,y,a) depending on the delta on
 * virtual encoders since last read, and depending on physical
 * parameters. The processed position is in cm.
 */
void position_manage(struct robot_position * pos)
{
	double x, y, a, r, arc_angle;
	s16 x_s16, y_s16, a_s16;
	struct rs_polar encoders;
	struct rs_polar delta;
	struct robot_system * rs;
	uint8_t flags;
 
	IRQ_LOCK(flags);
	if( !(rs = pos->rs) ) {
		IRQ_UNLOCK(flags);
		/* here we could raise an error */
		return;
	}

	IRQ_UNLOCK(flags);
	
#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	if(pos->use_ext) {
		encoders.distance = rs_get_ext_distance(rs);
		encoders.angle = rs_get_ext_angle(rs);
	}
	else {
		encoders.distance = rs_get_mot_distance(rs);
		encoders.angle = rs_get_mot_angle(rs);
	}
#else
	encoders.distance = rs_get_ext_distance(rs);
	encoders.angle = rs_get_ext_angle(rs);
#endif

	/* process difference between 2 measures.
	 * No lock for prev_encoders since we are the only one to use
	 * this var XXX that's wrong now, perhaps we should lock */
	delta.distance = encoders.distance - pos->prev_encoders.distance;
	delta.angle = encoders.angle - pos->prev_encoders.angle;

	pos->prev_encoders = encoders;

	/* update double position */
	IRQ_LOCK(flags);
	a = pos->pos_d.a;
	x = pos->pos_d.x;
	y = pos->pos_d.y;
	IRQ_UNLOCK(flags);

	if (delta.angle == 0) {
		/* we go straight */
		x = x + cos(a) * ((double) delta.distance / (pos->phys.distance_imp_per_cm)) ;
		y = y + sin(a) * ((double) delta.distance / (pos->phys.distance_imp_per_cm)) ;
	}
	else {
		/* r the radius of the circle arc */
		r = (double)delta.distance * pos->phys.track_cm / ((double) delta.angle * 2);
		arc_angle = 2 * (double) delta.angle / (pos->phys.track_cm * pos->phys.distance_imp_per_cm);
		
		x += r * (-sin(a) + sin(a+arc_angle));
		y += r * (cos(a) - cos(a+arc_angle));
		a += arc_angle;
	}

	if (a < -M_PI)
		a += (M_PI*2);
	else if (a > (M_PI))
		a -= (M_PI*2);

	/* update int position */
	x_s16 = (int16_t)x;
	y_s16 = (int16_t)y;
	a_s16 = (int16_t)(a * (360.0/(M_PI*2)));

	IRQ_LOCK(flags);
	pos->pos_d.a = a;
	pos->pos_d.x = x;
	pos->pos_d.y = y;
	pos->pos_s16.x = x_s16;
	pos->pos_s16.y = y_s16;
	pos->pos_s16.a = a_s16;
	IRQ_UNLOCK(flags);
}


/**
 * returns current x
 */
int16_t position_get_x_s16(struct robot_position *pos)
{
	return pos->pos_s16.x;
}

/**
 * returns current y
 */
int16_t position_get_y_s16(struct robot_position *pos)
{
	return pos->pos_s16.y;
}

/**
 * returns current alpha
 */
int16_t position_get_a_deg_s16(struct robot_position *pos)
{
	return pos->pos_s16.a;
}

/********* double */

/**
 * returns current x
 */
double position_get_x_double(struct robot_position *pos)
{
	return pos->pos_d.x;
}

/**
 * returns current y
 */
double position_get_y_double(struct robot_position *pos)
{
	return pos->pos_d.y;
}

/**
 * returns current alpha
 */
double position_get_a_rad_double(struct robot_position *pos)
{
	return pos->pos_d.a;
}

