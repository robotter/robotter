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
#include <avr/pgmspace.h>

#include <stdio.h>
#include <stdlib.h>
#include <uart.h>
#include <math.h>
#include <scheduler.h>
#include <adc.h>
#include <time.h>

#include <adns6010.h>

#include "fpga.h"
#include "motor.h"
#include "logging.h"
#include "cli.h"

// error code
#define MAIN_ERROR 0x30

#define N 20
//-----

typedef struct 
{ 
  int32_t adns[6];
  uint8_t squals[3];
  uint8_t padding;// Holy padding, pray for us
  int16_t compass;
  int16_t pwm[3];
  int32_t heds[3];

}output_t;

uint8_t state[3] = {0,0,0};
int16_t delay[3] = {0,0,0};

PROGMEM int16_t pwm_delay[3][N] =
{
{3,1,5,6,7,9,2,8,7,10,9,2,6,7,4,8,7,1,1,6},
{10,5,8,5,5,10,6,2,8,9,4,6,10,8,8,7,7,9,8,2},
{9,2,10,6,5,2,2,4,10,6,1,6,7,4,8,1,10,6,6,10}
};

PROGMEM int16_t pwm_inc[3][N] =
{
{59,16,51,-32,13,80,31,25,4,74,60,2,68,-52,-74,11,14,-26,-5,2},
{61,-95,13,73,-85,62,69,-39,37,-61,-72,-38,-26,-63,74,78,5,-1,-81,43},
{-35,22,-32,97,-72,99,-54,22,-43,66,79,-31,38,16,-94,80,15,-14,-48,40}
};


// log level
extern uint8_t log_level;

// scheduler events
uint8_t event_cs;


void cs_update(void* dummy);

extern int16_t pwm_1,pwm_2,pwm_3;

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

  log_level = ERROR_SEVERITY_NOTICE;
  //log_level = ERROR_SEVERITY_DEBUG;

  // Clear screen
  printf("%c[2J",0x1B);
  printf("%c[0;0H",0x1B);

  // Some advertisment :p
  NOTICE(0,"Robotter 2009 - Galipeur - UNIOC-NG IDENTIFICATION MEASUREMENT");
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

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);

  sbi(DDRD,1);
  cbi(PORTD,1);

  printf("DATA\n");

  // init motors
  motor_cs_init();

  // remove break
  motor_cs_break(0);

  // Unleash control systems
  event_cs = 
    scheduler_add_periodical_event_priority(&cs_update, NULL, 53,100);

   //----------------------------------------------------------------------
  while(1);

  return 0;
}

void cs_update(void* dummy)
{
  sbi(PORTD,1);

  output_t out;

  adns6010_encoders_t adns6010;

  adns6010_encoders_get_value(&adns6010);

  out.adns[0] = adns6010.vectors[0];
  out.adns[1] = adns6010.vectors[1];
  out.adns[2] = adns6010.vectors[2];
  out.adns[3] = adns6010.vectors[3];
  out.adns[4] = adns6010.vectors[4];
  out.adns[5] = adns6010.vectors[5];

  out.squals[0] = adns6010.squals[0];
  out.squals[1] = adns6010.squals[1];
  out.squals[2] = adns6010.squals[2];
  
  //compass
  out.compass = _SFR_MEM16(0x1700);
        
  out.pwm[0] = pwm_1;
  out.pwm[1] = pwm_2;
  out.pwm[2] = pwm_3;

  out.heds[0] = _SFR_MEM32(MOTOR_CS_ENCODER1_ADDR);
  out.heds[1] = _SFR_MEM32(MOTOR_CS_ENCODER2_ADDR);
  out.heds[2] = _SFR_MEM32(MOTOR_CS_ENCODER3_ADDR);

  uint8_t i;
  for(i=0;i<sizeof(output_t);i++)
  {
    uart_send(1,((char*)&out)[i]);
  }

  uint8_t k;
  int16_t inc;
  for(k=0;k<3;k++)
  {

      if(delay[k] <= 0)
      {
        if(state[k] == N-1)
        {
          scheduler_del_event(event_cs);
          motor_cs_break(1);
          return;
        }
          
        state[k]++;

        delay[k] = pgm_read_word(&pwm_delay[k][state[k]]);

      }//if delay[k] == 0


      inc = pgm_read_word(&pwm_inc[k][state[k]]);

      if(k==0)
        set_pwm_motor1(NULL,pwm_1+inc);

      if(k==1)
        set_pwm_motor2(NULL,pwm_2+inc);

      if(k==2)
        set_pwm_motor3(NULL,pwm_3+inc);
      
      delay[k]--;
  }
   
  cbi(PORTD,1);
}
