/*  
 *  Copyright RobOtter (2010)
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

/** \file avoidance.h
  * \author JD
  */

#ifndef _AVOIDANCE_H_
#define _AVOIDANCE_H_

#include "hposition_manager.h"
#include "settings.h"

#define AVOIDANCE_ERROR 0x90

typedef struct 
{
  // sensor multiplexing
  uint8_t gp2_it;
  
  // sensors ADCs
  uint16_t gp2_muxs[SETTING_AVOIDANCE_GP2ARRAY_SIZE];

  // gp2 detections status
  uint8_t gp2_detections[SETTING_AVOIDANCE_GP2ARRAY_SIZE];

}avoidance_t;

/** @brief Initialize avoidance systems */
void avoidance_init(avoidance_t*);

/** @brief Update avoidance system */
void avoidance_update(avoidance_t*);

/** @brief Check avoidance sensors */
direction_t avoidance_check(avoidance_t*);

#endif/*_AVOIDANCE_H_*/
