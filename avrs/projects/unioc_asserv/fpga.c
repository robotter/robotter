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
#include <aversive/error.h>
#include <aversive/wait.h>
#include <stdio.h>

#include "fpga.h"
#include "settings.h"

void fpga_init()
{
  sbi(FPGA_RESET_DDR,FPGA_RESET_PIN);
  sbi(FPGA_RESET_PORT,FPGA_RESET_PIN);

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

  // FPGA needs time to boot (load flash)
  wait_ms(SETTING_FPGA_BOOTTIME);

  // perform FPGA reset
  fpga_reset();


}

void fpga_reset()
{
  cbi(FPGA_RESET_PORT,FPGA_RESET_PIN);
  wait_ms(10);
  sbi(FPGA_RESET_PORT,FPGA_RESET_PIN);
}

void fpga_test()
{
  uint16_t addrA;
  uint16_t addrB;
 
  NOTICE(0,"Performing FPGA TEST");

  printf("    ");

  for(addrA=0x00;addrA<=0x20;addrA++)
    printf(" %02x",addrA);
  printf("\n");
  for(addrA=0x13;addrA<=0x18;addrA++)
  {
    printf("%04x",addrA*0x100);
    for(addrB=0x00; addrB<=0x20; addrB++)
    {
      printf(" %02x",_SFR_MEM8(addrA*0x100+addrB));
    }
    printf("\n");
  }
}
