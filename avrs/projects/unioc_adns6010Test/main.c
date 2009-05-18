#include <aversive.h>
#include <aversive/wait.h>
#include <scheduler.h>
#include <stdio.h>
#include <stdlib.h>
#include <uart.h>
#include <math.h>

#include <adns6010.h>

#include "sendframe.h"

uint32_t t=0;
uint32_t lt;
/*
SIGNAL(SIG_INTERRUPT4)
{
  if(PINE&0x10)
  {
    // INT4 is up
    *(uint16_t*)(&TCNT1L) = 0;
  }
  else
  {
    // INT4 is down
    printf("%u\n",*(uint16_t*)(&TCNT1L));
  }

}
*/
int main(void)
{
  uint8_t rv = 0x00;

	// ADNS configuration
	adns6010_configuration_t adns_config;

	//--------------------------------------------------------------------------
	// Booting

  // Turn interruptions ON
  sei();

  sbi(DDRD,7);
  cbi(PORTD,7);

  // Initialize UART
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);

  // Some advertisment :p
  printf("\n\nRobotter 2009 - 102chute - UNIOC ADNS6010 TEST\n");
  printf("Compiled "__DATE__" at "__TIME__"\n\n");

  //--------------------------------------------------------
  // Initialize ADNS6010s
  printf("Initializing ADNS6010s : ");
  adns6010_init();
  printf("OK\n");

  // TEST
  _SFR_MEM8(0x1800) = 1;

  //--------------------------------------------------------

  printf("Checking ADNS6010 firmware on FLASH : ");
  rv = adns6010_checkFirmware();

  if(!rv)
  {
    printf("KO -- Firmware stored on ATMEGA FLASH is not valid\n");

    // It's a trap !
    while(1);
  }
  printf("OK\n");

	// ADNS CONFIGURATION
	adns_config.res = ADNS6010_RES_2000;
	adns_config.shutter = ADNS6010_SHUTTER_ON;
	adns_config.power = 0x11;

  //--------------------------------------------------------

  wait_ms(200);

  printf("Checking ADNS6010 component ID = 0x%2.2X\n", ADNS6010_ID);
 
  adns6010_setMode(ADNS6010_BHVR_MODE_UC_DRIVEN);

  printf("Checking SPI communication with ADNS6010s : ");
  rv = adns6010_checkSPI();

  if(rv)
  {
    printf("KO -- adns6010_checkSPI() returned 0x%2.2X",rv);
    
    // It's a trap !
    while(1);
  }
  printf("OK\n");

  //--------------------------------------------------------
  
  // Launch ADNS6010s boot sequence
  printf("Booting ADNS6010s : ");
  rv = adns6010_boot(&adns_config);

  if(rv)
  {
    printf("KO -- adns6010_boot() returned 0x%X\n",rv);

    // It's a trap !
    while(1);
  }
  printf("OK\n");

  //--------------------------------------------------------

  printf("Checking ADNS6010s : ");
  rv = adns6010_checks();

  if(rv)
  {
    printf("KO -- adns6010_checks() returned 0x%X\n",rv);

    // It's a trap !
    while(1);
  }
  printf("OK\n");

	printf("ADNS6010s are GO\n\n");

  //--------------------------------------------------------

  // Ready up
  printf("All systems GO.\n\n");

  int32_t x2,y2,x3,y3;

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);
  
  adns6010_encoders_t adnsenc;

  while(1)
  {
    t++;

    adns6010_encoders_get_value(&adnsenc);
    
    printf("ADNS : [%d|%ld %ld] [%d|%ld %ld] [%d|%ld %ld]\n",
              adnsenc.squals[0],
              adnsenc.vectors[0], 
              adnsenc.vectors[1], 
              adnsenc.squals[1],
              adnsenc.vectors[2], 
              adnsenc.vectors[3], 
              adnsenc.squals[2],
              adnsenc.vectors[4], 
              adnsenc.vectors[5]);

    wait_ms(100);              
  }

  return 0;
}
