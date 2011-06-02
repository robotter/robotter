#include <math.h>
#include <perlimpinpin.h>
#include "logging.h"
#include "strat.h"
#include "tirette.h"


typedef enum {
  ARM_LEFT = 0,
  ARM_RIGHT,
  ARM_NB
} Arm;

typedef enum {
  ARM_LOW = -1,
  ARM_MID = 0,
  ARM_HIGH = 1,
} ArmPos;

typedef struct {
  float x;
  float y;
} VecXY;

typedef struct {
  float x;
  float y;
  float a;
} VecXYA;

typedef struct {
  float r;
  float a;
} VecRA;

typedef union {
  uint8_t status;
  struct {
    uint8_t a:1;
    uint8_t xy:1;
    uint8_t blocked:1;
    uint8_t autoset:1;
  };
} __attribute__((__packed__)) AsservStatus;

enum {
  ASTATUS_A  = 1,
  ASTATUS_XY = 2,
};

typedef enum {
  SCAN_NONE = 0,
  SCAN_BAD,
  SCAN_GOOD,
} ScanCertainty;

typedef struct {
  ScanCertainty certainty;
  float x;
  float y;
  float h;
} ScanResult;

typedef enum {
  SIDE_BACK = 0,
  SIDE_RIGHT = 1,
  SIDE_LEFT = 2,
} AutosetSide;



/// 1 if pawn has been detected
static uint8_t arm_pawn_present[ARM_NB] = { 0, 0 };
/// 1 if a pawn is grabbed
static uint8_t arm_pawn_grabbed[ARM_NB] = { 0, 0 };
static int8_t arm_pos[ARM_NB] = { 0, 0 };
/// Set to 1 on overtorque.
static uint8_t arm_overtorque[ARM_NB] = { 0, 0 };
/// 1 if the scanner detected something
static uint8_t scanner_detected[ARM_NB] = { 0, 0 };
static AsservStatus asserv_status = { .status = 0 };
static VecRA r3d2_detection = { 0, 0 };
/// Last retrieved robot position.
static VecXYA robot_pos = { 0, 0, 0 };
/// Set to 1 when robot_pos is retrieved.
static uint8_t robot_pos_valid = 0;
/// Last retrieved scan result.
static ScanResult scan_result = { 0, 0, 0, 0 };
/// Last retrieved scan result.
static uint8_t scan_result_valid = 0;
/// Set to 1 when autoset is over.
static uint8_t asserv_autoset_done = 0;

/** @name Wrappers for asserv orders. */
//@{
static void goto_a(double a);
static void goto_ar(double a);
static void goto_xy(double x, double y);
static void goto_xyr(double x, double y);
static void goto_traj(const VecXY *xy, uint8_t n);
//@}

/** @name Wrappers for arm orders. */
//@{
static void arm_set_pos(Arm arm, ArmPos pos);
static void arm_release(Arm arm);
//@}

/** @brief Grab a pawn (lower, detect, raise).
 *
 * The arm is assumed to be in middle position.
 * The arm is left in high position.
 */
static void arm_grab(Arm arm);

/// Wait for a given asserv status mask.
static void wait_asserv_status(uint8_t status);
static void wait_arm_pos(Arm arm, ArmPos pos);

/// Update robot_pos, wait for the response.
static void get_robot_pos(void);
/// Update scan_result, wait for the response.
static void arm_scan(Arm arm);
/// Do an asserv autoset, wait for completion.
static void asserv_autoset(AutosetSide side, float x, float y);

/** @brief Robot avoidance. */
//@{

/// Callback when a robot to avoid is detected by R3D2.
static void avoidance_cb(void);

//@}


// Convenient aliases
#define PPP_PROP(m, ...)  PPP_SEND_##m(ROID_PROP, ##__VA_ARGS__)
#define PPP_MECA(m, ...)  PPP_SEND_##m(ROID_MECA, ##__VA_ARGS__)
#define PPP_R3D2(m, ...)  PPP_SEND_##m(ROID_R3D2, ##__VA_ARGS__)

