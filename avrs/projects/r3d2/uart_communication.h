#ifndef UART_COMMUNICATION_H
#define UART_COMMUNICATION_H

	#include <aversive.h>
	
	void uart_com_init(void);

	void send_periodic_position_msg(void* dummy);

	void uart_com_monitor(void);


#endif //UART_COMMUNICATION_H
