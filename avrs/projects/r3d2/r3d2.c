#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>
#include <math.h>
#include <timer.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
#include <pwm_ng.h>
#include <stdlib.h>
#include "r3d2.h"
#include "r3d2_config.h"


bool r3d2_robot_detected;
double r3d2_robot_angle;
double r3d2_robot_distance;

uint8_t r3d2_motor_watchdog_timeout;
EEMEM uint8_t eep_motor_watchdog_timeout = DEFAULT_MOTOR_WATCHDOG_TIMEOUT;
/// Current value of the motor watchdog (detect stop)
static volatile uint8_t r3d2_motor_watchdog_value;

uint8_t r3d2_detection_threshold;
EEMEM uint8_t eep_detection_threshold = DEFAULT_DETECTION_THRESHOLD;
/// Current count of successive robot detections
static uint8_t r3d2_detection_count;

/// Ratio used to determine the correct distance of the robot
double r3d2_distance_coef;
EEMEM float eep_distance_coef = DEFAULT_DISTANCE_COEF;

double r3d2_angle_offset;
EEMEM float eep_angle_offset = DEFAULT_ANGLE_OFFSET;

// Value of the PWM applied to the motor
EEMEM uint16_t eep_motor_speed = DEFAULT_MOTOR_SPEED;

/// Time of detection start in last rotation, in ticks
static volatile uint16_t last_detection_start;
/// Time of detection end in last rotation, in ticks
static volatile uint16_t last_detection_end;
/// Motor period of last rotation, in ticks
static volatile uint16_t last_motor_period;

// Detection start and end, updated by SICK sensor interruption
static volatile uint16_t detection_start_irq;
static volatile uint16_t detection_end_irq;
/// Set to true on sensor detection
static volatile bool detection_values_updated;

// PWM structure used to drive the motor
static struct pwm_ng pwm;

// some function prototype
static void init_sensor(void);
static void int0_init(void);
static void int1_init(void);
static void motor_init(void);


void r3d2_init(void)
{
  NOTICE(0, "Initializing timer");
  // initialize timer used by sensor detection and motor rotation
  timer_init();
  timer1_start();

  // initialize port to power on and get signal of the sensor
  NOTICE(0, "Initializing sensor");
  init_sensor();

  // power on the motor driving the mirror
  NOTICE(0, "Initializing motor");
  motor_init();

  // read configuration values from EEPROM
  r3d2_detection_threshold = eeprom_read_byte(&eep_detection_threshold);
  r3d2_motor_watchdog_timeout = eeprom_read_byte(&eep_motor_watchdog_timeout);
  r3d2_angle_offset = eeprom_read_float(&eep_angle_offset);
  r3d2_distance_coef = eeprom_read_float(&eep_distance_coef);

  r3d2_robot_detected = false;
  r3d2_detection_count = 0;
}


// INT0 initialization
void int0_init(void)
{
  MCUCR |= (2 << ISC00); // generate interrupt on falling edge
  sbi(GICR, INT0);       // enable interrupt
  sbi(GIFR, INTF0);      // clear previous interrupt
}

/// Interruption at mirror rotation
ISR(INT0_vect)
{
  uint16_t tnow = timer1_get();
  timer1_set(0);
  r3d2_motor_watchdog_value = r3d2_motor_watchdog_timeout;
  // update detection values and motor period
  if(detection_end_irq != 0xFFFF) {
    last_detection_start = detection_start_irq;
    last_detection_end = detection_end_irq;
    last_motor_period = tnow;
    detection_values_updated = true;
  }
  detection_start_irq = detection_end_irq = 0xFFFF;
}

// INT1 initialization
void int1_init(void)
{
  MCUCR |= (3 << ISC10); // generate interrupt on rising edge
  sbi(GICR, INT1);       // enable interrupt
  sbi(GIFR, INTF1);      // clear previous interrupt
}