#define PPP2RAD(v)   ((v)/1000.)
#define RAD2PPP(v)   ((v)*1000)

/// Size of chessboard squares.
#define SQSIZE       350.


void goto_a(double a)
{
  PPP_PROP(ASSERV_GOTO_AR, RAD2PPP(a));
  asserv_status.a = 0;
  PPP_PROP(ASSERV_STATUS);
}

void goto_ar(double a)
{
  PPP_PROP(ASSERV_GOTO_A, RAD2PPP(a));
  asserv_status.a = 0;
  PPP_SEND_ASSERV_STATUS(ROID_PROP);
}

void goto_xy(double x, double y)
{
  PPP_PROP(ASSERV_GOTO_XY, x, y);
  asserv_status.xy = 0;
  PPP_SEND_ASSERV_STATUS(ROID_PROP);
}

void goto_xyr(double x, double y)
{
  PPP_PROP(ASSERV_GOTO_XYR, x, y);
  asserv_status.xy = 0;
  PPP_SEND_ASSERV_STATUS(ROID_PROP);
}

void goto_traj(const VecXY *xy, uint8_t n)
{
  uint8_t i;
  for( i=0; i<n; i++ ) {
    PPP_PROP(ASSERV_LOAD, i, xy[i].x, xy[i].y);
  }
  PPP_PROP(ASSERV_RUN, n);
  asserv_status.xy = 0;
}


void arm_set_pos(Arm arm, ArmPos pos)
{
  PPP_MECA(ARM_SET_POS, arm, pos);
}

void arm_release(Arm arm)
{
  PPP_MECA(ARM_RELEASE, arm);
  arm_pawn_grabbed[arm] = 0;
}

void arm_grab(Arm arm)
{
  //XXX assert( ! arm_grabbed[arm] );
  arm_set_pos(arm, ARM_LOW);
  arm_overtorque[arm] = 0;
  while( arm_pos[arm] != ARM_LOW && !arm_overtorque[arm] ) {
    ppp_update();
  }
  arm_set_pos(arm, ARM_HIGH);
  wait_arm_pos(arm, ARM_HIGH);
  arm_pawn_grabbed[arm] = arm_pawn_present[arm];
}


void wait_asserv_status(uint8_t status)
{
  DEBUG(0, "waiting status %x", status);
  while( (asserv_status.status & status) != status ) {
    ppp_update();
  }
}

void wait_arm_pos(Arm arm, ArmPos pos)
{
  DEBUG(0, "waiting arm %u at %d", arm, pos);
  while( arm_pos[arm] != pos ) {
    ppp_update();
  }
}

void get_robot_pos(void)
{
  robot_pos_valid = 0;
  PPP_PROP(ASSERV_GET_POSITION);
  while( !robot_pos_valid ) {
    ppp_update();
  }
}

void arm_scan(Arm arm)
{
  scan_result_valid = 0;
  PPP_MECA(ARM_SCAN, arm);
  while( !scan_result_valid ) {
    ppp_update();
  }
}

void asserv_autoset(AutosetSide side, float x, float y)
{
  asserv_autoset_done = 0;
  PPP_PROP(ASSERV_AUTOSET, side, x, y);
  while( !asserv_autoset_done ) {
    ppp_update();
  }
}


void avoidance_cb(void)
{
  static uint8_t called = 0;  // to avoid recursive calls
  if( called ) {
    return;
  }
  called = 1;

  // block while the opponent is near us
  while( r3d2_detection.r < 50 ) {
    ppp_update();
  }

  called = 0;
}


