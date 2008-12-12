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
 *  Revision : $Id: encoders_eirbot.h,v 1.4 2007-05-24 13:08:47 zer0 Exp $
 *
 */

/** \file encoders_eirbot.h
 *  \brief universal Interface for incremental coders
 */

#ifndef _ENCODERS_EIRBOT_H_
#define _ENCODERS_EIRBOT_H_

#include <base/utils/aversive.h>
#include <encoders_eirbot_config.h>

typedef int32_t encoders;

/** 
 * Initialisation of counters, variables
 */
void encoders_init(void);


/** 
 * Update counter values, need to be done quite (depends on which counter)
 */
void encoders_manage(void);


/** Extract counter value */
encoders encoders_get_value(uint8_t number);

#endif
