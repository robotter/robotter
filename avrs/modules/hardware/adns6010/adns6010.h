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

/** @file adns6010.h
  * @author JD
  *
  * Drive RobOtter ADNS6010 FPGA system.
  */

#ifndef _ADNS6010_H_
#define _ADNS6010_H_

#include <stdint.h>

#include "adns6010_encoders.h"
#include "adns6010_fpga.h"
#include "adns6010_timings.h"
#include "adns6010_returns.h"

//@ Number of ADNS
#define ADNS6010_NUM 1

/** @brief ADNS resolutions
  */
typedef enum
{
  ADNS6010_RES_400 = 0,
  ADNS6010_RES_800,
  ADNS6010_RES_1600,
  ADNS6010_RES_2000

}adns6010_resolution_t;

/** @brief ADNS LASER shutter mode
  */
typedef enum
{
  ADNS6010_SHUTTER_OFF = 0,
  ADNS6010_SHUTTER_ON

}adns6010_shuttermode_t;

/** @brief ADNS configuration
  */
typedef struct
{
  //@ ADNS resolution
  adns6010_resolution_t res;

  //@ Shutter mode
  adns6010_shuttermode_t shutter;

  //@ Laser power (0x00 = 100%, 0x7F = 33.85%)
  uint8_t power;

}adns6010_configuration_t;

/** @brief Behaviour modes
  */
typedef enum 
{
  ADNS6010_BHVR_MODE_UC_DRIVEN = 0,
  ADNS6010_BHVR_MODE_AUTOMATIC
}adns6010_behaviour_t;

/** @brief Initialize ADNS6010
  */
void adns6010_init(void);

/** @brief Launch ADNS6010s boot sequence
  * @return error code
  */
uint8_t adns6010_boot(adns6010_configuration_t*);

/** @brief Check ADNS6010s for GO
  * @return error code
  */
uint8_t adns6010_checks(void);

/** @brief Change behaviour mode 
  */
void adns6010_setMode(adns6010_behaviour_t);

/** @brief Set reset on all ADNS
  * @param value 0 - reset low / others - reset high
  */
void adns6010_setReset(uint8_t value);

/** @brief Upload firmware to an ADNS6010
  * @param adns_i ADNS to load
  */
void adns6010_uploadFirmware(uint8_t adns_i);

/** @brief Compute atmega FLASH firmware CRC
  * @return computed firmware CRC 
  */
uint8_t adns6010_computeFirmwareCRC(void);

/** @brief Check atmega FLASH firmware
  * @return 0 - check fail, 1 - check pass
  */
uint8_t adns6010_checkFirmware(void);  

/** @brief Check SPI communication between ATMEGA and ADNS6010
  * @return error code
  */
uint8_t adns6010_checkSPI(void);


#endif/*_ADNS6010_H_*/
