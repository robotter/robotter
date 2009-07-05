
#ifndef MOTOR_H
#define MOTOR_H

#include <aversive.h>

#define MOTORCS_ERROR 0x20

#define MOTOR_CS_BREAK_DDR DDRB
#define MOTOR_CS_BREAK_PORT PORTB
#define MOTOR_CS_BREAK_PIN 2

// pwms
#define MOTOR_CS_PWM1_DDR DDRE
#define MOTOR_CS_PWM1_PORT PORTE
#define MOTOR_CS_PWM1_PIN 4

#define MOTOR_CS_PWM2_DDR DDRB
#define MOTOR_CS_PWM2_PORT PORTB
#define MOTOR_CS_PWM2_PIN 4

#define MOTOR_CS_PWM3_DDR DDRG
#define MOTOR_CS_PWM3_PORT PORTG
#define MOTOR_CS_PWM3_PIN 3

// encoders
#define MOTOR_CS_ENCODER1_ADDR (0x1400)
#define MOTOR_CS_ENCODER2_ADDR (0x1500)
#define MOTOR_CS_ENCODER3_ADDR (0x1600)


void motor_cs_init(void);

void motor_cs_break(uint8_t);

int32_t get_encoder_motor1(void*);
int32_t get_encoder_motor2(void*);
int32_t get_encoder_motor3(void*);

void set_pwm_motor1(void*,int32_t);
void set_pwm_motor2(void*,int32_t);
void set_pwm_motor3(void*,int32_t);

#endif//MOTOR_H
