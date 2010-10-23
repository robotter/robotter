#include <aversive.h>
#include <aversive/error.h>
#include <stdio.h>
#include <uart.h>
#include <adns9500.h>
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
  //printf("%c[2J",0x1B);
  //printf("%c[0;0H",0x1B);


  // Test

  fpga_init();
  _SFR_MEM8(0x1800) = 1;

  NOTICE(0, "ADNS9500 init");
  adns9500_init();
  NOTICE(0, "ADNS9500 boot");
  adns9500_boot();

  NOTICE(0, "DONE");
  while(1);

  return 0;
}

