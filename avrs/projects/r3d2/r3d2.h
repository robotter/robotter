/*
 *  Copyright RobOtter (2011)
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/** \file
  * \author Lamygalle
  */

#ifndef R3D2_H
#define R3D2_H

#include <stdint.h>

void r3d2_init(void);
void r3d2_start(void);
void r3d2_stop(void);

/** @brief Detection of the other robot near the sensor.
 *
 * Based on robot_detected_timout_* variables.
 * 1 if detected, 0 otherwise.
 */
extern uint8_t r3d2_is_robot_detected;

/** @brief Last position of the robot
 *
 * May be obsolete if the robot is out of the detection range.
 */
extern double r3d2_detected_robot_angle;
extern double r3d2_detected_robot_distance;

void r3d2_monitor(void *dummy);

void r3d2_enable_sensor(void);
void r3d2_disable_sensor(void);

void r3d2_start_motor(void);
void r3d2_stop_motor(void);

void r3d2_set_motor_speed(uint16_t speed);
uint16_t r3d2_get_motor_speed(void);

/// Timeout indicating if the robot is in the detection range
extern uint8_t r3d2_motor_rotating_timeout_threshold;

/// Timeout indicating if the robot is in the detection range
extern uint8_t r3d2_robot_detected_timeout_threshold;

/// Angle offset added to the computed position
extern double r3d2_robot_detected_angle_offset;
void r3d2_update_angle_offset_from_object_angle(double given_angle);

/// Ratio to determine the correct distance of the robot
extern double r3d2_surface_reflection_ratio;
void r3d2_update_surface_ratio_from_object_distance(double distance);


/// Write all current memory values to EEPROM
void r3d2_write_to_eeprom(void);


#endif // R3D2_H
