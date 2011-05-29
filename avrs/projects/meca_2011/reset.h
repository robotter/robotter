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

/** \file reset.h
  * \author JD
  */

#ifndef _RESET_H_
#define _RESET_H_

#define RESET_ADDR_NOBOOTLOADER 0x0
#define RESET_ADDR_BOOTLOADER_512W  0xFE00
#define RESET_ADDR_BOOTLOADER_1024W 0xFC00
#define RESET_ADDR_BOOTLOADER_2048W 0xF800
#define RESET_ADDR_BOOTLOADER_4096W 0xF000

/**@brief Perform a bootloader compliant AVR reset */
void reset_bootloader(void);

#endif/*_RESET_H_*/
