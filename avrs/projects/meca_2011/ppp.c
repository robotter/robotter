#include <perlimpinpin.h>

#include "actuators.h"
#include "scanner.h"
#include "sys.h"

extern actuators_t actuators;

extern uint8_t scanner_source_address;
extern scanner_state_t scanner_state;

void ppp_msg_callback(PPPMsgFrame *msg)
{
  uint8_t armid;
  switch( msg->mid ) {
    case PPP_MID_PING:
      PPP_SEND_PING_R(msg->src, msg->ping.v);
      break;

    case PPP_MID_ARM_SET_POS:
      armid = msg->arm_set_pos.arm;
      switch(msg->arm_set_pos.pos)
      {
        case -1: actuators_arm_lower(&actuators, armid); break;
        case  0: actuators_arm_mid(&actuators,armid); break;
        case  1: actuators_arm_raise(&actuators,armid); break;
        default: break;
      }
      return;

    case PPP_MID_ARM_SCAN:
      scanner_source_address = msg->src;
      switch(msg->arm_scan.arm)
      {
        case 0: scanner_state = ST_SCHEDULED_LEFT; break;
        case 1: scanner_state = ST_SCHEDULED_RIGHT; break;
        default: break;
      }
      return;

    default:
      return;
  }
}

