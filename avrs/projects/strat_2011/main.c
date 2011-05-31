#include <avr/wdt.h>
#include <aversive.h>
#include <perlimpinpin_common.h>
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
  if( ppp_common_callback(msg) ) {
    return;
  }
  switch( msg->mid ) {
    case PPP_MID_KILL:
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

  PPP_SEND_START(ROID_SUBSCRIBER);
  NOTICE(0, "STRAT START");
  for(;;) {
    ppp_update();
  }

  return 0;
}
