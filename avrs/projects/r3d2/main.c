#include <aversive.h>
#include <aversive/error.h>
#include <math.h>
#include <uart.h>
#include <scheduler.h>
#include <perlimpinpin_common.h>
#include "r3d2.h"
#include "logging.h"
#include "uart_ui.h"


extern uint8_t log_level;

static void init_led(void)
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
      r3d2_stop();
      NOTICE(0,"killed");
      break;
    default:
      return;
  }
}


bool r3d2_periodic_position_msg_enabled = true;

static void r3d2_periodic_position_msg(void *dummy)
{
  if(r3d2_periodic_position_msg_enabled && r3d2_robot_detected) {
    if(uart_ui_enabled) {
      printf("angle %4.2f | dist %3.2f\n", r3d2_robot_angle*180/M_PI, r3d2_robot_distance);
    } else {
      PPP_SEND_R3D2_DETECTED(ROID_SUBSCRIBER, r3d2_robot_distance*10, 1000*r3d2_robot_angle);
    }
  }
  PORTA =~ PORTA;
}


int main(void)
{
  uart_init();
  fdevopen(uart_dev_send, uart_dev_recv);

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

  PPP_SEND_START(0);
  printf("\033[2J\033[0;0H"
         "R3D2 - compiled "__DATE__" at "__TIME__"\n");

  r3d2_init();
  init_led();
  scheduler_init();

  scheduler_add_periodical_event_priority(&r3d2_update, NULL, 300, 50);
  scheduler_add_periodical_event_priority(&r3d2_periodic_position_msg, NULL, 1000, 60);
  PORTA = ~(0x55);

  //uart_ui_enable();

  for(;;) {
    if(uart_ui_enabled) {
      uart_ui_update();
    } else {
      ppp_update();
    }
  }
}
