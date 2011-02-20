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

/** \file stratcomm.h
  * \author JD
  */

#ifndef STRATCOMM_H
#define STRATCOMM_H

#include <aversive.h>

#define STRATCOMM_ERROR 0x80

/** @brief Initialize strategic communications */
void stratcomm_init(void);

/** @brief Compute payload checksum */
uint8_t stratcomm_computeChecksum(const uint8_t* payload, uint8_t payloadSize);

uint8_t stratcomm_i2cm_recv(uint8_t addr, uint8_t *data, uint8_t n);

#endif/*STRATCOMM_H*/
