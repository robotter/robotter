#include <perlimpinpin_common.h>
#include <aversive/error.h>

#include "led.h"
#include "actuators.h"
#include "sys.h"
#include "settings.h"

extern actuators_t actuators;

void ppp_msg_callback(PPPMsgFrame *msg)
{
  if( ppp_common_callback(msg) ) {
    return;
  }
  uint8_t armid;

  led_toggle(3);

  switch( msg->mid ) {
    case PPP_MID_ARM_SET_POS:
      armid = msg->arm_set_pos.arm;
      //TODO arm positions
      switch(msg->arm_set_pos.pos) {
        case -1: actuators_arm_lower(&actuators, armid); break;
        case  0: actuators_arm_mid(&actuators, armid); break;
        case  1: actuators_arm_raise(&actuators, armid); break;
        default: break;
      }
      return;

    default:
      return;
  }
}

