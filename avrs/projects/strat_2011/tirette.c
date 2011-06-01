#include <avr/io.h>

void tirette_init(void)
{
  DDRF  &= _BV(3);
  PORTF |= _BV(3);
}

/// Return 1 if the tirette is plugged, 0 otherwise.
uint8_t tirette_plugged(void)
{
  return (PORTF & _BV(3)) == 0;
}

