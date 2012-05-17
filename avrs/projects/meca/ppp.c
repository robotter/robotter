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
    case PPP_MID_KILL:
      PPP_REPLY_KILL(msg);
      brush_stop();
      actuators_stop(&actuators);
      break;

    case PPP_MID_ARM_SET_ANGLE:
      {
        arm_location_t loc = msg->arm_set_angle.arm;
        arm_angle_t angle = msg->arm_set_angle.angle;
        uint16_t speed = msg->arm_set_angle.speed;
        if( loc < ARM_COUNT && angle < ARM_ANGLE_COUNT ) {
          actuators_arm_set_angle(&actuators, loc, angle, speed);
        }
      }
      PPP_REPLY_ARM_SET_ANGLE(msg);
      return;
    case PPP_MID_BRUSH_STOP:
      if (msg->brush_stop.now) {
        brush_stop();
      } else {
        brush_stop_closed();
      }
      PPP_REPLY_BRUSH_STOP(msg);
      return;
    case PPP_MID_BRUSH_SET_SPEED:
      brush_set_speed(msg->brush_set_speed.speed);
      PPP_REPLY_BRUSH_SET_SPEED(msg);
      return;
    case PPP_MID_BRUSH_GET_POS:
      PPP_REPLY_BRUSH_GET_POS(msg, brush_get_pos());
      break;

    default:
      return;
  }
}

