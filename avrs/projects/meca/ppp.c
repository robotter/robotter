#include <perlimpinpin_common.h>
#include <aversive/error.h>

#include "led.h"
#include "actuators.h"
#include "brush.h"
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
    case PPP_MID_BRUSH_SET_STATE:
      brush_set_state(msg->brush_set_state.on, msg->brush_set_state.open);
      return;
    case PPP_MID_BRUSH_SET_SPEED:
      brush_set_speed(msg->brush_set_speed.speed);
      return;

    default:
      return;
  }
}

