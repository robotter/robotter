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
 *  Revision : $Id: robot_system.c,v 1.9 2008-04-13 16:55:31 zer0 Exp $
 *
 */

/**
 * The goal of this module is to provide an interface to motor and
 * encoders of the robot. This module provide a function that returns
 * the value of virtual encoders containing distance and angle. It
 * also allow the user to command virtual angle and distance PWMs.
 */

#include <string.h>
#include <stdio.h>

#include <aversive/error.h>

#include <aversive.h>
#include <f64.h>

#include "angle_distance.h"
#include "robot_system.h"


/** Call a pwm() pointer : 
 * - lock the interrupts
 * - read the pointer to the pwm function
 * - unlock the interrupts
 * - if pointer is null, don't do anything
 * - else call the pwm with the parameters
 */
static inline void
safe_setpwm(void (*f)(void *, int32_t), void * param, int32_t value)
{
	void (*f_tmp)(void *, int32_t);
	void * param_tmp;
	uint8_t flags;
	IRQ_LOCK(flags);
	f_tmp = f;
	param_tmp = param;
	IRQ_UNLOCK(flags);
	if (f_tmp) {
		f_tmp(param_tmp, value);
	}
}

/** Call a encoder() pointer : 
 * - lock the interrupts
 * - read the pointer to the encoder function
 * - unlock the interrupts
 * - if pointer is null, return 0
 * - else return the value processed by the function
 */
static inline uint32_t
safe_getencoder(int32_t (*f)(void *), void * param)
{
	int32_t (*f_tmp)(void *);
	void * param_tmp;
	uint8_t flags;
	IRQ_LOCK(flags);
	f_tmp = f;
	param_tmp = param;
	IRQ_UNLOCK(flags);
	if (f_tmp) {
		return f_tmp(param_tmp);
	}
	return 0;
}

/** Set the structure to 0 */
void rs_init( struct robot_system * rs)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	memset(rs, 0, sizeof(struct robot_system));
#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	rs_set_ratio(rs, 1.0);
#endif
	IRQ_UNLOCK(flags);
}

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
/** define ratio between mot and ext track. (track_mot / track_ext) */
void rs_set_ratio(struct robot_system * rs, double ratio)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	rs->ratio_mot_ext = f64_from_double(ratio);
	IRQ_UNLOCK(flags);
}
#endif

/** define left PWM function and param */
void rs_set_left_pwm(struct robot_system * rs, void (*left_pwm)(void *, int32_t), void *left_pwm_param)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	rs->left_pwm = left_pwm;
	rs->left_pwm_param = left_pwm_param;
	IRQ_UNLOCK(flags);
}

/** define right PWM function and param */
void rs_set_right_pwm(struct robot_system * rs, void (*right_pwm)(void *, int32_t), void *right_pwm_param)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	rs->right_pwm = right_pwm;
	rs->right_pwm_param = right_pwm_param;
	IRQ_UNLOCK(flags);
}

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
/** define left motor encoder function and param */
void rs_set_left_mot_encoder(struct robot_system * rs, int32_t (*left_mot_encoder)(void *), 
			     void *left_mot_encoder_param, double gain)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	rs->left_mot_encoder = left_mot_encoder;
	rs->left_mot_encoder_param = left_mot_encoder_param;
	rs->left_mot_gain = f64_from_double(gain);
	IRQ_UNLOCK(flags);
}

/** define right motor encoder function and param */
void rs_set_right_mot_encoder(struct robot_system * rs, int32_t (*right_mot_encoder)(void *), 
			      void *right_mot_encoder_param, double gain)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	rs->right_mot_encoder = right_mot_encoder;
	rs->right_mot_encoder_param = right_mot_encoder_param;
	rs->right_mot_gain = f64_from_double(gain);
	IRQ_UNLOCK(flags);
}
#endif

/** define left external encoder function and param */
void rs_set_left_ext_encoder(struct robot_system * rs, int32_t (*left_ext_encoder)(void *), 
			     void *left_ext_encoder_param, double gain)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	rs->left_ext_encoder = left_ext_encoder;
	rs->left_ext_encoder_param = left_ext_encoder_param;
	rs->left_ext_gain = f64_from_double(gain);
	IRQ_UNLOCK(flags);
}

