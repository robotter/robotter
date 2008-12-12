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
 *  Revision : $Id: robot_system.h,v 1.7 2008-04-13 16:55:31 zer0 Exp $
 *
 */

/**
 * The goal of this module is to provide an interface to motor and
 * encoders of the robot. This module provide a function that returns
 * the value of virtual encoders containing distance and angle. It
 * also allow the user to command virtual angle and distance PWMs.
 */

#include <aversive.h>
#include <f64.h>

#include "angle_distance.h"

#ifndef _ROBOT_SYSTEM_H_
#define _ROBOT_SYSTEM_H_

/* flags */
#define RS_USE_EXT 1
#define RS_IGNORE_EXT_GAIN 2
#define RS_IGNORE_MOT_GAIN 4


struct robot_system
{
	uint8_t flags;

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	struct rs_polar pmot_prev;
	struct rs_wheels wmot_prev;

	f64 ratio_mot_ext;

	/* Motor encoders */
	int32_t (*left_mot_encoder)(void *);
	void* left_mot_encoder_param;
	f64 left_mot_gain;
	
	int32_t (*right_mot_encoder)(void *);
	void* right_mot_encoder_param;
	f64 right_mot_gain;
#endif

	struct rs_polar virtual_pwm;
	struct rs_polar virtual_encoders;

	struct rs_polar pext_prev;
	struct rs_wheels wext_prev;

	/* External encoders */
	int32_t (*left_ext_encoder)(void *);
	void* left_ext_encoder_param;
	f64 left_ext_gain;
	
	int32_t (*right_ext_encoder)(void *);
	void* right_ext_encoder_param;
	f64 right_ext_gain;

	/* PWM */
	void (*left_pwm)(void *, int32_t);
	void *left_pwm_param;
	void (*right_pwm)(void *, int32_t);
	void *right_pwm_param;
};

/** Set the structure to 0 */
void rs_init( struct robot_system * );

/**** ACCESSORS */

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
/** define ratio between mot and ext track. (track_mot / track_ext) */
void rs_set_ratio(struct robot_system * rs, double ratio);
#endif

/** define left PWM function and param */
void rs_set_left_pwm(struct robot_system * rs, void (*left_pwm)(void *, int32_t), void *left_pwm_param);

/** define right PWM function and param */
void rs_set_right_pwm(struct robot_system * rs, void (*right_pwm)(void *, int32_t), void *right_pwm_param);

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
/** define left motor encoder function and param */
void rs_set_left_mot_encoder(struct robot_system * rs, int32_t (*left_mot_encoder)(void *), 
			     void *left_mot_encoder_param, double gain);

/** define right motor encoder function and param */
void rs_set_right_mot_encoder(struct robot_system * rs, int32_t (*right_mot_encoder)(void *), 
			      void *right_mot_encoder_param, double gain);
#endif

/** define left external encoder function and param */
void rs_set_left_ext_encoder(struct robot_system * rs, int32_t (*left_ext_encoder)(void *), 
			     void *left_ext_encoder_param, double gain);

/** define right external encoder function and param */
void rs_set_right_ext_encoder(struct robot_system * rs, int32_t (*right_ext_encoder)(void *), 
			      void *right_ext_encoder_param, double gain);

/**** Virtual encoders and PWM */

/** 
 * set the real pwms according to the specified angle (it also
 * depends on the last distance command sent) 
 */
void rs_set_angle(void * rs, int32_t angle);

/** 
 * set the real pwms according to the specified distance (it also
 * depends on the last angle command sent) 
 */
void rs_set_distance(void * rs, int32_t distance);

/** 
 * get the virtual angle according to real encoders value. 
 */
int32_t rs_get_angle(void * rs);

/** 
 * get the virtual distance according to real encoders value. 
 */
int32_t rs_get_distance(void * rs);

/** 
 * get the angle according to ext encoders value. 
 */
int32_t rs_get_ext_angle(void * rs);

/** 
 * get the distance according to ext encoders value. 
 */
int32_t rs_get_ext_distance(void * rs);

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
/** 
 * get the angle according to mot encoders value. 
 */
int32_t rs_get_mot_angle(void * rs);

/** 
 * get the distance according to mot encoders value. 
 */
int32_t rs_get_mot_distance(void * rs);
#endif

/* same for left/right */
int32_t rs_get_ext_left(void * rs);
int32_t rs_get_ext_right(void * rs);
#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
int32_t rs_get_mot_left(void * rs);
int32_t rs_get_mot_right(void * rs);
#endif


/** 
 * Read the encoders, and update internal virtual counters. Call this
 * function is needed before reading the virtual encoders. The program
 * will decide if it the external encoders or the motor encoders are
 * taken in account (depending on flags, but not yet)
 */
void rs_update(void * rs);

void rs_set_flags(struct robot_system * rs, uint8_t flags);


#endif /* #ifndef _ROBOT_SYSTEM */
