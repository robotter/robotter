#include <aversive/error.h>
#include <perlimpinpin_common.h>

#include "htrajectory.h"

extern htrajectory_t trajectory;

#define RAD_CONVERT(v) ((double)(v)/1000)
#define MM_CONVERT(v) ((double)(v))
#define AS_CONVERT(v) ((double)(v)/100)
#define XYS_CONVERT(v) ((double)(v)/1000)

vect_xy_t points[HTRAJECTORY_MAX_POINTS];

void ppp_msg_callback(PPPMsgFrame *msg)
{
  if( ppp_common_callback(msg) ) {
    return;
  }

  uint8_t n,status;
  double x,y,a,s;
  switch( msg->mid ) {
    case PPP_MID_ASSERV_GOTO_A:
      a = RAD_CONVERT(msg->asserv_goto_a.a);
      htrajectory_gotoA(&trajectory,a);
      break;

    case PPP_MID_ASSERV_GOTO_AR:
      a = RAD_CONVERT(msg->asserv_goto_ar.a);
      htrajectory_gotoA_R(&trajectory,a);
      break;

    case PPP_MID_ASSERV_GOTO_XY:
      x = MM_CONVERT(msg->asserv_goto_xy.x);
      y = MM_CONVERT(msg->asserv_goto_xy.y);
      htrajectory_gotoXY(&trajectory, x, y);
      break;

    case PPP_MID_ASSERV_GOTO_XYR:
      x = MM_CONVERT(msg->asserv_goto_xyr.x);
      y = MM_CONVERT(msg->asserv_goto_xyr.y);
      htrajectory_gotoXY_R(&trajectory, x, y);
      break;

    case PPP_MID_ASSERV_RUN:
      n = msg->asserv_run.n;
      if(n > HTRAJECTORY_MAX_POINTS)
        WARNING(0,"Command ASSERV_RUN failed, too much points: %d>%d",
                    n, HTRAJECTORY_MAX_POINTS);
      else
        htrajectory_run(&trajectory, points, n);
      break;

    case PPP_MID_ASSERV_LOAD:
      n = msg->asserv_load.idx;
      x = MM_CONVERT(msg->asserv_load.x);
      y = MM_CONVERT(msg->asserv_load.y);
      if(n > HTRAJECTORY_MAX_POINTS)
        WARNING(0,"Command ASSERV_LOAD failed, index not in range: %d>%d",
                    n, HTRAJECTORY_MAX_POINTS);
      else
        points[n].x = x;
        points[n].y = y;
      break;

    case PPP_MID_ASSERV_AUTOSET:
      n = msg->asserv_autoset.side;
      htrajectory_autoset(&trajectory, n);
      break;

    case PPP_MID_ASSERV_SET_A_SPEED:
      s = AS_CONVERT(msg->asserv_set_a_speed.speed);
      a = AS_CONVERT(msg->asserv_set_a_speed.acc);
      htrajectory_setASpeed(&trajectory, s, a);
      break;

    case PPP_MID_ASSERV_SET_XY_CRUISE_SPEED:
      s = XYS_CONVERT(msg->asserv_set_xy_cruise_speed.speed);
      a = XYS_CONVERT(msg->asserv_set_xy_cruise_speed.acc);
      htrajectory_setXYCruiseSpeed(&trajectory, s, a);
      break;

    case PPP_MID_ASSERV_SET_XY_STEERING_SPEED:
      s = XYS_CONVERT(msg->asserv_set_xy_steering_speed.speed);
      a = XYS_CONVERT(msg->asserv_set_xy_steering_speed.acc);
      htrajectory_setXYCruiseSpeed(&trajectory, s, a);
      break;

    case PPP_MID_ASSERV_SET_XY_STOP_SPEED:
      s = XYS_CONVERT(msg->asserv_set_xy_stop_speed.speed);
      a = XYS_CONVERT(msg->asserv_set_xy_stop_speed.acc);
      htrajectory_setXYCruiseSpeed(&trajectory, s, a);
      break;

    case PPP_MID_ASSERV_SET_STEERING_WINDOW:
      x = MM_CONVERT(msg->asserv_set_steering_window.xywin);
      htrajectory_setSteeringWindow(&trajectory, x);
      break;

    case PPP_MID_ASSERV_SET_STOP_WINDOWS:
      x = MM_CONVERT(msg->asserv_set_stop_windows.xywin);
      a = RAD_CONVERT(msg->asserv_set_stop_windows.awin);
      htrajectory_setStopWindows(&trajectory, x, a);
      break;

    case PPP_MID_ASSERV_STATUS:
      status = 0;
      if(htrajectory_doneA(&trajectory))
        status |= _BV(0);
      if(htrajectory_doneXY(&trajectory))
        status |= _BV(1);
      if(htrajectory_blocked(&trajectory))
        status |= _BV(2);
      if(htrajectory_doneAutoset(&trajectory))
        status |= _BV(3);

      PPP_SEND_ASSERV_STATUS_R(msg->src, status);
      break;

    case PPP_MID_ASSERV_SET_POSITION:
      x = MM_CONVERT(msg->asserv_set_position.x);
      y = MM_CONVERT(msg->asserv_set_position.x);
      a = RAD_CONVERT(msg->asserv_set_position.a);
      hposition_set(trajectory.hrp, x, y, a);
      break;

    default:
      return;
  }
}

