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
#include "r3d2.h"
#include "logging.h"
#include "uart_communication.h"


// log level
extern uint8_t log_level;

void init_led(void)
{
	DDRA = 0xFF;
}

int main(void)
{
	//wait_ms(3000); /// XXX hack to give time to the person that tests the system to take a cofee
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

	sei();
	printf("%c[2J",0x1B);
  printf("%c[0;0H",0x1B);
  printf("Robotter 2011 - Galipeur - R3D2-2K10");
  printf("Compiled "__DATE__" at "__TIME__".");

	//NOTICE(0,"Initializing r3d2");
	r3d2_init();

	//NOTICE(0,"Initializing leds");
	init_led();  
	
	//NOTICE(0,"Initializing scheduler");
	scheduler_init();

  scheduler_add_periodical_event_priority(&r3d2_monitor, NULL,
                                            300,
                                            50);	
	
	scheduler_add_periodical_event_priority(&send_periodic_position_msg, NULL,
                                            1000,
                                           60);	
		
	PORTA = ~(0x55);
	
	NOTICE(0,"Strike '?' for help");

	while (1)	
	{	
		uart_com_monitor();
	}
}
