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

#include "fpga.h"
#include "cs.h"
#include "motor_cs.h"
#include "robot_cs.h"
#include "htrajectory.h"
#include "logging.h"
#include "cli.h"

// error code
#define MAIN_ERROR 0x30

//-----

void manual_control(void);
void safe_key_pressed(void* dummy);

//-----

// log level
extern uint8_t log_level;

// trajectory management 
// XXX TBMoved to a strat dedicated source file
extern htrajectory_t trajectory;

// manual control
// XXX TBMoved to a manual control dedicated source file
extern robot_cs_t robot_cs;

// scheduler events
uint8_t event_position;
uint8_t event_cs;

int main(void)
{
  uint8_t tirette = 0;

  // ADNS configuration
  adns6010_configuration_t adns_config;

  //--------------------------------------------------------------------------
  // Booting

  // Turn interruptions ON
  sei();

  // Initialize UART
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);

  //--------------------------------------------------------
  // Error configuration
  error_register_emerg(log_event);
  error_register_error(log_event);
  error_register_warning(log_event);
  error_register_notice(log_event);
  error_register_debug(log_event);

  //log_level = ERROR_SEVERITY_NOTICE;
  log_level = ERROR_SEVERITY_DEBUG;

  // Clear screen
  printf("%c[2J",0x1B);
  printf("%c[0;0H",0x1B);

  // Some advertisment :p
  NOTICE(0,"Robotter 2009 - Galipeur - UNIOC-NG PROPULSION");
  NOTICE(0,"Compiled "__DATE__" at "__TIME__".");

  //--------------------------------------------------------
  // Initialize scheduler
  scheduler_init();

  //--------------------------------------------------------
  // Initialize time
  time_init(160);

  //--------------------------------------------------------
  // Initialize FPGA
  fpga_init();

  // turn off led
  _SFR_MEM8(0x1800) = 1;

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

  NOTICE(0,"Initializing CS");
  cs_initialize();

  //--------------------------------------------------------

  NOTICE(0,"Initializing ADCs");
  adc_init();
  
  // For ploting purposes
  NOTICE(0,"<PLOTMARK>");

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);

  // Unleash control systems
  event_cs = 
    scheduler_add_periodical_event_priority(&cs_update, NULL, 25,100);

  // Safe key event
  scheduler_add_periodical_event_priority(&safe_key_pressed, NULL, 100, 50);

  // remove break
  motor_cs_break(0);

  //----------------------------------------------------------------------

  // Set CS speeds
  htrajectory_set_xy_speed(&trajectory, 2000, 25);
  htrajectory_set_a_speed(&trajectory, 500, 10);
  htrajectory_set_realign_speed(&trajectory, 2500);

  NOTICE(0,"Strike 'c' for manual control / 'x' to reboot / any other key to go");
 
  uint8_t c;
  while(!tirette)
  {
    c = cli_getkey();
    
    if(c == 'x')
      EMERG(MAIN_ERROR,"safe key 'x' pressed");
  
    if(c == 'c')
      manual_control();
    
    if(c != -1)
      break;
  }

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------
  
  NOTICE(0,"Go");

  while(1) nop();

  htrajectory_realign(&trajectory, RV_YPLUS, 0);
  htrajectory_goto_xya_wait(&trajectory, -1300, 300, 0);

  NOTICE(0,"Done");
  while(1);

  return 0;
}

void manual_control(void)
{
  uint8_t key;
  double x = 0.0;
  double y = 0.0;
  double a = 0.0;

  NOTICE(0,"Entering manual control");

  while(1)
  {
    key = cli_getkey();

    if(key=='x')
      EMERG(MAIN_ERROR,"safe key 'x' pressed");

    switch(key)
    {
      case 'z':
        x=0.0; y=0.0; a=0.0;
        break;

      case 'j':
        x-=10.0;
        break;

      case 'l':
        x+=10.0;
        break;

      case 'k':
        y-=10.0;
        break;

      case 'i':
        y+=10.0;
        break;

      case 'u':
        a+=0.05*M_PI;
        break;

      case 'o':
        a-=0.05*M_PI;
        break;
    }

    NOTICE(0,"manual control : (%2.2f, %2.2f, %2.2f)",x,y,a);

    robot_cs_set_consigns(&robot_cs, x*RCS_MM_TO_CSUNIT,
                                    y*RCS_MM_TO_CSUNIT,
                                    a*RCS_RAD_TO_CSUNIT);


  } 
}

void safe_key_pressed(void* dummy)
{
  if(cli_getkey_nowait() == 'x') 
    EMERG(MAIN_ERROR,"safe key 'x' pressed");
}
