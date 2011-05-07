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

typedef enum
{
  SCANNER_LL = 0,
  SCANNER_LR,
  SCANNER_RL,
  SCANNER_RR
} scanner_t;

/** Detect pawn on scanner number n 
 * @return Pawn distance to robot in mm, -1 on no pawn found
 * */
float scanner_detect(scanner_t n);

#endif/*SCANNER_H*/
