#ifndef R3D2_H
#define R3D2_H

#include <stdint.h>
#include <stdbool.h>

void r3d2_init(void);
void r3d2_start(void);
void r3d2_stop(void);

/// True if robot is in the detection range
extern bool r3d2_robot_detected;
/// Detected robot angle
extern double r3d2_robot_angle;
/// Detected robot distance
extern double r3d2_robot_distance;

/// Timeout of motor watchdog (restart on stop), writable
extern uint8_t r3d2_motor_watchdog_timeout;
/// Duration after which robot is considered in the detection range, writable
extern uint8_t r3d2_detection_threshold;
/// Offset added to the computed angle, writable
extern double r3d2_angle_offset;
/// Coefficient for robot distance computation
extern double r3d2_distance_coef;

/// Method to call regularly to update detection values
void r3d2_update(void *);

void r3d2_enable_sensor(void);
void r3d2_disable_sensor(void);

void r3d2_start_motor(void);
void r3d2_stop_motor(void);

void r3d2_set_motor_speed(uint16_t speed);
uint16_t r3d2_get_motor_speed(void);

/// Compute angle offset from known object angle (in radians)
void r3d2_update_angle_offset_from_object_angle(double angle);

/// Compute distance coef from known object distance (in cm)
void r3d2_update_distance_coef_from_object_distance(double dist);

/// Write all current memory values to EEPROM
void r3d2_write_to_eeprom(void);


#endif
