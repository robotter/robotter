#include <aversive.h>
#include <aversive/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <uart.h>
#include <math.h>

#include <adns6010.h>
#include <hposition_manager.h>

int main(void)
{
  uint8_t rv = 0x00;

	// ADNS configuration
	adns6010_configuration_t adns_config;

  // Robot position
  hrobot_position_t position;

	//--------------------------------------------------------------------------
	// Booting

  // Turn interruptions ON
  sei();

  // Initialize UART
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);

  // Some advertisment :p
  printf("\n\nRobotter 2009 - 102chute - UNIOC POSITION TEST\n");
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

  wait_ms(100);

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

  //--------------------------------------------------------
  // Initialize position manager
  printf("Initializing position manager : ");
  hposition_init( &position );
  hposition_set( &position, 0.0, 0.0, 0.0 );
  printf("OK\n");


  // Ready up
  printf("All systems GO.\n\n");

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);
  
  uint32_t t=0;
  while(1)
  {
    t++;

    hposition_update(&position);

    wait_ms(20);
  }

  return 0;
}
