#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>
#include <uart.h>
#include <time.h>
#include <timer.h>
#include <scheduler.h>
#include <math.h>
#include <i2cs.h>
#include <adc.h>

#include <ax12.h>
#include "ax12_user.h"

#include "sys.h"
#include "actuators.h"
#include "led.h"
#include "logging.h"
#include "cli.h"
#include "settings.h"
<<<<<<< HEAD
=======
#include "stratcomm.h"
#include "ground_detector.h"

>>>>>>> 09f46c5146aaf06342c5266dcdb0bbbe48d2b38a

#define MAIN_ERROR 0x30

#define USE_GROUND_SENSOR_0
//#define USE_GROUND_SENSOR_1

#ifdef USE_GROUND_SENSOR_0
#undef USE_GROUND_SENSOR_1
#endif

// log level
extern uint8_t log_level;

// ax12 modules
extern AX12 ax12;

// actuators
extern actuators_t actuators;

// safe key
void safe_key_pressed(void*);

void apds9700_init(void);

// paddocks
void paddock_setAX12EEPROMs(void);
void paddock_AX12manual(void);
void paddock_actuatorsManual(void);
<<<<<<< HEAD
=======
void paddock_groundDetector(void);
>>>>>>> 09f46c5146aaf06342c5266dcdb0bbbe48d2b38a
void paddock_sandbox(void);

int main(void)
{
  //apds9700_init();
  //--------------------------------------------------------
  // Booting

  // Turn interruptions ON
  sei();

  // Initialize LEDs
  led_init();

  // Initialize UART
  uart_init();
  fdevopen(uart0_dev_send, uart0_dev_recv);

  // Initialize ADC
  adc_init();

  //--------------------------------------------------------
  // Error configuration
  error_register_emerg(log_event);
  error_register_error(log_event);
  error_register_warning(log_event);
  error_register_notice(log_event);
  error_register_debug(log_event);

  log_level = ERROR_SEVERITY_NOTICE;
  log_level = ERROR_SEVERITY_DEBUG;

  // Clear screen
  printf("%c[2J",0x1B);
  printf("%c[0;0H",0x1B);

  // Some advertisment :p
  NOTICE(0,"Robotter 2011 - Galipeur - MECA-2011");
  NOTICE(0,"Compiled "__DATE__" at "__TIME__".");

  //--------------------------------------------------------
  // initialize scheduler
  scheduler_init();

  //--------------------------------------------------------
  // initialize time
  time_init(160);

  //--------------------------------------------------------
  // TIMER3
  NOTICE(0,"Initializing TIMER3");
  timer_init();

  //--------------------------------------------------------
  // systems
  NOTICE(0,"Initializing systems");
  sys_init();

  //--------------------------------------------------------
  // I2CS
  NOTICE(0,"Initializing i2c slave");
  i2cs_init(SETTING_I2C_ADDRESS);

  //--------------------------------------------------------
  // Safe key event
  scheduler_add_periodical_event_priority(&safe_key_pressed, NULL,
                                              SETTING_SCHED_SAFEKEY_PERIOD,
                                              SETTING_SCHED_SAFEKEY_PRIORITY);

  //--------------------------------------------------------
  // Unleash systems
  scheduler_add_periodical_event_priority(&sys_update, NULL,
                                            SETTING_SCHED_SYS_PERIOD,
                                            SETTING_SCHED_SYS_PRIORITY);


  uint8_t c;

  NOTICE(0,"Strike 'x' to reboot / 'e' AX12 EEPROM load / 'm' AX12 manual control / 'a' actuators manual control / 'g' ground detector sensor");

  led_off(1);

  while(1)
  {
    c = cli_getkey();
    
    if(c == 'x')
      EMERG(MAIN_ERROR,"safe key 'x' pressed");
    
    if(c == 'e')
      paddock_setAX12EEPROMs();

    if(c == 'm')
      paddock_AX12manual();

    if(c == 'a')
      paddock_actuatorsManual();

    if(c == 'g')
      paddock_groundDetector();

    if(c == 's')
      paddock_sandbox();
  }

  while(1) nop();
}

void paddock_setAX12EEPROMs(void)
{
  actuators_loadDefaults(&actuators);

  EMERG(MAIN_ERROR,"done");
}