/** define right external encoder function and param */
void rs_set_right_ext_encoder(struct robot_system * rs, int32_t (*right_ext_encoder)(void *), 
			      void *right_ext_encoder_param, double gain)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	rs->right_ext_encoder = right_ext_encoder;
	rs->right_ext_encoder_param = right_ext_encoder_param;
	rs->right_ext_gain = f64_from_double(gain);
	IRQ_UNLOCK(flags);
}

/**** Virtual encoders and PWM */

/** 
 * set the real pwms according to the specified angle (it also
 * depends on the last distance command sent) 
 */
void rs_set_angle(void * data, int32_t angle)
{
	struct rs_polar p;
	struct rs_wheels w;
	struct robot_system * rs = data;
	uint8_t flags;

	IRQ_LOCK(flags);
	p.distance = rs->virtual_pwm.distance ;
	rs->virtual_pwm.angle = angle;
	IRQ_UNLOCK(flags);

	p.angle = angle;
	rs_get_wheels_from_polar(&w, &p);
	
	safe_setpwm(rs->left_pwm, rs->left_pwm_param, w.left);
	safe_setpwm(rs->right_pwm, rs->right_pwm_param, w.right);
}

/** 
 * set the real pwms according to the specified distance (it also
 * depends on the last angle command sent) 
 */
void rs_set_distance(void * data, int32_t distance)
{
	struct robot_system * rs = data;
	struct rs_polar p;
	struct rs_wheels w;
	uint8_t flags;

	IRQ_LOCK(flags);
	p.angle = rs->virtual_pwm.angle ;
	rs->virtual_pwm.distance = distance;
	IRQ_UNLOCK(flags);

	p.distance = distance;
	rs_get_wheels_from_polar(&w, &p);
	
	safe_setpwm(rs->left_pwm, rs->left_pwm_param, w.left);
	safe_setpwm(rs->right_pwm, rs->right_pwm_param, w.right);
}

/** 
 * get the virtual angle according to real encoders value. 
 */
int32_t rs_get_angle(void * data)
{
	struct robot_system * rs = data;
	int32_t angle;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	angle = rs->virtual_encoders.angle ;	
	IRQ_UNLOCK(flags);
	return angle;
}

/** 
 * get the virtual distance according to real encoders value. 
 */
int32_t rs_get_distance(void * data)
{
	struct robot_system * rs = data;
	int32_t distance;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	distance = rs->virtual_encoders.distance ;	
	IRQ_UNLOCK(flags);
	return distance;
}

int32_t rs_get_ext_angle(void * data)
{
	struct robot_system * rs = data;
	int32_t angle;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	angle = rs->pext_prev.angle ;	
	IRQ_UNLOCK(flags);
	return angle;
}

int32_t rs_get_ext_distance(void * data)
{
	struct robot_system * rs = data;
	int32_t distance;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	distance = rs->pext_prev.distance ;	
	IRQ_UNLOCK(flags);
	return distance;
}

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
int32_t rs_get_mot_angle(void * data)
{
	struct robot_system * rs = data;
	int32_t angle;
	uint8_t flags;	

	IRQ_LOCK(flags);
	angle = rs->pmot_prev.angle ;	
	IRQ_UNLOCK(flags);
	return angle;
}

int32_t rs_get_mot_distance(void * data)
{
	struct robot_system * rs = data;
	int32_t distance;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	distance = rs->pmot_prev.distance ;	
	IRQ_UNLOCK(flags);
	return distance;
}
#endif

int32_t rs_get_ext_left(void * data)
{
	struct robot_system * rs = data;
	int32_t left;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	left = rs->wext_prev.left ;	
	IRQ_UNLOCK(flags);
	return left;
}

