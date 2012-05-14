#include <math.h>
#include <stdbool.h>
#include "uart_communication.h"
#include "r3d2.h"
#include <aversive/error.h>
#include <uart.h>
#include <ctype.h>
#include <perlimpinpin.h>

// allow or not sent of message that contains position of robot
volatile uint8_t periodic_position_msg_status;

/// XXX TODO : replace those function by correct one
// function that extract numerical value from uart
// return -1 in case of error
int8_t get_uint8_t_from_uart(uint8_t *d);
int8_t get_uint16_t_from_uart(uint16_t *d);
int8_t get_double_from_uart(double *d);



void enable_periodic_position_msg(void);
void disable_periodic_position_msg(void);

void uart_com_init(void)
{
	enable_periodic_position_msg();
}

void disable_periodic_position_msg(void)
{
	periodic_position_msg_status = 0;
}

void enable_periodic_position_msg(void)
{
	periodic_position_msg_status = 1;
}

void send_periodic_position_msg(void* dummy)
{
  static bool b = false;
  b = !b;
	if (is_robot_detected() && (periodic_position_msg_status!=0))
	{
#ifdef SETTING_UART_UI_ENABLED
		printf("angle %4.2f | dist %3.2f\n", get_detected_robot_angle(), get_detected_robot_distance());
#else
    PPP_SEND_R3D2_DETECTED(0, get_detected_robot_distance()*10, get_detected_robot_angle()*1000*M_PI/180.);
#endif
    PORTA = b?0x0F:0xF0;
	}
  else
    PORTA = b?0x55:~0x55;
} 

void uart_com_monitor(void)
{
	uint8_t u08_tmp;
	uint16_t u16_tmp;
	double d_tmp;

	int8_t c = uart_recv_nowait(0);
	if (c!= -1)
	{
		switch(c)
		{
			case 'x' : 
				stop_r3d2();
				NOTICE(0,"r4d2 stopped\n");
				break;

			case 'X' :  // just to get caps lock kill signal too
				stop_r3d2();
				NOTICE(0,"r3d2 stopped\n");
				break;

			case '?' : // help
				NOTICE(0,"help :");	
				NOTICE(0,"\tx/X => stop system");
				NOTICE(0,"\tw   => start system");
				NOTICE(0,"\ts/S => stop/START sensor");
				NOTICE(0,"\tm/M => stop/START motor");
				NOTICE(0,"\tp/P => stop/START send of position message");
				break;

			case 'w' : 
				start_r3d2();
				NOTICE(0,"r3d2 started");
				break;

			case 'm' : 
				stop_motor();
				break;

			case 'M' : 
				start_motor();
				break;

			case 's' : 
				disable_sensor();
				break;
		
			case 'S' : 
				enable_sensor();
				break;

			case 'p' : 
				disable_periodic_position_msg();
				NOTICE(0,"periodic message off\n");
				break;

			case 'P' : 
				enable_periodic_position_msg();
				NOTICE(0,"periodic message on\n");
				break;
		
			case 'a':
				if (get_uint16_t_from_uart(&u16_tmp) != -1)
				{
					set_motor_speed(u16_tmp);
				}
				NOTICE(0,"motor speed %u\n",get_motor_speed() );
				break;

			case 'b':				
				if (get_uint8_t_from_uart(&u08_tmp) != -1)
				{
					set_motor_rotating_timout_treshold(u08_tmp);
				}
				NOTICE(0,"motor rot treshold %u\n", get_motor_rotating_timout_treshold());
			break;

			case 'c':
				if ( get_uint8_t_from_uart(&u08_tmp) != -1)
				{
					set_robot_detected_timout_treshold(u08_tmp);
				}
				NOTICE(0,"robot detect treshold %u\n", get_robot_detected_timout_treshold());
				break;

			case 'e': // update angle offset from known object angle (must be in degree between 0 and 360)
				if (get_double_from_uart(&d_tmp) != -1 )
				{
					if (d_tmp >= 0 && d_tmp<= 360)
					{
						update_angle_offset_from_object_angle(d_tmp);	
					}
				}
				NOTICE(0,"angle offset %f\n", get_robot_detected_angle_offset());
				break;

			case 'f':
				if (get_double_from_uart(&d_tmp) != -1 )
				{
						update_surface_ratio_from_object_distance(d_tmp);
				}
				NOTICE(0,"surface ratio %f\n", get_surface_reflection_ratio());
				break;

			default: break;
		}
	}
}


int8_t get_uint8_t_from_uart(uint8_t *d)
{
	uint8_t it;
	int8_t c = uart_recv(0);
	*d = 0;
	for(it =0; it <= 2 && isdigit(c); it ++)
	{
		*d = ((*d) *10) + (c -'0');
		c = uart_recv(0);		
	}
	if (it != 0)
		return 1;
	else
		return -1;
}


int8_t get_uint16_t_from_uart(uint16_t *d)
{
	uint8_t it;
	int8_t c = uart_recv(0);
	*d = 0;
	for(it =0; it <= 4 && isdigit(c); it ++)
	{
		*d = ((*d) *10) + (c -'0');
		c = uart_recv(0);		
	}
	if (it != 0)
		return 1;
	else
		return -1;
}
 /// XXX only accept positive value
int8_t get_double_from_uart(double *d)
{
	uint8_t it, decimal_nb;
	double data = 0;
	int8_t c = uart_recv(0);
	decimal_nb = 0;
	data = 0;

	for(it =0; it <= 20 ; it ++)
	{
		if ((c == '.') || (c == ','))
		{
			decimal_nb =1;
		}
		else if ( !isdigit(c))
		{
			break;
		}
		else 
		{
			if (decimal_nb != 0)
			{
				decimal_nb ++;
			}

		data = (data *10) + (float)(c -'0');
		}
		c = uart_recv(0);
	}
	/// transform into decimal number
	for(; decimal_nb >1; decimal_nb --)
		data /= 10,0;

	*d = data;	

	if (it != 0)
		return 1;
	else
		return -1;
}