/// Interruption of SICK sensor
ISR(INT1_vect)
{
  uint16_t tnow = timer1_get();
  if(bit_is_set(MCUCR, ISC10)) {
    // detection start
    cbi(MCUCR, ISC10);
    detection_start_irq = tnow;
  } else {
    // detection end
    sbi(MCUCR, ISC10);
    detection_end_irq = tnow;
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

  last_detection_start = last_detection_end = 0xFFFF;
  last_motor_period = 0;

  int0_init();

  PWM_NG_TIMER_8BITS_INIT(2, TIMER_8_MODE_PWM, TIMER1_PRESCALER_DIV_256);
  PWM_NG_INIT8(&pwm, 2, 12, PWM_NG_MODE_NORMAL, NULL, 0);
  r3d2_start_motor();
}

void r3d2_start_motor(void)
{
  sbi(PORTD, 5);
  // hack to start mirror even if PWM value is too low to start rotation
  pwm_ng_set(&pwm, 5000);
  wait_ms(500);
  pwm_ng_set(&pwm, r3d2_get_motor_speed());
  r3d2_motor_watchdog_value = r3d2_motor_watchdog_timeout;
}

void r3d2_stop_motor(void)
{
  cbi(PORTD, 5);
}

bool r3d2_motor_is_powered(void)
{
  return PORTD & _BV(5);
}

void r3d2_start(void)
{
  if(!r3d2_motor_is_powered()) {
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


void r3d2_update_angle_offset_from_object_angle(double angle)
{
  // angle value without offset
  double angle_raw = r3d2_robot_angle - r3d2_angle_offset;
  for( ; angle_raw > M_2_PI; angle_raw -= M_2_PI ) ;
  for( ; angle_raw < 0; angle_raw += M_2_PI ) ;
  // compute and update offset
  r3d2_angle_offset = angle - angle_raw;
}


void r3d2_update_distance_coef_from_object_distance(double dist)
{
  // distance value without coef
  double dist_raw = r3d2_robot_distance / r3d2_distance_coef;
  // compute and update coef
  r3d2_distance_coef = dist / dist_raw;
}


void r3d2_update(void *dummy)
{
  if(detection_values_updated) {
    detection_values_updated = false;
    uint8_t irq_ctx;
    IRQ_LOCK(irq_ctx);
    // use local values for atomicity during computations
    uint16_t detection_start = last_detection_start;
    uint16_t detection_end = last_detection_end;
    uint16_t motor_period = last_motor_period;
    IRQ_UNLOCK(irq_ctx);

    // compute robot position
    uint16_t detection_duration = detection_end - detection_start;
    uint16_t detection_angle = detection_start + detection_duration/2;
    r3d2_robot_angle = ((float)detection_angle * M_2_PI) / motor_period + r3d2_angle_offset;
    for( ; r3d2_robot_angle > M_2_PI; r3d2_robot_angle -= M_2_PI ) ;
    for( ; r3d2_robot_angle < 0; r3d2_robot_angle += M_2_PI ) ;
    r3d2_robot_distance = r3d2_distance_coef / (2*tan((float)detection_duration*M_PI / motor_period));

    // reset robot detection
    r3d2_robot_detected = false;
    r3d2_detection_count = 0;

  } else {
    // robot in range, handle detection timer
    if(r3d2_detection_count >= r3d2_detection_threshold) {
      r3d2_robot_detected = true;
    } else {
      r3d2_detection_count++;
    }
  }

  // handle motor watchdog
  if(r3d2_motor_is_powered()) {
    if(r3d2_motor_watchdog_value == 0) {
      WARNING(0, "motor stopped, restarting");
      r3d2_start_motor();
    } else {
      r3d2_motor_watchdog_value--;
    }
  }
}


void r3d2_write_to_eeprom(void)
{
  eeprom_update_byte(&eep_detection_threshold, r3d2_detection_threshold);
  eeprom_update_byte(&eep_motor_watchdog_timeout, r3d2_motor_watchdog_timeout);
  eeprom_update_float(&eep_angle_offset, r3d2_angle_offset);
  eeprom_update_float(&eep_distance_coef, r3d2_distance_coef);
}

