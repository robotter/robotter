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

/** \file comm_fpga.h
  *
  * Manage communication with FPGA on the UNIOC board
  */

#ifndef COMM_FPGA_H
#define COMM_FPGA_H

#include <aversive.h>
#include <avr/sfr_defs.h>
#include "vectors.h"

// Read squal from FPGA
//#define ACCESS_SQUAL

// Define base address in the FPGA mapped memory
#define BASE_IO   0x1300
#define BASE_PWM1 0x1302
#define BASE_PWM2 0x1304
#define BASE_PWM3 0x1306
#define BASE_CO1  0x1308
#define BASE_CO2  0x1310
#define BASE_CO3  0x1318

// 8 bits for IO configuration register
#define REG_IO  _SFR_MEM8(BASE_IO)

// 16 bits for PWMs
#define REG_PWM1  _SFR_MEM16(BASE_PWM1)
#define REG_PWM2  _SFR_MEM16(BASE_PWM2)
#define REG_PWM3  _SFR_MEM16(BASE_PWM3)

// 16 bits for sensor 1
#define REG_CO1_X _SFR_MEM16(BASE_CO1)
#define REG_CO1_Y _SFR_MEM16(BASE_CO1+2)
#define REG_CO1_S _SFR_MEM8(BASE_CO1+4)

// 16 bits for sensor 2
#define REG_CO2_X _SFR_MEM16(BASE_CO2)
#define REG_CO2_Y _SFR_MEM16(BASE_CO2+2)
#define REG_CO2_S _SFR_MEM8(BASE_CO2+4)

// 16 bits for sensor 3
#define REG_CO3_X _SFR_MEM16(BASE_CO3)
#define REG_CO3_Y _SFR_MEM16(BASE_CO3+2)
#define REG_CO3_S _SFR_MEM8(BASE_CO3+4)


/** \brief Initialize FPGA communication */
void commfpga_init(void);

/** \brief Get COn encoders value */
void commfpga_get_CO1(void*, vxys_t*);
void commfpga_get_CO2(void*, vxys_t*);
void commfpga_get_CO3(void*, vxys_t*);

/** \brief Set motor Mn PWM */
void commfpga_set_M1(void*,int32_t);
void commfpga_set_M2(void*,int32_t);
void commfpga_set_M3(void*,int32_t);


#endif/*COMM_FPGA_H*/
