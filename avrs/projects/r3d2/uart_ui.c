#include <aversive/error.h>
#include <math.h>
#include <uart.h>
#include <perlimpinpin.h>
#include "uart_ui.h"
#include "r3d2.h"


extern bool r3d2_periodic_position_msg_enabled;

bool uart_ui_enabled = false;

void uart_ui_enable(void)
{
  uart_ui_enabled = true;
}

void uart_ui_disable(void)
{
  uart_ui_enabled = false;
}

static bool recv_uint16(uint16_t *d);
static bool recv_double(double *d);

bool recv_uint16(uint16_t *d)
{
  uint8_t it;
  uint16_t v = 0;
  for( it=0; it <= 4; it++ ) {
    uint8_t c = uart_recv();
    if( '0' <= c && c <= '9' ) {
      v = 10*v + (c - '0');
    } else if( c == '\r' ) {
      // ignore
    } else if( c == '\n' ) {
      break;
    } else {
      return false;
    }
  }
  *d = v;
  return it != 0;
}

bool recv_double(double *d)
{
  uint8_t decimal_nb = 0;
  uint8_t it;
  double v = 0;
  for( it=0; it <= 4; it++ ) {
    uint8_t c = uart_recv();
    if( c == '.' || c == ',' ) {
      decimal_nb = 1;
    } else if( '0' <= c && c <= '9' ) {
      if( decimal_nb != 0 ) {
        decimal_nb++;
      }
      v = 10*v + (c - '0');
    } else if( c == '\r' ) {
      // ignore
    } else if( c == '\n' ) {
      break;
    } else {
      return false;
    }
  }
  for(; decimal_nb > 1; decimal_nb--) {
    v /= 10.0;
  }
  *d = v;
  return it != 0;
}


void uart_ui_update(void)
{
  uint16_t v_u16;
  double v_double;

  int c = uart_recv_nowait();
  if( c == -1 ) {
    return;
  }

  switch(c) {
    case 'x':
    case 'X':
      r3d2_stop();
      printf("r3d2 stopped\n");
      break;

    case '?':
      NOTICE(0, "help");
      printf("\tx/X -- stop system\n");
      printf("\t w  -- start system\n");
      printf("\ts/S -- stop/START sensor\n");
      printf("\tm/M -- stop/START motor\n");
      printf("\tp/P -- stop/START sending of periodic message\n");
      printf("\t a  -- set motor speed\n");
      printf("\t b  -- set motor watchdog timeout \n");
      printf("\t c  -- set detection duration\n");
      printf("\t e  -- update angle offset from object angle\n");
      printf("\t f  -- update distance coef from object distance\n");
      printf("\t o  -- write changes to EEPROM\n");
      printf("\t Q  -- disable UART UI\n");
      break;

    case 'w' :
      r3d2_start();
      NOTICE(0, "r3d2 started");
      break;

    case 'm' :
      r3d2_stop_motor();
      NOTICE(0, "motor off");
      break;

    case 'M' :
      r3d2_start_motor();
      NOTICE(0, "motor on");
      break;

    case 's' :
      r3d2_disable_sensor();
      NOTICE(0, "sensor off");
      break;

    case 'S' :
      r3d2_enable_sensor();
      NOTICE(0, "sensor on");
      break;

    case 'p' :
      r3d2_periodic_position_msg_enabled = false;
      printf("periodic message off\n");
      break;

    case 'P' :
      r3d2_periodic_position_msg_enabled = true;
      printf("periodic message on\n");
      break;

    case 'a':
      if(recv_uint16(&v_u16)) {
        r3d2_set_motor_speed(v_u16);
      }
      printf("motor speed: %u\n", r3d2_get_motor_speed());
      break;

    case 'b':
      if(recv_uint16(&v_u16)) {
        r3d2_motor_watchdog_timeout = v_u16;
      }
      printf("motor watchdog timeout: %u\n", r3d2_motor_watchdog_timeout);
      break;

    case 'c':
      if(recv_uint16(&v_u16)) {
        r3d2_detection_threshold = v_u16;
      }
      printf("detection threshold: %u\n", r3d2_detection_threshold);
      break;

    case 'e':
      if(recv_double(&v_double)) {
        if(v_double >= 0 && v_double <= 360) {
          r3d2_update_angle_offset_from_object_angle(v_double * M_PI/180);
        }
      }
      printf("angle offset: %f\n", r3d2_angle_offset * 180 / M_PI);
      break;

    case 'f':
      if(recv_double(&v_double)) {
        r3d2_update_distance_coef_from_object_distance(v_double);
      }
      printf("distance coef: %f\n", r3d2_distance_coef);
      break;

    case 'o':
      r3d2_write_to_eeprom();
      break;

    case 'Q':
      uart_ui_disable();
      break;

    default:
      break;
  }
}


