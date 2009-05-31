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

#include <aversive.h>
#include <aversive/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <uart.h>
#include <math.h>
#include <scheduler.h>
#include <adc.h>

#include <adns6010.h>
#include <hposition_manager.h>
#include <hrobot_manager.h>

#include "motor_cs.h"
#include "robot_cs.h"
#include "htrajectory.h"


int color = 1; // 1 => GREEN -1 => RED

uint8_t RDS_got_it(uint8_t mode)
{
  int16_t g1,g2,g3;
  int val = 0;

  g1 = adc_get_value(MUX_ADC2|ADC_REF_AVCC); 
  if(color==-1)
  {
    g2 = adc_get_value(MUX_ADC3|ADC_REF_AVCC); 
    g3 = adc_get_value(MUX_ADC0|ADC_REF_AVCC); 
  }
  else
  {
    g3 = adc_get_value(MUX_ADC3|ADC_REF_AVCC); 
    g2 = adc_get_value(MUX_ADC0|ADC_REF_AVCC); 
  }


  if(mode&0x01)
  {
    if(g1 > 600)
      val = 1;
  }

  if(mode&0x02)
  {
    if(g2 > 400)
      val = 1;
  }

  if(mode&0x04)
  {
    if(g3 > 400)
      val = 1;
  }
    
  return val;
}

int main(void)
{
  uint8_t rv = 0x00;

	// ADNS configuration
	adns6010_configuration_t adns_config;

  // Robot position
  hrobot_position_t position;

  // Robot system
  hrobot_system_t system;

  // Robot control systems
  robot_cs_t robot_cs;

  // Trajectory management
  htrajectory_t trajectory;

	//--------------------------------------------------------------------------
	// Booting

  // Turn interruptions ON
  sei();

  // Initialize UART
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);

  // Some advertisment :p
  printf("\n\n# Robotter 2009 - Galipeur - UNIOC POSITION TEST\n");
  printf("# Compiled "__DATE__" at "__TIME__"\n\n");


  //--------------------------------------------------------
  // Reboot FPGA
