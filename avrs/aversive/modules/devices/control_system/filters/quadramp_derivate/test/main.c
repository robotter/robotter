/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2005)
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
 *
 *  Revision : $Id: main.c,v 1.2 2007-03-04 13:53:46 zer0 Exp $
 *
 */
 
#include <avr/io.h>
#include <wait.h>
#include <utils.h>

#include <brushless.h>
#include <biquad.h>

#include <pwm.h>



#include <uart.h>
#include <stdio.h>
#include <aversive_pgmspace.h>




#include <pid.h>
#include <control_system_manager.h>
#include <quadramp_derivate.h>



struct cs                          speed;
struct pid_filter                  speed_pid;
struct biquad_filter               speed_derivation;


struct cs                          position;
struct quadramp_derivate_filter    position_quadr_derv;



// periodical 10ms execution
void asserv_rapide_manage(brushless data_moteur)
{

	cs_manage(&position);
  
	cs_manage(&speed);
  
  
  
	// for debug graphs
	printf_P(PSTR("C%lip%liP%liv%liV%li\n"), position.consign_value, brushless_get_pos((void*)0), position_quadr_derv.pivot + position.consign_value
		 , brushless_get_speed((void*)0), speed.consign_value);
  
	//printf_P(PSTR("i%lio%liv%li\n"), speed_pid.prev_in, speed_pid.prev_out,  vitesse);
}


int main(void)
{


  
  // init motors and PWMs
  brushless_init();


  // enable power bridges
  sbi(DDRG, 1);
  sbi(PORTG, 1);
  
  
  // init uart
  uart_init();
  fdevopen((void *)uart0_send,NULL,0);

  
  
  //printf_P(PSTR("\nbonjour\n"));
  
  
  
  /** replaces the scheduler. This is directly derived from the interrupt which runs the brushless motors, for convenience */
  brushless_0_register_periodic_event(asserv_rapide_manage); // 10 ms
  
  
  
  /** speed PID stuff */
  
  // PID
  pid_init(&speed_pid);
  
  pid_set_gains(&speed_pid,     180, 70, 40); // sur alim
  
  pid_set_maximums(&speed_pid,  0, 80, PWM_MAX*4/5);
  pid_set_out_shift(&speed_pid, 0);
  
  // derivation (This could alternatively be skipped if we use the brushless peed info directly)
  biquad_init(&speed_derivation);
  biquad_set_numerator_coeffs(&speed_derivation, 1,-1,0); // this is a discrete derivation : O(n) = I(n) - I(n-1)
  // no need to initialize denominator coeffs to 0, init has done it
  
  // control system speed
  cs_init(&speed);
  
  cs_set_correct_filter(&speed, pid_do_filter, &speed_pid);
  cs_set_process_in(&speed, brushless_set_torque, (void *)0 );
  cs_set_process_out(&speed,brushless_get_pos , (void *)0 );
  cs_set_feedback_filter(&speed, biquad_do_filter, &speed_derivation);
  cs_set_consign(&speed, 0);
  
  
  
  /** ramp generator parameters */
  
  quadramp_derivate_init(&position_quadr_derv);
  
  quadramp_derivate_set_gain_anticipation(&position_quadr_derv, 256 *3);// some anticipation : 3.0 (this is a fixed point value *1/256)

  quadramp_derivate_set_goal_window(&position_quadr_derv, 5);           // algorithm shut down window

  quadramp_derivate_set_2nd_order_vars(&position_quadr_derv,   1 ,  1); // max acceleration : 1
  quadramp_derivate_set_1st_order_vars(&position_quadr_derv,  12,  12); // max speed is 12

  quadramp_derivate_set_divisor(&position_quadr_derv, 2);               // divisor, for precision


  // control system position 
  cs_init(&position);
  cs_set_correct_filter(&position, quadramp_derivate_do_filter, &position_quadr_derv); 
  cs_set_process_in(&position, (void *)cs_set_consign, &speed );
  cs_set_process_out(&position,brushless_get_pos , (void *)0 );
  cs_set_consign(&position, 0);


  /** begin */
  
  brushless_set_speed((void *)0 , BRUSHLESS_MAX_SPEED); // init speed

  sei();




  // some simple trajectories (enable one )

  while(1)
  {
  wait_ms(3500);
  cs_set_consign(&position, 400);
  wait_ms(500);
  cs_set_consign(&position, 0);
  }


  /*
  while(1)
  {
  wait_ms(2500);
  cs_set_consign(&position, 2000);
  wait_ms(2500);
  cs_set_consign(&position, 0);
  }



  // test of speed pid only, deactivate the position.
  while(1)
  {
  wait_ms(300);
  cs_set_consign(&speed, 10);
  wait_ms(300);
  cs_set_consign(&speed, -10);
  } */




  while(1);


  return 0;
}

