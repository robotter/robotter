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
 *  Revision : $Id: hamming.h,v 1.3 2008-01-08 20:05:04 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Interface for HAMMING
 *
 * Thanks and hello to Serpilliere
 */

/** \file hamming.c
 *  \brief Interface for the Hamming module.
 *
 *  \todo nothing.
 *
 *  \test Seems to work
 *
 * This module provides functions for error detection/correction
 */

/**********************************************************/

/**
 * Encode the frame (the 24 LSB bits) into a 29 bits frame with
 * hamming error correction bits. The 3 MSB bits are not used.
 */
void hamming_do(uint32_t *frame);

/** 
 * Decode the 29 bits frame into a 24 bits one. If an error occurs,
 * the function tries to correct it and returns a positive value. If
 * there is no error, the function returns 0.
 */
uint8_t hamming_undo(uint32_t *frame);
