#include <uart.h>


/// Callback called on matching.
static void (*match_cb)(void);
/// Pattern to match.
static const char *match_pat;
/// Current matching state.
static const char *match_cur;
/// Number of UART currently watched, or UINT8_MAX.
static uint8_t match_num = UINT8_MAX;


static void uart_event(char c)
{
  if( c == *match_cur )
  {
    match_cur++;
    if( *match_cur == '\0' )
      (*match_cb)();
  }
  else
  {
    match_cur = match_pat;
  }
}


void matchuart_init(uint8_t num, const char *pat, void (*cb)(void))
{
  if( match_num != UINT8_MAX )
  {
    // unregister previous event
    uart_register_rx_event(match_num, NULL);
  }

  match_cb  = cb;
  match_pat = pat;
  match_cur = pat;
  match_num = num;
  uart_register_rx_event(num, uart_event);
}

