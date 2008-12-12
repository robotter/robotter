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
 *  Revision : $Id: main.c,v 1.5 2007-05-24 13:08:47 zer0 Exp $
 *
 */

#include <stdio.h>

#include <uart.h>
#include <aversive/wait.h>
#include <pid.h>
#include <quadramp.h>
#include <control_system_manager.h>

#define MAX_SPEED 10000
static int32_t motor_speed=0;
static int32_t motor_pos=0;

/* try to simulate a motor (quick and dirty and wrong) */
void motor_set(void * dummy, int32_t in)
{
    motor_speed = motor_speed - motor_speed/8 ;
    motor_speed += in/8;
}

int32_t motor_get_pos(void * dummy)
{
    motor_pos += motor_speed;
    return motor_pos;
}
    
int main(void)
{
    struct cs my_cs;
    struct pid_filter my_pid;
    struct quadramp_filter my_qr;
    uint16_t i ;

    uart_init();

    pid_init(&my_pid);
    pid_set_gains(&my_pid, 40, 1, 3);
    pid_set_maximums(&my_pid, 0, 5000, 4095); 
    pid_set_out_shift(&my_pid, 10);
  
    quadramp_init(&my_qr);
    quadramp_set_1st_order_vars(&my_qr, 1000, 1000); /* set speed */
    quadramp_set_2nd_order_vars(&my_qr, 100, 100); /* set accel */
  
    cs_init(&my_cs);
    cs_set_consign_filter(&my_cs, quadramp_do_filter, &my_qr);   
    cs_set_correct_filter(&my_cs, pid_do_filter, &my_pid); 
    cs_set_process_in(&my_cs, motor_set, NULL);
    cs_set_process_out(&my_cs, motor_get_pos, NULL);
    cs_set_consign(&my_cs, 0);
  
    for ( i=0 ; i<10 ; i++) {
        wait_ms(10);
        cs_manage(&my_cs);
    }
        
    cs_set_consign(&my_cs, 100000);   
    
    while(1) {
        wait_ms(10);
        cs_manage(&my_cs);
    }

    return 0;
}


