#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>
#include <stdio.h>
#include <uart.h>
#include <adns9500.h>
#include <adns9500_spi.h>
#include "logging.h"
#include "fpga.h"


// log level
extern uint8_t log_level;

int main(void)
{
  // Global init
  sei();
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);
  // Error configuration
  error_register_emerg(log_event);
  error_register_error(log_event);
  error_register_warning(log_event);
  error_register_notice(log_event);
  error_register_debug(log_event);

  log_level = ERROR_SEVERITY_DEBUG;

  // Clear screen
  printf("%c[2J",0x1B);
  printf("%c[0;0H",0x1B);


  // Test

  fpga_init();

  wait_ms(100);
  _SFR_MEM8(0x1800) = 1;
  wait_ms(100);
  _SFR_MEM8(0x1800) = 0;

  NOTICE(0, "ADNS9500 init");
  adns9500_init();
  NOTICE(0, "ADNS9500 boot");
  adns9500_boot();

  NOTICE(0,"ADNS9500 > AUTO");
  adns9500_set_mode(ADNS9500_BHVR_MODE_AUTOMATIC);
 
  adns9500_encoders_t e;
  while(1)
  {
    adns9500_encoders_get_value(&e);
    printf("%ld %ld %ld %ld %ld %ld | %2.2X %2.2X %2.2X | %2.2X\n",
            e.vectors[0], e.vectors[1], e.vectors[2],
            e.vectors[3], e.vectors[4], e.vectors[5],
            e.squals[0], e.squals[1], e.squals[2],
            e.fault);
    wait_ms(100);
  }

  NOTICE(0, "DONE");

  while(1) nop();
  return 0;
}

