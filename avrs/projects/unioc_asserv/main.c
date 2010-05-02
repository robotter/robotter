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
#include <i2cs.h>
#include <timer.h>

#include <adns6010.h>

#include "fpga.h"
#include "cs.h"
#include "motor_cs.h"
#include "robot_cs.h"
#include "htrajectory.h"
#include "logging.h"
#include "cli.h"
#include "stratcomm.h"

#include "settings.h"

// error code
#define MAIN_ERROR 0x30

//-----

void safe_key_pressed(void* dummy);

void paddock_manualControl(void);
void paddock_adnsFeedback(void);
void paddock_testCode(void);
void paddock_pwmTest(void);
//-----

// log level
extern uint8_t log_level;

// trajectory management 
// XXX TBMoved to a strat dedicated source file
extern volatile htrajectory_t trajectory;

// manual control
// XXX TBMoved to a manual control dedicated source file
extern robot_cs_t robot_cs;

// XXX 
extern hrobot_position_t position;

// XXX
extern hrobot_system_t system;


// communications
extern stratcomm_t stratcomm;

// CSs cpu usage in percent (0-100)
extern uint8_t cs_cpuUsage;

// scheduler events
uint8_t event_position;
uint8_t event_cs;

int main(void)
{
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
  NOTICE(0,"Robotter 2010 - Galipeur - UNIOC-NG PROPULSION");
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

  #ifdef SETTING_OVERRIDE_ADNSBOOT
  WARNING(MAIN_ERROR, "ADNS6010 BOOT OVERRIDE");
  #else
  NOTICE(0,"Initializing ADNS6010s");
  adns6010_init();

  NOTICE(0,"Checking ADNS6010s firmware");
  adns6010_checkFirmware();

  // ADNS CONFIGURATION
  adns_config.res = SETTING_ADNS_RESOLUTION;
  adns_config.shutter = SETTING_ADNS_SHUTTER;
  adns_config.power = SETTING_ADNS_POWER;

  NOTICE(0,"Checking ADNS6010s SPI communication");
  adns6010_checkSPI();

  NOTICE(0,"Booting ADNS6010s");
  adns6010_boot(&adns_config);

  NOTICE(0,"Checking ADNS6010s");
  adns6010_checks();

  NOTICE(0,"ADNS6010s are GO");
  #endif//SETTING_OVERRIDE_ADNSBOOT

  //--------------------------------------------------------
  // CS
  //--------------------------------------------------------

  NOTICE(0,"Initializing CS");
  cs_initialize();

  //--------------------------------------------------------
  // MISC
  //--------------------------------------------------------

  NOTICE(0,"Initializing TIMER3");
  timer_init();

  NOTICE(0,"Initializing ADCs");
  adc_init();
 
  NOTICE(0,"Initializing I2C slave");
  i2cs_init(SETTING_I2C_ADDRESS);
 
  NOTICE(0,"Initializing communications");
  stratcomm_init(&stratcomm);

  //--------------------------------------------------------


  // For ploting purposes
  NOTICE(0,"<PLOTMARK>");

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);

  // Unleash control systems

  event_cs = 
    scheduler_add_periodical_event_priority(&cs_update, NULL,
                                              SETTING_SCHED_CS_PERIOD,
                                              SETTING_SCHED_CS_PRIORITY);

  // Safe key event
  scheduler_add_periodical_event_priority(&safe_key_pressed, NULL,
                                              SETTING_SCHED_SAFEKEY_PERIOD,
                                              SETTING_SCHED_SAFEKEY_PRIORITY);

  // remove break
  motor_cs_break(0);

  //----------------------------------------------------------------------

  NOTICE(0,"Strike 'x' to reboot / 'c' manual control / 'a' ADNS test / 'p' PWM test / 't' test code / any other key to go");
 
  uint8_t c;
  while(1)
  {
    c = cli_getkey();
    
    if(c == 'x')
      EMERG(MAIN_ERROR,"safe key 'x' pressed");
  
    if(c == 'c')
      paddock_manualControl();
    
    if(c == 'a')
      paddock_adnsFeedback();

    if(c == 't')
      paddock_testCode();

    if(c == 'p')
      paddock_pwmTest();

    if(c != -1)
      break;
  }

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------
  
  NOTICE(0,"Go");
 
  NOTICE(0,"Done");
  while(1);

  return 0;
}

void paddock_testCode(void)
{
  NOTICE(0, "Entering TEST CODE");


  while(1) nop();
}

void paddock_adnsFeedback(void)
{
  adns6010_encoders_t adns6010;

  NOTICE(0, "Entering ANDS feedback mode");

  // breaking motors
  motor_cs_break(1);
  scheduler_del_event(event_cs);

  while(1)
  {
    adns6010_encoders_get_value(&adns6010);
    
    NOTICE(0,"ADNS 0x%2.2x | %6ld %6ld %6ld %6ld %6ld %6ld | %d %d %d",
              adns6010.fault,
              adns6010.vectors[0],
              adns6010.vectors[1],
              adns6010.vectors[2],
              adns6010.vectors[3],
              adns6010.vectors[4],
              adns6010.vectors[5],
              adns6010.squals[0],
              adns6010.squals[1],
              adns6010.squals[2]);
  }
}

void paddock_manualControl(void)
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

    robot_cs_set_xy_consigns(&robot_cs, x*RCS_MM_TO_CSUNIT,
                                        y*RCS_MM_TO_CSUNIT);

    robot_cs_set_a_consign(&robot_cs, a*RCS_RAD_TO_CSUNIT);


  } 
}

void paddock_pwmTest(void)
{
  uint8_t key;
  int32_t pwm1 = 0;
  int32_t pwm2 = 0;
  int32_t pwm3 = 0;
  
  NOTICE(0,"Entering PWM test mode");

  // kill CSs
  scheduler_del_event(event_cs);

  NOTICE(0,"PWM1 +/- : i/k | PWM2 +/- : o/l | PWM3 +/- : p/m | zero all : z");

  while(1)
  {
    key = cli_getkey();

    if(key=='x')
      EMERG(MAIN_ERROR,"safe key 'x' pressed");
    
    switch(key)
    {
      case 'i': 
        pwm1 += SETTING_PADDOCK_PWMTEST_INC;
        break;
        
      case 'k':
        pwm1 -= SETTING_PADDOCK_PWMTEST_INC;
        break;

      case 'o':
        pwm2 += SETTING_PADDOCK_PWMTEST_INC;
        break;

      case 'l':
        pwm2 -= SETTING_PADDOCK_PWMTEST_INC;
        break;

      case 'p':
        pwm3 += SETTING_PADDOCK_PWMTEST_INC;
        break;

      case 'm':
        pwm3 -= SETTING_PADDOCK_PWMTEST_INC;
        break;

      case 'z': 
        pwm1 = 0;
        pwm2 = 0;
        pwm3 = 0;
        break;
    }

    NOTICE(0,"PWM1=%5ld PWM2=%5ld PWM3=%5ld",pwm1,pwm2,pwm3);
    
    set_pwm_motor1(NULL, pwm1);
    set_pwm_motor2(NULL, pwm2);
    set_pwm_motor3(NULL, pwm3);
  }

  while(1) nop();
}

void safe_key_pressed(void* dummy)
{
  if(cli_getkey_nowait() == 'x') 
    EMERG(MAIN_ERROR,"safe key 'x' pressed");
}
