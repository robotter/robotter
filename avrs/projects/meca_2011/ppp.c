#include <perlimpinpin.h>

void ppp_msg_callback(PPPMsgFrame *msg)
{
  switch( msg->mid ) {
    case PPP_MID_NONE:
      break;
    case PPP_MID_FORTYTWO:
      PPP_SEND_FORTYTWO_R(msg->src, 42);
      break;
    default:
      return;
  }
}

