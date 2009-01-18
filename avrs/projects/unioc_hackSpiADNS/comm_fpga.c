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

/** \file comm_fpga.c
  *
  * Manage communication with FPGA on the UNIOC board
  */

#include "comm_fpga.h"

#include <aversive/wait.h>

void commfpga_init()
{
  // enable ATmega external SRAM operation
  sbi(MCUCR,SRE);

  // set low timings on SRAM
  sbi(MCUCR,SRW10);
  sbi(XMCRA,SRW11);
  sbi(XMCRA,SRW00);
  sbi(XMCRA,SRW01);

  sbi(XMCRA,SRL0);
  sbi(XMCRA,SRL1);
  sbi(XMCRA,SRL2);

  // FPGA need some time to boot
  wait_ms(400);
}

void commfpga_get_CO1(void* d, vxys_t* v)
{
  v->x = (int16_t)REG_CO1_X;
  v->y = (int16_t)REG_CO1_Y;
#ifdef ACCESS_SQUAL
  v->s = (int8_t)REG_CO1_S;
#else
  v->s = 0;
#endif
}

void commfpga_get_CO2(void* d, vxys_t* v)
{
  v->x = (int16_t)REG_CO2_X;
  v->y = (int16_t)REG_CO2_Y;
#ifdef ACCESS_SQUAL
  v->s = (int8_t)REG_CO2_S;
#else
  v->s = 0;
#endif
}

void commfpga_get_CO3(void* d, vxys_t* v)
{
  v->x = (int16_t)REG_CO3_X;
  v->y = (int16_t)REG_CO3_Y;
#ifdef ACCESS_SQUAL
  v->s = (int8_t)REG_CO3_S;
#else
  v->s = 0;
#endif
}

void commfpga_set_M1(void* d,int32_t v)
{
  REG_PWM1 = (int16_t)v;
}

void commfpga_set_M2(void* d,int32_t v)
{
  REG_PWM2 = (int16_t)v;
}

void commfpga_set_M3(void* d,int32_t v)
{
  REG_PWM3 = (int16_t)v;
}

