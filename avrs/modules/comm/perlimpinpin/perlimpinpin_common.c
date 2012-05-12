#include <avr/wdt.h>
#include "perlimpinpin_common.h"

/** @brief Handler common PPP messages.
 * @return 1 if handled, 0 otherwise
 */
int8_t ppp_common_callback(const PPPMsgFrame *msg)
{
  switch( msg->mid ) {
    case PPP_MID_RESET:
      wdt_enable(WDTO_30MS);
      for(;;) ;
    case PPP_MID_PING:
      PPP_REPLY_PING(msg, msg->ping.v);
      break;
    default: // not handled
      return 0;
  }
  return 1;
}

