/*  
 *  Copyright RobOtter (2008) 
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

/** \file vectors.h
  *
  * Define various vectors data structures 
  */

#ifndef VECTORS_H
#define VECTORS_H

typedef struct vxya_t
{
  double x;
  double y;
  double a;
}vxya_t;

typedef struct vxys_t
{
  int16_t x;
  int16_t y;
  uint8_t s;
}vxys_t;

#endif/*VECTORS_H*/
