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

#include <adns6010.h>
#include <hposition_manager.h>
#include <hrobot_manager.h>

#include "motor_cs.h"
#include "robot_cs.h"

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

	//--------------------------------------------------------------------------
	// Booting

  // Turn interruptions ON
  sei();

  // Initialize UART
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);

  // Some advertisment :p
  printf("\n\n# Robotter 2009 - 102chute - UNIOC POSITION TEST\n");
  printf("# Compiled "__DATE__" at "__TIME__"\n\n");


  //--------------------------------------------------------
  // Initialize ADNS6010s
  printf("# Initializing ADNS6010s : ");
  adns6010_init();
  printf("# OK\n");

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

  printf("# Initializing robot control systems : ");
  robot_cs_init(&robot_cs);
  robot_cs_set_hrobot_manager(&robot_cs,&system);
  robot_cs_set_hposition_manager(&robot_cs,&position);
  printf("# OK\n");
  
  printf("# Control systems are GO\n\n");
  //--------------------------------------------------------

  // Ready up
  printf("# All systems GO.\n\n");

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);


  // initialize scheduler
  scheduler_init();

  // Fire up position management
  scheduler_add_periodical_event_priority(&hposition_update, &position,
                                            400, 50);

  // Unleash control systems
  scheduler_add_periodical_event_priority(&robot_cs_update, &robot_cs,
                                            40, 100);

  // remove break
  motor_cs_break(0);

  double t=0;
  int32_t pwm;

  robot_cs_set_update(&robot_cs_update, 0, 0, 500);

  while(1)
  {
 /* 
    printf("%f %f %f\n",
            position.position.x,
            position.position.y,
            position.position.alpha);
*/
    wait_ms(100);            
  }

  return 0;
}
