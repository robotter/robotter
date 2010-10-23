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

/** \file logging.c
  * \author JD
  */

#include <stdio.h>
#include <uart.h>
#include <scheduler.h>

#include "logging.h"
#if 0 //TODO:temp
#include "cli.h"
#include "motor.h"
#endif

extern uint8_t event_cs;
extern uint8_t event_position;

// default log level
uint8_t log_level = ERROR_SEVERITY_DEBUG;

void log_event(struct error * e, ...)
{
  PGM_P txt_sev;
  uint16_t flags;
  va_list ap;
  time_h tv;

  if( e->severity > log_level)
    return;

  // save flags
  flags = stdout->flags;

  va_start(ap, e);
  tv = time_get_time();
  
  // print timestamp
  printf_P(PSTR("%ld.%3.3ld | "), tv.s, (tv.us/1000UL));
  
  // print severity
  switch(e->severity)
  {
    case ERROR_SEVERITY_EMERG :   txt_sev = PSTR(ERROR_SEVTEXT_EMERG);   break;
    case ERROR_SEVERITY_ERROR :   txt_sev = PSTR(ERROR_SEVTEXT_ERROR);   break;
    case ERROR_SEVERITY_WARNING : txt_sev = PSTR(ERROR_SEVTEXT_WARNING); break;
    case ERROR_SEVERITY_NOTICE :  txt_sev = PSTR(ERROR_SEVTEXT_NOTICE);  break;
    case ERROR_SEVERITY_DEBUG :   txt_sev = PSTR(ERROR_SEVTEXT_DEBUG);   break;
    default :                     txt_sev = PSTR("XXX");                 break;
  }

  printf_P(txt_sev);
  printf_P(PSTR(": "));

  // print message
  vfprintf_P(stdout,e->text,ap);

  printf_P(PSTR("\n"));

  va_end(ap);

  // restore flags
  stdout->flags = flags;


  // dead end
  if( (e->severity == ERROR_SEVERITY_ERROR)
    ||(e->severity == ERROR_SEVERITY_EMERG) )
  {
    printf_P(PSTR("\nprogram stopped, strike a key other than 'x' to reset\n"));
    
#if 0  //TODO:temp
    //XXX Add shutdown procedures here XXX
    
    // breaking motors
    motor_cs_break(1);

    // killing cs & position tasks
    scheduler_del_event(event_cs);
  
    // wait for key
    uint8_t key;
    while(1)
    {
      key = cli_getkey();

      if( (key == -1)||(key == 'x'))
        continue;
      
      break;
    }
#endif

    // reset MCU 
    reset();
  }

}


