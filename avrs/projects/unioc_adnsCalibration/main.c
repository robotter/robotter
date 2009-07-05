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

#include "cs.h"
#include "compass.h"
#include "motor_cs.h"
#include "fpga.h"
#include "logging.h"
#include "cli.h"

// error code
#define MAIN_ERROR 0x30

//-----

void line_calibration(int);
void angle_calibration(int);
void setmotors_course(double,int);
void setmotors_rotation(int);
void safe_key_pressed(void* dummy);

//-----

// log level
extern uint8_t log_level;

uint8_t event_cs;

extern volatile int32_t cs_vx,cs_vy,cs_omega;
extern compass_t compass;

adns6010_encoders_t adns_zero;

double robot_angle = 0.0;

double calibration_data[12][6];
double calibration_data_compass[12];

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
  NOTICE(0,"Robotter 2009 - Galipeur - UNIOC-NG ADNS6010 CALIBRATION");
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

  NOTICE(0,"Initializing ADCs");
  adc_init();
  
 
  // For ploting purposes
  NOTICE(0,"<PLOTMARK>");

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);

  // Safe key event
  scheduler_add_periodical_event_priority(&safe_key_pressed, NULL, 100, 50);

  //----------------------------------------------------------------------

  NOTICE(0,"Any key to go");
  
  char cal_name = 'x';
  uint8_t c;
  while(1)
  {
    c = cli_getkey();

    if(c != -1)
      break;
  }

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------
  
  int i,k;

  NOTICE(0,"Go");

  // Initialize control systems
  cs_initialize();

  cs_vx=0;
  cs_vy=0;
  cs_omega=0;

// remove break
  motor_cs_break(0);

  event_cs =  
    scheduler_add_periodical_event_priority(&cs_update, NULL, 25, 100);


  NOTICE(0,"Press 'l' for line calibration / 'a' for angle calibration");
  c = cli_getkey();
  

  //-----------------------------------------------------------------------------
  // LINE CALIBRATION
  //-----------------------------------------------------------------------------
  if( c=='l')
  {
    NOTICE(0,"Direction : '1' <- 0 ; '2' <- 2Pi/3 ; '3' <- 4Pi/3");
    c = cli_getkey();

    switch(c)
    {
      case '1': cal_name = 'A'; robot_angle = 0; break;
      case '2': cal_name = 'B'; robot_angle = -2*M_PI/3; break;
      case '3': cal_name = 'C'; robot_angle = -4*M_PI/3; break;
      default : cal_name = 'A'; robot_angle = 0; break;
    }

    NOTICE(0,"ADNS ZERO : Place robot in position zero then press a key");
    setmotors_course(robot_angle, 0);
    while(!cli_getkey());
    
    adns6010_encoders_get_value(&adns_zero);

    wait_ms(200);

    NOTICE(0,"ADNS zero values = (%ld,%ld,%ld,%ld,%ld,%ld)",
              adns_zero.vectors[0],adns_zero.vectors[1],adns_zero.vectors[2],
              adns_zero.vectors[3],adns_zero.vectors[4],adns_zero.vectors[5]);

    NOTICE(0,"P(init), press a key to continue");
    while(!cli_getkey());

    cs_vx=0;
    cs_vy=0;
    cs_omega=0;


    // perform calibration, positive direction
    line_calibration(1);

    NOTICE(0,"ADNS ZERO : Place robot in position zero then press a key");
    setmotors_course(robot_angle, 0);
    while(!cli_getkey());

    adns6010_encoders_get_value(&adns_zero);

    wait_ms(200);

    NOTICE(0,"ADNS zero values = (%ld,%ld,%ld,%ld,%ld,%ld)",
              adns_zero.vectors[0],adns_zero.vectors[1],adns_zero.vectors[2],
              adns_zero.vectors[3],adns_zero.vectors[4],adns_zero.vectors[5]);

    NOTICE(0,"P(init), press a key to continue");
    while(!cli_getkey());

    // perform calibration, negative direction
    line_calibration(-1);


    // output calibration data

    NOTICE(0,"CALIBRATION DONE, printint scilab matrix :");

    printf("%c=[\n",cal_name);
    for(i=0;i<12;i++)
      for(k=0;k<6;k++)
      {
        printf("%7.1f",calibration_data[i][k]);

        if(k==5)
          printf(";\n");
        else
          printf(" ");
      }

    printf("];\n\n");
    
  }

  //-----------------------------------------------------------------------------
  // ANGLE CALIBRATION
  //-----------------------------------------------------------------------------
  if( c=='a' )
  {
    NOTICE(0,"Angle calibration is fully automatic, robot will do approx. 3 turns");
    NOTICE(0,"Press a key to start, calibration will start ~5s after.");
    while(!cli_getkey());

    NOTICE(0,"Starting in 5s...");

    wait_ms(5000);

    angle_calibration(1);
    angle_calibration(-1);

    NOTICE(0,"Angle calibration done, press a key for results matrix : ");
    while(!cli_getkey());

    printf("R=[\n");
    for(i=0;i<12;i++)
      for(k=0;k<6;k++)
      {
        printf("%7.1f",calibration_data[i][k]);

        if(k==5)
          printf(";\n");
        else
          printf(" ");
      }

    printf("];\n\n");

    int i,k;
    for(i=0;i<12;i++)
    {
      printf("u_r%d = [0 0 %7.1f];\n",i,calibration_data_compass[i]);
    }

    printf("// ");
    for(i=0;i<12;i++)
      if(i==11)
        printf("u_r11];\n");
      else
        printf("u_r%d;",i);


  }

  EMERG(0,"Program ended");

	while(1);

  return 0;
}