int8_t ppp_strat_callback(PPPMsgFrame *msg)
{
  switch( msg->mid ) {
    case PPP_MID_ARM_AT_POS:
      arm_pos[msg->arm_at_pos.arm] = msg->arm_at_pos.pos;
      //TODO update arm_pawn_grabbed when pos is high
      break;
    case PPP_MID_ARM_PAWN_PRESENT:
      arm_pawn_present[msg->arm_pawn_present.arm] = msg->arm_pawn_present.b;
      break;
    case PPP_MID_SCANNER_THRESHOLD:
      scanner_detected[msg->scanner_threshold.arm] = msg->scanner_threshold.state == 0;
      break;
    case PPP_MID_ARM_OVERTORQUE:
      arm_overtorque[msg->arm_overtorque.arm] = 1;
      break;

    case PPP_MID_R3D2_DETECTED:
      r3d2_detection.r = msg->r3d2_detected.r;
      r3d2_detection.a = PPP2RAD(msg->r3d2_detected.a);
      avoidance_cb();
      break;

    case PPP_MID_ASSERV_ANGLE_REACHED:
      asserv_status.a = 1;
      break;
    case PPP_MID_ASSERV_TRAJECTORY_REACHED:
      if( msg->asserv_trajectory_reached.last ) {
        asserv_status.xy = 1;
      }
      break;

    case PPP_MID_ASSERV_STATUS_R:
      asserv_status.status = msg->asserv_status_r.status;
      break;

    case PPP_MID_ASSERV_GET_POSITION_R:
      robot_pos.x = msg->asserv_get_position_r.x;
      robot_pos.y = msg->asserv_get_position_r.y;
      robot_pos.a = PPP2RAD(msg->asserv_get_position_r.a);
      robot_pos_valid = 1;
      break;

    case PPP_MID_ARM_SCAN_R:
      scan_result.certainty = msg->arm_scan_r.certainty;
      scan_result.x = msg->arm_scan_r.x;
      scan_result.y = msg->arm_scan_r.y;
      scan_result.h = msg->arm_scan_r.h;
      scan_result_valid = 1;
      break;

    case PPP_MID_ASSERV_AUTOSET_R:
      asserv_autoset_done = 1;
      break;

    default: // not handled
      return 0;
  }
  return 1;
}


void strat_start(RobotColor color)
{
  if( color == ROBOT_COLOR_NONE ) {
    ERROR(0, "no color");
    return;
  }
  int8_t kx = color == ROBOT_COLOR_RED ? -1 : 1;

  // init
  PPP_SEND_SUBSCRIBE(0, PPP_DEVICE_ROID);
  PPP_PROP(ASSERV_SET_POSITION, 1300.*kx, 2100./2-15, RAD2PPP(M_PI));
  arm_set_pos(ARM_LEFT, ARM_HIGH);
  arm_set_pos(ARM_RIGHT, ARM_HIGH);

  NOTICE(0, "init done, color is %s", kx==ROBOT_COLOR_RED?"RED":"BLUE");

  /**  homologation  **/

  uint8_t karm = color == ROBOT_COLOR_RED ? ARM_LEFT : ARM_RIGHT;

  goto_xyr(0, -50);
  wait_asserv_status(ASTATUS_XY);

  goto_xy( 2.5*SQSIZE*kx, 2100./2-70 );
  arm_set_pos(karm, ARM_MID);
  wait_asserv_status(ASTATUS_XY);
  wait_arm_pos(karm, ARM_MID);

  // first pawn
  goto_xyr( -0.4*SQSIZE*kx, -0.4*SQSIZE );
  wait_asserv_status(ASTATUS_XY);
  if( arm_pawn_present[karm] ) {
    DEBUG(0, "pawn 1: PRESENT");
    arm_grab(karm);
    if( ! arm_pawn_grabbed[karm] ) {
      WARNING(0, "pawn 1: grab FAILED");
    }
  } else {
    DEBUG(0, "pawn 1: NO");
  }

  // end: kill all
  PPP_SEND_KILL(0);
  for(;;) ;
}

