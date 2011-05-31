#include "uart_communication.h"
#include "r3d2.h"
#include <aversive/error.h>
#include <uart.h>
#include <ctype.h>

// allow or not sent of message that contains position of robot
static volatile uint8_t periodic_position_msg_status;

/// XXX TODO : replace those function by correct one
// function that extract numerical value from uart
// return -1 in case of error
static int8_t get_uint16_t_from_uart(uint16_t *d);
static int8_t get_double_from_uart(double *d);



static void enable_periodic_position_msg(void);
static void disable_periodic_position_msg(void);

void uart_com_init(void)
{
  //disable_periodic_position_msg();
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
  if (r3d2_is_robot_detected && (periodic_position_msg_status!=0))
  {
    printf("angle %4.2f | dist %3.2f\n", r3d2_detected_robot_angle, r3d2_detected_robot_distance);
  }
  PORTA =~ PORTA;
}

void uart_com_monitor(void)
{
  uint16_t u16_tmp;
  double d_tmp;

  int c = uart_recv_nowait();
  if(c!= -1)
  {
    switch(c)
    {
      case 'x' :
      case 'X' :  // just to get caps lock kill signal too
        r3d2_stop();
        printf("r3d2 stopped\n");
        break;

      case '?' : // help
        NOTICE(0,"help :");
        NOTICE(0,"\tx/X => stop system");
        NOTICE(0,"\tw   => start system");
        NOTICE(0,"\ts/S => stop/START sensor");
        NOTICE(0,"\tm/M => stop/START motor");
        NOTICE(0,"\tp/P => stop/START send of position message");
        NOTICE(0,"\to   => write changes to EEPROM");
        break;

      case 'w' :
        r3d2_start();
        NOTICE(0,"r3d2 started");
        break;

      case 'm' :
        r3d2_stop_motor();
        NOTICE(0,"motor off");
        break;

      case 'M' :
        r3d2_start_motor();
        NOTICE(0,"motor on");
        break;

      case 's' :
        r3d2_disable_sensor();
        NOTICE(0,"sensor off");
        break;

      case 'S' :
        r3d2_enable_sensor();
        NOTICE(0,"sensor on");
        break;

      case 'p' :
        disable_periodic_position_msg();
        printf("periodic message off\n");
        break;

      case 'P' :
        enable_periodic_position_msg();
        printf("periodic message on\n");
        break;

      case 'a':
        if (get_uint16_t_from_uart(&u16_tmp) != -1)
        {
          r3d2_set_motor_speed(u16_tmp);
        }
        printf("motor speed %u\n",r3d2_get_motor_speed() );
        break;

      case 'b':
        if (get_uint16_t_from_uart(&u16_tmp) != -1)
        {
          r3d2_motor_rotating_timeout_threshold = u16_tmp;
        }
        printf("motor rot treshold %u\n", r3d2_motor_rotating_timeout_threshold);
        break;

      case 'c':
        if ( get_uint16_t_from_uart(&u16_tmp) != -1)
        {
          r3d2_robot_detected_timeout_threshold = u16_tmp;
        }
        printf("robot detect treshold %u\n", r3d2_robot_detected_timeout_threshold);
        break;

      case 'e': // update angle offset from known object angle (must be in degree between 0 and 360)
        if (get_double_from_uart(&d_tmp) != -1 )
        {
          if (d_tmp >= 0 && d_tmp<= 360)
          {
            r3d2_update_angle_offset_from_object_angle(d_tmp);
          }
        }
        printf("angle offset %f\n", r3d2_robot_detected_angle_offset);
        break;

      case 'f':
        if (get_double_from_uart(&d_tmp) != -1 )
        {
          r3d2_update_surface_ratio_from_object_distance(d_tmp);
        }
        printf("surface ratio %f\n", r3d2_surface_reflection_ratio);
        break;

      case 'o':
        r3d2_write_to_eeprom();
        break;

      default: break;
    }
  }
}


int8_t get_uint16_t_from_uart(uint16_t *d)
{
  uint8_t it;
  uint8_t c = uart_recv();
  *d = 0;
  for(it =0; it <= 4 && isdigit(c); it ++)
  {
    *d = ((*d) *10) + (c -'0');
    c = uart_recv();
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
  uint8_t c = uart_recv();
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
    c = uart_recv();
  }
  /// transform into decimal number
  for(; decimal_nb >1; decimal_nb --)
    data /= 10.0;

  *d = data;

  if (it != 0)
    return 1;
  else
    return -1;
}
