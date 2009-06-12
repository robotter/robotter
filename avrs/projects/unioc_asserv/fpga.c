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

/** \file fpga.c
  * \author JD
  */

#include <aversive.h>
#include <aversive/wait.h>
#include "fpga.h"

void fpga_init()
{
  // Initialize external memory over FPGA

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
  wait_ms(1000);

}

void fpga_reset()
{
  // TODO 
}
