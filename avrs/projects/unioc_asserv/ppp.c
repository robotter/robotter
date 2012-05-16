#include <aversive/error.h>
#include <perlimpinpin_common.h>

#include "htrajectory.h"
#include "avoidance.h"

extern avoidance_t avoidance;
extern robot_cs_t robot_cs;
extern htrajectory_t trajectory;

#define FROM_RAD(v) ((int16_t)(v*1000))
#define FROM_MM(v) ((int16_t)(v))

#define TO_RAD(v) ((double)(v)/1000)
#define TO_MM(v) ((double)(v))
#define TO_AS(v) ((double)(v)/100)
#define TO_XYS(v) ((double)(v)/1000)

vect_xy_t points[HTRAJECTORY_MAX_POINTS];

void ppp_msg_callback(PPPMsgFrame *msg)
{
  if( ppp_common_callback(msg) ) {
    return;
  }

  hrobot_vector_t hvec;
  uint8_t n,status;
  double x,y,a,s;
  int16_t ix,iy,ia;

  DEBUG(0,"msg_callback %d %d",msg->src, msg->mid);

  switch( msg->mid ) {
    case PPP_MID_KILL:
      PPP_REPLY_KILL(msg);
      EMERG(0,"KILL recveived from PPP");
      break;

    case PPP_MID_ASSERV_GOTO_A:
      a = TO_RAD(msg->asserv_goto_a.a);
      DEBUG(0,"GOTO_A %1.1f",a);
      htrajectory_gotoA(&trajectory,a);
      PPP_REPLY_ASSERV_GOTO_A(msg);
      break;

    case PPP_MID_ASSERV_GOTO_AR:
      a = TO_RAD(msg->asserv_goto_ar.a);
      DEBUG(0,"GOTO_AR %1.1f",a);
      htrajectory_gotoA_R(&trajectory,a);
      PPP_REPLY_ASSERV_GOTO_AR(msg);
      break;

    case PPP_MID_ASSERV_GOTO_XY:
      x = TO_MM(msg->asserv_goto_xy.x);
      y = TO_MM(msg->asserv_goto_xy.y);
      DEBUG(0,"GOTO_XY %1.1f %1.1f",x,y);
      htrajectory_gotoXY(&trajectory, x, y);
      PPP_REPLY_ASSERV_GOTO_XY(msg);
      break;

    case PPP_MID_ASSERV_GOTO_XYR:
      x = TO_MM(msg->asserv_goto_xyr.x);
      y = TO_MM(msg->asserv_goto_xyr.y);
      DEBUG(0,"GOTO_XYR %1.1f %1.1f",x,y);
      htrajectory_gotoXY_R(&trajectory, x, y);
      PPP_REPLY_ASSERV_GOTO_XYR(msg);
      break;

    case PPP_MID_ASSERV_RUN:
      n = msg->asserv_run.n;
      if(n > HTRAJECTORY_MAX_POINTS)
        WARNING(0,"Command ASSERV_RUN failed, too much points: %d>%d",
                    n, HTRAJECTORY_MAX_POINTS);
      else
        htrajectory_run(&trajectory, points, n);
      PPP_REPLY_ASSERV_RUN(msg);
      break;

    case PPP_MID_ASSERV_LOAD:
      n = msg->asserv_load.idx;
      x = TO_MM(msg->asserv_load.x);
      y = TO_MM(msg->asserv_load.y);
      if(n > HTRAJECTORY_MAX_POINTS)
        WARNING(0,"Command ASSERV_LOAD failed, index not in range: %d>%d",
                    n, HTRAJECTORY_MAX_POINTS);
      else
      {
        points[n].x = x;
        points[n].y = y;
      }
      PPP_REPLY_ASSERV_LOAD(msg);
      break;

    case PPP_MID_ASSERV_AUTOSET:
      n = msg->asserv_autoset.side;
      x = TO_MM(msg->asserv_autoset.x);
      y = TO_MM(msg->asserv_autoset.y);
      htrajectory_autoset(&trajectory, n, x, y);
      PPP_REPLY_ASSERV_AUTOSET(msg);
      break;

    case PPP_MID_ASSERV_SET_A_SPEED:
      s = TO_AS(msg->asserv_set_a_speed.speed);
      a = TO_AS(msg->asserv_set_a_speed.acc);
      htrajectory_setASpeed(&trajectory, s, a);
      PPP_REPLY_ASSERV_SET_A_SPEED(msg);
      break;

    case PPP_MID_ASSERV_SET_XY_CRUISE_SPEED:
      s = TO_XYS(msg->asserv_set_xy_cruise_speed.speed);
      a = TO_XYS(msg->asserv_set_xy_cruise_speed.acc);
      htrajectory_setXYCruiseSpeed(&trajectory, s, a);
      PPP_REPLY_ASSERV_SET_XY_CRUISE_SPEED(msg);
      break;

    case PPP_MID_ASSERV_SET_XY_STEERING_SPEED:
      s = TO_XYS(msg->asserv_set_xy_steering_speed.speed);
      a = TO_XYS(msg->asserv_set_xy_steering_speed.acc);
      htrajectory_setXYCruiseSpeed(&trajectory, s, a);
      PPP_REPLY_ASSERV_SET_XY_STEERING_SPEED(msg);
      break;

    case PPP_MID_ASSERV_SET_XY_STOP_SPEED:
      s = TO_XYS(msg->asserv_set_xy_stop_speed.speed);
      a = TO_XYS(msg->asserv_set_xy_stop_speed.acc);
      htrajectory_setXYCruiseSpeed(&trajectory, s, a);
      PPP_REPLY_ASSERV_SET_XY_STOP_SPEED(msg);
      break;

    case PPP_MID_ASSERV_SET_STEERING_WINDOW:
      x = TO_MM(msg->asserv_set_steering_window.xywin);
      htrajectory_setSteeringWindow(&trajectory, x);
      PPP_REPLY_ASSERV_SET_STEERING_WINDOW(msg);
      break;

    case PPP_MID_ASSERV_SET_STOP_WINDOWS:
      x = TO_MM(msg->asserv_set_stop_windows.xywin);
      a = TO_RAD(msg->asserv_set_stop_windows.awin);
      htrajectory_setStopWindows(&trajectory, x, a);
      PPP_REPLY_ASSERV_SET_STOP_WINDOWS(msg);
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

      PPP_REPLY_ASSERV_STATUS(msg, status);
      break;

    case PPP_MID_ASSERV_SET_POSITION:
      x = TO_MM(msg->asserv_set_position.x);
      y = TO_MM(msg->asserv_set_position.y);
      a = TO_RAD(msg->asserv_set_position.a);
      hposition_set(trajectory.hrp, x, y, a);
      htrajectory_reset_carrot(&trajectory);
      PPP_REPLY_ASSERV_SET_POSITION(msg);
      break;

    case PPP_MID_ASSERV_GET_POSITION:
      hposition_get(trajectory.hrp, &hvec);
      ix = FROM_MM(hvec.x);
      iy = FROM_MM(hvec.y);
      ia = FROM_RAD(hvec.alpha);
      PPP_REPLY_ASSERV_GET_POSITION(msg, ix, iy, ia);
      break;

    case PPP_MID_FORCE_AVOIDANCE:
      n = msg->force_avoidance.b;
      avoidance_force_blocked(&avoidance, n);
      PPP_REPLY_FORCE_AVOIDANCE(msg);
      break;

    default:
      break;
  }
}

