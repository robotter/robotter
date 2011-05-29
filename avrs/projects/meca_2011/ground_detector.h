/*  
 *  Copyright RobOtter (2010) 
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
  * \author lamygalle
  */

#ifndef GROUND_DETECTOR_H
#define GROUND_DETECTOR_H

#include <aversive.h>


typedef struct{
  volatile uint8_t *pwm_port;             // pwm port register
  uint8_t pwm_pin_mask;                   // pwm pin nb bit field
  volatile uint8_t *enable_port;          // enable pin register
  uint8_t enable_pin_mask;                // enable pin bit field
  volatile uint8_t *object_present_pin;  // sensor input pin register
  uint8_t object_present_pin_mask;        // sensor input number bit field
  volatile uint8_t *sensor_output_select_mux_port; // only used in meca_2k10 to adapt to previous color sensor
  uint8_t sensor_output_mux_select_pin_mask; // only used in meca_2k10 to adapt to previous color sensor
  uint8_t sensor_number;
  uint16_t object_present_threshold;      // threshold that defines presence of object

} ground_detector_t;


/// initialise ground detector structure (must be called after all 
void ground_detector_init(ground_detector_t* gd);

/// signal registers and pin number of each signal used to get ground detector sensor status (the 3 one must be called before init)
void ground_detector_set_pwm_port(ground_detector_t* gd, volatile uint8_t *port,  uint8_t pin_nb);
void ground_detector_set_enable_port(ground_detector_t* gd, volatile uint8_t *port,  uint8_t pin_nb);
void ground_detector_set_object_present_pin(ground_detector_t* gd, volatile uint8_t *pin,  uint8_t pin_nb);
/// note: those function may not be called (only used on meca_2k10 board)
void ground_detector_set_sensor_output_mux_select_port(ground_detector_t* gd, volatile uint8_t *port,  uint8_t pin_nb);
void ground_detector_set_sensor_number(ground_detector_t* gd, uint8_t nb);
uint8_t ground_detector_get_sensor_number(ground_detector_t* gd);


/// object detection threshold accessors
void ground_detector_set_object_present_threshold(ground_detector_t* gd, uint16_t v); 
uint16_t ground_detector_get_object_present_threshold(ground_detector_t* gd);

// return the number of pwm sent to detect the object.
//note: if number no object is detected, returns 0
uint16_t ground_detector_get_object_presence_pwm_count(ground_detector_t* gd);

// return presence of object (compare ground_detector_get_object_presence_pwm_count() result to object_present_threshold)
uint8_t ground_detector_is_object_present(ground_detector_t* gd);

#endif