int32_t rs_get_ext_right(void * data)
{
	struct robot_system * rs = data;
	int32_t right;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	right = rs->wext_prev.right ;	
	IRQ_UNLOCK(flags);
	return right;
}

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
int32_t rs_get_mot_left(void * data)
{
	struct robot_system * rs = data;
	int32_t left;
	uint8_t flags;	

	IRQ_LOCK(flags);
	left = rs->wmot_prev.left ;	
	IRQ_UNLOCK(flags);
	return left;
}

int32_t rs_get_mot_right(void * data)
{
	struct robot_system * rs = data;
	int32_t right;
	uint8_t flags;
	
	IRQ_LOCK(flags);
	right = rs->wmot_prev.right ;	
	IRQ_UNLOCK(flags);
	return right;
}
#endif

void rs_set_flags(struct robot_system * rs, uint8_t flags)
{
	uint8_t i_flags;
	
	IRQ_LOCK(i_flags);
	rs->flags = flags;
	IRQ_UNLOCK(i_flags);
}

/** 
 * Read the encoders, and update internal virtual counters. Call this
 * function is needed before reading the virtual encoders.The program
 * will decide if it the external encoders or the motor encoders are
 * taken in account (depending on flags, but not yet)
 */
void rs_update(void * data)
{
	struct robot_system * rs = data;
	struct rs_wheels wext;
	struct rs_polar pext;
#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	struct rs_wheels wmot;
	struct rs_polar pmot;
#endif
	int32_t delta_angle, delta_distance;
	uint8_t flags;
	
	/* read encoders */
	wext.left = safe_getencoder(rs->left_ext_encoder, rs->left_ext_encoder_param);
	wext.right = safe_getencoder(rs->right_ext_encoder, rs->right_ext_encoder_param);

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	wmot.left = safe_getencoder(rs->left_mot_encoder, rs->left_mot_encoder_param);
	wmot.right = safe_getencoder(rs->right_mot_encoder, rs->right_mot_encoder_param);
#endif
	
	/* apply gains to each wheel */
	if( ! (rs->flags & RS_IGNORE_EXT_GAIN ) ) {
		wext.left = f64_msb_mul(f64_from_lsb(wext.left), rs->left_ext_gain);
		wext.right = f64_msb_mul(f64_from_lsb(wext.right), rs->right_ext_gain);
	}
	
#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	if( ! (rs->flags & RS_IGNORE_MOT_GAIN ) ) {
		wmot.left = f64_msb_mul(f64_from_lsb(wmot.left), rs->left_mot_gain);
		wmot.right = f64_msb_mul(f64_from_lsb(wmot.right), rs->right_mot_gain);
	}
#endif

	rs_get_polar_from_wheels(&pext, &wext);
#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	rs_get_polar_from_wheels(&pmot, &wmot);

	/* apply ratio to polar and reupdate wheels for ext coders */
	pext.angle = f64_msb_mul(f64_from_lsb(pext.angle), rs->ratio_mot_ext);
#endif
	rs_get_wheels_from_polar(&wext, &pext);

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	/* update from external encoders */
	if( rs->flags & RS_USE_EXT ) {
		delta_angle = pext.angle - rs->pext_prev.angle;
		delta_distance = pext.distance - rs->pext_prev.distance;
	}

	/* update from motor encoders */
	else {
		delta_angle = pmot.angle - rs->pmot_prev.angle;
		delta_distance = pmot.distance - rs->pmot_prev.distance;
	}
#else
	delta_angle = pext.angle - rs->pext_prev.angle;
	delta_distance = pext.distance - rs->pext_prev.distance;
#endif

	IRQ_LOCK(flags);
	rs->virtual_encoders.angle += delta_angle;
	rs->virtual_encoders.distance += delta_distance;
	IRQ_UNLOCK(flags);

	/* don't lock too much time */

	IRQ_LOCK(flags);
	rs->pext_prev = pext;
	rs->wext_prev = wext;
	IRQ_UNLOCK(flags);

#ifdef CONFIG_MODULE_ROBOT_SYSTEM_MOT_AND_EXT
	IRQ_LOCK(flags);
	rs->pmot_prev = pmot;
	rs->wmot_prev = wmot;
	IRQ_UNLOCK(flags);
#endif
}
