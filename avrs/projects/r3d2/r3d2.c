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
#include "r3d2.h"
#include "r3d2_config.h"
#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>
#include <pwm_ng.h>
#include <timer.h>
#include <stdlib.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
#include <math.h>


// angle , and distance of the object (measured in timer ticks), period of the motor, values modified by during one rotation
static volatile uint16_t object_beginnig_detection_irq, object_end_detection_irq, motor_period_irq;
// same variable but modified at the same time : at the end of a rotation
static volatile uint16_t object_beginnig_detection, object_end_detection, motor_period;

/// 1 if a robot has been detected, 0 otherwise.
static volatile uint8_t position_updated_value;

double r3d2_detected_robot_angle;
double r3d2_detected_robot_distance;

static uint8_t robot_detected_timout_value;
uint8_t r3d2_robot_detected_timeout_threshold;
EEMEM uint8_t eep_robot_detected_timeout_threshold = (uint8_t)DEFAULT_ROBOT_DETECTED_TIMEOUT_THRESHOLD;

uint8_t r3d2_is_robot_detected;

// pwm structure used to drive the motor
static struct pwm_ng pwm;

// value of the pwm applied to the motor
EEMEM uint16_t eep_motor_speed = (uint16_t)DEFAULT_MOTOR_SPEED;

// ratio used to determine the correct distance of the robot
double r3d2_surface_reflection_ratio;
EEMEM float eep_surface_reflection_ratio = DEFAULT_SURFACE_REFLECTION_RATIO;

// timout that indicates if robot is present on detecting range
static volatile uint8_t r3d2_motor_rotating_timeout_value;
uint8_t r3d2_motor_rotating_timeout_threshold;
EEMEM uint8_t eep_motor_rotating_timeout_threshold = (uint8_t)DEFAULT_MOTOR_ROTATING_TIMEOUT_THRESHOLD;

double r3d2_robot_detected_angle_offset;
EEMEM float eep_robot_detected_angle_offset = DEFAULT_ROBOT_DETECTED_ANGLE_OFFSET;

// some function prototype
static void init_sensor(void);
static void int0_init(void);
static void int1_init(void);
static void motor_init(void);


void r3d2_init(void)
{
  NOTICE(0,"Initializing timer");
  // initialise timer used to get ticks of sensor detection and motor rotation
  timer_init();

  NOTICE(0,"timer1 starting");
  timer1_start();

  // initialise port to power on and get signal of the sensor
  NOTICE(0,"Initializing sensor");
  init_sensor();

  // power on the motor that drive the mirror
  NOTICE(0,"Initializing motor");
  motor_init();

  // first there is no robot detected, neither motor error
  r3d2_is_robot_detected = 1;

  r3d2_robot_detected_timeout_threshold = eeprom_read_byte(&eep_robot_detected_timeout_threshold);
  r3d2_surface_reflection_ratio = eeprom_read_float(&eep_surface_reflection_ratio);
  r3d2_robot_detected_angle_offset = eeprom_read_float(&eep_robot_detected_angle_offset);
  r3d2_motor_rotating_timeout_threshold = eeprom_read_byte(&eep_motor_rotating_timeout_threshold);

  r3d2_motor_rotating_timeout_value = r3d2_motor_rotating_timeout_threshold;
  robot_detected_timout_value = 0;
}

// int0 initialisation (mirror)
void int0_init(void)
{
  MCUCR |= (2 << ISC00); // generates interrupt on falling edge
  sbi(GICR, INT0);       // enable interrupt
  sbi(GIFR, INTF0);      // clear previous interrupt
}


ISR(INT0_vect)
{
  motor_period_irq = timer1_get();
  timer1_set(0);

  // recopy to allow detection of motor blocked
  motor_period  = motor_period_irq;

  // used to detect if motor is stopped (
  if (r3d2_motor_rotating_timeout_value <= 6)
  {
    r3d2_motor_rotating_timeout_value += r3d2_motor_rotating_timeout_threshold;
  }

  // initialise data to know when it has been updated
  object_beginnig_detection_irq = 0xFFFF;
  object_end_detection_irq = 0xFFFF;
}

// int1 initialisation (sick sensor)
void int1_init(void)
{
  MCUCR |= (3 << ISC10); // generates interrupt on rising edge
  sbi(GICR, INT1);       // enable interrupt
  sbi(GIFR, INTF1);      // clear previous interrupt
}


ISR(INT1_vect)
{
  uint16_t timer_value = timer1_get();

  // end of object detection
  if(!bit_is_set(MCUCR, ISC10))
  {
    // store timer value and prepare to detect future beginning of object
    object_end_detection_irq= timer_value;
    sbi(MCUCR, ISC10);

    position_updated_value = 1;

    // recopy data modified in block
    object_beginnig_detection = object_beginnig_detection_irq;
    object_end_detection  = object_end_detection_irq;
    motor_period  = motor_period_irq;
  }
  else
  {
    cbi(MCUCR, ISC10);
    object_beginnig_detection_irq = timer_value;
  }
}

void r3d2_enable_sensor(void)
{
  sbi(DDRB, 1);
  sbi(PORTB, 1);
}

void r3d2_disable_sensor(void)
{
  cbi(PORTB,1);
}

void init_sensor(void)
{
  int1_init();
  r3d2_enable_sensor();
}


void motor_init(void)
{
  // direction
  sbi(DDRD, 4);
  sbi(DDRD, 4);

  // brake
  sbi(DDRD, 5);
  sbi(PORTD, 5);

  motor_period = 0;

  int0_init();

  PWM_NG_TIMER_8BITS_INIT(2, TIMER_8_MODE_PWM,
                          TIMER1_PRESCALER_DIV_256);

  PWM_NG_INIT8(&pwm, 2, 12, PWM_NG_MODE_NORMAL, NULL, 0);
  r3d2_start_motor();
}

