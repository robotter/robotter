#ifndef STRAT_H
#define STRAT_H

/// Robot color.
typedef enum {
  ROBOT_COLOR_NONE = 0,
  ROBOT_COLOR_RED,
  ROBOT_COLOR_BLUE,
} RobotColor;

/// Main strat routine.
void strat_start(RobotColor color);

/** @brief Callback for PPP messages.
 * @retval 1 if handled, 0 otherwise
 */
int8_t ppp_strat_callback(PPPMsgFrame *msg);

#endif
