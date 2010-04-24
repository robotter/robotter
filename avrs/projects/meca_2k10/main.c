#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>
#include <uart.h>
#include <time.h>
#include <scheduler.h>
#include <math.h>

#include <ax12.h>
#include "ax12_user.h"

#include "actuators.h"
#include "led.h"
#include "logging.h"
#include "cli.h"
#include "setting.h"


#define MAIN_ERROR 0x30

// log level
extern uint8_t log_level;

// ax12 modules
AX12 ax12;

// actuators
actuators_t actuators;

// safe key
void safe_key_pressed(void*);

// paddocks
void paddock_setAX12EEPROMs(void);
void paddock_AX12manual(void);

int main(void)
{

  //--------------------------------------------------------
  // Booting

  // Turn interruptions ON
  sei();

  // Initialize LEDs
  led_init();

  // Initialize UART
  uart_init();
  fdevopen(uart0_dev_send, uart0_dev_recv);

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
  NOTICE(0,"Robotter 2010 - Galipeur - MECA-2K10");
  NOTICE(0,"Compiled "__DATE__" at "__TIME__".");

  //--------------------------------------------------------
  // initialize scheduler
  scheduler_init();

  //--------------------------------------------------------
  // initialize time
  time_init(160);

  //--------------------------------------------------------
  // AX12 
  NOTICE(0,"Initializing AX12s");
  ax12_user_init();

  //--------------------------------------------------------
  // Actuators 
  NOTICE(0,"Initializing actuators");

  //--------------------------------------------------------
  // Safe key event
  scheduler_add_periodical_event_priority(&safe_key_pressed, NULL,
                                              SETTING_SCHED_SAFEKEY_PERIOD,
                                              SETTING_SCHED_SAFEKEY_PRIORITY);

  //--------------------------------------------------------
 
  NOTICE(0,"Strike 'x' to reboot / 'e' AX12 EEPROM load / 'm' AX12 manual control");

  uint8_t c;
  while(1)
  {
    c = cli_getkey();
    
    if(c == 'x')
      EMERG(MAIN_ERROR,"safe key 'x' pressed");
    
    if(c == 'e')
      paddock_setAX12EEPROMs();

    if(c == 'm')
      paddock_AX12manual();
  }

  // ---- 

  while(1) nop();
}

void paddock_setAX12EEPROMs(void)
{
  actuators_loadDefaults(&actuators);

  EMERG(MAIN_ERROR,"done");
}

void paddock_AX12manual(void)
{
  uint8_t c;
  uint8_t id = 0x01;
  uint16_t incr = 0x10;
  uint16_t pos = 0x000;
  uint16_t speed = 0x3FF;
  uint16_t torque = 0x3FF;

  uint16_t data;
  uint8_t datab;

  NOTICE(0,"AX12 MAN CONTROL | a/z : addr | q/s : incr | i/k : pos | o/l : speed | p/m : torque | d : dump");

  while(1)
  {
    c = cli_getkey();
    
    switch(c)
    {
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

      default: break;
    }

    // rescaling
    if(incr == 0) incr = 1;

    NOTICE(0,"ID=0x%02x | +/- 0x%02x | p=0x%03x | s=0x%03x | t=0x%03x",
              id, incr, pos, speed, torque);
    
    ax12_user_write_int(&ax12, id, AA_GOAL_POSITION_L, pos);
    ax12_user_write_int(&ax12, id, AA_MOVING_SPEED_L, speed);
    ax12_user_write_int(&ax12, id, AA_TORQUE_LIMIT_L, torque);
  }
  
}

void safe_key_pressed(void* dummy)
{
  if(cli_getkey_nowait() == 'x') 
    EMERG(MAIN_ERROR,"safe key 'x' pressed");
}
