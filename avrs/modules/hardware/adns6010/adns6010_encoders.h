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

/** @file adns6010_encoders.h
  * @author JD
  *
  * Manage ADNS6010 system while in automatic mode
  */

#ifndef _ADNS6010_ENCODERS_H_
#define _ADNS6010_ENCODERS_H_

#include <stdint.h>

#include "adns6010_spi.h"
#include "adns6010_fpga.h"

//@ Encoders values
typedef struct
{
  // ADNS 1
  int32_t x1;
  int32_t y1;
  uint8_t squal1;

  // ADNS 2
  int32_t x2;
  int32_t y2;
  uint8_t squal2;

  // ADNS 3
  int32_t x3;
  int32_t y3;
  uint8_t squal3;

  // FAULT register
  uint8_t fault;

}adns6010_encoders_t;


/** @brief Access ADNS6010 system to get encoders values
  * 
  */
void adns6010_encoders_get_value(adns6010_encoders_t*);

#endif/*_ADNS6010_ENCODERS_H_*/
