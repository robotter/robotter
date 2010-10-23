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

/** @file
 * @brief Drive RobOtter ADNS9500 FPGA system.
 */

#ifndef ADNS9500_H_
#define ADNS9500_H_

#include <stdint.h>

#include "adns9500_fpga.h"
#include "adns9500_timings.h"


/// ADNS9500 error code
#define ADNS9500_ERROR 0x10

/// Number of ADNS
#define ADNS9500_NUM 1 //XXX:debug 3

// Vectors
#define ADNS9500_VX1 0
#define ADNS9500_VY1 1
#define ADNS9500_VX2 2
#define ADNS9500_VY2 3
#define ADNS9500_VX3 4
#define ADNS9500_VY3 5

/// Encoders values
typedef struct
{
  // ADNS VECTORS
  int32_t vectors[6];

  // ADNS SQUALS
  uint8_t squals[3];

  // FAULT register
  uint8_t fault;

} adns9500_encoders_t;

/// ADNS resolutions
typedef enum
{
  ADNS9500_RES_400 = 0,
  ADNS9500_RES_800,
  ADNS9500_RES_1600,
  ADNS9500_RES_2000

} adns9500_resolution_t;

/// ADNS LASER shutter mode
typedef enum
{
  ADNS9500_SHUTTER_OFF = 0,
  ADNS9500_SHUTTER_ON

} adns9500_shuttermode_t;

/// Behaviour modes
typedef enum
{
  ADNS9500_BHVR_MODE_UC_DRIVEN = 0,
  ADNS9500_BHVR_MODE_AUTOMATIC
} adns9500_behaviour_t;

/// Initialize ADNS9500
void adns9500_init(void);

/// Launch ADNS9500s boot sequence
void adns9500_boot(void);

/// Check ADNS9500s for GO
void adns9500_checks(void);

/// Change behaviour mode
void adns9500_set_mode(adns9500_behaviour_t);

/// Check atmega FLASH firmware
void adns9500_check_firmware(void);

/// Access ADNS9500 system to get encoders values
void adns9500_encoders_get_value(adns9500_encoders_t*);


#endif/*ADNS9500_H_*/
