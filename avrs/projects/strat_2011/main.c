#include <avr/wdt.h>
#include <aversive.h>
#include <perlimpinpin_common.h>
#include <uart.h>
#include <matchuart.h>
#include <scheduler.h>
#include <aversive/wait.h>
#include <time.h>
#include "logging.h"
#include "tirette.h"
#include "strat.h"


static RobotColor choosed_color = ROBOT_COLOR_NONE;
static uint8_t strat_run_now = 0;

int8_t ppp_strat_callback(PPPMsgFrame *msg);

static void ppp_msg_callback(PPPMsgFrame *msg)
{
  if( ppp_strat_callback(msg) ) {
    return;
  }
  if( ppp_common_callback(msg) ) {
    return;
  }
  switch( msg->mid ) {
    case PPP_MID_KILL:
      break; //TODO
    case PPP_MID_STRAT_RUN:
      strat_run_now = 1;
      break;
    case PPP_MID_STRAT_SET_COLOR:
      choosed_color = msg->strat_set_color.color;
      const char *scolor;
      if( choosed_color == ROBOT_COLOR_RED ) {
        scolor = "RED";
      } else if( choosed_color == ROBOT_COLOR_BLUE ) {
        scolor = "BLUE";
      } else {
        scolor = "NONE";
      }
      NOTICE(0, "color set to %s", scolor);
      break;
    default:
      return;
  }
}


#define MATCH_END_EV_TOTAL   90000000
#define MATCH_END_EV_PERIOD  10000000
#define MATCH_END_EV_COUNT   (MATCH_END_EV_TOTAL/MATCH_END_EV_PERIOD)
#if MATCH_END_EV_TOTAL % MATCH_END_EV_PERIOD != 0
#error "MATCH_END_EV_PERIOD doesn't divide MATCH_END_EV_TOTAL"
#endif

static uint8_t match_end_ev;

/** @brief Scheduler callback for match end.
 *
 * A 'kill' message is broadcasted forever, but not too often to avoid
 * flooding.
 */
void match_end_cb(void *dummy)
{
  static uint8_t periods = MATCH_END_EV_COUNT;
  if( --periods != 0 ) {
    return;
  }
  scheduler_del_event(match_end_ev);
  for(;;) {
    PPP_SEND_ASSERV_GOTO_XY(ROID_PROP, 0, 0);
    PPP_SEND_KILL(0);
    int i;
    for( i=0; i<1000; i++ ) {
      ppp_update();
    }
  }
}


int main(void)
{
  // color selector
  DDRD |= _BV(4);
  DDRD &= ~_BV(6);
  PORTD &= ~_BV(4);
  PORTD |= _BV(6);

  tirette_init();
  ppp_init(ppp_msg_callback);
  fdevopen(uart_dev_send, uart_dev_recv);
  logging_init(ERROR_SEVERITY_DEBUG);
  //matchuart_init("__", do_reset);
  scheduler_init();
  time_init(160);
  sei();


  wait_ms(1000);
  NOTICE(0, "STRAT READY");
  //PPP_SEND_START(ROID_SUBSCRIBER);
  PPP_SEND_ARM_SET_POS(ROID_MECA, 0, 1);
  PPP_SEND_ARM_SET_POS(ROID_MECA, 1, 1);

  NOTICE(0, "waiting for tirette or manual run order");
  uint8_t colorsel_last = (PIND & _BV(6)) != 0;
  while( tirette_plugged() && !strat_run_now ) {
    ppp_update();
    uint8_t colorsel = (PIND & _BV(6)) != 0;
    if( colorsel != colorsel_last ) {
      choosed_color = colorsel ? ROBOT_COLOR_RED : ROBOT_COLOR_BLUE;
      NOTICE(0, "color set to %s", choosed_color==ROBOT_COLOR_RED ? "RED" : "BLUE");
      colorsel_last = colorsel;
    }
  }
  DEBUG(0, "strat go");

  if( choosed_color == ROBOT_COLOR_NONE ) {
    uint8_t colorsel = (PIND & _BV(6)) != 0;
    choosed_color = colorsel ? ROBOT_COLOR_RED : ROBOT_COLOR_BLUE;
  }
  match_end_ev = scheduler_add_periodical_event(match_end_cb, NULL, MATCH_END_EV_PERIOD/SCHEDULER_UNIT);
  strat_start(choosed_color);
  for(;;) ;
  return 1;
}
