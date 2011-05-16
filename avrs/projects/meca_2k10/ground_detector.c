#include "ground_detector.h"
#include <aversive/error.h>
#include <util/delay.h>
#include <stdlib.h>

#include <aversive/wait.h>

// function that change 1 pin defined on ground detector structure
static void gd_select_sensor(ground_detector_t* gd);
static void gd_deselect_sensor(ground_detector_t* gd);
static void gd_send_one_pulse(ground_detector_t* gd);
static uint8_t gd_get_sensor_state(ground_detector_t* gd);





void ground_detector_set_pwm_port(ground_detector_t* gd, volatile uint8_t *port,  uint8_t pin_nb)
{
    gd->pwm_port = port;
    if (pin_nb <= 7)
    {
      gd->pwm_pin_mask = _BV(pin_nb);
    }
}

void ground_detector_set_enable_port(ground_detector_t* gd, volatile uint8_t *port,  uint8_t pin_nb)
{
    gd->enable_port = port;
    if (pin_nb <= 7)
    {
      gd->enable_pin_mask = _BV(pin_nb);
    }   
}

void ground_detector_set_object_present_pin(ground_detector_t* gd, volatile uint8_t *pin,  uint8_t pin_nb)
{
    gd->object_present_pin = pin;
    if (pin_nb <= 7)
    {
      gd->object_present_pin_mask = _BV(pin_nb);
    }
}

void ground_detector_set_sensor_output_mux_select_port(ground_detector_t* gd, volatile uint8_t *port,  uint8_t pin_nb)
{
    gd->sensor_output_select_mux_port = port;
    if (pin_nb <= 7)
    {
      gd->sensor_output_mux_select_pin_mask = _BV(pin_nb);
    }
}

void ground_detector_set_sensor_number(ground_detector_t* gd, uint8_t nb)
{
  gd->sensor_number = nb;
}

uint8_t ground_detector_get_sensor_number(ground_detector_t* gd)
{
  return gd->sensor_number;
}

void ground_detector_set_object_present_threshold(ground_detector_t* gd, uint16_t v)
{
    gd->object_present_threshold = v;
}

uint16_t ground_detector_get_object_present_threshold(ground_detector_t* gd)
{
    return  gd->object_present_threshold;
}


void gd_select_sensor(ground_detector_t* gd)
{
  if (gd->enable_port != NULL)
  {
  *(gd->enable_port) &= ~gd->enable_pin_mask;
  }
}

void gd_deselect_sensor(ground_detector_t* gd)
{
  if (gd->enable_port != NULL)
  {
   *(gd->enable_port) |= gd->enable_pin_mask;
  }
}

void gd_send_one_pulse(ground_detector_t* gd)
{
  if (gd->pwm_port != NULL)
  {
    *(gd->pwm_port) |= gd->pwm_pin_mask;
    _delay_us(1);
    *(gd->pwm_port) &= ~gd->pwm_pin_mask;
    _delay_us(1);
  }
}

uint8_t gd_get_sensor_state(ground_detector_t* gd)
{
  if (gd->sensor_output_select_mux_port != NULL)
  {
    switch(gd->sensor_number)
    {
      case 0 : *(gd->sensor_output_select_mux_port) &= ~gd->sensor_output_mux_select_pin_mask; 
        break;
      case 1 : *(gd->sensor_output_select_mux_port) |= gd->sensor_output_mux_select_pin_mask; 
        break;
      default: ERROR(ERROR_SEVERITY_ERROR,"sensor_number not supported, see ground_detector.c"); break;
    }
  }
  return (*(gd->object_present_pin) &gd->object_present_pin_mask)==0;
}

void ground_detector_init(ground_detector_t* gd)
{
 //set port as output (ddr register address is always at relative address -1 from port one and +1 from pin one). see page 363 of atmega128 DS to understand
  
  if (gd->pwm_port != NULL)
  {
    *(gd->pwm_port-1) |= gd->pwm_pin_mask; // set port as output
  }
  if (gd->pwm_port != NULL)
  {
    *(gd->pwm_port) &= ~gd->pwm_pin_mask; // set port at low level
  }
  if (gd->enable_port != NULL)
  {
    *(gd->enable_port-1) |= gd->enable_pin_mask; //set port as output
  }
  gd_deselect_sensor(gd);
  
  if (gd->object_present_pin!=NULL)
  {
    *(gd->object_present_pin+1) &= ~gd->object_present_pin_mask; // set port as input
  }

  if (gd->sensor_output_select_mux_port !=NULL)
  {
   *(gd->sensor_output_select_mux_port-1) |= gd->sensor_output_mux_select_pin_mask;// set port as output
  }
}

uint16_t ground_detector_get_object_presence_pwm_count(ground_detector_t* gd)
{
  uint16_t dist = 1;
  gd_select_sensor(gd);
  for(dist = 1; dist <= 500 && gd_get_sensor_state(gd) == 0; dist ++)
  {
    gd_send_one_pulse(gd);
  }
  if(dist >= 500)
  {
    dist = -1;
  }
  gd_deselect_sensor(gd);
  return dist;
}

uint8_t ground_detector_is_object_present(ground_detector_t* gd)
{
    return (ground_detector_get_object_presence_pwm_count(gd) <= gd->object_present_threshold);
}
