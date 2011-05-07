#include <uart.h>


/// Callback called on matching.
static void (*match_cb)(void);
/// Pattern to match.
static const char *match_pat;
/// Current matching state.
static const char *match_cur;


static void uart_event(uint8_t c)
{
  if( c == *match_cur ) {
    match_cur++;
    if( *match_cur == '\0' )
      (*match_cb)();
  } else {
    match_cur = match_pat;
  }
}


void matchuart_init(uint8_t num, const char *pat, void (*cb)(void))
{
  match_cb  = cb;
  match_pat = pat;
  match_cur = pat;
  uart_set_rx_event(uart_event);
}

