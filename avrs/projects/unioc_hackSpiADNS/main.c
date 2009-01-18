#include <aversive.h>
#include <uart.h>
#include <stdio.h>
#include <stdlib.h>
#include <avr/sfr_defs.h>

#include "comm_fpga.h"

#define REG_DREADY _SFR_MEM8(BASE_IO)
#define REG_DATA _SFR_MEM8(BASE_IO+1)

int main(void)
{
  // Turn interruptions ON
  sei();

  // Initialize UART
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);

  // Some advertisment :p
  printf("\n\nRobotter 2008 - 102chute - UNIOC HACK SPI\n");
  printf("Compiled "__DATE__" at "__TIME__"\n");

  // Initialize FPGA communication
  commfpga_init();

  // Ready up
  printf("Done, waiting for data.\n\n");

  int it;
  uint8_t buffer[55];
  uint8_t c;
  uint8_t pc = 0;

  while(1)
  {
    // Clear buffer
    for(it=0;it<sizeof(buffer);it++)
    {
      buffer[it] = 0x00;
    }

    // Wait for a firmware ending "35;b5;"
    while(1)
    {
      while(!REG_DREADY);

      c = REG_DATA;

      if( (c == 0x35) && (pc == 0xb5) )
        break;

      pc = c;
    }

    // Read data
    for(it=0;it<sizeof(buffer);it++)
    {
      while(!REG_DREADY);

      buffer[it] = REG_DATA;
    }

    // Print data
    for(it=0;it<sizeof(buffer);it++)
    {
      printf("%2.2x;",buffer[it]);
    }

    printf("\n");
  }

  while(1) nop();
  return 0;
}