void setmotors_course(double angle, int advance)
{
  DEBUG(0,"SETMOTORS_COURSE angle=%3.3f advance=%d",angle,advance);
  cs_vx = 900*advance*cos(angle) + 800*sin(angle);
  cs_vy = 900*advance*sin(angle) - 800*cos(angle);
  cs_omega = 0;
  DEBUG(0,"SETMOTORS_COURSE vx=%ld vy=%ld omega=%ld",cs_vx,cs_vy,cs_omega);
}

void setmotors_rotation(int dir)
{
  DEBUG(0,"SETMOTORS_ROTATION dir=%d",dir);
  cs_vx = 0;
  cs_vy = 0;
  cs_omega = 1000*dir;
  DEBUG(0,"SETMOTORS_ROTATION vx=%ld vy=%ld omega=%ld",cs_vx,cs_vy,cs_omega);
}



void angle_calibration(int dir)
{
  adns6010_encoders_t adns_zero;
  adns6010_encoders_t adns_sample;
  double heading;
  int offset;
  int nsamples = 20;
  double samples[6];
  int i,j,k;

  const int16_t timings[6] = { 1000, 1500, 2000, 2500, 3000, 3500};

  // Zero compass
  compass_set_heading_rad(&compass,0.0);

  adns6010_encoders_get_value(&adns_zero);

  NOTICE(0,"ADNS zero values = (%ld,%ld,%ld,%ld,%ld,%ld)",
              adns_zero.vectors[0],adns_zero.vectors[1],adns_zero.vectors[2],
              adns_zero.vectors[3],adns_zero.vectors[4],adns_zero.vectors[5]);


  for(i=0;i<6;i++)
  {
    NOTICE(0,"Robot turns for %d ms",timings[i]);

    setmotors_rotation(dir);
    wait_ms(timings[i]);

    setmotors_rotation(0);
    wait_ms(1000);

    heading = compass_get_heading_rad(&compass);

    for(k=0;k<6;k++)
      samples[k] = 0.0;

    for(j=0;j<nsamples;j++)
    {
      wait_ms(1);
      adns6010_encoders_get_value(&adns_sample);
      for(k=0;k<6;k++)
        samples[k] += adns_sample.vectors[k] - adns_zero.vectors[k];
    }

    offset = (dir<0)?1:0;

    for(k=0;k<6;k++)
    {
      DEBUG(0,"saving cal_data[%d][%d] = %3.3f",i+offset*6,k,samples[k]);
      samples[k] /= nsamples;
      calibration_data[i+offset*6][k] = samples[k];
    }

    calibration_data_compass[i+offset*6] = heading;
    DEBUG(0,"saving cal_data_compass[%d] = %3.3f", i+offset*6, heading);

    NOTICE(0,"ADNS values : (%3.1f,%3.1f,%3.1f,%3.1f,%3.1f,%3.1f) \
COMPASS value (%3.3f)",
            samples[0],samples[1],samples[2],
            samples[3],samples[4],samples[5],
            heading);
  }


}


void line_calibration(int dir)
{
  int i,j,k;
  int offset;
  int nsamples = 20;
  double samples[6];
  adns6010_encoders_t adns_sample;
  for(i=0;i<6;i++)
  {
    setmotors_course(robot_angle, dir);
    wait_ms(1200);

    setmotors_course(robot_angle, 0);
    wait_ms(200);

    for(k=0;k<6;k++)
      samples[k] = 0.0;

    for(j=0;j<nsamples;j++)
    {
      wait_ms(1);
      adns6010_encoders_get_value(&adns_sample);
      for(k=0;k<6;k++)
        samples[k] += adns_sample.vectors[k] - adns_zero.vectors[k];
    }

    offset = (dir<0)?1:0;

    for(k=0;k<6;k++)
    {
      DEBUG(0,"saving cal_data[%d][%d] = %3.3f",i+offset*6,k,samples[k]);
      samples[k] /= nsamples;
      calibration_data[i+offset*6][k] = samples[k];
    }

    NOTICE(0,"ADNS values : (%3.1f,%3.1f,%3.1f,%3.1f,%3.1f,%3.1f)",
            samples[0],samples[1],samples[2],
            samples[3],samples[4],samples[5]);

    NOTICE(0,"P(%d,%d), press a key to continue",dir,i);
    while(!cli_getkey());
  }
}

void safe_key_pressed(void* dummy)
{
  if(cli_getkey_nowait() == 'x') 
    EMERG(MAIN_ERROR,"safe key 'x' pressed");
}
