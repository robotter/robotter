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
 *  Revision : $Id: main.c,v 1.2 2007-03-04 13:53:45 zer0 Exp $
 *
 */
 
#include <avr/io.h>
#include <wait.h>
#include <utils.h>

#include <brushless.h>

#include <pwm.h>

#include <diagnostic.h>

#include <uart.h>
#include <stdio.h>
#include <aversive_pgmspace.h>





void event0(brushless mesures)
{
	static int8_t cpt;
	static int8_t dir = 1;

	cpt +=dir;
  
	if(cpt == 10)
		dir = -1;
	if (cpt == -10 )
		dir = 1;
  
  
  
	brushless_0_set_parameters(BRUSHLESS_MAX_SPEED, PWM_MAX/10*cpt    /1  );

	printf_P(PSTR("vitesse M0 : %5i t/s %5i t/min      "), mesures.speed /48, (int16_t)((int32_t)mesures.speed *60/48));

}
void event1(brushless mesures)
{
	static int8_t cpt;
	static int8_t dir = 1;

	cpt +=dir;
  
	if(cpt == 10)
		dir = -1;
	if (cpt == -10 )
		dir = 1;
  
  
  
	brushless_1_set_parameters(BRUSHLESS_MAX_SPEED, PWM_MAX/10*cpt    /1  );

	printf_P(PSTR("vitesse M1 : %5i t/s %5i t/min\n"), mesures.speed /48, (int16_t)((int32_t)mesures.speed *60/48));

}

void test_capteurs(void)
{

	uint8_t sensor1_0;
	uint8_t sensor2_0;
	uint8_t sensor3_0;
	
	uint8_t sensor1_1;
	uint8_t sensor2_1;
	uint8_t sensor3_1;
  
	while(1) {

		sensor1_0 = 0;
		sensor2_0 = 0;
		sensor3_0 = 0;
		
		sensor1_1 = 0;
		sensor2_1 = 0;
		sensor3_1 = 0;
    
		if(bit_is_set(PIN(BRUSHLESS_0_SENSOR_1_PORT),BRUSHLESS_0_SENSOR_1_BIT))
			sensor1_0 =1;
		if(bit_is_set(PIN(BRUSHLESS_0_SENSOR_2_PORT),BRUSHLESS_0_SENSOR_2_BIT))
			sensor2_0 =1;
		if(bit_is_set(PIN(BRUSHLESS_0_SENSOR_3_PORT),BRUSHLESS_0_SENSOR_3_BIT))
			sensor3_0 =1;
      

  
		if(bit_is_set(PIN(BRUSHLESS_1_SENSOR_1_PORT),BRUSHLESS_1_SENSOR_1_BIT))
			sensor1_1 =1;
		if(bit_is_set(PIN(BRUSHLESS_1_SENSOR_2_PORT),BRUSHLESS_1_SENSOR_2_BIT))
			sensor2_1 =1;
		if(bit_is_set(PIN(BRUSHLESS_1_SENSOR_3_PORT),BRUSHLESS_1_SENSOR_3_BIT))
			sensor3_1 =1;

		printf_P(PSTR("sensors M0 = %i%i%i    "), sensor1_0,sensor2_0,sensor3_0);
		wait_ms(100);
		printf_P(PSTR("sensors M1 = %i%i%i\n")  , sensor1_1,sensor2_1,sensor3_1);

		wait_ms(250);
	}
  
}





int main(void)
{


  
	brushless_init();

	//wait_ms(500);


	uart_init();
	fdevopen((void *)uart0_send,NULL,0);

	printf_P(PSTR("\nbonjour\n"));
	sei();




	//test_capteurs();


	// enable power bridges
	sbi(DDRG, 1);
	sbi(PORTG, 1);
  


	brushless_0_register_periodic_event(event0);
	brushless_1_register_periodic_event(event1);
	show_int_loop();
	return 0;
}