void paddock_actuatorsManual(void)
{
  uint8_t c;  

  NOTICE(0,"ACT MAN CONTROL LARM u/j | RARM i/k");

  while(1)
  {
    c = cli_getkey();
    
    switch(c)
    {
      case 'u':
        actuators_arm_raise(&actuators,ARM_LEFT);
        break;

      case 'j':
        actuators_arm_lower(&actuators,ARM_LEFT);
        break;

      case 'i':
        actuators_arm_raise(&actuators,ARM_RIGHT);
        break;

      case 'k':
        actuators_arm_lower(&actuators,ARM_RIGHT);
        break;

      case 'x':
        EMERG(MAIN_ERROR,"safe key 'x' pressed");
      
      default: break;
    }
  }
  
}

void paddock_AX12manual(void)
{
  uint8_t c;
  uint8_t id = 0x01;
  uint16_t incr = 0x10;
  uint16_t pos = 0x100;
  uint16_t speed = 0x3FF;
  uint16_t torque = 0x3FF;

  uint16_t data;
  uint8_t datab;

  NOTICE(0,"AX12 MAN CONTROL | a/z : addr | q/s : incr | i/k : pos | o/l : speed | p/m : torque | d : dump | SPC : commit");

  while(1)
  {
    c = cli_getkey();
    
    switch(c)
    {
      case 'x':
        EMERG(MAIN_ERROR,"safe key 'x' pressed");

      case 'a': id++; break;
      case 'z': id--; break;
      
      case 'q': incr*=2; break;
      case 's': incr/=2; break;

      case 'i': pos+=incr; break;
      case 'k': pos-=incr; break;

      case 'o': speed+=incr; break;
      case 'l': speed-=incr; break;

      case 'p': torque+=incr; break;
      case 'm': torque-=incr; break;
      
      case 'd':
        data = 0;
        ax12_user_read_int(&ax12, id, AA_PRESENT_POSITION_L, &data);
        NOTICE(0,"pos=0x%03x",data);

        data = 0;
        ax12_user_read_int(&ax12, id, AA_PRESENT_SPEED_L, &data);
        NOTICE(0,"speed=0x%03x",data);

        data = 0;
        ax12_user_read_int(&ax12, id, AA_PRESENT_LOAD_L, &data);
        NOTICE(0,"load=0x%03x",data);
        
        datab = 0;
        ax12_user_read_byte(&ax12, id, AA_PRESENT_VOLTAGE, &datab);
        NOTICE(0,"voltage=0x%02x",datab);

        datab = 0;
        ax12_user_read_byte(&ax12, id, AA_PRESENT_TEMP, &datab);
        NOTICE(0,"temp=0x%02x",datab);
        break;

      case ' ':
        ax12_user_write_int(&ax12, id, AA_MOVING_SPEED_L, speed);
        ax12_user_write_int(&ax12, id, AA_TORQUE_LIMIT_L, torque);
        ax12_user_write_int(&ax12, id, AA_GOAL_POSITION_L, pos);
        break;

      default: break;
    }

    // rescaling
    if(incr == 0) incr = 1;

    NOTICE(0,"ID=0x%02x | +/- 0x%04x | p=0x%03x | s=0x%03x | t=0x%03x",
              id, incr, pos, speed, torque);
    

  }
  
}



void paddock_sandbox(void)
{
  int16_t d;
  while(1)
  {
<<<<<<< HEAD
    d = scanner_get_distance(0);
    NOTICE(0,"scanner_get_distance()=%d",d);
  }
=======
    for(pos=0x240;pos<=0x330;pos+=5)
    {
      // set AX12 to pos
      actuators_ax12_setPosition(&actuators, 2, pos);
      while( actuators_ax12_checkPosition(&actuators, 2, pos) == 0 )
        wait_ms(1);

      wait_ms(50);
      adcv = adc_get_value( MUX_ADC1 | ADC_REF_AVCC);
      printf("%d %d\n",pos,adcv);
    }
  }
}

