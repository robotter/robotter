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
#include <i2cs.h>

#define STRATCOMM_ERROR 0x80

#define STRATCOMM_MAX_RPAYLOAD_SIZE ((I2CS_SEND_BUF_SIZE) - 2)
#define STRATCOMM_MAX_PAYLOAD_SIZE  ((I2CS_RECV_BUF_SIZE) - 3)

/// Internal packet processing state.
typedef struct stratcomm_ stratcomm_t;

/** @brief Initialize strategic communications */
void stratcomm_init(void);

/** @brief Update strategic communications */
void stratcomm_update(void);

/** @brief Perform command */
void stratcomm_process(stratcomm_t*, uint8_t, uint8_t* payload);

/** @brief Pop data from payload buffer */
const uint8_t* stratcomm_popPayload(stratcomm_t*, const uint8_t* p, uint8_t psize);

/** @brief Push data on return payload buffer */
void stratcomm_pushReturnPayload(stratcomm_t*, const void* p, uint8_t psize);

#endif/*STRATCOMM_H*/
