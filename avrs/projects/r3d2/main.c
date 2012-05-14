/*  
 *  Copyright RobOtter (2011) 
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

/** \file 
  * \author Lamygalle
  */

#include "settings.h"
#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>
#include <stdlib.h>
#include <pwm_ng.h>
#include <timer.h>
#include <uart.h>
#include <avr/interrupt.h>
#include <math.h>
#include <scheduler.h>
#include <perlimpinpin_common.h>
#include "r3d2.h"
#include "logging.h"
#include "uart_communication.h"


// log level
extern uint8_t log_level;

void init_led(void)
{
	DDRA = 0xFF;
}

static void ppp_msg_callback(PPPMsgFrame *msg)
{
  if( ppp_common_callback(msg) ) {
    return;
  }
  switch( msg->mid ) {
    case PPP_MID_KILL:
      stop_r3d2();
      NOTICE(0,"killed");
      break;
    default:
      return;
  }
}

int main(void)
{
	init_led();  

	uart_init();
  uart_com_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);
	
	//--------------------------------------------------------
  // Error configuration
  error_register_emerg(log_event);
  error_register_error(log_event);
  error_register_warning(log_event);
  error_register_notice(log_event);
  error_register_debug(log_event);

  log_level = ERROR_SEVERITY_NOTICE;
  log_level = ERROR_SEVERITY_DEBUG;

  ppp_init(ppp_msg_callback);

	sei();
#ifndef AVERSIVE_ERROR_FORCE_SILENT
	printf("%c[2J",0x1B);
  printf("%c[0;0H",0x1B);
#endif
  NOTICE(0,"Robotter 2011 - Galipeur - R3D2-2K12");
  NOTICE(0,"Compiled "__DATE__" at "__TIME__".");

	r3d2_init();
	scheduler_init();

  scheduler_add_periodical_event_priority(&r3d2_monitor, NULL, 300, 50);	
	scheduler_add_periodical_event_priority(&send_periodic_position_msg, NULL, 1000, 60);	

	while (1)	
	{	
#ifdef SETTING_UART_UI_ENABLED
    #warning UART ui activated
		uart_com_monitor();
#else
    ppp_update();
#endif
	}
}