void apds9700_init(void)
{
  DDRG |= _BV(4);
  PORTG &= ~_BV(4);
  DDRC|= _BV(4);
  PORTC |= _BV(4);
}
/*
void apds9700_select_sensor(void)
{
  PORTC &= ~_BV(4);
}

void apds9700_deselect_sensor(void)
{
  PORTC |= _BV(4);
}

void apds9700_send_one_pulse(void)
{
  PORTG |= _BV(4);
  _delay_us(1);
  PORTG &= ~_BV(4);
  _delay_us(1);
}

uint8_t apds9700_get_sensor_state(void)
{
  PORTC |= _BV(3);
  return (PINE &_BV(7))==0;
}

uint16_t apds9700_get_distance(void)
{
  uint16_t dist = 1;
  apds9700_select_sensor();
  for(dist = 1; dist <= 500 && apds9700_get_sensor_state() == 0; dist ++)
  {
    apds9700_send_one_pulse();
  }
  if(dist >= 500)
  {
    dist = 0;
  }
  apds9700_deselect_sensor();
  return dist;
}
*/
void paddock_groundDetector(void)
{
  char c;
  uint16_t object_threshold =10;
  uint8_t continuous_object_scan_active =0;
  ground_detector_t gd;
  
  NOTICE(0,"Ground Detector menu | s : sensor state | i/k : select | p/m : pwm | r : run measure");
  
  #ifdef USE_GROUND_SENSOR_0
  ground_detector_set_pwm_port(&gd, &PORTG, 3);
  ground_detector_set_enable_port(&gd, &PORTC, 4);
  ground_detector_set_object_present_pin(&gd, &PINE, 7);
  ground_detector_set_sensor_output_mux_select_port(&gd, &PORTC, 3);
  ground_detector_set_sensor_number(&gd, 0);
  #endif

  #ifdef USE_GROUND_SENSOR_1
  ground_detector_set_pwm_port(&gd, &PORTG, 4);
  ground_detector_set_enable_port(&gd, &PORTC, 4);
  ground_detector_set_object_present_pin(&gd, &PINE, 7);
  ground_detector_set_sensor_output_mux_select_port(&gd, &PORTC, 3);
  ground_detector_set_sensor_number(&gd, 1);
  #endif

  ground_detector_init (&gd);
  
  while(1)
  {

  c = cli_getkey_nowait();
    
    switch(c)
    {
      case -1:break; //no caracter received
      case 'x':
        EMERG(MAIN_ERROR,"safe key 'x' pressed");
      
      case 's': printf("%d\n", ground_detector_get_object_presence_pwm_count(&gd)); break;

      case 'i': object_threshold ++; ground_detector_set_object_present_threshold(&gd, object_threshold);
         printf("threshold : %d\n", ground_detector_get_object_present_threshold(&gd));; break;
      case 'k': object_threshold --; ground_detector_set_object_present_threshold(&gd, object_threshold);
        printf("threshold : %d\n", ground_detector_get_object_present_threshold(&gd)); break;

      case 'r':
        if (continuous_object_scan_active)
        {
          continuous_object_scan_active = 0;
        }
        else
        {
          continuous_object_scan_active = 1;
        }
        break;

      default: break;
    }
    if (continuous_object_scan_active)
    {
      wait_ms(100);    
      printf("%d\n",ground_detector_is_object_present(&gd));
    }
  }

/*
  while(1)
  {

  c = cli_getkey();
    
    switch(c)
    {
      case 'x':
        EMERG(MAIN_ERROR,"safe key 'x' pressed");
      
      case 's': printf("%d\n", apds9700_get_sensor_state()); break;

      case 'i': apds9700_select_sensor(); break;
      case 'k': apds9700_deselect_sensor(); break;

      case 'p': PORTG |= _BV(4);break;
      case 'm': PORTG &= ~_BV(4); break;
      
      case 'r':
        while(1)
        {
          wait_ms(100);
      
          printf("%d\n",apds9700_get_distance());
        }
        break;

      default: break;
    }
  }
*/
>>>>>>> 09f46c5146aaf06342c5266dcdb0bbbe48d2b38a
}

void safe_key_pressed(void* dummy)
{
  if(cli_getkey_nowait() == 'x') 
    EMERG(MAIN_ERROR,"safe key 'x' pressed");
}
