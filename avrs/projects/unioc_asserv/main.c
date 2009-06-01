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
#include <aversive/error.h>

#include <stdio.h>
#include <stdlib.h>
#include <uart.h>
#include <math.h>
#include <scheduler.h>
#include <adc.h>
#include <time.h>

#include <adns6010.h>
#include <hposition_manager.h>
#include <hrobot_manager.h>

#include "motor_cs.h"
#include "robot_cs.h"
#include "htrajectory.h"
#include "logging.h"

// log level
extern uint8_t log_level;

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
  // Error configuration
  error_register_emerg(log_event);
  error_register_error(log_event);
  error_register_warning(log_event);
  error_register_notice(log_event);
  error_register_debug(log_event);

  log_level = ERROR_SEVERITY_DEBUG;
  
  //--------------------------------------------------------
  // Initialize scheduler
  scheduler_init();

  //--------------------------------------------------------
  // Initialize time
  time_init(160);

  //--------------------------------------------------------
  // ADNS6010
  //--------------------------------------------------------

  NOTICE(0,"Initializing ADNS6010s");
  adns6010_init();

  NOTICE(0,"Checking ADNS6010s firmware");
  adns6010_checkFirmware();

	// ADNS CONFIGURATION
	adns_config.res = ADNS6010_RES_2000;
	adns_config.shutter = ADNS6010_SHUTTER_ON;
	adns_config.power = 0x11;

  NOTICE(0,"Checking ADNS6010s SPI communication");
  adns6010_checkSPI();

  NOTICE(0,"Booting ADNS6010s");
  adns6010_boot(&adns_config);

  NOTICE(0,"Checking ADNS6010s");
  adns6010_checks();

	NOTICE(0,"ADNS6010s are GO");
  
  //--------------------------------------------------------
  // CS
  //--------------------------------------------------------
  // Initialize robot manager
  NOTICE(0,"Initializing robot manager");
  hrobot_init(&system);
  hrobot_set_motors_accessor(&system, motor_cs_update, NULL);

  // Initialize position manager
  NOTICE(0,"Initializing position manager");
  hposition_init( &position );
  hposition_set( &position, 0.0, 0.0, 0.0 );

  // Initialize control systems for motors
  NOTICE(0,"Initializing motors control systems");
  motor_cs_init();

  // Initialize control systems for robot
  NOTICE(0,"Initializing robot control systems");
  robot_cs_init(&robot_cs);
  robot_cs_set_hrobot_manager(&robot_cs,&system);
  robot_cs_set_hposition_manager(&robot_cs,&position);
  
  // Initialize trajectory management
  NOTICE(0,"Initializing trajectory management");
  htrajectory_init(&trajectory,&robot_cs,&position);
  htrajectory_set_precision(&trajectory,3.0,0.1*M_PI);

  //--------------------------------------------------------

  // Wait for *tirette*
  NOTICE(0,"Waiting for tirette");
  
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
  
  //--------------------------------------------------------

  NOTICE(0,"Initializing ADCs");
  adc_init();

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);

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
      nop();
    wait_ms(100);
    
    htrajectory_goto_xya(&trajectory,0,0,0);
    while(!htrajectory_in_position(&trajectory))
      nop();
    wait_ms(100);
  }

  return 0;
}
