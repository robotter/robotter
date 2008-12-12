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
 *  Revision : $Id: blocking_detection_manager.c,v 1.4 2008-05-14 13:27:12 zer0 Exp $
 *
 *  Olivier MATZ <zer0@droids-corp.org>
 */

/* blocking detection manager */

#include <stdio.h>
#include <string.h>
#include <aversive/error.h>

#include <blocking_detection_manager.h>

/** init module, give the robot system to use as a parameter */
void bd_init(struct blocking_detection * bd)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	memset(bd, 0, sizeof(*bd));
	IRQ_UNLOCK(flags);
}

/* thresholds */
void bd_set_current_thresholds(struct blocking_detection * bd, 
			       int32_t k1, int32_t k2, 
			       uint32_t i_thres, uint16_t cpt_thres)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	bd->k1 = k1;
	bd->k2 = k2;
	bd->i_thres = i_thres;
	bd->cpt_thres = cpt_thres;
	bd->cpt = 0;
	IRQ_UNLOCK(flags);
}

/* speed threshold */
void bd_set_speed_threshold(struct blocking_detection * bd, 
			    uint16_t speed)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	bd->speed_thres = speed;
	IRQ_UNLOCK(flags);
}

/** reset current blocking */
void bd_reset(struct blocking_detection * bd)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	bd->cpt = 0;
	IRQ_UNLOCK(flags);
}



/** function to be called periodically */
void bd_manage_from_speed_cmd(struct blocking_detection * bd, 
			      int32_t speed, int32_t cmd)	   
{
	int32_t i=0;

	/* if current-based blocking_detection enabled */
	if ( bd->cpt_thres ) {
		i = bd->k1 * cmd - bd->k2 * speed;
		if (ABS(i) > bd->i_thres && 
		    (bd->speed_thres == 0 || ABS(speed) < bd->speed_thres)) {
			if (bd->cpt == bd->cpt_thres - 1)
				WARNING(E_BLOCKING_DETECTION_MANAGER, 
				      "BLOCKING cmd=%ld, speed=%ld i=%ld",
				      cmd, speed, i);
			if(bd->cpt < bd->cpt_thres)
				bd->cpt++;
		}
		else {
			bd->cpt=0;
		}
#if BD_DEBUG
		if (bd->debug_cpt++ == BD_DEBUG) {
			DEBUG(E_BLOCKING_DETECTION_MANAGER, "cmd=%ld, speed=%ld i=%ld",
			      cmd, speed, i);
			bd->debug_cpt = 0;
		}
	}
#endif
}

/** function to be called periodically */
void bd_manage_from_pos_cmd(struct blocking_detection * bd, 
			    int32_t pos, int32_t cmd)   
{
	int32_t speed = (pos - bd->prev_pos);
	bd_manage_from_speed_cmd(bd, speed, cmd);	
	bd->prev_pos = pos;
}

/** function to be called periodically */
void bd_manage_from_cs(struct blocking_detection * bd, struct cs *cs)
{
	bd_manage_from_pos_cmd(bd, cs_get_filtered_feedback(cs), cs_get_out(cs));
}

/** get value of blocking detection */
uint8_t bd_get(struct blocking_detection * bd)
{
	uint8_t ret, flags;
	IRQ_LOCK(flags);
	ret = (bd->cpt_thres && (bd->cpt == bd->cpt_thres));
	IRQ_UNLOCK(flags);
	return ret;
}
