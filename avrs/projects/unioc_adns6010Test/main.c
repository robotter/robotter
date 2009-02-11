#include <aversive.h>
#include <aversive/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <uart.h>

#include <adns6010.h>
#include <adns6010_spi.h>

int main(void)
{
  uint8_t rv = 0x00;

	// ADNS configuration
	adns6010_configuration_t adns_config;

	//--------------------------------------------------------------------------
	// Booting

  // Turn interruptions ON
  sei();

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

  printf("Checking SPI communication with ADNS6010s : ");
  rv = adns6010_checkSPI();

  if(!rv)
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
    printf("dbgno = %X\n",dbgno);

    // It's a trap !
    while(1);
  }
  printf("OK\n");

	printf("ADNS6010s are GO\n\n");

  //--------------------------------------------------------

  // Ready up
  printf("All systems GO.\n\n");

  uint8_t motion;
  uint8_t squal;
  int8_t mreg[2];
  int32_t x = 0;
  int32_t y = 0;
  
  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);
  
  adns6010_encoders_t adnsenc;
  while(1)
  {
    adns6010_encoders_get_value(&adnsenc);
    
    printf("%6.6ld %6.6ld %X| %6.6ld %6.6ld %X| %6.6ld %6.6ld %X| %X          \r",
              adnsenc.x1, adnsenc.y1, adnsenc.squal1,
              adnsenc.x2, adnsenc.y2, adnsenc.squal2,
              adnsenc.x3, adnsenc.y3, adnsenc.squal3,
              adnsenc.fault);

    wait_ms(20);
  }

  return 0;
}