/* XXX DOESNOTWORK XXX
  sbi(DDRE,6);

  // pull reset low
  cbi(PORTE,6);
  
  wait_ms(10);

  // pull reset high
  sbi(PORTE,6);
*/

  //--------------------------------------------------------
  // Initialize ADNS6010s
  printf("# Initializing ADNS6010s : ");
  adns6010_init();
  printf("# OK\n");

  //--------------------------------------------------------
  // Shut down LED
  _SFR_MEM8(0x1800) = 1;
  
  //--------------------------------------------------------
  
  printf("# Checking ADNS6010 firmware on FLASH : ");
  rv = adns6010_checkFirmware();

  if(!rv)
  {
    printf("# KO -- Firmware stored on ATMEGA FLASH is not valid\n");

    // It's a trap !
    while(1);
  }
  printf("# OK\n");

	// ADNS CONFIGURATION
	adns_config.res = ADNS6010_RES_2000;
	adns_config.shutter = ADNS6010_SHUTTER_ON;
	adns_config.power = 0x11;

  //--------------------------------------------------------

  wait_ms(100);

  printf("# Checking SPI communication with ADNS6010s : ");
  rv = adns6010_checkSPI();

  if(rv)
  {
    printf("# KO -- adns6010_checkSPI() returned 0x%2.2X",rv);
    
    // It's a trap !
    while(1);
  }
  printf("# OK\n");

  //--------------------------------------------------------

  // Launch ADNS6010s boot sequence
  printf("# Booting ADNS6010s : ");
  rv = adns6010_boot(&adns_config);

  if(rv)
  {
    printf("# KO -- adns6010_boot() returned 0x%X\n",rv);

    // It's a trap !
    while(1);
  }
  printf("# OK\n");

  //--------------------------------------------------------

  printf("# Checking ADNS6010s : ");
  rv = adns6010_checks();

  if(rv)
  {
    printf("# KO -- adns6010_checks() returned 0x%X\n",rv);

    // It's a trap !
    while(1);
  }
  printf("# OK\n");

	printf("# ADNS6010s are GO\n\n");
  
  //--------------------------------------------------------

  //--------------------------------------------------------
  // Initialize robot manager
  printf("# Initializing robot manager : ");
  hrobot_init(&system);
  hrobot_set_motors_accessor(&system, motor_cs_update, NULL);
  printf("# OK\n");

  printf("# Robot manager is GO\n\n");
  //--------------------------------------------------------

  //--------------------------------------------------------
  // Initialize position manager
  printf("# Initializing position manager : ");
  hposition_init( &position );
  hposition_set( &position, 0.0, 0.0, 0.0 );
  printf("# OK\n");

  printf("# Position manager is GO\n\n");
  //--------------------------------------------------------

  //--------------------------------------------------------
  // Initialize control systems for motors
  printf("# Initializing motors control systems : ");
  motor_cs_init();
  printf("# OK\n");

  // Initialize control systems for robot
  printf("# Initializing robot control systems : ");
  robot_cs_init(&robot_cs);
  robot_cs_set_hrobot_manager(&robot_cs,&system);
  robot_cs_set_hposition_manager(&robot_cs,&position);
  printf("# OK\n");
  
  printf("# Control systems are GO\n\n");
  //--------------------------------------------------------

  //--------------------------------------------------------
  // Initialize trajectory management
  printf("# Initializing trajectory management : ");
  htrajectory_init(&trajectory,&robot_cs,&position);
  htrajectory_set_precision(&trajectory,3.0,0.1*M_PI);
  printf("# OK\n");
  //--------------------------------------------------------

  // Ready up
  printf("# All systems GO.\n\n");


  //------------------------------------------------------------
  // Acquire robot color
  printf("# Robot color is : ");
  
  // pink   -> GND
  // grey   -> 3v3
  sbi(DDRE,7);
  sbi(PORTE,7);

  // yellow -> ?
  cbi(DDRE,5);
    
  if(PINE&(1<<5))
  {
    printf("GREEN");
    color = 1;
  }
  else
  {
    printf("RED");
    color = -1;
  }
  
  printf("\n");

  //------------------------------------------------------------
  // Wait for *tirette*
  printf("# Waiting for tirette...\n");
  
  // tirette to Z
  cbi(DDRF,1);
  cbi(PORTF,1);
  int tircpt=0;
  uint8_t twilite=0;
  while(1)
  {
    if(PINF&0x02)
      tircpt++;
    else
      tircpt=0;
    
    if(tircpt>2) break;

    // info
    _SFR_MEM8(0x1800) = twilite;
    twilite = !twilite;
    wait_ms(100);
  }
  
  // switch led off
  _SFR_MEM8(0x1800) = 0;

  printf("# GO !\n");

  //--------------------------------------------------------------------------
  // Initializing ADCs
  printf("# Initializing ADCs : ");
  adc_init();
  printf("OK\n");
  //--------------------------------------------------------------------------

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);

  // initialize scheduler
  scheduler_init();

  // Fire up position management
  scheduler_add_periodical_event_priority(&hposition_update, &position,
                                            400, 50);

  // Unleash control systems
  scheduler_add_periodical_event_priority(&robot_cs_update, &robot_cs,
                                            10,100);

  // remove break
  motor_cs_break(0);

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------

  while(1)
  {
    htrajectory_goto_xya(&trajectory,0,300,0);
    while(!htrajectory_in_position(&trajectory))
    {
      if(RDS_got_it(1))
        robot_cs.active = 0;
      else
        robot_cs.active = 1;
    }
    wait_ms(100);
    
    printf("step 1\n");
    htrajectory_goto_xya(&trajectory,0,0,0);
    while(!htrajectory_in_position(&trajectory))
    {
      if(RDS_got_it(1))
        robot_cs.active = 0;
      else
        robot_cs.active = 1;
    }
    wait_ms(100);
  }

  while(1) nop();
  //--------------------------------------------------------------------

  printf("step 0\n");
  htrajectory_goto_xya(&trajectory,color*450,-180,0);
  while(!htrajectory_in_position(&trajectory))
  {
    if(RDS_got_it(1))
      robot_cs.active = 0;
    else
      robot_cs.active = 1;
  }
  wait_ms(100);
  
  printf("step 1\n");
  htrajectory_goto_xya(&trajectory,color*450,-300,0);
  while(!htrajectory_in_position(&trajectory))
  {
    if(RDS_got_it(1))
      robot_cs.active = 0;
    else
      robot_cs.active = 1;
  }
  wait_ms(100);

  printf("step 2\n");
  htrajectory_goto_xya(&trajectory,color*130,-400,0);
  while(!htrajectory_in_position(&trajectory))
  {
    if(RDS_got_it(0x01|0x04))
      robot_cs.active = 0;
    else
      robot_cs.active = 1;
  }
  wait_ms(100);

  printf("step 3A\n");
  htrajectory_goto_xya(&trajectory,color*130,-1300,0);
  while(!htrajectory_in_position(&trajectory))
  {
    if(RDS_got_it(1))
      robot_cs.active = 0;
    else
      robot_cs.active = 1;
  }
  wait_ms(100);

  printf("step 3B\n");
  htrajectory_goto_xya(&trajectory,color*400,-1500,0);
  while(!htrajectory_in_position(&trajectory))
  {
    if(RDS_got_it(1))
      robot_cs.active = 0;
    else
      robot_cs.active = 1;
  }
  wait_ms(100);


  printf("step 4\n");
  htrajectory_goto_xya(&trajectory,color*700,-1500,0);
  while(!htrajectory_in_position(&trajectory))
  {
    if(RDS_got_it(0x01|0x02))
      robot_cs.active = 0;
    else
      robot_cs.active = 1;
  }
  wait_ms(100);

  printf("step 5\n");
  htrajectory_goto_xya(&trajectory,color*700,-1900,0);
  wait_ms(500);

  printf("step 6\n");
  htrajectory_goto_xya(&trajectory,color*700,-1400,0);
  while(!htrajectory_in_position(&trajectory))
  {
    if(RDS_got_it(0x02|0x04))
      robot_cs.active = 0;
    else
      robot_cs.active = 1;
  }
  wait_ms(100);

  printf("step 7\n");
  motor_cs_break(1);

  while(1) nop();
  return 0;
}
