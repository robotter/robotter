#include <avr/wdt.h>
#include <aversive.h>
#include <perlimpinpin.h>
#include <uart.h>
#include <matchuart.h>
#include "logging.h"


static void do_reset(void)
{
  wdt_enable(WDTO_30MS);
  for(;;) ;
}


static void ppp_msg_callback(PPPMsgFrame *msg)
{
  switch( msg->mid ) {
    case PPP_MID_NONE:
      break;
    case PPP_MID_FORTYTWO:
      PPP_SEND_FORTYTWO_R(msg->src, 42);
      break;

    case PPP_MID_ARM_IS_POS_R:
    case PPP_MID_GROUND_DETECT_R:
    default:
      return;
  }
}



int main(void)
{
  ppp_init(ppp_msg_callback);
  fdevopen(uart_dev_send, uart_dev_recv);
  logging_init(ERROR_SEVERITY_DEBUG);
  matchuart_init("__", do_reset);
  sei();

  NOTICE(0, "STRAT START");
  for(;;) ;

  return 0;
}
