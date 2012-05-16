#include <aversive.h>
#include <stdint.h>
#include <pwm_ng.h>
#include <scheduler.h>
#include <timer.h>
#include "brush.h"
#include "settings.h"

static struct pwm_ng brush_pwm;
static uint8_t brush_event;

static volatile uint16_t brush_position = 0;


enum {
  BRUSH_ON,
  BRUSH_OFF,
  BRUSH_STOP_OPEN,
  BRUSH_STOP_CLOSE,
} brush_state;


void brush_update(void *dummy)
{
  uint8_t flags;
  if( brush_state == BRUSH_STOP_OPEN && brush_state == BRUSH_STOP_CLOSE ) {
    IRQ_LOCK(flags);
    uint16_t t = brush_position;
    IRQ_UNLOCK(flags);
    uint16_t tmin, tmax;
    if( brush_state == BRUSH_STOP_OPEN ) {
      tmin = SETTING_BRUSH_OPEN_TMIN;
      tmax = SETTING_BRUSH_OPEN_TMAX;
    } else {
      tmin = SETTING_BRUSH_CLOSE_TMIN;
      tmax = SETTING_BRUSH_CLOSE_TMAX;
    }
    if( tmin <= t && t <= tmax ) {
      brush_stop();
    }
  }
  if( PINC & _BV(5) ) {
    IRQ_LOCK(flags);
    brush_position = 0;
    IRQ_UNLOCK(flags);
  }
}


void brush_init(void)
{
  DDRC &= ~_BV(5);
  PINC |= _BV(5);
  DDRC |= _BV(3);
  PORTC |= _BV(3);

  PWM_NG_TIMER_16BITS_INIT(1, TIMER_16_MODE_PWM_8, TIMER1_PRESCALER_DIV_8);
  PWM_NG_INIT16(&brush_pwm, 1, A, 9, PWM_NG_MODE_NORMAL, 0, 0);
  brush_stop();

  brush_event = scheduler_add_periodical_event_priority(
      &brush_update, 0,
      SETTING_SCHED_BRUSH_PERIOD, SETTING_SCHED_BRUSH_PRIORITY);
}

void brush_set_state(bool on, bool open)
{
  if(on) {
    brush_start();
  } else {
    brush_state = open ? BRUSH_STOP_OPEN : BRUSH_STOP_CLOSE;
  }
}

void brush_start(void)
{
  pwm_ng_set(&brush_pwm, SETTING_BRUSH_SPEED);
  brush_state = BRUSH_ON;
}

void brush_stop(void)
{
  pwm_ng_set(&brush_pwm, 0);
  brush_state = BRUSH_OFF;
}

void brush_set_speed(uint16_t speed)
{
  pwm_ng_set(&brush_pwm, speed);
  brush_state = BRUSH_ON;
}

uint16_t brush_get_pos(void)
{
  uint8_t flags;
  IRQ_LOCK(flags);
  uint16_t v = brush_position;
  IRQ_UNLOCK(flags);
  return v;
}


SIGNAL(SIG_INTERRUPT7)
{
  brush_position++;
}

