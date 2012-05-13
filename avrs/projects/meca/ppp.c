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
  led_toggle(3);

  switch( msg->mid ) {
    case PPP_MID_ARM_SET_ANGLE:
      {
        arm_location_t loc = msg->arm_set_angle.arm;
        arm_angle_t angle = msg->arm_set_angle.angle;
        if( loc < ARM_COUNT && angle < ARM_ANGLE_COUNT ) {
          actuators_arm_set_angle(&actuators, loc, angle);
        }
      }
      return;

    default:
      return;
  }
}

