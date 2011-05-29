#include <stdio.h>
#include <avr/wdt.h>
#include <time.h>
#include <uart.h>
#include "logging.h"


static uint8_t logging_level = ERROR_SEVERITY_DEBUG;

static void logging_handler(struct error * e, ...)
{
  if( e->severity > logging_level) {
    return;
  }

  time_h tv = time_get_time();
  printf_P(PSTR("%ld.%3.3ld | "), tv.s, tv.us/1000UL);

  PGM_P txt_sev;
  switch( e->severity ) {
    case ERROR_SEVERITY_EMERG:   txt_sev = PSTR("\033[1;37;41m"); break;
    case ERROR_SEVERITY_ERROR:   txt_sev = PSTR("\033[1;31m"); break;
    case ERROR_SEVERITY_WARNING: txt_sev = PSTR("\033[1;33m"); break;
    case ERROR_SEVERITY_NOTICE:  txt_sev = PSTR("\033[36m"); break;
    case ERROR_SEVERITY_DEBUG:   txt_sev = PSTR(""); break;
    default:                     txt_sev = PSTR("\033[1;35"); break;
  }
  printf_P(txt_sev);

  va_list ap;
  va_start(ap, e);
  vfprintf_P(stdout, e->text, ap);
  va_end(ap);

  printf_P(PSTR("\033[m\n"));

  if( e->severity <= ERROR_SEVERITY_ERROR ) {
    printf_P(PSTR("fatal error, press any key to reset\n"));
    uart_recv();
    wdt_enable(WDTO_30MS);
    for(;;) ;
  }
}


void logging_init(uint8_t level)
{
  logging_level = level;
  error_register_emerg(logging_handler);
  error_register_error(logging_handler);
  error_register_warning(logging_handler);
  error_register_notice(logging_handler);
  error_register_debug(logging_handler);
}