void r3d2_start_motor(void)
{
  sbi(PORTD, 5);
  // hack to start mirror even if pwn value is too low to start rotation
  pwm_ng_set(&pwm, 5000);
  wait_ms(500);
  pwm_ng_set(&pwm, r3d2_get_motor_speed());
}

void r3d2_stop_motor(void)
{
  cbi(PORTD, 5);
}

uint8_t is_motor_powered(void)
{
  if (PORTD &_BV(5))
    return 1;
  else
    return 0;
}

void r3d2_start(void)
{
  if (!is_motor_powered())
  {
    r3d2_start_motor();
  }
  r3d2_enable_sensor();
}

void r3d2_stop(void)
{
  r3d2_stop_motor();
  r3d2_disable_sensor();
}


void r3d2_set_motor_speed(uint16_t speed)
{
  pwm_ng_set(&pwm, speed);
  eeprom_update_word(&eep_motor_speed, speed);
}

uint16_t r3d2_get_motor_speed(void)
{
  return eeprom_read_word(&eep_motor_speed);
}


// automatic calculation of ratio with object detection and relative distance form object
// given_angle must be between 0 and 360 (°)
void r3d2_update_angle_offset_from_object_angle(double given_angle)
{
  double new_offset;

  // compute value without offset
  new_offset = r3d2_detected_robot_angle - r3d2_robot_detected_angle_offset;


  // angle is modulo360
  if (new_offset<0)
    new_offset += 360;

  // then compute radio that is a ratio between distance (here new_ratio) and real distance
  new_offset = given_angle - new_offset;

  // update offset
  r3d2_robot_detected_angle_offset = new_offset;
}


// automatic calculation of ratio with object detection and relative distance form object
// given_distance must be in cm
void r3d2_update_surface_ratio_from_object_distance(double given_distance)
{
  double new_ratio = r3d2_detected_robot_distance;
  // compute value without ratio
  new_ratio = new_ratio/r3d2_surface_reflection_ratio;

  // then compute radio that is a ratio between distance (here new_ratio) and real distance
  new_ratio = given_distance/new_ratio;
  r3d2_surface_reflection_ratio = new_ratio;
}

double convert_timer_ticks_to_rpm(uint16_t timer_ticks)
{
  return ((double)((F_CPU*60)/TIMER1_PRESCALER_DIV)/(double)timer_ticks);
}

double convert_timers_ticks_to_angle(uint16_t angle, uint16_t motor_period)
{
  return (((double)angle *360)/(double)motor_period);
}
///---------------------------------------------------------------
/// robot detection accessor (detected, and position )
uint8_t is_robot_detected(void)
{
  return r3d2_is_robot_detected;
}


void r3d2_monitor(void *dummy)
{
  uint16_t object_angle, object_duty_cycle;
  double float_duty_cycle;
  uint8_t irq_ctx;
  uint16_t object_beginnig_detection_local, object_end_detection_local, motor_period_local;

  // if new position is avaliable
  if(position_updated_value == 1)
  {
    // recopy value on local variable to avoid modification during computation
    IRQ_LOCK(irq_ctx);
    object_beginnig_detection_local = object_beginnig_detection;
    object_end_detection_local = object_end_detection;
    motor_period_local = motor_period;
    IRQ_UNLOCK(irq_ctx);

    // robot position computation
    object_duty_cycle = object_end_detection_local - object_beginnig_detection_local;
    object_angle = object_beginnig_detection_local + object_duty_cycle/2;

    r3d2_detected_robot_angle = (((float)object_angle)*360)/motor_period_local;
    r3d2_detected_robot_angle = (r3d2_detected_robot_angle + r3d2_robot_detected_angle_offset);

    if (r3d2_detected_robot_angle > 360)
    {
      r3d2_detected_robot_angle -= 360;
    }
    else if(r3d2_detected_robot_angle <0)
    {
      r3d2_detected_robot_angle += 360;
    }

    float_duty_cycle = (((float)object_duty_cycle)*360)/motor_period_local;
    r3d2_detected_robot_distance = r3d2_surface_reflection_ratio/(2 * tan(float_duty_cycle*M_PI_2/180));

    // update flags
    r3d2_is_robot_detected = 0;
    position_updated_value = 0;

    // reset robot detection timout
    robot_detected_timout_value =0;

  }
  else
  {
    // robot decetion timout reached
    if (robot_detected_timout_value >= r3d2_robot_detected_timeout_threshold)
    {
      r3d2_is_robot_detected = 1;
    }
    else
    {
      robot_detected_timout_value ++;
    }
  }

  // value not protected from irq
  if(r3d2_motor_rotating_timeout_value == 0 && is_motor_powered())
  {
    WARNING(0,"motor stopped, restarting");
    r3d2_start_motor();
    r3d2_motor_rotating_timeout_value = r3d2_motor_rotating_timeout_threshold;
  }
  else
  {
    r3d2_motor_rotating_timeout_value --;
  }

}


void r3d2_write_to_eeprom(void)
{
  eeprom_update_byte(&eep_motor_rotating_timeout_threshold, r3d2_motor_rotating_timeout_threshold);
  eeprom_update_byte(&eep_robot_detected_timeout_threshold, r3d2_robot_detected_timeout_threshold);
  eeprom_update_float(&eep_robot_detected_angle_offset, r3d2_robot_detected_angle_offset);
  eeprom_update_float(&eep_surface_reflection_ratio, r3d2_surface_reflection_ratio);
}

