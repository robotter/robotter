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

/** \file stratcomm_payloads.h
  * \author JD
  */

#ifndef STRATCOMM_PAYLOADS_H
#define STRATCOMM_PAYLOADS_H

#define UNPACK_DOUBLE(sc,payload) ( *((double*) stratcomm_popPayload(sc, payload, sizeof(double))) )
#define UNPACK_INT16(sc,payload) ( *((int16_t*) stratcomm_popPayload(sc, payload, sizeof(int16_t))) )
#define UNPACK_UINT8(sc,payload) ( *((uint8_t*) stratcomm_popPayload(sc, payload, sizeof(uint8_t))) )

#define PACK_UINT8(v)  ( (uint8_t*)(&(v)) )

#endif/*STRATCOMM_PAYLOADS_H*/
