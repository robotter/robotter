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

void start_r3d2(void);
void stop_r3d2(void);

uint8_t is_robot_detected(void);

double get_detected_robot_angle(void);
double get_detected_robot_distance(void);

void r3d2_monitor(void *dummy);

void enable_sensor(void);
void disable_sensor(void);

void start_motor(void);
void stop_motor(void);

void set_motor_speed(uint16_t speed);
uint16_t get_motor_speed(void);

void set_motor_rotating_timout_treshold(uint8_t value);
uint8_t get_motor_rotating_timout_treshold(void);

uint8_t get_robot_detected_timout_treshold(void);
void set_robot_detected_timout_treshold(uint8_t treshold);

void set_robot_detected_angle_offset(double offset);
double get_robot_detected_angle_offset(void);
void update_angle_offset_from_object_angle(double given_angle);

double get_surface_reflection_ratio(void);
void set_surface_reflection_ratio(double ratio);
void update_surface_ratio_from_object_distance(double distance);


#endif // R3D2_H
