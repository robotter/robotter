/*  
 *  Copyright Droids Corporation (2007)
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
 *  Revision : $Id: blocking_detection_manager.h,v 1.5 2008-05-14 13:27:12 zer0 Exp $
 *
 *  Olivier MATZ <zer0@droids-corp.org>
 */

/* blocking detection manager */

#ifndef BLOCKING_DETECTION_MANAGER_H_
#define BLOCKING_DETECTION_MANAGER_H_

/* display debug every 128 calls of manage if defined */
#define BD_DEBUG 128

#include <control_system_manager.h>

/* detect blocking based on motor current. 
 * triggers the blocking if:
 *   - the current in the motor is a above a threshold 
 *     during n tests
 *   - the speed is below the threshold (if specified)
 *
 * We suppose that i = k1.V - k2.w
 * (V is the voltage applied on the motor, and w the current speed 
 * of the motor)
 */

struct blocking_detection {
	struct cs *cs;

	uint32_t i_thres;
	int32_t k1;
	int32_t k2;
	uint16_t cpt_thres;
	uint16_t cpt;
	uint16_t speed_thres;
#ifdef BD_DEBUG
	uint16_t debug_cpt;
#endif

	int32_t prev_pos;
	int32_t speed;
};

/** init module, give the cs as parameter */
void bd_init(struct blocking_detection * bd);

/** thresholds for current-based blocking detection. If cpt_thres 
 *  is 0, disable it. */
void bd_set_current_thresholds(struct blocking_detection * bd, 
			       int32_t k1, int32_t k2, 
			       uint32_t i_thres, uint16_t cpt_thres);

/** speed threshold: if speed is above it, disable
 *  blocking_detection. */
void bd_set_speed_threshold(struct blocking_detection * bd, 
			    uint16_t speed);

/** reset the blocking */
void bd_reset(struct blocking_detection * bd);

/** function to be called periodicallyn, when we use cs structure */
void bd_manage_from_cs(struct blocking_detection * bd, struct cs *cs);

/** function to be called periodically, when we use values directly */
void bd_manage_from_pos_cmd(struct blocking_detection * bd, 
			    int32_t pos, int32_t cmd);

/** function to be called periodically, when we use values directly */
void bd_manage_from_speed_cmd(struct blocking_detection * bd, 
			      int32_t speed, int32_t cmd);

/** get value of blocking detection */
uint8_t bd_get(struct blocking_detection * bd);

#endif
