/*  
 *  Copyright RobOtter (2009) 
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

/** \file motor.c
  * \author JD
  *
  */

#include "motor.h"

#include <avr/interrupt.h>
#include <aversive/wait.h>
#include <aversive/error.h>
#include <pwm.h>

// encoders previous values
int32_t encoder1_pvalue;
int32_t encoder2_pvalue;
int32_t encoder3_pvalue;

// motors bit signs
uint8_t motor1_sign;
uint8_t motor2_sign;
uint8_t motor3_sign;

int16_t pwm_1,pwm_2,pwm_3;

// PWM overflow event
ISR(SIG_OVERFLOW1)
{
  // set motor1 sign bit
  if(motor1_sign)
    sbi(MOTOR_CS_PWM1_PORT,MOTOR_CS_PWM1_PIN);
  else
    cbi(MOTOR_CS_PWM1_PORT,MOTOR_CS_PWM1_PIN);

  // set motor2 sign bit
  if(motor2_sign)
    sbi(MOTOR_CS_PWM2_PORT,MOTOR_CS_PWM2_PIN);
  else
    cbi(MOTOR_CS_PWM2_PORT,MOTOR_CS_PWM2_PIN);

  // set motor3 sign bit
  if(motor3_sign)
    sbi(MOTOR_CS_PWM3_PORT,MOTOR_CS_PWM3_PIN);
  else
    cbi(MOTOR_CS_PWM3_PORT,MOTOR_CS_PWM3_PIN);
}

void motor_cs_init()
{
  // initialize pwms
  pwm_init();

  // setup pwms dirs
  sbi(MOTOR_CS_PWM1_DDR,MOTOR_CS_PWM1_PIN);
  cbi(MOTOR_CS_PWM1_PORT,MOTOR_CS_PWM1_PIN);

  sbi(MOTOR_CS_PWM2_DDR,MOTOR_CS_PWM2_PIN);
  cbi(MOTOR_CS_PWM2_PORT,MOTOR_CS_PWM2_PIN);

  sbi(MOTOR_CS_PWM3_DDR,MOTOR_CS_PWM3_PIN);
  cbi(MOTOR_CS_PWM3_PORT,MOTOR_CS_PWM3_PIN);

  motor1_sign = 0;
  motor2_sign = 0;
  motor3_sign = 0;

  pwm_set_1A(0);
  pwm_set_1B(0);
  pwm_set_1C(0);
  
  // setup brake
  sbi(MOTOR_CS_BREAK_DDR, MOTOR_CS_BREAK_PIN);
  cbi(MOTOR_CS_BREAK_PORT, MOTOR_CS_BREAK_PIN);

  // activate interrupts
  sbi(TIMSK,TOIE1);

	return;
}

void motor_cs_break(uint8_t state)
{
  if(state)
    cbi(MOTOR_CS_BREAK_PORT,MOTOR_CS_BREAK_PIN);
  else    
    sbi(MOTOR_CS_BREAK_PORT,MOTOR_CS_BREAK_PIN);
}

int32_t get_encoder_motor1(void* dummy)
{
  int32_t value,speed;

  value = _SFR_MEM32(MOTOR_CS_ENCODER1_ADDR);
  speed = value - encoder1_pvalue;
  encoder1_pvalue = value;

	return speed;
}

int32_t get_encoder_motor2(void* dummy)
{
  int32_t value,speed;

  value = _SFR_MEM32(MOTOR_CS_ENCODER2_ADDR);
  speed = value - encoder2_pvalue;
  encoder2_pvalue = value;

	return speed;
}

int32_t get_encoder_motor3(void* dummy)
{
  int32_t value,speed;

  value = _SFR_MEM32(MOTOR_CS_ENCODER3_ADDR);
  speed = value - encoder3_pvalue;
  encoder3_pvalue = value;

	return speed;
}

void set_pwm_motor1(void* dummy, int32_t pwm)
{
  S_MAX(pwm,4095);

  pwm_1 = pwm;

  if( (pwm == 4095)||(pwm ==  -4095))
    DEBUG(MOTORCS_ERROR,"PWM#1 saturated pwm=%d",pwm);

  if(pwm>0)
  {
    pwm_set_1C(4095-pwm);
    //sbi(MOTOR_CS_PWM1_PORT,MOTOR_CS_PWM1_PIN);
    motor1_sign = 1;
  }
  else
  {
    pwm_set_1C(-pwm);
    //cbi(MOTOR_CS_PWM1_PORT,MOTOR_CS_PWM1_PIN);
    motor1_sign = 0;
  }

  return;
}

void set_pwm_motor2(void* dummy, int32_t pwm)
{
  S_MAX(pwm,4095);

  pwm_2 = pwm;

  if( (pwm == 4095)||(pwm ==  -4095))
    DEBUG(MOTORCS_ERROR,"PWM#2 saturated pwm=%d",pwm);

  if(pwm>0)
  {
    pwm_set_1B(4095-pwm);
    //sbi(MOTOR_CS_PWM2_PORT,MOTOR_CS_PWM2_PIN);
    motor2_sign = 1;
  }
  else
  {
    pwm_set_1B(-pwm);
    //cbi(MOTOR_CS_PWM2_PORT,MOTOR_CS_PWM2_PIN);
    motor2_sign = 0;
  }

  return;
}

void set_pwm_motor3(void* dummy, int32_t pwm)
{
  S_MAX(pwm,4095);

  pwm_3 = pwm;

  if( (pwm == 4095)||(pwm ==  -4095))
    DEBUG(MOTORCS_ERROR,"PWM#3 saturated pwm=%d",pwm);

	if(pwm>0)
  {
    pwm_set_1A(4095-pwm);
    //sbi(MOTOR_CS_PWM3_PORT,MOTOR_CS_PWM3_PIN);
    motor3_sign = 1;
  }
  else
  {
    pwm_set_1A(-pwm);
    //cbi(MOTOR_CS_PWM3_PORT,MOTOR_CS_PWM3_PIN);
    motor3_sign = 0;
  }

  return;
}
