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

/** \file scanner.h
  * \author JD
  */

#ifndef SCANNER_H
#define SCANNER_H

#include <aversive.h>
#include <aversive/error.h>

#include "actuators.h"

typedef enum
{
  SCC_NONE = 0,
  SCC_BAD,
  SCC_GOOD
} scan_certainty_t;

/** Detect pawn on side n
 * @return Pawn distance to robot in mm, -1 on no pawn found
 * */
int16_t scanner_detect(armPos_t n, double *px, double *py, double *ph);

uint16_t scanner_get_z(armPos_t n);

int16_t scanner_do_scan(uint8_t muxa, uint8_t muxb,
                        armPos_t arm, uint8_t ax12id,
                        uint16_t start, uint16_t stop, uint16_t step,
                        int32_t *bmin, int32_t *bmax, double *height);

/** Set scanner to look at specified distance */
void scanner_look_at(armPos_t n, double y);

#endif/*SCANNER_H*/
